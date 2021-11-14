export interface Movie {
    _id: string;
    title: string;
    synopsis: string;
    release_date: string;
    poster: string;
    images: string[];
    genre_ids: number[];
}
