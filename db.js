const { Pool } = require('pg');  // Import Pool from the pg library

// Create a new Pool instance to connect to the database
const pool = new Pool({
  user: 'postgres',            // Your PostgreSQL username
  host: 'localhost',           // Database host
  database: 'postgres',        // Your database name
  password: 'atlasUerol12@',   // Your PostgreSQL password
  port: 8888,                  // PostgreSQL port (8888 in your case)
});

// Export the pool instance so it can be used in other files
module.exports = pool;
