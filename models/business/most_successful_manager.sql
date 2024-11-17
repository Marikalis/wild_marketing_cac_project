with new_customers as (
    -- Calculate new customers for each discount code
    select
        discount_code,
        count(distinct customer_id) as new_customer_count
    from {{ ref('staged_orders') }}
    where order_number = 1  -- Only consider new customers
    group by discount_code
),
cac_per_campaign as (
    select
        staged_marketing_costs.manager,
        staged_marketing_costs.channel,
        staged_marketing_costs.discount_code,
        staged_marketing_costs.cost,
        new_customers.new_customer_count,
        staged_marketing_costs.cost / nullif(new_customers.new_customer_count, 0) as cac  -- Avoid division by zero
    from {{ ref('staged_marketing_costs') }} staged_marketing_costs
    left join new_customers
    on staged_marketing_costs.discount_code = new_customers.discount_code
),
lowest_cac as (
    select
        manager,
        channel,
        discount_code,
        cost,
        cac
    from cac_per_campaign
    where cac is not null  -- Exclude campaigns with no new customers
    order by cac asc
    limit 1
)
select 
    manager,
    channel,
    discount_code,
    cac as lowest_cac
from lowest_cac