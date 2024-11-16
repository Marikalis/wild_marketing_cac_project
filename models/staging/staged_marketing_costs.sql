with filtered_costs as (
    select
        manager,
        channel,
        "Discount_Code" as discount_code,
        cost,
        "Live_Date" as live_date,
        "End_Date" as end_date
    from {{ ref('marketing_costs') }}
    where 
        (
            live_date <= '2024-11-15' and
            (end_date is null or end_date >= '2024-10-01')
        )
)
select 
    manager, 
    channel, 
    discount_code, 
    cost
from filtered_costs;