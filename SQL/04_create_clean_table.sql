-- ============================================================
-- 04_create_clean_table.sql
--
-- Purpose:
-- Create the cleaned master dataset used for analysis.
-- ============================================================


CREATE OR REPLACE TABLE
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean` AS

SELECT
  * REPLACE(
    TRIM(start_station_name) AS start_station_name,
    TRIM(end_station_name) AS end_station_name
  )

FROM
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Full_Year`;


-- ------------------------------------------------------------
-- Verify row counts
-- ------------------------------------------------------------

SELECT

  (
    SELECT COUNT(*)
    FROM
      `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Full_Year`
  ) AS full_year_rows,

  (
    SELECT COUNT(*)
    FROM
      `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean`
  ) AS clean_rows;


-- ------------------------------------------------------------
-- Verify whitespace removal
-- ------------------------------------------------------------

SELECT

  COUNTIF(
    start_station_name != TRIM(start_station_name)
  ) AS start_station_whitespace,

  COUNTIF(
    end_station_name != TRIM(end_station_name)
  ) AS end_station_whitespace

FROM
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean`;
