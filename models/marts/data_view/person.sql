with person as (

    select * from {{ ref('referential_person') }}
)

select * from person