# Source Data Documentation
- **Purpose:** Clean and filter Shopify orders to focus on Q4 2024 (1 October – 15 November).

## Shopify Orders Table
- **Location:** `SHARE_WILD_COSMETICS.OUTPUT.FINAL_ORDERS`
- **Description:** Contains customer orders, including revenue, discount codes, and shipping information.
- **Columns:**
  - `Order ID`: Unique identifier for each order.
  - `Customer ID`: Unique identifier for the customer.
  - `Customer Order Number`: The nth order of each customer.
  - `Discount Code`: Applied discount code, if any.

## Marketing Table
- **Location:** `SHARE_WILD_COSMETICS.OUTPUT.ALL_INFLUENCER_RESULTS`
- **Description:** Tracks marketing campaigns, associated costs, and discount codes.
- **Columns:**
  - `Manager`: Campaign manager's name.
  - `Channel`: Marketing channel (e.g., Instagram, Podcast, Affiliate).
  - `Cost`: Total campaign cost.
