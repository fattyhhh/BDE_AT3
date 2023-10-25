
with calculate_1 as (
    select 
    listing_neighbourhood,
    date_trunc('month', scraped_date) as month_year,
    round(avg(case when has_availability then 1 else 0 end),4) * 100 as active_listings_rate,
    (100 - round(avg(case when has_availability then 1 else 0 end),4) * 100) as inactive_listings_rate,
    min(price) filter (where has_availability) as min_price,
    max(price) filter (where has_availability) as max_price,
    percentile_cont(0.5) within group (order by price) filter (where has_availability) as median_price,
    round(avg(price) filter (where has_availability),2) as avg_price,
    count(distinct host_id) as distinct_hosts,
    round(avg(case when host_is_superhost then 1 else 0 end),2) as superhost_rate,
    round(avg(review_scores_rating) filter (where has_availability),2) as avg_rating_active_listings,
    sum(30 - availability_30) as total_number_of_stays,
    round(avg(price *(30 - availability_30)) filter (where has_availability),2) as avg_revenue_active_listings
    from 
        {{ ref('facts_listing') }}
    group by
    listing_neighbourhood,
    month_year
    order by 
    listing_neighbourhood, 
    month_year
),
calculate_2 as (
    select 
    *,
    lag(active_listings_rate) over (partition by listing_neighbourhood order by month_year) as last_active_listings_rate,
    lag(inactive_listings_rate) over (partition by listing_neighbourhood order by month_year) as last_inactive_listings_rate
    from calculate_1
)
select listing_neighbourhood, month_year, active_listings_rate, min_price, max_price, median_price,
    avg_price, distinct_hosts, superhost_rate, avg_rating_active_listings, total_number_of_stays, avg_revenue_active_listings,
    round((active_listings_rate - last_active_listings_rate) / nullif(last_active_listings_rate, 0) * 100,2) as active_listing_rate_change,
    round((inactive_listings_rate - last_inactive_listings_rate) / nullif(last_inactive_listings_rate, 0) * 100,2) as inactive_listing_rate_change
from calculate_2
order by listing_neighbourhood, month_year


