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
    
    state.set_student_id(student_id);

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
		const result = await pool.query('SELECT * FROM student WHERE student_email = $1', [student_email]);

		if (result.rows.length === 0) {
			return res.status(400).json({ error: 'Invalid email or password' });
		}

		const user = result.rows[0];

		// Compare the password with the hashed password
		const isMatch = await bcrypt.compare(student_password, user.student_password);

		if (!isMatch) {
			return res.status(400).json({ error: 'Invalid email or password' });
		}

		// Return student_id or username in the response
		res.json({
			message: 'Login successful',
			student_id: user.student_id,
			username: user.student_name, // Use the actual column name
		});
	} catch (err) {
		console.error('Error logging in user:', err.message);
		res.status(500).json({ error: 'Server error' });
	}
});


app.get('/api/profile', async (req, res) => {
	const { student_id } = req.query; // Get the student_id from query parameters

	try {
		// Query the student table to get the student's details
		const studentResult = await pool.query(
			`SELECT student_name, student_email, student_dob, student_grade, student_guardian 
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




// Start the server
const PORT = process.env.PORT || 5001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
