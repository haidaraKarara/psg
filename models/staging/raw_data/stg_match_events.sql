with match_events as (

    select 
        * 
    from {{ source('raw_data', 'match_events') }}
)

select * from match_events