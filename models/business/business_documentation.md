# Business Models Documentation

## CAC by Channel and Overall
- **Purpose:** Calculate Customer Acquisition Cost (CAC) for each marketing channel and overall.
- **Logic:**
  - Centralizes channel-level data (total cost and new customers).
  - Identify new customers (`Customer Order Number = 1`).
  - Computes CAC for each channel.
  - Calculates the overall CAC across all channels.

## Most Successful Manager
- **Purpose:** Identify the manager responsible for the campaign with the lowest Cost of Acquisition (CAC).
- **Logic:**
  - Calculate CAC for each campaign.
  - Join with the marketing costs to retrieve the associated manager.
  - Identify the campaign with the lowest CAC.

### Metrics:
- **CAC:** Cost per new customer for each channel.
- **Overall CAC:** Cost of acquiring a customer across all channels combined.
- **Most Successful Manager:** The manager associated with the campaign having the lowest CAC.