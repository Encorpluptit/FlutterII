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

export default router;
