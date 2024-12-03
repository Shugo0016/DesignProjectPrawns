//Connect PostgreSQL with Gamemaker 
//TODO: edit to fit with current postgresql tables/data format

const express = require('express');
const { Pool } = require('pg');
const state = require('./state');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();
const port = 8888;

// PostgreSQL connection pool
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'postgres',
    password: 'marbby84',
    port: 5433,
});

const pool_unity = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'prawndata',
    password: 'postgres',
    port: 5432,
});

app.use(cors());
app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.send('Server is running');
});

// Receive data from Gamemaker - session_id, game_id,level,score,time,completed
// get student id from state
app.post('/data', async (req, res) => {
    const { data_field } = req.body;
   // console.log(req.body); // Log the entire body
    const { session_id,game_id,level_id,score,time_spent,completed} = req.body;
    const student_id = state.get_student_id();
    console.log(`id: ${student_id}, session: ${session_id}`); // Check if values are received
    //res.send([session_id,student_id,game_id,level_id,score,time_spent,completed]);
    try {
        const result = await pool.query('INSERT INTO gamesessions (session_id,student_id,game_id,level_id,score,time_spent,completed) VALUES ($1, $2,$3,$4,$5,$6,$7)', [session_id,student_id,game_id,level_id,score,time_spent,completed]);
     
        res.status(201).json(result.rows[0]);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error saving data');
    }
});

app.get('/data', async (req, res) => {
    try {
        //display
        const result = await pool.query('SELECT * FROM gamesessions');
        res.json(result.rows);
    } catch (err) {
        console.error('Error executing query', err);
        res.status(500).send('Server error');
    }
});

app.post('/unitydata', async (req, res) => {
    const { data_field } = req.body;
   // console.log(req.body); // Log the entire body
    const student_id = state.get_student_id();
    const { to_update, value } = req.body;

    console.log(`update: ${to_update}, value: ${value}, student id: ${student_id}`); // Check if values are received
    console.log(to_update,value, student_id)
    res.send([to_update,value, student_id]);
    if(to_update == 'time_spent'){
        hrs = Math.floor(value / 3600);
        mins = Math.floor((value % 3600) / 60);
        secs = value % 60;
        
        new_value = [hrs.toString().padStart(2, '0'),
                mins.toString().padStart(2, '0'),
                secs.toString().padStart(2, '0'), ].join(':');
    }
    try {
        const query = `UPDATE public.gamesessions SET ${to_update} = $1 WHERE student_id = $2`;
        if(to_update == 'time_spent'){
            const result = await pool_unity.query(query, [new_value, student_id]);
            res.status(201).json(result.rows[0]);
        }
        else{
            const result = await pool_unity.query(query, [value, student_id]);
            res.status(201).json(result.rows[0]);

        }
    } catch (err) {
        console.error(err);
        res.status(500).send('Error saving data');
    }
});


app.get('/unitydata', async (req, res) => {
    try {
        //display
        const result = await pool_unity.query('SELECT * FROM unitytable');
        res.json(result.rows);
    } catch (err) {
        console.error('Error executing query', err);
        res.status(500).send('Server error');
    }
});
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});