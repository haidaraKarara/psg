with match as (

    select * from {{ ref('enterprise_match') }}
),
filtered as (

    select
    
        matchid, description, sportname, rulesetname, competitionname, competitioncode, competitionformat, countryname, 
        tournamentcalendarname, tournamentcalendarstartdate, tournamentcalendarenddate, stagename, stagestartdate, 
        stageenddate, seriesname, venueneutral, venuelongname, venueshortname, matchstatus, winner, contestantcode_1, 
        contestantofficialname_1, contestantposition_1, contestantcountryname_1, contestantcode_2, contestantofficialname_2,
        contestantposition_2, contestantcountryname_2, scoreshthome, scoreshtaway, scoresfthome, scoresftaway, scorestotalhome, 
        scorestotalaway, lineupteamofficialfirstname_1, lineupteamofficiallastname_1, lineupteamofficialfirstname_2, 
        lineupteamofficiallastname_2, attendance, matchlengthmin, coveragelevel, matchdate, matchtime, matchlocaldate, 
        matchlocaltime, week, postmatch, numberofperiods, periodlength, lastupdated

    from match
)

select * from filtered