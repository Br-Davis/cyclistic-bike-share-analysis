# Cyclistic Bike-Share Analysis

## Overview

This project analyzes Cyclistic’s 2025 bike-share trip data to identify differences in behavior between annual members and casual riders.

The primary business question was:

**How do annual members and casual riders use Cyclistic bikes differently?**

The analysis was completed using **Excel, BigQuery SQL, Google Sheets, and Tableau Public**. Twelve months of trip data were cleaned, combined, transformed, and analyzed to identify differences in ride frequency, ride duration, day-of-week usage, and seasonal ridership patterns.

## Project Links

- [View the Tableau Public Dashboard](https://public.tableau.com/app/profile/brian.davis1592/viz/CyclisticUserAnalysis_17909320764440/Dashboard1)
- [View the Full Case Study PDF](./Cyclistic_Bike_Share_Case_Study.pdf)
- [View the SQL Code](./SQL%20code)

## Business Task

Cyclistic wants to increase the number of casual riders who purchase annual memberships.

This analysis examines how casual riders and annual members currently use the bike-share system differently in order to identify patterns that may help support future marketing decisions.

## Tools Used

- **Excel** — initial data review, cleaning, and creation of ride length and day-of-week fields
- **Google BigQuery / SQL** — schema standardization, data combination, cleaning, transformation, validation, and analysis
- **Google Sheets / Connected Sheets** — transfer of analysis results for visualization
- **Tableau Public** — dashboard development and visualization
- **GitHub** — project documentation and SQL portfolio

## Data Source

This project uses public 2025 Divvy bike-share trip data from Chicago.

For the Google Data Analytics case study, the Divvy dataset is used to represent the fictional Cyclistic bike-share company.

The analysis includes **12 monthly datasets covering January through December 2025**.

Raw data files are not included in this repository because they are publicly available and are large in size.

Data source:  
https://divvy-tripdata.s3.amazonaws.com/index.html

## Data Preparation

The monthly datasets were reviewed for:

- Duplicate ride IDs
- Missing values
- Formatting inconsistencies
- Inconsistent data types
- Leading and trailing whitespace

Additional fields were created to support the analysis, including:

- `ride_length`
- `ride_length_seconds`
- `day_of_week`
- `month_number`
- `month_name`

The 12 monthly datasets were standardized and combined in BigQuery using `UNION ALL`.

Some monthly tables contained inconsistent data types that prevented them from being combined. These fields were standardized before the full-year dataset was created.

Only one representative version of some month-level schema correction queries was retained in the project files, although the same corrections were applied to the other monthly datasets that produced the same errors.

The final cleaned dataset used for analysis was:

`Cyclistic_2025_Clean`

## Data Cleaning

Several validation and cleaning steps were performed before analysis.

### Duplicate Check

Ride IDs were checked for duplicates.

**Result:** No duplicate ride IDs were found.

### Missing Data

Missing station names and station IDs were identified.

These records were retained because station location was not required to answer the primary business question.

### Whitespace

The data was checked for leading and trailing whitespace.

Station-name fields containing unnecessary whitespace were cleaned using `TRIM()`.

### Ride Length

Ride duration was originally stored in `HH:MM:SS` format and imported into BigQuery as a string.

The values were standardized using `LPAD()` and converted into total seconds using `SUBSTR()` and `CAST()`.

This created the numeric field:

`ride_length_seconds`

A small number of malformed ride-duration records that could not be converted were identified and removed.

## Analysis

### Average Ride Length

| Rider Type | Average Ride Length |
|---|---:|
| Members | 12.3 minutes |
| Casual Riders | 22.6 minutes |

Casual rides were approximately **83% longer on average** than member rides.

### Day-of-Week Patterns

The highest-ridership day for each group was:

- **Members:** Thursday
- **Casual riders:** Saturday

Member ridership remained relatively consistent throughout the workweek, while casual ridership increased toward the weekend.

Casual riders also had longer average rides than members on every day of the week.

### Monthly Ridership

Both rider groups showed higher ridership during warmer months.

Both members and casual riders reached their highest ridership in **August**.

Members completed more rides than casual riders in every month of the year.

From August to September:

- Member ridership decreased by **0.69%**
- Casual ridership decreased by **21.4%**

This suggests that casual ridership is substantially more seasonal than member ridership.

### Electric Bike Usage

Electric-bike usage was also examined during exploratory analysis.

- **Casual riders:** 72.46% of rides used electric bikes
- **Members:** 64.71% of rides used electric bikes

This analysis was not included as one of the primary findings in the final dashboard.

## Key Findings

The strongest differences between annual members and casual riders were:

- Casual riders take substantially longer rides.
- Casual ridership is more concentrated on weekends.
- Members ride more consistently throughout the workweek.
- Casual ridership is more seasonal.
- Members complete more rides overall and use the system more consistently throughout the year.

These patterns may suggest that casual riders use Cyclistic more often for occasional or recreational trips, while members may use the service more routinely.

Trip-purpose data was not available, so this interpretation should be treated as a possible explanation rather than a confirmed cause.

## Tableau Dashboard

The Tableau dashboard visualizes the major findings from the analysis, including:

- Monthly ridership by rider type
- Ridership by day of week
- Average ride length by rider type
- Average ride length by day of week

[View the interactive Cyclistic dashboard on Tableau Public](https://public.tableau.com/app/profile/brian.davis1592/viz/CyclisticUserAnalysis_17909320764440/Dashboard1)

## Recommendations

### 1. Target casual riders during peak season

Casual ridership increases substantially during spring and summer and reaches its highest level in August.

Cyclistic could increase membership-focused marketing during this period when the largest number of casual riders are actively using the service.

### 2. Focus membership marketing on weekend riders

Casual riders are most active on weekends and also take some of their longest rides during this period.

Weekend-focused campaigns could target riders who repeatedly use Cyclistic for longer leisure trips.

### 3. Emphasize membership value for frequent casual riders

Casual riders take substantially longer trips than annual members.

Cyclistic could test marketing that compares the cost of repeated casual rides with the potential value of an annual membership.

## SQL

The `SQL code` folder documents the BigQuery workflow used throughout the project.

The SQL includes:

- Schema standardization
- Full-year table creation
- Data-quality checks
- Cleaning
- Invalid record removal
- Ride-length transformation
- Monthly ridership analysis
- Day-of-week analysis
- Average ride-length analysis
- Ride-length analysis by day
- Electric-bike exploratory analysis

The files are numbered in the order of the project workflow.

## Project Status

**Completed**

This project was completed as part of the **Google Data Analytics Professional Certificate** case study and was expanded into a portfolio project using BigQuery, SQL, Tableau, and GitHub.

## Skills Demonstrated

- SQL
- Google BigQuery
- Excel
- Tableau
- Data cleaning
- Data validation
- Data transformation
- Exploratory data analysis
- Data visualization
- Business analysis
- Stakeholder communication
- Data-driven recommendations
