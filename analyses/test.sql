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
