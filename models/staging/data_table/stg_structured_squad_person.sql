with squad_person as (
    select

        s2.value:id::string as id,
        s2.value:firstName::string as firstName,
        s2.value:lastName::string as lastName,
        s2.value:matchName::string as matchName,
        s2.value:shortFirstName::string as shortFirstName,
        s2.value:shortLastName::string as shortLastName,
        s2.value:foot::string as foot,
        s2.value:height::double as height,
        s2.value:weight::double as weight,
        --s2.value:dateOfBirth::date as dateOfBirth,
        try_to_date(regexp_replace(s2.value:dateOfBirth,'z|Z')) as dateOfBirth,
        s2.value:countryOfBirthId::string as countryOfBirthId,
        s2.value:countryOfBirth::string as countryOfBirth,
        s2.value:placeOfBirth::string as placeOfBirth,
        s2.value:nationalityId::string as nationalityId,
        s2.value:nationality::string as nationality,
        s2.value:shirtNumber::string as shirtNumber,
        s2.value:status::string as status,
        s2.value:type::string as type,
        s2.value:active::string as active,
        s2.value:position::string as position,
        s1.value as src

    from {{ source('raw_data', 'squad') }},
    lateral flatten ( input => v:squad) s1,
    lateral flatten ( input => s1.value:person) s2
)

select * from squad_person