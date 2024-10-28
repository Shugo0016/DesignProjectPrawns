const express = require('express');
const cors = require('cors');
const path = require('path');  // For handling file paths
const pool = require('./db');  // Import the Pool instance from db.js

const app = express();
app.use(cors());
app.use(express.json());  // Enable JSON parsing for incoming requests

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Serve the index.html file at the root URL
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Test database connection
pool.query('SELECT NOW()', (err, res) => {
  if (!err) {
    console.log('Database connected successfully:', res.rows);  // Display result of the query
  } else {
    console.error('Error connecting to the database:', err.message);  // Log any error that occurs
  }
});

// Define your API route to get all students
app.get('/api/students', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM student');  // Query the student table
    res.json(result.rows);  // Send the data as JSON response
  } catch (err) {
    console.error('Error fetching student data:', err.message);  // Log any errors
    res.status(500).send('Server error');  // Send a server error response
  }
});

// Start the server on port 5001
const PORT = process.env.PORT || 5001;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
