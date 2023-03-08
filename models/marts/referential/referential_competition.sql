with competition as (

    select * exclude src from {{ ref('stg_structured_competition') }}
),
transformed as (

    select
        *,
        max(lastupdated) over(partition by id) as maxlastupdated
    
    from competition
),
filtered as (

    select
        * exclude maxlastupdated
    
    from transformed
    where maxlastupdated = lastupdated
)

select * from filtered