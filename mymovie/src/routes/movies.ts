import express from 'express';
import mongoose from 'mongoose';
import { Movie } from '../database/schema/movies';
import { Movie as MovieType } from '../types/Movie';

const router = express.Router();

router.get('/', async (req: express.Request, res: express.Response) => {
    const movies = await Movie.find().populate('genres').exec();

    const result = movies.map((movie: MovieType) => ({
        'id': movie._id,
        'title': movie.title,
        'synopsis': movie.synopsis,
        'release_date': movie.release_date,
        'poster': movie.poster,
        'images': movie.images,
        'genres': movie.genres.map((_movie: any) => _movie.name),
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

    const movie = await Movie.findById(id).populate('genres').exec();

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
            images: movie.images,
            genres: movie.genres.map((_movie: any) => _movie.name),
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
            images: movie_copy.images,
        },
    });
});

router.post('/', async (req: express.Request, res: express.Response) => {
    const { title, synopsis, release_date, poster, images } = req.body;

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
        images,
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
            images: movie.images,
        },
    });
});

router.post('/search', async (req: express.Request, res: express.Response) => {
    const { content } = req.body;

    if (!content) {
        res.status(400).send({
            'success': false,
            'data': 'Bad request',
        });
        return;
    }

    const movies = await Movie.find({ $text: { $search: content } }).populate('genres').exec();

    const result = movies.map((movie: MovieType) => ({
        'id': movie._id,
        'title': movie.title,
        'synopsis': movie.synopsis,
        'release_date': movie.release_date,
        'poster': movie.poster,
        'images': movie.images,
        'genres': movie.genres.map((_movie: any) => _movie.name),
    }));

    res.status(200).send({
        'success': true,
        'data': result,
    });
});

export default router;
