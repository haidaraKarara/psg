with trophy as (

    select * from {{ source('raw_data', 'trophies') }}
),
structured_trohpy as (

    select
        v:contestant:id::string as contestantId,
        v:contestant:name::string as contestantName,
        v:contestant:type::string as contestantType,
        v:contestant:teamType::string as contestantTeamType,
        c.value:id::string as competitionId,
        c.value:name::string as competitionName,
        c.value:competitionFormat::string as competitionFormat,
        c.value:type::string as competitionType,
        try_to_date(regexp_replace(t.value:tournamentCalendarStartDate,'z|Z')) as tournamentCalendarStartDate,
        try_to_date(regexp_replace(t.value:tournamentCalendarEndDate,'z|Z')) as tournamentCalendarEndDate,
        t.value:tournamentCalendarName::string as tournamentCalendarName,
        t.value:winnerContestantId::string as winnerContestantId,
        t.value:winnerContestantName::string as winnerContestantName,
        t.value:winnerContestantCountry::string as winnerContestantCountry,
        t.value:winnerContestantCountryId::string as winnerContestantCountryId,
        t.value:runnerUpContestantId::string as runnerUpContestantId,
        t.value:runnerUpContestantName::string as runnerUpContestantName,
        t.value:runnerUpContestantCountry::string as runnerUpContestantCountry,
        t.value:runnerUpContestantCountryId::string as runnerUpContestantCountryId,
        try_to_timestamp(regexp_replace(v:lastUpdated,'z|Z')) as lastUpdated,
        v as src

    from trophy, 
    lateral flatten ( input => v:competition) c,
    lateral flatten (input => c.value:trophy) t
)

select * from structured_trohpy