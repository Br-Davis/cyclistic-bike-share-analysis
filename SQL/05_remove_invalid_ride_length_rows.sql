-- ============================================================
-- 05_remove_invalid_ride_length_rows.sql
--
-- Purpose:
-- Remove records containing malformed ride_length values that
-- could not be converted into numeric ride durations.
--
-- These malformed records caused BigQuery CAST errors while
-- converting ride_length from HH:MM:SS into total seconds.
-- ============================================================

CREATE OR REPLACE TABLE
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean` AS

SELECT
  *

FROM
  `cycle-analysis-507422.Cyclistic_2025.Cyclistic_2025_Clean`

WHERE
  ride_id IS NULL

  OR ride_id NOT IN (

    '3AF2F8908C9386F8',
    '595AED6AB9A66E8F',
    '120BC0544C3B92E4',
    'A66DEC9146C488BF',
    '4976DE4C5F1AA516',
    '083534D28DA37F72',
    '434E3D11ABA96891',
    '9288498F5630E3AD',
    '222A5E8650C55311',
    '985A3462DAACFFCF',
    '12E0A9A586A45DE3',
    'F87FA50B8D40FA97',
    'ED8C9D500F271C3D',
    '093B3FC8E465DA4A',
    '83995E751A0DB5D5',
    '01C21B340CC1EEDA',
    '4446901DBDE0531B',
    '19386939ECD81B33',
    '5D010AFEA6850513',
    '8BF21DA40F846779',
    'A61B896123C0D647',
    '5F7692C857079901',
    'C89AFBD919D615FD',
    'E37AEB3E9CE2343E',
    '4A659F1BB40EDBF7',
    '5740B9AA6176D32C',
    'D1E5316AD88ECD45',
    'DA5386E5759667EC',
    '3301C8D1FF15E4CE'

  );
