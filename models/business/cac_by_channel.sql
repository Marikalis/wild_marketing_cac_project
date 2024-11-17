with new_customers as (
    select
        discount_code,
        count(distinct customer_id) as new_customer_count
    from {{ ref('staged_orders') }}
    where order_number = 1
    group by discount_code
),
channel_cac as (
    select
        staged_marketing_costs.channel,
        staged_marketing_costs.discount_code,
        staged_marketing_costs.cost,
        coalesce(new_customers.new_customer_count, 0) as new_customer_count,
        staged_marketing_costs.cost / nullif(coalesce(new_customers.new_customer_count, 0), 0) as cac
    from {{ ref('staged_marketing_costs') }} staged_marketing_costs
    left join new_customers
    on staged_marketing_costs.discount_code = new_customers.discount_code
),
overall_cac as (
    select
        'Overall' as channel,
        null as discount_code,
        sum(staged_marketing_costs.cost) as total_cost,
        sum(coalesce(new_customers.new_customer_count, 0)) as total_new_customer_count,
        sum(staged_marketing_costs.cost) / nullif(sum(coalesce(new_customers.new_customer_count, 0)), 0) as overall_cac
    from {{ ref('staged_marketing_costs') }} staged_marketing_costs
    left join new_customers
    on staged_marketing_costs.discount_code = new_customers.discount_code
)
select
    channel,
    discount_code,
    cost,
    new_customer_count,
    cac
from channel_cac

union all

select 
    channel,
    discount_code,
    total_cost as cost,
    total_new_customer_count as new_customer_count,
    overall_cac as cac
from overall_cac