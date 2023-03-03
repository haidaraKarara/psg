with squad as (

    select 
        *

    from {{ source('raw_data', 'squad') }}
)

select * from squad