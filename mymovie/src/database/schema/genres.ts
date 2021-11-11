import mongoose from 'mongoose';

const GenreSchema = new mongoose.Schema({
    id: {
        type: Number,
        require: true,
    },
    name: {
        type: String,
        require: true,
    },
});

const Genre = mongoose.model('Genre', GenreSchema);

export { Genre, GenreSchema };
