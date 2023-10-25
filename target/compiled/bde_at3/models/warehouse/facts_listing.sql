

with check_dimensions as 
(
    select 
        listingid,
        scraped_date,
        case when host_id in (select distinct host_id from "postgres"."public_staging"."host_stg") then host_id else 0 end as host_id,
        host_neighbourhood,
        listing_neighbourhood,
        case when property_type in (select distinct property_type from "postgres"."public_staging"."property_stg") then property_type else 'Unknown' end as property_type,
        case when room_type in (select distinct room_type from "postgres"."public_staging"."room_stg") then room_type else 'Unknown' end as room_type,
        accommodates,
        price,
        has_availability,
        availability_30,
        number_of_reviews,
        review_scores_rating,
        review_scores_accuracy,
        review_scores_cleanliness,
        review_scores_checkin,
        review_scores_communication,
        review_scores_value
    from "postgres"."public_staging"."listing_stg"
)

select 
    a.listingid,
    a.scraped_date,
    b.host_id,
    b.host_name,
    b.host_since,
    b.host_is_superhost,
    a.host_neighbourhood,
    a.listing_neighbourhood,
    c.property_type,
    d.room_type,
    a.accommodates,
    a.price,
    a.has_availability,
    a.availability_30,
    a.number_of_reviews,
    a.review_scores_rating,
    a.review_scores_accuracy,
    a.review_scores_cleanliness,
    a.review_scores_checkin,
    a.review_scores_communication,
    a.review_scores_value
from check_dimensions a
left join "postgres"."public_staging"."host_stg" b on a.host_id = b.host_id and a.scraped_date::timestamp between b.dbt_valid_from and coalesce(b.dbt_valid_to, '9999-12-31'::timestamp)
left join "postgres"."public_staging"."property_stg" c on a.property_type = c.property_type and a.scraped_date::timestamp between c.dbt_valid_from and coalesce(c.dbt_valid_to, '9999-12-31'::timestamp)
left join "postgres"."public_staging"."room_stg" d on a.room_type = d.room_type and a.scraped_date::timestamp between d.dbt_valid_from and coalesce(d.dbt_valid_to, '9999-12-31'::timestamp)