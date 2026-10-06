-- ============================================================
-- 11_electric_bike_analysis.sql
--
-- Exploratory analysis:
-- Compare electric-bike usage between annual members and
-- casual riders.
--
-- This analysis was completed but was not used as one of the
-- primary findings in the final Tableau dashboard.
-- ============================================================

CREATE OR REPLACE TABLE
  `cycle-analysis-507422.Cyclistic_2025.ride_type_by_membership` AS

SELECT

  member_casual,

  COUNT(*) AS total_rides,

  COUNTIF(
    rideable_type = 'electric_bike'
  ) AS electric_bike_rides,

  ROUND(
    COUNTIF(
      rideable_type = 'electric_bike'
    )
    / COUNT(*) * 100,
    2
  ) AS percent_electric

FROM
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean`

GROUP BY
  member_casual;
