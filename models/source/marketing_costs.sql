select * from {{ source('google_sheets', 'all_influencer_results') }}
