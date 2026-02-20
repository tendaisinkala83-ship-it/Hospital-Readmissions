# Hospital Readmissions

## Overview
Hospital readmissions are costly and often preventable. This project analyzes patient admission data to identify key factors contributing to 30-day hospital readmissions.

The analysis was performed using MYSQL, and insights were visualized in an interactive dashboard built with Tableau.

## Business Problem
Hospital administrators want to:
- Reduce 30 day readmission rates
- Identify  high-risk patient groups
- understand patterns in diagnoses, age, and length of stay
- Improve patient care while reducing financial penalties

## Tool & Technologies
- Python 3.x
- pandas
- numpy
- faker
- Tableau
- MYSQL

## Installation
1. Clone the repository:
   ```
   git clone https://github.com/<your-username>/Hospital-Readmissions.git
   cd Hospital-Readmissions
   ```
2. Install the required Python packages:
   ```
   pip install -r requirements.txt
   ```

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
