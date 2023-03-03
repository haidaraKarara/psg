with trophies as (

    select 
        * 
    from {{ source('raw_data', 'trophies') }}
)

select * from trophies