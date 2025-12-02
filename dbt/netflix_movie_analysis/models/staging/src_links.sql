wITH raw_links AS (
    select * from MOVIE_LENS.RAW.RAW_LINKS
)

SELECT 
    movieId as movie_id,
    imdbId as imdb_id,
    tmdbid as tmdb_id
FROM raw_links
