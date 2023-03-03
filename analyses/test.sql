with t as (
select
    value:id::string as id,
    value:firstName::string as firstName,
    value:lastName::string as lastName,
    value:matchName::string as matchName,
    value:shortFirstName::string as shortFirstName,
    value:shortLastName::string as shortLastName,
    value:gender::string as gender,
    --value:dateOfBirth::date as dateOfBirth,
    try_to_date(regexp_replace(value:dateOfBirth,'z|Z')) as dateOfBirth,
    value:countryOfBirthId::string as countryOfBirthId,
    value:countryOfBirth::string as countryOfBirth,
    value:placeOfBirth::string as placeOfBirth,
    value:nationalityId::string as nationalityId,
    value:nationality::string as nationality,
    value:status::string as status,
    value:type::string as type,
    value:position::string as position,
    value:membership::variant as membership,
    value as src
from {{ source('raw_data', 'person') }},
lateral flatten ( input => v:person))

select * from t