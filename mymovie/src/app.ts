import express from 'express';
import http from 'http';
import cors from 'cors';
import mongoose from 'mongoose';
import movies from './routes/movies';
import debug from './routes/debug';

const app = express();

const mongo_host = process.env.DB_HOST || 'localhost';
const mongo_uri = `mongodb://${mongo_host}:27017`;

mongoose.connect(mongo_uri, function (err) {
    if (err) {
        throw (err);
    }
});

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());

app.get('/health', (req, res) => {
    res.status(200).send('OK');
});
app.use('/movies', movies);
app.use('/debug', debug);

const httpServer = http.createServer(app);
const port = process.env.PORT || 8080;

httpServer.listen(port, () => {
    console.log(`HTTP Server running on port ${port}`);
});

