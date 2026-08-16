# NTI-Road-Traffic-Accidents
Road Traffic Accidents Data Analysis Project

## Project Overview

This project focuses on analyzing road traffic accidents in Egypt using data from 2022 to 2025 using real datasets collected from the official website of the **Central Agency for Public Mobilization and Statistics (CAPMAS)**

The main goal was to turn the raw accident data into a clear and useful analysis that helps identify trends and patterns in road accidents, injuries, and deaths.

The project covers different aspects of the data, including time, governorates, gender, age groups, road users, and vehicle types.

## Project Workflow

The project followed the main stages of a data analysis workflow:

- Collected and organized the available accident data.
- Cleaned and prepared the raw data for analysis.
- Standardized the data and handled inconsistencies.
- Built a data model to support the analysis.
- Analyzed accident trends across different years and categories.
- Created interactive dashboards to present the results.

## Data Analysis

The analysis looks at road accident injuries and deaths from different perspectives, including:

- Yearly trends
- Monthly trends
- Governorates
- Gender
- Age groups
- Road users
- Vehicle types
- Injuries and deaths

This made it possible to compare accident patterns and identify the areas and categories with the highest numbers.

## Key Findings

Some of the main findings from the analysis include:

- Road accident injuries increased from **76,362 in 2024 to 84,553 in 2025**.
- Road accident deaths increased from **5,260 in 2024 to 5,829 in 2025**.
- **Dakahlia** recorded the highest number of road accident injuries among the governorates in 2025, with **17,975 injuries**.
- **October** recorded the highest number of road accident injuries in 2025, with **8,245 injuries**.
- **March** recorded the highest number of road accident deaths in 2025, with **583 deaths**.
- The data also shows clear differences in accident outcomes based on age, gender, road-user category, and vehicle type.

## Data Model

A Galaxy Schema was used to organize the data and make it easier to analyze the accident data from different dimensions.

## Dashboard

The final dashboards bring the main results together in an interactive format, allowing users to explore accident trends and compare different categories and periods.

## Tools

| Tool | Purpose |
|---|---|
| Excel | Data Storage & Organization |
| Power Query | Data Cleaning & Transformation |
| Power Pivot | Data Modeling |
| Power BI | Data Visualization & Dashboard Development |
| Python | Data Cleaning |
| SQL | Database Design & Data Analysis |

---
##  Project Folder Structure :
│
├── Data/
│   ├── DATA 2022.pdf
│   ├── DATA 2023.pdf
│   ├── DATA 2024.pdf
│   ├── DATA 2025.pdf
│   ├── DIRTY_Data.xlsx
│   └── Cleaning_Data+Dashboard.xlsx
│
├── Dashboards/
│   ├── Excel_dashboards.png
│   └── Power bi_dashboards.png
│
├── Python/
│   └── Python cleaning.ipynb
│
├── SQL/
│   └── road_accident_analysis.sql
│
├── Power BI/
│   └── Traffic Pulse report.pbix
│
├── Proposal.pptx
├── NTI_Road_Accidents_Presentation.pptx
├── README.md
