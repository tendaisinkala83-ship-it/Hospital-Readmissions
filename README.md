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
- Python 3.x
- pandas
- numpy
- faker
- Tableau
- MYSQL

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
   

## Database Setup
- To set up the database, import the provided CSV files into your database management system (e.g., MySQL, PostgreSQL):
  - `Patients.csv`
  - `Admissions.csv`
  - `Diagnoses.csv`

## Tableau Setup
1. Open Tableau.
2. Connect to your database.
3. Load the `Patients`, `Admissions`, and `Diagnoses` tables.

## Usage
- Run the analysis scripts in the `src` directory.
- Visualize the results using Tableau.

## Project Structure
```
Hospital-Readmissions/
├── Patients.csv
├── Admissions.csv
├── Diagnoses.csv
├── src/
├── README.md
└── requirements.txt
```

## Key Insights
-  Elderly patients(75+) had the highest readmission rate.
-  Certain chronic conditions showed significantly higher recurrence.
-  Longer length of stay correlated with increased readmission probability.
-  Emergency admissions had higher readmission rates than elective admissions.

## Business Recommendations
- Implement targeted post-discharge follow-ups for high-risk groups.
- Develop chronic disease management programs.
- Improve discharge planning for emergency admissions.
- Monitor patients with extended hospital stays more closely.

## Contact
Tendai Sinkala
sinkalat99@gmail.com
