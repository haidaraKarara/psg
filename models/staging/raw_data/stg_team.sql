with team as (

    select
        *
        
    from {{ source('raw_data', 'team') }}

)

select * from team
