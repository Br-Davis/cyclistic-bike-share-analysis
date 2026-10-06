# SQL Analysis

These SQL files document the BigQuery workflow used for the Cyclistic 2025 bike-share case study.

The scripts are ordered according to the analysis workflow:

1. Standardize monthly schemas
2. Combine 12 months of data
3. Perform data-quality checks
4. Create the cleaned dataset
5. Remove malformed ride-duration records
6. Convert ride length to numeric seconds
7. Analyze monthly ridership
8. Analyze day-of-week ridership
9. Compare average ride duration
10. Compare ride duration by day of week
11. Perform exploratory electric-bike analysis

Some schema corrections were required on multiple monthly tables because BigQuery detected incompatible data types during `UNION ALL`.

Only one representative query was retained for some of these monthly corrections in the original working history. The same transformation was applied to the other affected monthly tables before the full-year dataset was created.

The final analysis dataset was:

`Cyclistic_2025_Clean`
