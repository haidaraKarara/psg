with team as (

    select * exclude countryid from {{ ref('referential_team') }}
)

select * from team