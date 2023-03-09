with person as (

    select * exclude src from {{ ref('referential_person') }}
)

select * from person