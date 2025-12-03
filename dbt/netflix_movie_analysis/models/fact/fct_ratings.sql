{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
   
}}

WITH src_ratings as (
    select * from {{ ref("src_ratings")}}
)

select 
    user_id,
    movie_id,
    rating,
    rating_timestamp,
from src_ratings
where rating is not null

-- get new timestamp after addition of new data into the table
{% if is_incremental() %}
    AND rating_timestamp > (SELECT MAX(rating_timestamp) from {{ this}})
{% endif %}