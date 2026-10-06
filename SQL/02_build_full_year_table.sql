-- ============================================================
-- 02_build_full_year_table.sql
--
-- Purpose:
-- Combine all 12 monthly Cyclistic tables into one full-year
-- dataset and add month identifiers for seasonal analysis.
-- ============================================================

CREATE OR REPLACE TABLE
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Full_Year` AS

SELECT
  *,
  1 AS month_number,
  'January' AS month_name
FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_01_25`

UNION ALL

SELECT
  *,
  2 AS month_number,
  'February' AS month_name
FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_02_25`

UNION ALL

SELECT
  *,
  3 AS month_number,
  'March' AS month_name
FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_03_25`

UNION ALL

SELECT
  *,
  4 AS month_number,
  'April' AS month_name
FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_04_25`

UNION ALL

SELECT
  *,
  5 AS month_number,
  'May' AS month_name
FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_05_25`

UNION ALL

SELECT
  *,
  6 AS month_number,
  'June' AS month_name
FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_06_25`

UNION ALL

SELECT
  *,
  7 AS month_number,
  'July' AS month_name
FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_07_25`

UNION ALL

SELECT
  *,
  8 AS month_number,
  'August' AS month_name
FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_08_25`

UNION ALL

SELECT
  *,
  9 AS month_number,
  'September' AS month_name
FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_09_25`

UNION ALL

SELECT
  *,
  10 AS month_number,
  'October' AS month_name
FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_10_25`

UNION ALL

SELECT
  *,
  11 AS month_number,
  'November' AS month_name
FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_11_25`

UNION ALL

SELECT
  *,
  12 AS month_number,
  'December' AS month_name
FROM `cycle-analysis-507422.Cyclistic_2025.Cyclistic_12_25`;
