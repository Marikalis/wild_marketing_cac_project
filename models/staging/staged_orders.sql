-- depends_on: {{ ref('shopify_orders') }}
with cleaned_orders as (
    select
        "Customer ID" as customer_id,
        "Customer Order Number" as order_number,
        "Order Date" as order_date,
        "Discount Code" as discount_code,
        "Order Tags" as order_tags
    from {{ ref('shopify_orders') }}
),
filtered_orders as (
    select *
    from cleaned_orders
    where 
        order_date >= '01/10/2024' 
        and order_date <= '15/11/2024'
        and discount_code is not null
        and lower(order_tags) not like '%test%'
)
select customer_id, order_number, order_date, discount_code
from filtered_orders