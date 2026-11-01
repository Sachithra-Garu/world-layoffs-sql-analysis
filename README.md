# World Layoffs: Data Cleaning and Exploratory Analysis Using MySQL

## Project Overview
This project uses MySQL to clean and explore a world layoffs dataset.
The aim is to prepare the data for analysis and examine recorded layoffs
across companies, industries, countries, funding stages, and time.

## Project Objectives
- Identify and remove duplicate records.
- Standardise inconsistent text values.
- Convert dates into a suitable date format.
- Investigate and handle missing values.
- Analyse layoffs across key categories.
- Calculate cumulative monthly layoffs.
- Rank companies by recorded layoffs within each year.

## Tools and Techniques
- MySQL
- MySQL Workbench
- Common Table Expressions (CTEs)
- Aggregations and GROUP BY
- Self-joins
- ROW_NUMBER()
- DENSE_RANK()
- SUM() OVER()

## Dataset
- Source: [Insert original dataset source]
- Dataset coverage: [Insert verified minimum and maximum dates]
- Original row count: [Insert verified count]
- Final row count: [Insert verified count]
- Usage conditions: [Insert applicable licence or source conditions]

## Data Cleaning
1. Created staging tables to work separately from the source data.
2. Identified duplicate records using ROW_NUMBER().
3. Removed duplicate records from the staging table.
4. Trimmed company names and standardised selected category values.
5. Converted the date field into DATE format.
6. Converted blank industry values to NULL.
7. Used company matches to populate missing industry values where justified.
8. Excluded records with neither a layoff count nor a layoff percentage.
9. Removed the temporary row-number column.

Any additional exclusions and their reasons:
[Document any company-specific or other exclusions.]

## Analysis Questions
- Which companies recorded the highest total layoffs?
- Which industries and countries recorded the highest totals?
- How did recorded layoffs vary by year and month?
- What was the cumulative monthly total?
- Which companies occupied the top five layoff ranks in each year?


## Repository Files
- 01_data_cleaning.sql: Data preparation and cleaning workflow.
- 02_exploratory_analysis.sql: Analysis queries.
- results/: Selected query outputs.
- screenshots/: Selected result screenshots.

## How to Reproduce
1. Obtain the dataset from the source listed above.
2. Import it into MySQL.
3. Follow the database and table setup instructions below.
4. Run 01_data_cleaning.sql.
5. Run 02_exploratory_analysis.sql.

Database and import details:
[Add the exact database name, source table name, import settings,
and MySQL version used.]

## Limitations
- Findings describe the records available in this dataset.
- Missing values and exclusions may affect the totals.
- Recorded layoff counts do not establish the reasons for layoffs.
- Company rankings use DENSE_RANK(), so ties may produce more
  than five companies within the top five ranks.

## Learning Reflection
This project strengthened my ability to prepare data, investigate
data-quality issues, and use SQL to explore patterns and communicate findings.

