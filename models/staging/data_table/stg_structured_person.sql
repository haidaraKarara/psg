with person as (
    select
        p1.value:id::string as id,
        p1.value:firstName::string as firstName,
        p1.value:lastName::string as lastName,
        p1.value:matchName::string as matchName,
        p1.value:shortFirstName::string as shortFirstName,
        p1.value:shortLastName::string as shortLastName,
        p1.value:foot::string as foot,
        p1.value:gender::string as gender,
        p1.value:height::double as height,
        p1.value:weight::double as weight,
        --p1.value:dateOfBirth::date as dateOfBirth,
        try_to_date(regexp_replace(p1.value:dateOfBirth,'z|Z')) as dateOfBirth,
        p1.value:countryOfBirthId::string as countryOfBirthId,
        p1.value:countryOfBirth::string as countryOfBirth,
        p1.value:placeOfBirth::string as placeOfBirth,
        p1.value:nationalityId::string as nationalityId,
        p1.value:nationality::string as nationality,
        p1.value:status::string as status,
        p1.value:type::string as type,
        p1.value:position::string as position,
        -- p1.value:membership::variant as membership,
        p2.value:contestantName::string as membershipContestantName,
        p2.value:contestantType::string as membershipContestantType,
        p2.value:active::string as membershipActiveStatus,
        p2.value:transferType::string as membershipTransferType,
        p2.value:type::string as membershipType,
        p2.value:role::string as membershipRole,
        p2.value:stat::variant as membershipStat,
        try_to_date(regexp_replace(p2.value:startDate, 'z|Z')) as membershipStartDate,
        try_to_date(regexp_replace(p1.value:lastUpdated, 'z|Z')) as lastUpdated,
        p1.value as src
    from {{ source('raw_data', 'person') }},
    lateral flatten ( input => v:person) p1,
    lateral flatten (input => p1.value:membership) p2)

select * from person