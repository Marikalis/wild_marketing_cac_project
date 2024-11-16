# Data Lineage Diagram

## Data Flow
1. **Source Tables:**
   - Shopify Orders → `source.shopify_orders`
   - Marketing Table → `source.marketing_costs`

2. **Staging Models:**
   - `source.shopify_orders` → `staging.staged_orders`
   - `source.marketing_costs` → `staging.staged_marketing_costs`

3. **Business Models:**
   - `staging.staged_orders`, `staging.staged_marketing_costs` → `business.cac_by_channel`
   - `business.cac_by_channel` → `business.most_successful_manager`

### Diagram Overview
The lineage diagram illustrates the transformation of raw data from source tables through staging and business models to generate actionable insights.
