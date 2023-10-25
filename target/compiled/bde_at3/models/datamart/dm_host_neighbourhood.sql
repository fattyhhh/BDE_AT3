with joint as (
    select a.*, c.lga_name as host_neighbourhood_lga, date_trunc('month', a.scraped_date) as month_year
    from "postgres"."public_warehouse"."facts_listing" as a
    left join "postgres"."public_warehouse"."dim_lga_suburb" as b on a.host_neighbourhood = b.suburb_name
    left join "postgres"."public_warehouse"."dim_lga_code" as c on b.lga_code = c.lga_code
)
select host_neighbourhood_lga, month_year,count(distinct host_id) as distinct_hosts, 
    sum(price * (30 - availability_30)) as estm_revenue,
    round(sum(price * (30 - availability_30))/count(distinct host_id),2) as avg_revenue_per_host
from joint
group by host_neighbourhood_lga, month_year
order by host_neighbourhood_lga, month_year