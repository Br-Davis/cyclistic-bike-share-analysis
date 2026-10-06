-- ============================================================
-- 07_monthly_ridership.sql
--
-- Purpose:
-- Compare member and casual ride counts by month.
-- ============================================================

CREATE OR REPLACE TABLE
  `cycle-analysis-507422.Cyclistic_2025.Ride_Count_Per_Month` AS

SELECT
  month_number,
  member_casual,
  COUNT(*) AS ride_count

FROM
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean`

GROUP BY
  month_number,
  member_casual

ORDER BY
  month_number,
  member_casual;
