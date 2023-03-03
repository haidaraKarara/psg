with competitions as (

    select 
        * 
    from {{ source('raw_data', 'competitions') }}
)

select * from competitions