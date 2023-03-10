with competition as (

    select * from {{ source('raw_data', 'competitions') }}
),
structured_competition as (

    select
    
        c.value:id::string as id,
        c.value:ocId::int as ocId,
        c.value:name::string as name,
        c.value:competitionCode::string as competitionCode,
        c.value:displayOrder::int as displayOrder,
        c.value:country::string as country,
        c.value:countryId::string as countryId,
        c.value:countryCode::string as countryCode,
        c.value:isFriendly::string as isFriendly,
        c.value:competitionFormat::string as competitionFormat,
        c.value:type::string as type,
        c.value:competitionType::string as competitionType,
        t.value:id::string as tournamentCalendarId,
        t.value:includesVenues::string as tournamentCalendarIncludesVenues,
        t.value:ocId::int as tournamentCalendarOcId,
        t.value:name::string as tournamentCalendarName,
        try_to_date(regexp_replace(t.value:startDate, 'z|Z')) as tournamentCalendarStartDate,
        try_to_date(regexp_replace(t.value:endDate, 'z|Z')) as tournamentCalendarEndDate,
        t.value:active::string as tournamentCalendarActive,
        try_to_timestamp(regexp_replace(t.value:lastUpdated, 'z|Z')) as tournamentCalendarLastUpdated,
        t.value:includesStandings::string as tournamentCalendarIncludeStandings,
        try_to_timestamp(regexp_replace(v:lastUpdated,'z|Z')) as lastUpdated,
        v as src

    from competition,
    lateral flatten ( input => v:competition) c,
    lateral flatten ( input => c.value:tournamentCalendar) t
)

select * from structured_competition