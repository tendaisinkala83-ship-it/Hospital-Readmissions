# Hospital Readmissions

## Overview
Hospital readmissions within 30days are a critical indicator of care quality and a major cost driver for healthcare systems. This project analyzes patient demgraphics, diagnosis categories, discharge timing, and operational factors to  identify drivers of 30 day readmissions and highlight opportunities for intervention.

The analysis was performed using MYSQL for data modeling and SQL analysis, and insights were visualized in an interactive dashboard built with Tableau.

## Objectives
- Calculate overall 30-day readmission rate
- Identify  high-risk diagnosis groups
- Analyze the relationship between length of stay and readmissions
- Assess impact of weekend vs. weekday discharge
- Segment risk by age group and payer
- Develop an executive-level interactive dashboard
  

## Tool & Technologies
- **MYSQL**- data storage and SQL analysis
- **SQL**- aggregations, joins, segmentation queries
- **Tableau**- interactive dashboard development
- **Python(data generation stage)**- synthetic dataset creation
  
  
## Data & Schema Design
A synthetic hospital admissions dataset was generated in Python and imported into MySQL.
The dataset was normalized into three relational tables:

**Patients**
- Pateint_id
- age_group
- sex
- race
- payer

**Admissions**
- admission_id
- patient_id
- admission_date
- discharge_date
- length_of_stay
- readmitted_30d
- discharge_day_type(derived field)

**diagnoses**
- admission_id
- diagnosis_group

This structure mirrors real_world healthcare database design and enables multi-table SQL joins for risk segmentation analysis.
   

## Key SQL Analyses

The following analytical queries were performed:
 
  - Overall readmission rate calculation
  - Readmission rate by diagnosis group
  - Length of stay bucket analysis
  - Weekend vs. weekday discharge comparison
  - Age group risk segnentation
  - Payer-based readmission analysis
  - Multi-factor high-risk patient profiling
Example:
SELECT
   d.diagnosis_group,
   COUNT(*) AS total_admissions,
   ROUND(AVG(a.readmittied_30d) * 100, 2) AS readmission_rate_pct
FROM admissions a
JOIN diagnoses d
   ON a.admission_id = d.admission_id
GROUP BY d. diagnosis_group
ORDER BY readmission_rate_pct DESC;


## Dashboard Overview

The Tableau dashboard includes:

- Executive KPI summary (Admissions, Readmissions, Readmission %, Avg LOS)
- Readmission rate by diagnosis group
- Length of stay vs readmission analysis
- Weekend vs weekday discharge comparison
- Age group segmentation
- Payer-risk analysis
- Interactive filters for exploratory analysis
The dashboard is designed for hospital leadership and operational decision-makers.


## Project Structure

/sql_queries
    baseline_metrics.sql
    risk_segmentation.sql
    payer_analysis.sql
/tableau_dashboard
    hospital_readmissions_dashboard.twbx
/data_schema
    schema_design.sql
README.md


## Key Insights
-  Elderly patients(75+) and specific payer categories show higher readmission rates.
-  Certain chronic conditions showed significantly higher readmission risk.
-  Longer length of stay do not consistently reduce readmission likelihood.
-  Weekend discharges show elevated readmission rates, indicating possible operational gaps.

## Business Implications

This analysis demonstrates how structured data modelling and segmentation can support:
- Implement targeted post-discharge follow-ups for high-risk groups.
- Develop chronic disease management programs.
- Improve discharge planning for emergency admissions.
- Monitor patients with extended hospital stays more closely.
- Financial impact mitigation related to readmission penalties.

##How to Reproduce

1. Import dataset into MYSQL
2. Create normalized tables(patients, admissions, diagnoses)
3. Run SQL scripts located in / sql_queries
4. Connect Tableau to database
5. Open dashboard file and explore

##About the Analyst

This project was developed by a data analyst with a healthcare background, combing clinical domain knowledge with SQL and BI tools to drive operational insights.

## Contact
Tendai Sinkala
sinkalat99@gmail.com
