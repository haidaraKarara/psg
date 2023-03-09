with match_stats_events as (

    select * from {{ ref('int_match_stats_and_events') }}
),
match_tournament_schedule as (

    select * exclude src from {{ ref('stg_structured_match_tournament_schedule') }}
),
joined as (

    select 
        *

    from match_stats_events

    union

    select
        *

    from match_tournament_schedule
    where matchId not in 
        (select distinct matchId from match_stats_events)

)

select * from joined