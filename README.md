# Cyclistic Bike-Share Analysis

## Overview

This project analyzes Cyclistic’s 2025 bike-share trip data to identify differences in behavior between annual members and casual riders.

The goal was to answer the business question:

**How do annual members and casual riders use Cyclistic bikes differently?**

The analysis was completed using **Excel, BigQuery SQL, Google Sheets, and Tableau Public**. Twelve months of trip data were cleaned, combined, transformed, and analyzed to identify trends in ride frequency, ride duration, day-of-week usage, seasonality, and bike type preference.

## Project Links

- [View the Tableau Public Dashboard](https://public.tableau.com/app/profile/brian.davis1592/viz/CyclisticUserAnalysis_17909320764440/Dashboard1)
- [View SQL Queries](sql/)
- [View Full Case Study Report](report/Cyclistic_Bike_Share_Case_Study.pdf)
- [Divvy Public Data Source](https://divvy-tripdata.s3.amazonaws.com/index.html)

## Tools Used

- **Excel** — initial cleaning and creation of ride length and day-of-week fields
- **BigQuery / SQL** — data combination, transformation, aggregation, and analysis
- **Google Sheets / Connected Sheets** — transferring BigQuery summary results into Tableau Public
- **Tableau Public** — dashboard development and visualization

## Data Source

This project uses public 2025 trip data from Chicago’s Divvy bike-share system, provided by Motivate International Inc.

For the Google Data Analytics case study, Divvy data is used as the dataset for the fictional Cyclistic bike-share company.

The source data consisted of **12 monthly datasets covering January through December 2025**.

## Data Preparation

The monthly datasets were first reviewed in Excel for:

- Duplicate ride IDs
- Missing values
- Formatting inconsistencies
- Data type issues

Two additional fields were created:

- `ride_length`
- `day_of_week`

The monthly files were then imported into BigQuery and combined using `UNION ALL`.

During the combination process, I also added:

- `month_number`
- `month_name`

The resulting cleaned master dataset was saved as:

`Cyclistic_2025_Clean`

### Ride Length Transformation

The `ride_length` field was imported into BigQuery as a string in `HH:MM:SS` format.

Because some rows contained values such as:

`0:15:30`

while others contained:

`00:15:30`

I standardized the format using `LPAD()` and converted the duration into total seconds using `SUBSTR()` and `CAST()`.

This created a numeric field:

`ride_length_seconds`

which could then be used with aggregate functions such as `AVG()`.

## Analysis

The analysis focused on several behavioral differences between members and casual riders.

### Average Ride Length

| Rider Type | Average Ride Length |
|---|---:|
| Members | 739.9 seconds / 12.3 minutes |
| Casual Riders | 1,355.8 seconds / 22.6 minutes |

Casual rides were approximately **83% longer on average** than member rides.

### Day-of-Week Patterns

The most common riding day for:

- **Members:** Thursday
- **Casual riders:** Saturday

Member ridership remained relatively strong throughout the workweek, while casual ridership increased toward the weekend.

Casual riders also had longer average rides on every day of the week.

Their longest average rides occurred on:

- **Sunday:** 1,568.4 seconds
- **Saturday:** 1,515.4 seconds

For members:

- **Sunday:** 818.6 seconds
- **Saturday:** 809 seconds

### Monthly Ridership

Both groups showed increased ridership during warmer months.

Peak ridership occurred in:

- **Members:** August
- **Casual riders:** August

However, casual ridership was much more seasonal.

From August to September:

- Member ridership decreased by **0.69%**
- Casual ridership decreased by **21.4%**

Members also completed more rides than casual riders in every month of the year.

### Electric Bike Usage

I also calculated electric-bike usage by rider type during exploratory analysis.

- **Casual riders:** 72.46%
- **Members:** 64.71%

This analysis was not included as a primary finding in the final Tableau dashboard.

## Key Findings

The strongest behavioral differences were:

- Casual riders take significantly longer rides.
- Casual ridership is more concentrated on weekends.
- Members ride more consistently throughout the workweek.
- Casual ridership is more seasonal.
- Members complete more rides overall and use the service more consistently throughout the year.

Together, these patterns suggest that casual riders may use the service more often for occasional or recreational trips, while members may use Cyclistic more routinely for transportation.

The trip data does not directly identify trip purpose, so this interpretation should be treated as a likely behavioral pattern rather than a confirmed cause.

## Tableau Dashboard

The final Tableau dashboards visualize:

- Monthly ridership by rider type
- Ridership by day of week
- Average ride length by rider type
- Average ride length by day of week

Together, the dashboards show both **when riders use Cyclistic** and **how long they ride**.

### Interactive Dashboard

[View the Cyclistic User Analysis on Tableau Public](https://public.tableau.com/app/profile/brian.davis1592/viz/CyclisticUserAnalysis_17909320764440/Dashboard1)

## Recommendations

### 1. Target casual riders during peak season

Casual ridership increases substantially during spring and summer and peaks in August.

Cyclistic could increase membership marketing during these months when the largest number of casual riders are actively using the service.

### 2. Focus on weekend riders

Casual riders are most active on weekends and also take their longest rides during this period.

Weekend-focused digital campaigns could promote the value of an annual membership to riders who repeatedly use Cyclistic for leisure trips.

### 3. Emphasize membership value for frequent, longer casual rides

Casual riders average substantially longer trips than members.

Cyclistic could test marketing that shows frequent casual riders how repeated individual rides compare with the value of an annual membership.
