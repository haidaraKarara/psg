-- select id, any_value(CONTESTANTCLUBNAME), max(lastupdated) from {{ ref('stg_structured_squad_person') }} where id = 'esswflonzonoqlc4d0ltzhsoa' group by id
select * from {{ ref('referential_person') }} where id = 'esswflonzonoqlc4d0ltzhsoa'

-- select distinct teamType from {{ ref('stg_structured_squad') }}

/*create or replace table t(c date) as 
select * from 
values 
('2016-05-01'::timestamp), 
('2016-05-02'::timestamp);
select c from t order by c desc; 

select * from PSG.PSG_DEV_HAIDARA_DATA_TABLE.REFERENTIAL_PERSON where national is  null;
select count(id) from PSG.PSG_DEV_HAIDARA_DATA_TABLE.REFERENTIAL_PERSON;
select count(distinct id) from PSG.PSG_DEV_HAIDARA_DATA_TABLE.REFERENTIAL_PERSON;

select * from PSG.PSG_DEV_HAIDARA_DATA_TABLE.STG_STRUCTURED_PERSON where id = 'a3sw0zjhfxcn1nndia6d7d1p1'; --a3sw0zjhfxcn1nndia6d7d1p1

select * from PSG.PSG_DEV_HAIDARA_DATA_TABLE.STG_STRUCTURED_SQUAD_PERSON where id = 'esswflonzonoqlc4d0ltzhsoa';

select * from PSG.PSG_DEV_HAIDARA_DATA_TABLE.INT_SQUAD_PERSON where id = 'a3sw0zjhfxcn1nndia6d7d1p1';

select * from PSG.PSG_DEV_HAIDARA_DATA_TABLE.REFERENTIAL_PERSON where id = 'esswflonzonoqlc4d0ltzhsoa'; --esswflonzonoqlc4d0ltzhsoa

select count(distinct id) from PSG.PSG_DEV_HAIDARA_DATA_TABLE.INT_SQUAD_PERSON;
select count(id) from PSG.PSG_DEV_HAIDARA_DATA_TABLE.INT_SQUAD_PERSON;

select count(distinct id) from PSG.PSG_DEV_HAIDARA_DATA_TABLE.INT_PERSON;
select count(id) from PSG.PSG_DEV_HAIDARA_DATA_TABLE.INT_PERSON;

select id, count(id) c
from PSG.PSG_DEV_HAIDARA_DATA_TABLE.REFERENTIAL_PERSON--PSG.PSG_DEV_HAIDARA_DATA_TABLE.INT_SQUAD_PERSON 
group by id
order by c desc;

*/












with match_stats as (

    select * from {{ ref('enterprise_match') }}
),
filtered as (

    select
    
        -- m.matchid, m.description, m.sportname, m.competitionname, m.competitionformat, m.countryname, 
        -- m.tournamentcalendarname, m.tournamentcalendarstartdate, m.tournamentcalendarenddate, m.stagename, 
        -- m.seriesname, m.venueneutral, m.venuelongname, m.matchstatus, m.winner, 
        -- m.contestantofficialname_1, m.contestantposition_1, m.contestantcountryname_1, m.contestantofficialname_2,
        -- m.contestantposition_2, m.contestantcountryname_2, m.scoreshthome, m.scoreshtaway, m.scoresfthome, m.scoresftaway, m.scorestotalhome, 
        -- m.scorestotalaway, m.lineupteamofficialfirstname_1, m.lineupteamofficiallastname_1, m.lineupteamofficialfirstname_2, 
        -- m.lineupteamofficiallastname_2, m.attendance, m.matchlengthmin, m.coveragelevel, m.matchdate, m.matchtime, m.matchlocaldate, 
        -- m.matchlocaltime, m.week, m.postmatch, m.numberofperiods, m.periodlength, m.lastupdated,
        m.matchid, m.description, m.sportname, m.competitionname, m.competitionformat, m.countryname,
        m.tournamentcalendarname, m.tournamentcalendarstartdate, m.tournamentcalendarenddate, m.stagename, 
        m.seriesname, m.matchstatus,
        case
            when winner = m.contestantposition_1 then m.contestantofficialname_1
            when winner = m.contestantposition_2 then m.contestantofficialname_2
            else ''
        end as winner,
        {% if 1==1 %}
            {% set team1=contestantofficialname_1 %}

            case
                when winner = 'home' and winner = m.contestantposition_1 then m.scoresfthome
                when winner = 'away' and winner = m.contestantposition_1 then m.scoresftaway
                else ''
            end as r
        {% endif %}
        


    from match_stats m
    --lateral flatten(input => m:)
)

select * from filtered limit 1

{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Principal": {
				"AWS": [
					"arn:aws:iam::217748682645:user/3xq40000-s",
					"arn:aws:iam::217748682645:user/9jo40000-s"
				]
			},
			"Action": "sts:AssumeRole",
			"Condition": {
				"ForAnyValue:StringEquals": {
					"sts:ExternalId": [
						"NB60849_SFCRole=2_gL0oehvoxdYFxxeKrwLi7/NjrdM=",
						"NB60849_SFCRole=2_gL0oehvoxdYFxxeKrwLi7/NjrdM="
					]
				}
			}
		}
	]
}