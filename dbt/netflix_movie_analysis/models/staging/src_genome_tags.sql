wITH raw_genome_tags AS (
    select * from MOVIE_LENS.RAW.RAW_GENOME_TAGS
)

SELECT 
    tagId as tag_id,
    tag
FROM raw_genome_tags
