create database psg_dev;
create database psg_uat;
create database psg_prod;

---

--param
alter session set timezone = 'Europe/Paris';

-- snowflake integration
create schema if not exists psg_dev.raw;
-- create schema if not exists data_table;
-- create schema if not exists data_view;


-- TABLES IN RAW SCHEMA
create or replace transient table raw.person(v variant);
create or replace transient table raw.team(v variant);
create or replace transient table raw.squad(v variant);
create or replace transient table raw.match_stats(v variant);
create or replace transient table raw.match_events(v variant);
create or replace transient table raw.trophies(v variant);
create or replace transient table raw.competitions(v variant);
create or replace transient table raw.match_tournament_schedule(v variant);

--file format
CREATE OR REPLACE FILE FORMAT PSG_DEV.RAW.PSG_JSON_FORMAT
  TYPE = JSON
  STRIP_OUTER_ARRAY = TRUE
  ;

desc integration psg_s3_int_my_jems_sf;

-- external stage
CREATE OR REPLACE STAGE psg_dev.raw.psg_json_stage
  STORAGE_INTEGRATION = psg_s3_int_my_jems_sf
  URL = ('s3://psg-poc/')
  FILE_FORMAT = PSG_DEV.RAW.PSG_JSON_FORMAT;

  -- list the stage
list @psg_json_stage;
  
--Raw Data
use schema psg_dev.raw;

copy into psg_dev.RAW.PERSON
from @psg_json_stage/Person;

copy into psg_dev.RAW.TEAM
from '@psg_json_stage/Team'
pattern ='.*Teams[.]json';



copy into psg_dev.RAW.SQUAD
from '@psg_json_stage/Team'
pattern ='.*Squads[.]json';



copy into psg_dev.RAW.MATCH_STATS
from '@psg_json_stage/Match'
pattern ='.*stats[.]json';



copy into psg_dev.RAW.MATCH_EVENTS
from '@psg_json_stage/Match'
pattern ='.*events[.]json';

copy into psg_dev.RAW.TROPHIES
from '@psg_json_stage/Misc';



copy into psg_dev.RAW.COMPETITIONS
from '@psg_json_stage/Authorized competitions/';


copy into psg_dev.RAW.MATCH_TOURNAMENT_SCHEDULE
from '@psg_json_stage/Tournament schedule/';
