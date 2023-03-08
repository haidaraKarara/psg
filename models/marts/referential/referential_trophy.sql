with trophy as (

    select * from {{ ref('stg_structured_trophy') }}
)

select * from trophy