-- ============================================================
-- 08_day_of_week_ridership.sql
--
-- Purpose:
-- Compare ride frequency by day of week between annual members
-- and casual riders.
--
-- day_of_week:
-- 1 = Sunday
-- 7 = Saturday
-- ============================================================

CREATE OR REPLACE TABLE
  `cycle-analysis-507422.Cyclistic_2025.Ride_Count_Day_of_Week` AS

SELECT
  day_of_week,
  member_casual,
  COUNT(*) AS ride_count

FROM
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean`

GROUP BY
  day_of_week,
  member_casual

ORDER BY
  day_of_week,
  member_casual;
