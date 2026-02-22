# Hospital 30-Day Readmissions: Risk & Operational Analysis

## Overview  
Hospital Readmissions within 30 days are a critical indicator of care quality and a major cost driver for healthcare systems.
This project analyzes patient demographics, diagnosis categories, discharge timing, and operational factors to identify drivers of 30-day readmissions and highlight opportuniities for intervention.
Thia analysis was conducted  using MySQL for data modeling and SQL analysis and Tableau for interactive  dashboard visualization.

## Objectives 
- Calculate overall 30-day readmission rate.
- Identify high-risk diagnosis groups.
- Analyze the relationship between length of stay and readmissions.
- Develop an executive-level interactive dashboard.
- Segment risk by age group and payer.
- Assess impact of weekend vs weekday discharge.

## Tools & Technologies 

- **Python (data generation stage)**- synthetic dataset creation 
- **SQL**- aggregation, joins, segmentation queries
- **MySQL**- data storage and SQL analysis 
- **Tableau**- interactive dashboard development  
   
 
## Data & Schema Design 

A synthetic hospital admissions dataset was generated in Python and imported into MySQL.
The dataset was normalized into three relational tables:

**Patients**

- Patient_id 
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
- discharge_day_type (derived field)

**Diagnoses**

- admission_id
- diagnosis_group

This structure mirrors real-world healthcare database design and enables multi-table SQL joins for risk segmentation analysis.

## Key SQL Analyses 

The following analytical queries were performed;
- Readmission rate by diagnosis group 
- Length of stay bucket analysis
- Weekend VS weekday discharge comparison
- Age group risk segmentation
- Payer-based readmission analysis
- Multi-factor high-risk patient profiling
Example:

SELECT
    d.diagnosis-group,
    COUNT(*) AS total_admissions,
    ROUND(AVG(a.readmitted_30d) * 100,2) AS readmission_rate_pct
FROM admission a
JOIN diagnoses d
        ON a.admission_id = d.admission_id
GROUP BY d.diagnosis_group
ORDER BY readmission_rate_pct DESC;


## Dashboard Overview

The Tableau dashboard includes;
-Execute KPI summary(Admissions, Readmissions, Readmission %, Avg LOS)
-Readmission rate by diagnosis group
-Length of stay vs readmission analysis
-Weekend VS weekday discharge comparison
-Age group segmentation
-Payer-based risk analysis
-Interactive filters for exploratory analysis
The dashboard is designed for hospital leadership and operational decision-makers.

## Project Structure  
```
/sql_queries
    baseline_metrics.sql
    risk_segmentation.sql
    payer_analysis.sql
/tableau_dashboard
    hospital_readmission_dashboard.twbx
/data_schema
    schema_design.sql

README.MD 
```

## Key Insights

- Certain diagnosis groups demonstrate significantly higher readmission risk.
- Weekend discharges show elevated readmission rates, indicating possible operational gaps.
- Longer hospital stays do not consistently reduce readmission likelihood.
- Older patient groups and specific payer categories show higher readmission rates.

## Business Implications  

This analysis demonstrates how structured data modeling and segmentation can support;
-Improved discharge planning strategies
-Targeted follow-up programs for high-risk patients
-Resource allocation and staffing optimization
-Financial impact mitigation related to readmission penalties


## How to Reproduce 

1. Import dataset into MYSQL.  
2. Create normalized tables(patients, admissions, diagnoses).  
3. Run SQL scripts located in/sql_queries.
4. Connect Tableau to database.
5. Open dashboard file and exploe.

## About the Analyst  

This project was develpoed by a data analyst with a healthcare background, combining clinical domain knowlegde with SQL and BI tools to drive operational insights.

## Contact  

Tendai Sinkala
sinkalat99@gmail.com.
