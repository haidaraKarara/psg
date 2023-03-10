with person as (
    
    select * from {{ ref('int_person') }}
),
squad_person as (

    select * from {{ ref('int_squad_person') }}
),
union_person as (

    select distinct

        id, 
        firstname,
        lastname,
        matchname,
        shortfirstname,
        shortlastname,
        foot,
        gender,
        height,
        weight,
        dateofbirth,
        countryofbirth,
        placeofbirth,
        nationality,
        status,
        type,
        position,
        national,
        club,
        lastupdated
        --src

    from person

        union 

    (select distinct 
    
        id, 
        firstname,
        lastname,
        matchname,
        shortfirstname,
        shortlastname,
        foot,
        null as gender,
        height,
        weight,
        dateofbirth,
        countryofbirth,
        placeofbirth,
        nationality,
        status,
        type,
        position,
        null as national,
        club,
        lastupdated
        --src

    from squad_person
    where id not in 
        (select distinct id from person))
)

select * from union_person 
--where id = '9oxra7saok5mwixird12vf6c5'