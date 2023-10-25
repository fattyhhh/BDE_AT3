

with source as (
    select * from "postgres"."raw"."listing"
),

transform as (
    select listingid,
        scraped_date::timestamp as scraped_date,
        host_id,
        case when host_neighbourhood in (select suburb_name from "postgres"."public_staging"."lga_suburb_stg") then host_neighbourhood else 'Not in NSW' end as host_neighbourhood,
        case when listing_neighbourhood in (select lga_name from "postgres"."raw"."lga_code") then listing_neighbourhood else 'Not in NSW' end as listing_neighbourhood,
        property_type,
        room_type,
        accommodates,
        price,
        case when has_availability = 't' then true else false end as has_availability,
        availability_30,
        number_of_reviews,
        case when review_scores_rating = 'NaN' then 0 else review_scores_rating end as review_scores_rating,
        case when review_scores_accuracy = 'NaN' then 0 else review_scores_accuracy end as review_scores_accuracy,
        case when review_scores_cleanliness = 'NaN' then 0 else review_scores_cleanliness end as review_scores_cleanliness,
        case when review_scores_checkin = 'NaN' then 0 else review_scores_checkin end as review_scores_checkin,
        case when review_scores_communication = 'NaN' then 0 else review_scores_communication end as review_scores_communication,
        case when review_scores_value = 'NaN' then 0 else review_scores_value end as review_scores_value
    from source
)

select * from transform