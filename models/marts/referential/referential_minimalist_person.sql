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
        shortlastname

    from person

        union 

    (select distinct 
    
        id, 
        firstname,
        lastname,
        matchname,
        shortfirstname,
        shortlastname

    from squad_person
    where id not in 
        (select distinct id from person))
)

select * from union_person 
--where id = '9oxra7saok5mwixird12vf6c5'