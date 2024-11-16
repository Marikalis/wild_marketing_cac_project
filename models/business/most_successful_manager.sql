with lowest_cac as (
    select
        staged_marketing_costs.manager,
        cac_by_channel.channel,
        cac_by_channel.discount_code,
        cac_by_channel.cac
    from {{ ref('cac_by_channel') }} cac_by_channel
    join {{ ref('staged_marketing_costs') }} staged_marketing_costs
    on cac_by_channel.discount_code = staged_marketing_costs.discount_code
    where cac_by_channel.cac is not null  -- Exclude campaigns with no new customers
    order by cac_by_channel.cac asc
    limit 1  -- Select the best campaign
)
select 
    manager,
    channel,
    discount_code,
    cac as lowest_cac
from lowest_cac;
