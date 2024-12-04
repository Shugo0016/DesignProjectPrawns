const express = require('express');
const cors = require('cors');
const path = require('path');
const bcrypt = require('bcrypt');
const pool = require('./db');
const state = require('./state');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Serve static files
app.use(express.static(path.join(__dirname, 'public')));

// Test database connection
pool.query('SELECT NOW()', (err, res) => {
  if (!err) {
    console.log('Database connected successfully:', res.rows);
  } else {
    console.error('Error connecting to the database:', err.message);
  }
});

// Generate a random student ID
const generateStudentId = async () => {
  let isUnique = false;
  let studentId;

  while (!isUnique) {
    // Generate a random 6-digit number
    studentId = Math.floor(100000 + Math.random() * 900000);

    // Check if the ID already exists in the database
    const result = await pool.query('SELECT student_id FROM student WHERE student_id = $1', [studentId]);
    if (result.rows.length === 0) {
      isUnique = true; // The ID is unique
    }
  }

  return studentId;
};

// API Route: User registration
app.post('/api/register', async (req, res) => {
  const { student_name, student_email, student_password, student_dob, student_grade, student_guardian } = req.body;

  try {
    // Generate a unique student ID
    const student_id = await generateStudentId();

    // Hash the password
    const hashedPassword = await bcrypt.hash(student_password, 10);

    // Insert the new user into the database
    const result = await pool.query(
      `INSERT INTO student (student_id, student_name, student_email, student_password, student_dob, student_grade, student_guardian)
       VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *`,
      [student_id, student_name, student_email, hashedPassword, student_dob, student_grade, student_guardian]
    );

    res.status(201).json({ message: 'User registered successfully', user: result.rows[0] });
  } catch (err) {
    console.error('Error registering user:', err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

// API Route: User login
app.post('/api/login', async (req, res) => {
  const { student_email, student_password } = req.body;

  try {
    // Check if the user exists
    const result = await pool.query(
      'SELECT student_id, student_password FROM student WHERE student_email = $1',
      [student_email]
    );

    if (result.rows.length === 0) {
      return res.status(400).json({ error: 'Invalid email or password' });
    }

    const user = result.rows[0];

    state.set_student_id(user.student_id);
    getId();

    // Compare the entered password with the stored hashed password
    const isMatch = await bcrypt.compare(student_password, user.student_password);

    if (!isMatch) {
      return res.status(400).json({ error: 'Invalid email or password' });
    }

    // Return the correct student_id in the response
    res.json({ student_id: user.student_id });
  } catch (err) {
    console.error('Error logging in user:', err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

// Fetch user ID
async function getId() {
  const s_id = state.get_student_id();
  console.log("id is " + s_id);

  try {
    const response = await fetch('http://localhost:8886/getId', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ student_id: s_id }),
    });

    const data = await response.json();
    console.log('User Info:', data);
  } catch (err) {
    console.error('Error fetching user info:', err.message);
  }
}

// API Route: Fetch user profile
app.get('/api/profile', async (req, res) => {
  const { student_id } = req.query;

  try {
    // Query the student table to get the student's details
    const studentResult = await pool.query(
      `SELECT student_id, student_name, student_email, student_dob, student_grade, student_guardian 
       FROM student 
       WHERE student_id = $1`,
      [student_id]
    );

    // Check if the student exists
    if (studentResult.rows.length === 0) {
      return res.status(404).json({ error: 'Student not found' });
    }

    // Return the student's details
    res.json(studentResult.rows[0]);
  } catch (err) {
    console.error('Error fetching profile data:', err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

// API Route: Fetch student's game progress
app.get('/api/student-progress', async (req, res) => {
  const { student_id } = req.query;

  if (!student_id) {
    return res.status(400).json({ error: 'Student ID is required.' });
  }

  try {
    // Query to get highest score for each game
    const result = await pool.query(
      `SELECT g.game_id, g.game_name, MAX(gs.score) AS highest_score
       FROM games g
       LEFT JOIN gamesessions gs 
       ON g.game_id = gs.game_id AND gs.student_id = $1
       GROUP BY g.game_id, g.game_name
       ORDER BY g.game_id`,
      [student_id]
    );

    // Format the progress data
    const progress = result.rows.map(row => ({
      game_id: row.game_id,
      game_name: row.game_name,
      status: row.highest_score === null
        ? "Haven't played yet"
        : row.highest_score === 1
        ? "Needs Work"
        : row.highest_score === 2
        ? "Progressing"
        : "Mastery",
    }));

    res.json({ progress });
  } catch (err) {
    console.error('Error fetching student progress:', err.message);
    res.status(500).json({ error: 'Server error.' });
  }
});
// API Route: Fetch student's game progress
app.get('/api/student-sessions', async (req, res) => {
  const { student_id } = req.query;

  if (!student_id) {
    return res.status(400).json({ error: 'Student ID is required.' });
  }

  try {
    // Query to get highest score for each game
    const result = await pool.query(
      `
      SELECT gam.game_id, gam.game_name, gams.student_ID, gams.score
             FROM games gam
             LEFT JOIN gamesessions gams 
             ON gam.game_id = gams.game_id WHERE gams.student_id = 654767
      
      `,
      [student_id]
    );

    // Format the progress data
    const progress = result.rows.map(row => ({
      game_id: row.game_id,
      game_name: row.game_name,
      score: row.score,

    }));

    res.json({ progress });
  } catch (err) {
    console.error('Error fetching student progress:', err.message);
    res.status(500).json({ error: 'Server error.' });
  }
});
// Start the server
const PORT = process.env.PORT || 5001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
