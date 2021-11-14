import mongoose from 'mongoose';

const MovieSchema = new mongoose.Schema({
    title: {
        type: String,
        require: true,
    },
    synopsis: {
        type: String,
        require: true,
    },
    release_date: {
        type: String,
        require: true,
    },
    poster: {
        type: String,
    },
    images: {
        type: [String],
    },
    genre_ids: {
        type: [Number],
    }
});
MovieSchema.index({ title: 'text', synopsis: 'text' });

const Movie = mongoose.model('Movie', MovieSchema);

export { Movie, MovieSchema };
