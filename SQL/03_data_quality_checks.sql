-- ============================================================
-- 03_data_quality_checks.sql
--
-- Purpose:
-- Check the full-year dataset for duplicate IDs, missing data,
-- whitespace issues, and row-count integrity.
-- ============================================================


-- ------------------------------------------------------------
-- Check for duplicate ride IDs
-- ------------------------------------------------------------

SELECT
  ride_id,
  COUNT(*) AS occurrence_count
FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Full_Year`
GROUP BY ride_id
HAVING COUNT(*) > 1;

-- Result:
-- No duplicate ride IDs were found.


-- ------------------------------------------------------------
-- Check missing values
-- ------------------------------------------------------------

SELECT
  COUNT(*) AS total_rows,

  COUNTIF(
    ride_id IS NULL OR TRIM(ride_id) = ''
  ) AS missing_ride_id,

  COUNTIF(
    rideable_type IS NULL OR TRIM(rideable_type) = ''
  ) AS missing_rideable_type,

  COUNTIF(
    start_station_name IS NULL OR TRIM(start_station_name) = ''
  ) AS missing_start_station,

  COUNTIF(
    start_station_id IS NULL OR TRIM(start_station_id) = ''
  ) AS missing_start_station_id,

  COUNTIF(
    end_station_name IS NULL OR TRIM(end_station_name) = ''
  ) AS missing_end_station,

  COUNTIF(
    end_station_id IS NULL OR TRIM(end_station_id) = ''
  ) AS missing_end_station_id,

  COUNTIF(
    member_casual IS NULL OR TRIM(member_casual) = ''
  ) AS missing_member_type

FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Full_Year`;

-- Station-name and station-ID fields contained substantial
-- missing data.
--
-- These rows were retained because station location was not
-- required to answer the project's main business question:
-- how annual members and casual riders use Cyclistic differently.


-- ------------------------------------------------------------
-- Check for leading/trailing whitespace
-- ------------------------------------------------------------

SELECT
  COUNTIF(ride_id != TRIM(ride_id))
    AS ride_id_spaces,

  COUNTIF(rideable_type != TRIM(rideable_type))
    AS rideable_type_spaces,

  COUNTIF(start_station_name != TRIM(start_station_name))
    AS start_station_name_spaces,

  COUNTIF(start_station_id != TRIM(start_station_id))
    AS start_station_id_spaces,

  COUNTIF(end_station_name != TRIM(end_station_name))
    AS end_station_name_spaces,

  COUNTIF(end_station_id != TRIM(end_station_id))
    AS end_station_id_spaces,

  COUNTIF(member_casual != TRIM(member_casual))
    AS member_casual_spaces

FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Full_Year`;

-- The whitespace audit found 919 affected rows.
