wITH raw_genome_scores AS (
    select * from MOVIE_LENS.RAW.RAW_GENOME_SCORES
)

SELECT 
    movieId as movie_id,
    tagId as tag_id,
    relevance
FROM raw_genome_scores
