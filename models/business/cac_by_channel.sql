with new_customers as (
    -- Calculate new customers for each discount code
    select
        discount_code,
        count(distinct customer_id) as new_customer_count
    from {{ ref('staged_orders') }}
    where order_number = 1  -- Only consider new customers
    group by discount_code
),
channel_data as (
    -- Cost and new customers by channel
    select
        staged_marketing_costs.channel,
        sum(staged_marketing_costs.cost) as total_cost,
        sum(nc.new_customer_count) as total_new_customers
    from {{ ref('staged_marketing_costs') }} staged_marketing_costs
    left join new_customers nc
    on staged_marketing_costs.discount_code = nc.discount_code
    group by staged_marketing_costs.channel
),
cac_by_channel as (
    select
        channel,
        total_cost,
        total_new_customers,
        total_cost / nullif(total_new_customers, 0) as cac  -- Avoid division by zero
    from channel_data
),
overall_cac as (
    select
        sum(total_cost) as overall_total_cost,
        sum(total_new_customers) as overall_new_customers,
        sum(total_cost) / nullif(sum(total_new_customers), 0) as overall_cac -- Avoid division by zero
    from channel_data
)
select
    channel,
    total_cost,
    total_new_customers,
    cac
from cac_by_channel

union all

select
    'Overall' as channel,
    overall_total_cost as total_cost,
    overall_new_customers as total_new_customers,
    overall_cac as cac
from overall_cac
