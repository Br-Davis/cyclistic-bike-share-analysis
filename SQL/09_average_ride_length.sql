-- ============================================================
-- 09_average_ride_length.sql
--
-- Purpose:
-- Compare average ride duration for annual members and casual
-- riders.
-- ============================================================

CREATE OR REPLACE TABLE
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Average_Ride_Length` AS

SELECT

  AVG(
    ride_length_seconds
  ) AS average_ride_length_all,


  AVG(
    CASE
      WHEN member_casual = 'member'
      THEN ride_length_seconds
    END
  ) AS member_average_ride_length,


  AVG(
    CASE
      WHEN member_casual = 'casual'
      THEN ride_length_seconds
    END
  ) AS casual_average_ride_length

FROM
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean`;
