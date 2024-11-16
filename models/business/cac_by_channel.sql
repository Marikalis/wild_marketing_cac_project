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
        staged_marketing_costs.cost,
        new_customers.new_customer_count,
        staged_marketing_costs.cost / new_customers.new_customer_count as cac
    from {{ ref('staged_marketing_costs') }} staged_marketing_costs
    left join new_customers
    on staged_marketing_costs.discount_code = new_customers.discount_code
),
overall_cac as (
    select
        sum(staged_marketing_costs.cost) as total_cost,
        sum(nc.new_customer_count) as total_new_customers,
        sum(staged_marketing_costs.cost) / new_customers.new_customer_count as overall_cac
    from {{ ref('staged_marketing_costs') }} staged_marketing_costs
    left join new_customers
    on staged_marketing_costs.discount_code = new_customers.discount_code
)
select *
from channel_cac

union all

select 
    'Overall' as channel,
    total_cost,
    total_new_customers,
    overall_cac
from overall_cac;
