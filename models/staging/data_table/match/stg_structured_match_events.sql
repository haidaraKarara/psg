with match_events as (

    select * from {{ source('raw_data', 'match_events') }}
),
structured_match_events as (

    select

    	v:matchInfo:id::string as matchId,
    	v:liveData:event::variant as liveDataEvents,
        v as src

    from match_events
)

select * from structured_match_events