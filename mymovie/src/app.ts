import express from "express";
import http from 'http';
import cors from "cors";
import mongoose from "mongoose";
import movies from './routes/movies';

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());

mongoose.connect("mongodb://localhost:27017/MyMovie");

app.get("/health", (req, res) => {
    res.status(200).send('OK');
});
app.use("/movies", movies);

const httpServer = http.createServer(app);
const port = process.env.PORT || 8484;

httpServer.listen(port, () => {
    console.log(`HTTP Server running on port ${port}`);
});

