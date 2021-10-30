import express from "express";
import axios from 'axios';
import mongoose from 'mongoose';
import { Movie } from "../database/schema/movies";

const router = express.Router();

const API_KEY = "312a4fa8be68a1b2511bc17f1f6e2edd";

router.get("/fill_db", async (req: express.Request, res: express.Response) => {
    let response = null;

    try {
        response = await axios.get(`https://api.themoviedb.org/3/movie/popular?api_key=${API_KEY}`);
        response = response.data;
    } catch (err: any) {
        res.status(500).send({
            "success": false,
            "data": "Internal server error",
        });
        return;
    }
    const movies = response.results;
    const movies_in_db = [];

    for (let i = 0; i != movies.length; i++) {
        const imported_movie = movies[i];

        const movie = new Movie({
            title: imported_movie.title,
            synopsis: imported_movie.overview,
            release_date: imported_movie.release_date,
            poster: `https://image.tmdb.org/t/p/original${imported_movie.backdrop_path}`
        })

        movie.save();
        movies_in_db.push(movie);
    }

    res.send({
        "success": true,
        "data": `Imported ${movies_in_db.length} movies`,
    });
});

export default router;
