with squad_person as (

    select * from {{ ref('stg_structured_squad_person') }}
),
filtered as (
    select
        *,
        max(lastupdated) over(partition by id) as maxlastupdated

    from squad_person
),
filtered_again as (

    select
        *
    from filtered
    where maxlastupdated  = lastupdated 
),
final as (
    select distinct
        id,
        firstname,
        lastname,
        matchname,
        shortfirstname,
        shortlastname,
        foot,
        height,
        weight,
        dateofbirth,
        countryofbirth,
        placeofbirth,
        nationality,
        status,
        -- type,
        -- position,
        -- club,
        first_value(type) over(partition by id order by maxlastupdated desc) as type,
        first_value(position) over(partition by id order by maxlastupdated desc) as position,
        first_value(club) over(partition by id order by maxlastupdated desc) as club,
        lastupdated,
        src

    from filtered_again
)

select * from final