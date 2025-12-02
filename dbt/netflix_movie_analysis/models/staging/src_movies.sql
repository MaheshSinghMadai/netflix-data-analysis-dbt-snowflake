wITH raw_movies AS (
    select * from MOVIE_LENS.RAW.RAW_MOVIES
)

SELECT 
    movieId as movie_id,
    title,
    genres
FROM raw_movies
