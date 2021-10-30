import express from 'express';
import mongoose from 'mongoose';
import { Movie } from '../database/schema/movies';

const router = express.Router();

router.get('/', async (req: express.Request, res: express.Response) => {
    const movies = await Movie.find().exec();

    const result = movies.map((movie) => ({
        'id': movie._id,
        'title': movie.title,
        'synopsis': movie.synopsis,
        'release_date': movie.release_date,
        'poster': movie.poster,
    }));

    res.status(200).send({
        'success': true,
        'data': result,
    });
});

router.get('/:id', async (req: express.Request, res: express.Response) => {
    const { id } = req.params;

    if (!id || !mongoose.Types.ObjectId.isValid(id)) {
        res.status(400).send({
            'success': true,
            'data': 'Bad request',
        });
        return;
    }

    const movie = await Movie.findById(id).exec();

    if (!movie) {
        res.status(404).send({
            'success': true,
            'data': 'Not found',
        });
        return;
    }

    res.status(200).send({
        'success': true,
        'data': {
            id: movie._id,
            title: movie.title,
            synopsis: movie.synopsis,
            release_date: movie.release_date,
            poster: movie.poster,
        },
    });
});

router.delete('/:id', async (req: express.Request, res: express.Response) => {
    const { id } = req.params;

    if (!id || !mongoose.Types.ObjectId.isValid(id)) {
        res.status(400).send({
            'success': true,
            'data': 'Bad request',
        });
        return;
    }

    const movie = await Movie.findById(id).exec();

    if (!movie) {
        res.status(404).send({
            'success': true,
            'data': 'Not found',
        });
        return;
    }

    const movie_copy = JSON.parse(JSON.stringify(movie));

    movie.delete();

    res.status(200).send({
        'success': true,
        'data': {
            id: movie_copy._id,
            title: movie_copy.title,
            synopsis: movie_copy.synopsis,
            release_date: movie_copy.release_date,
            poster: movie_copy.poster,
        },
    });
});

router.post('/', async (req: express.Request, res: express.Response) => {
    const { title, synopsis, release_date, poster } = req.body;

    if (!title || !synopsis || !release_date) {
        res.status(400).send({
            'success': false,
            'data': 'Bad request',
        });
        return;
    }

    const movie = new Movie({
        title,
        synopsis,
        release_date,
        poster,
    });

    await movie.save();

    res.status(200).send({
        'success': true,
        'data': {
            id: movie._id,
            title: movie.title,
            synopsis: movie.synopsis,
            release_date: movie.release_date,
            poster: movie.poster,
        },
    });
});

export default router;
