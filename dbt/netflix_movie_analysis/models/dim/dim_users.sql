with ratings as (
    Select distinct user_id from {{ ref("src_movies")}}
),

tags as (
    select distinct user_id from {{ ref("src_tags")}}
)

select distinct user_id
FROM(
    select * from ratings
    UNION
    select * from tags
)