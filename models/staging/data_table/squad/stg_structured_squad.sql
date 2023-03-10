with squad as (
    select
        value:contestantId::string as contestantId,
        value:contestantName::string as contestantName,
        value:contestantShortName::string as contestantShortName,
        value:contestantClubName::string as contestantClubName,
        value:contestantCode::string as contestantCode,
        value:tournamentCalendarId::string as tournamentCalendarId,
        --regexp_replace(value:tournamentCalendarStartDate,'z|Z')::date as tournamentCalendarStartDate,
        try_to_date(regexp_replace(value:tournamentCalendarStartDate,'z|Z')) as tournamentCalendarStartDate,
        --regexp_replace(value:tournamentCalendarEndDate,'z|Z')::date as tournamentCalendarEndDate,
        try_to_date(regexp_replace(value:tournamentCalendarEndDate,'z|Z')) as tournamentCalendarEndDate,
        value:competitionName::string as competitionName,
        value:competitionId::string as competitionId,
        value:type::string as type,
        value:teamType::string as teamType,
        value:venueName::string as venueName,
        value:venueId::string as venueId,
        value:person::variant as person,
        s.v as src
    from {{ source('raw_data', 'squad') }} as s,
    lateral flatten ( input => s.v:squad)
)

select * from squad