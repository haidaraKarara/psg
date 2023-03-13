with team as (

    select * from {{ ref('stg_structured_team') }}
),
final as (

    select distinct

        id,
        name,
        shortname,
        officialname,
        code,
        type,
        teamtype,
        countryid,
        country,
        status,
        city,
        postaladdress,
        addresszip,
        founded
        --lastupdated
    
    from team
)

select * from final