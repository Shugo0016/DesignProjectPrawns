//Connect PostgreSQL with Gamemaker 
//TODO: edit to fit with current postgresql tables/data format

const express = require('express');
const { Pool } = require('pg');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();
const port = 3030;

// PostgreSQL connection pool
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'demo',
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

// Receive data from Gamemaker
/* - In GameMaker obj_data_manager Create -
   --> http_request(http://localhost:3030/data, "POST", ds_map(Content-Type "application/json"), ds_map(my_id,myscore))
    --> May change my_id to come from database instead of game
*/
app.post('/data', async (req, res) => {
    const { data_field } = req.body;
   // console.log(req.body); // Log the entire body
    const { my_id, my_score } = req.body;
    console.log(`id: ${my_id}, score: ${my_score}`); // Check if values are received
    console.log(my_id,my_score)
    res.send([my_id,my_score]);
    try {
        const result = await pool.query('INSERT INTO gm2tests (my_id, my_score) VALUES ($1, $2)', [my_id, my_score]);
     
        res.status(201).json(result.rows[0]);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error saving data');
    }
});

app.get('/data', async (req, res) => {
    try {
        //display
        const result = await pool.query('SELECT * FROM gm2tests');
        res.json(result.rows);
    } catch (err) {
        console.error('Error executing query', err);
        res.status(500).send('Server error');
    }
});

app.post('/unitydata', async (req, res) => {
    const { data_field } = req.body;
   // console.log(req.body); // Log the entire body
    const { to_update,value, session_id } = req.body;
    console.log(`update: ${to_update}, value: ${value}, session: ${session_id}`); // Check if values are received
    console.log(to_update,value, session_id)
    res.send([to_update,value, session_id]);
    try {
        const query = `UPDATE public.gamesessions SET ${to_update} = $1 WHERE session_id = $2`;
        const result = await pool_unity.query(query, [value, session_id]);
        res.status(201).json(result.rows[0]);
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