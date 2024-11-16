# Business Models Documentation

## CAC by Channel
- **Purpose:** Calculate Customer Acquisition Cost (CAC) for each marketing channel.
- **Logic:**
  - Identify new customers (`Customer Order Number = 1`).
  - Group by discount code to link orders with campaigns.
  - Compute CAC as `Cost / New Customers`.
  - Calculate the overall CAC across all channels as `Total Cost / Total New Customers`.

## Most Successful Manager
- **Purpose:** Identify the manager responsible for the campaign with the lowest Cost of Acquisition (CAC).
- **Logic:**
  - Reuse the `cac_by_channel` model to calculate CAC for each campaign.
  - Join with the marketing costs to retrieve the associated manager.
  - Identify the campaign with the lowest CAC.

### Metrics:
- **CAC:** Cost per new customer for each channel.
- **Overall CAC:** Cost of acquiring a customer across all channels combined.
- **Most Successful Manager:** The manager associated with the campaign having the lowest CAC.
