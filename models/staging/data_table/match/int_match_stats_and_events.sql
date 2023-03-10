with match_events as (

    select * exclude src from {{ ref('stg_structured_match_events') }}
),
match_stats as (

    select * exclude src from {{ ref('stg_structured_match_stats') }}
),
joined as (

    select

		s.*,
        e.liveDataEvents

    from match_stats s

    left join match_events e
    on s.matchId = e.matchId
)

select * from joined