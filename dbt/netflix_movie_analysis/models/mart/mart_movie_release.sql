{{ config(materialized='table')}}

with fct_ratings as (
    select * from {{ ref("fct_ratings")}}
),
seed_dates as (
    select * from {{ ref("seed_movie_release_dates")}}
)

select 
    r.*,
    CASE 
        WHEN d.release_date IS NULL THEN 'unknown'
        ELSE 'known'
    END as release_date_available  
from fct_ratings r
LEFT JOIN seed_dates s
ON f.movie_id = d.movie_id