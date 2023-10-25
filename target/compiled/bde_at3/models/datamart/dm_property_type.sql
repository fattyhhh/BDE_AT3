with calculate_1 as   
  (select
    property_type,
    room_type,
    accommodates,
    date_trunc('month', scraped_date) as month_year,
    round(avg(case when has_availability then 1 else 0 end) * 100,2) as active_listings_rate,
    round((1 - avg(case when has_availability then 1 else 0 end)) * 100, 2) as inactive_listings_rate,
    min(price) filter (where has_availability) as min_price_active,
    max(price) filter (where has_availability) as max_price_active,
    percentile_cont(0.5) within group (order by price) filter (where has_availability) as median_price_active,
    round(avg(price) filter (where has_availability),2) as avg_price_active,
    count(distinct host_id) as distinct_hosts,
    round(avg(case when host_is_superhost then 1 else 0 end) * 100) as superhost_rate,
    round(avg(review_scores_rating) filter (where has_availability) , 2) as avg_rating_active,
    sum(30 - availability_30) as tot_stays,
    round(avg(price *(30 - availability_30)) filter (where has_availability),2) as avg_revenue_active
  from
    "postgres"."public_warehouse"."facts_listing"
  group by
    property_type,
    room_type,
    accommodates,
    month_year
  order by
    property_type,
    room_type,
    accommodates,
    month_year),
calculate_2 as (
  select 
    *, lag(active_listings_rate) over (partition by property_type, room_type, accommodates order by month_year) as last_active_listings_rate,
    lag(inactive_listings_rate) over (partition by property_type, room_type, accommodates order by month_year) as last_inactive_listings_rate
  from calculate_1
)
select property_type, room_type, accommodates, month_year, active_listings_rate, min_price_active, max_price_active,
  median_price_active, avg_price_active, distinct_hosts,superhost_rate,avg_rating_active, 
  round((active_listings_rate - last_active_listings_rate) / nullif(last_active_listings_rate, 0) * 100,2) as active_listing_rate_change,
  round((inactive_listings_rate - last_inactive_listings_rate) / nullif(last_inactive_listings_rate, 0) * 100,2) as inactive_listing_rate_change,
  tot_stays, avg_revenue_active
from calculate_2