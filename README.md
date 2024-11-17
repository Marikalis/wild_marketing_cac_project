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

## **Database**
This project uses **DuckDB** for local testing.
- **Database File**: `wild_marketing.db`
- **Schema**: `staging` (default in `profiles.yml`).

---

## **How to Run**
1. **Install Dependencies**:
    ```
    pip install dbt-core dbt-duckdb duckdb
    ```
2. **Set Up Project: Clone the repository and navigate to the project directory**:
    ```
    git clone <repository-url>
    cd wild_marketing_cac_project
    dbt seed
    ```
3. **Run Models: Execute models to materialize tables/views**:
    ```
    dbt run
    ```
4. **Query Results: Open DuckDB to view results**:
    ```
    duckdb wild_marketing.db
    select * from staging.cac_by_channel;
    select * from staging.most_successful_manager;
    ```
