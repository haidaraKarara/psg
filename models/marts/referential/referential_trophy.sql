with trophy as (

    select * exclude src from {{ ref('stg_structured_trophy') }}
)

select * from trophy