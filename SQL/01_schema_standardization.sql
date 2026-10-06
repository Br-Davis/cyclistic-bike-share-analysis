-- ============================================================
-- 01_schema_standardization.sql
-- Cyclistic 2025 Bike-Share Analysis
--
-- Purpose:
-- Standardize monthly table schemas before combining the
-- January-December datasets into one full-year table.
--
-- Note:
-- Only one representative example of some month-level schema
-- corrections was retained in the project history. The same
-- transformation was applied to the other monthly tables that
-- produced the same BigQuery type mismatch.
-- ============================================================


-- ------------------------------------------------------------
-- Standardize ride_length as STRING
-- ------------------------------------------------------------
-- Some monthly tables imported ride_length as TIME while others
-- imported it as STRING. BigQuery UNION ALL requires matching
-- data types across corresponding columns.
--
-- January is retained here as the representative example.
-- The same CAST was applied to other affected monthly tables.

CREATE OR REPLACE TABLE
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_01_25` AS

SELECT
  * REPLACE(
    CAST(ride_length AS STRING) AS ride_length
  )
FROM
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_01_25`;


-- ------------------------------------------------------------
-- Standardize day_of_week as INT64
-- ------------------------------------------------------------
-- One monthly table imported day_of_week using a different type.
-- The field was converted to INT64 so it matched the other tables.

CREATE OR REPLACE TABLE
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_08_25` AS

SELECT
  * REPLACE(
    CAST(day_of_week AS INT64) AS day_of_week
  )
FROM
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_08_25`;


-- ------------------------------------------------------------
-- Standardize latitude/longitude columns
-- ------------------------------------------------------------
-- During the UNION ALL process, BigQuery reported incompatible
-- types for station coordinate fields in several monthly tables.
--
-- start_lat, start_lng, end_lat, and end_lng were standardized
-- as STRING in the affected tables.
--
-- The affected monthly tables included:
-- Cyclistic_07_25
-- Cyclistic_08_25
-- Cyclistic_10_25
-- Cyclistic_11_25
--
-- These transformations were performed during preparation even
-- though the individual queries were not all retained in the
-- final saved SQL history.
