# Business Models Documentation

## CAC by Channel and Overall
- **Purpose:** Calculate each marketing channel's overall customer acquisition cost (CAC).
- **Logic:**
  - Prepare data for each channel (total cost and new customers).
  - Identify new customers (`Customer Order Number = 1`).
  - Compute CAC for each channel.
  - Calculate the overall CAC across all channels.

## Most Successful Manager
- **Purpose:** Identify the manager responsible for the campaign with the lowest Cost of Acquisition (CAC).
- **Logic:**
  - Calculate CAC for each campaign.
  - Join with the marketing costs to retrieve the associated manager.
  - Identify the campaign with the lowest CAC.

### Metrics:
- **CAC:** Cost per new customer for each channel.
- **Overall CAC:** Customer acquisition cost across all channels combined.
- **Most Successful Manager:** The manager associated with the campaign has the lowest CAC.
