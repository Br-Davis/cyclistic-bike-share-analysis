-- ============================================================
-- 10_ride_length_by_day.sql
--
-- Purpose:
-- Compare average ride length by day of week and rider type.
-- ============================================================

CREATE OR REPLACE TABLE
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Ride_Length_Day` AS

SELECT

  day_of_week,

  member_casual,

  AVG(
    ride_length_seconds
  ) AS average_ride_length_seconds

FROM
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean`

GROUP BY
  day_of_week,
  member_casual

ORDER BY
  day_of_week,
  member_casual;
