with person as (

    select 
        * 
    
    from {{ source('raw_data', 'person') }}
)

select * from person