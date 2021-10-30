import express from "express";
import { Movie } from "../database/schema/movies";

const router = express.Router();

router.get("/", async (req: express.Request, res: express.Response) => {
    const movies = await Movie.find().exec();

    const result = movies.map((movie) => ({
        "id": movie._id,
        "title": movie.title,
        "synopsis": movie.synopsis,
        "release_date": movie.release_date
    }));

    res.status(200).send({
        "success": true,
        "data": result,
    });
});

router.post("/", async (req: express.Request, res: express.Response) => {
    const { title, synopsis, release_date } = req.body;

    if (!title || !synopsis || !release_date) {
        res.status(400).send({
            "success": false,
            "data": "Bad request",
        });
        return;
    }

    const movie = new Movie({
        title,
        synopsis,
        release_date
    });

    await movie.save();

    res.status(200).send({
        "success": true,
        "data": {
            id: movie._id,
            title: movie.title,
            synopsis: movie.synopsis,
            release_date: movie.release_date
        },
    });
});

export default router;
