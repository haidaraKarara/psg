with match_stats as (

    select 
        * 
    from {{ source('raw_data', 'match_stats') }}
)

select * from match_stats