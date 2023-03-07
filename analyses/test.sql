-- select id, any_value(CONTESTANTCLUBNAME), max(lastupdated) from {{ ref('stg_structured_squad_person') }} where id = 'esswflonzonoqlc4d0ltzhsoa' group by id
select * from {{ ref('stg_structured_squad_person') }} where id = 'esswflonzonoqlc4d0ltzhsoa'

-- select distinct teamType from {{ ref('stg_structured_squad') }}

/*create or replace table t(c date) as 
select * from 
values 
('2016-05-01'::timestamp), 
('2016-05-02'::timestamp);
select c from t order by c desc; */