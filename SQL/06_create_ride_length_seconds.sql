-- ============================================================
-- 06_create_ride_length_seconds.sql
--
-- Purpose:
-- Convert ride_length from HH:MM:SS text into total seconds
-- so ride duration can be analyzed numerically.
-- ============================================================

CREATE OR REPLACE TABLE
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean_v2` AS

SELECT

  * EXCEPT(ride_length_seconds),

  CAST(
    SUBSTR(
      LPAD(ride_length, 8, '0'),
      1,
      2
    ) AS INT
  ) * 3600

  +

  CAST(
    SUBSTR(
      LPAD(ride_length, 8, '0'),
      4,
      2
    ) AS INT
  ) * 60

  +

  CAST(
    SUBSTR(
      LPAD(ride_length, 8, '0'),
      7,
      2
    ) AS INT
  )

  AS ride_length_seconds

FROM
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean`;


-- BigQuery's free-tier environment did not allow the DML
-- UPDATE workflow used in some examples.
--
-- A new table was therefore created with the additional
-- ride_length_seconds field.


-- ------------------------------------------------------------
-- Replace the original clean table after verification
-- ------------------------------------------------------------

CREATE OR REPLACE TABLE
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean` AS

SELECT
  *

FROM
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean_v2`;
