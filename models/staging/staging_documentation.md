# Staging Models Documentation

## Staged Orders
- **Purpose:** Clean and filter Shopify orders to focus on Q4 2024 (1 October – 15 November).
- **Filters Applied:**
  - Filters orders in the analysis period.
  - Retains only relevant columns: `Customer ID`, `Customer Order Number`, and `Discount Code`.
  - Only orders with non-null discount codes are included.
  - Excludes orders with the tag "test" (case-insensitive).

## Staged Marketing Costs
- **Purpose:** Filter and prepare marketing cost data for analysis.
- **Filters Applied:**
  - Includes only campaigns that were active during the analysis period.
