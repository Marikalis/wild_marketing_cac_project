# Marketing Campaign Analysis - Q4 2024

## Project Overview
This dbt project calculates marketing campaign performance metrics for **Q4 2024 (1 October to 15 November)**. Specifically, it calculates the following metrics:
1. Quarter-to-date Customer Acquisition Cost (CAC) for each marketing channel.
2. Overall CAC across all channels.
3. Identifies the most successful campaign manager based on manager's lowest campain CAC.

### Key Concepts
- **CAC (Cost of Acquisition per Customer):** Calculated as `Cost / New Customers`.
- **New Customer:** A customer whose `Customer Order Number = 1`.

### Data Sources
1. **Shopify Orders Table** (Shopify platform):
   - Contains all order details, including `Customer ID`, `Order Date`, and `Discount Code`.
2. **Marketing Table** (Google Sheets):
   - Includes campaign costs, associated discount codes, and the responsible manager.

### Objectives
- Enable data-driven decisions for campaign investments.
- Highlight successful campaigns and managers for optimization.
