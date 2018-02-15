const express = require('express');
const bodyParser = require('body-parser');
const routes = require('./routes');
// const monsters = require('./routes/monsters');
// const habitats = require('./routes/habitats');
// const lives = require('./routes/lives');
const pool = require('./db');

const app = express();

function getEligibleCCs() {
    
    app.get('/', (request, response, next) => {
        pool.query(`SELECT * FROM credit_cards_ WHERE mincreditscore >= ${user.creditScore}  ORDER BY id ASC`,
        (err, res) => {
            // if (err) return console.log(err);
            if (err) return next(err);
        
            response.json(res.rows);
        });
    });
}

app.get('/final', (request, response, next) => {
    //grab the id field of our params object
    const { id } = request.params;

    pool.query('SELECT * FROM monsters WHERE id = $1', [id], (err, res) => {
        if (err) return next(err);

        response.json(res.rows);
    })
});

app.use(bodyParser.json());
app.use('/', routes);
// app.use('/monsters', monsters);
// app.use('/habitats', habitats);
// app.use('/lives', lives);

app.use((err, req, res, next) => {
    res.json(err);
});

module.exports = app;

//moved to www
// const port = 3000;

// app.listen(port, () => console.log(`listening on port ${port}`));
