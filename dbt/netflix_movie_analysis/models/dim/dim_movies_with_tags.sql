{{
    config(
        materialized = 'ephemeral'
    )
}}

with movies as s(
    select * from {{ ref("dim_movies") }}
),
tags as (
    select * from {{ ref("dim_genome_tags") }}
),
scores as (
    select * from {{ ref("fct_genome_scores") }}
)

select
    m.movie_id,
    m.movie_title,
    m.genres,
    t.tag_name,
    s.relevant_score
from movies m
LEFT JOIN scores s on a.movie_id = s.movie_id
LEFT JOIN tags t on t.tag_id = s.tag_id
