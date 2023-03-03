with match_tournament_schedule as (

    select 
        *
    from {{ source('raw_data', 'match_tournament_schedule') }}
)

select * from match_tournament_schedule