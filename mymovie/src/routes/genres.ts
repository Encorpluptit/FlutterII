import express from 'express';
import { Genre } from '../database/schema/genres';

const router = express.Router();

router.get('/', async (req: express.Request, res: express.Response) => {
    const genres = await Genre.find().exec();

    const result = genres.map((genre) => ({
        'id': genre.id,
        'name': genre.name,
    }));

    res.status(200).send({
        'success': true,
        'data': result,
    });
});

router.get('/:id', async (req: express.Request, res: express.Response) => {
    const {id} = req.params;

    if (!id) {
        res.status(400).send({
            'success': true,
            'data': 'Bad request',
        });
        return;
    }

    const genre = await Genre.findOne({id}).exec();
    if (!genre) {
        res.status(404).send({
            'success': true,
            'data': 'Not found',
        });
        return;
    }

    res.status(200).send({
        'success': true,
        'data': {
            id: genre.id,
            name: genre.name,
        },
    });
});

export default router;
