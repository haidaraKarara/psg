with structured_person as (

    select * from {{ ref('stg_structured_person') }}
),
filtered_person as (

    select
        *,
        max(membershipStartDate) over(partition by id, membershipContestantType) as memebershipRecentStartDate

    from structured_person
),
enriched_person as (

    select 
        *,
        case
            when
                membershipContestantType = 'national' and membershipactivestatus = 'yes' then membershipcontestantname
            else null
        end as national,
        case 
            when membershipContestantType = 'club' and membershipactivestatus = 'yes' then membershipcontestantname
            else null
        end as club

    from filtered_person
    where membershipStartDate = memebershipRecentStartDate
),
final as (

    select distinct
        id, 
        firstname,
        lastname,
        matchname,
        shortfirstname,
        shortlastname,
        foot,
        gender,
        height,
        weight,
        dateofbirth,
        countryofbirth,
        placeofbirth,
        nationality,
        status,
        type,
        position,
        -- membershiptransfertype,
        -- membershiptype,
        -- membershiprole,
        first_value(national) over(partition by id order by national nulls last) as national,
        first_value(club) over(partition by id order by club nulls last) as club,
        lastupdated,
        src
    from enriched_person
)

-- select * from final limit 10
select * from final