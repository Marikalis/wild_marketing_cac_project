select * from {{ source('shopify', 'final_orders') }}
