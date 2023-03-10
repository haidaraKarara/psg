with team as (

    select * from {{ source('raw_data', 'team') }}
),
structured_team as (

    select distinct

        value:id::string as id,
        value:name::string as name,
        value:shortName::string as shortName,
        value:officialName::string as officialName,
        value:code::string as code,
        value:type::string as type,
        value:teamType::string as teamType,
        value:countryId::string as countryId,
        value:country::string as country,
        value:status::string as status,
        value:city::string as city,
        value:postalAddress::string as postalAddress,
        value:addressZip::string as addressZip,
        value:founded::string as founded,
        --v:lastUpdated::timestamp as lastUpdated,
        try_to_timestamp(regexp_replace(value:lastUpdated,'z|Z')) as lastUpdated,
        v as src

    from team, lateral flatten ( input => v:contestant)
)

select * from structured_team