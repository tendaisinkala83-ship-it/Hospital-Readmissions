# Hospital Readmissions Analysis

## Overview
This project analyzes hospital readmission patterns using MySQL for data management and Tableau for visualization. Synthetic patient data was generated using Python to explore factors contributing to hospital readmissions and provide actionable insights for healthcare providers.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Tableau Setup](#tableau-setup)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Key Insights](#key-insights)
- [Technologies](#technologies)
- [Author](#author)

## Features
- Comprehensive analysis of hospital readmission rates
- Interactive Tableau dashboards for data exploration
- Patient demographic and clinical data analysis
- Readmission risk factors identification
- Synthetic data generation for testing and demonstration

## Prerequisites
Before you begin, ensure you have the following installed:
- MySQL Server (version 5.7 or higher)
- Tableau Desktop or Tableau Public (version 2021.1 or higher)
- Python (version 3.7 or higher)
- Required Python libraries: pandas, faker, numpy (see requirements.txt)

## Installation

### 1. Clone the Repository
```bash
git clone https://github.com/tendaisinkala83-ship-it/Hospital-Readmissions.git
cd Hospital-Readmissions
```

### 2. Set Up Python Environment
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

### 3. Generate Synthetic Data
```bash
python scripts/generate_synthetic_data.py
```
This will create CSV files with patient data that can be imported into MySQL.

### 4. Database Setup
Follow these steps to set up the MySQL database:

1. Open MySQL command line or MySQL Workbench
2. Create a new database:
```sql
CREATE DATABASE hospital_readmissions;
USE hospital_readmissions;
```

3. Import the database schema:
```bash
mysql -u your_username -p hospital_readmissions < database/schema.sql
```

4. Import the synthetic data (generated from Python):
```bash
mysql -u your_username -p hospital_readmissions < database/load_data.sql
```

5. Verify tables were created:
```sql
SHOW TABLES;
SELECT COUNT(*) FROM patients;
```

### 5. Tableau Setup
1. Open Tableau Desktop
2. Connect to your MySQL database:
   - Go to **Connect** > **MySQL**
   - Enter server: localhost (or your server address)
   - Username and password: your MySQL credentials
   - Select database: hospital_readmissions
3. Open the Tableau workbook file (`Hospital_Readmissions.twbx`)
4. The dashboards should connect automatically

## Usage

### Generating New Synthetic Data
If you want to generate fresh synthetic data:
```bash
python scripts/generate_synthetic_data.py --num_patients 5000 --output_path data/
```

### Running Analysis Queries
To run custom analysis queries:
```bash
mysql -u your_username -p hospital_readmissions < queries/readmission_analysis.sql
```

### Viewing Dashboards
1. Open the Tableau workbook in Tableau Desktop
2. Navigate through the sheets to explore visualizations:
   - Patient Demographics
   - Readmission Rates
   - Risk Factors Analysis
   - Temporal Trends
3. Use filters to drill down into specific patient cohorts or time periods

### Updating Data
To refresh the data in Tableau:
1. In Tableau, go to **Data** > **Refresh All**
2. Or manually import updated CSV files from the Python data generation script

## Project Structure
```
Hospital-Readmissions/
├── README.md
├── requirements.txt                 # Python dependencies
├── database/
│   ├── schema.sql                   # Database schema and tables
│   ├── load_data.sql                # SQL script to load data
│   └── stored_procedures.sql        # Any stored procedures
├── scripts/
│   ├── generate_synthetic_data.py   # Python script to create synthetic data
│   └── data_cleaning.py             # Data preprocessing scripts
├── queries/
│   ├── readmission_analysis.sql     # Key analysis queries
│   ├── patient_demographics.sql     # Demographic breakdowns
│   └── risk_factors.sql             # Risk factor analysis
├── data/
│   ├── patients.csv                 # Generated patient data
│   ├── readmissions.csv             # Readmission records
│   └── encounters.csv               # Hospital encounter data
├── tableau/
│   └── Hospital_Readmissions.twbx   # Tableau workbook
└── documentation/
    └── data_dictionary.md           # Column descriptions and definitions
```

## Key Insights
Document your main findings here:
- Readmission Rate: [Your percentage]
- Most Common Risk Factors: [List main factors]
- High-Risk Patient Groups: [Description]
- Preventive Measures: [Recommendations]

## Technologies
- **Python**: Synthetic data generation using Faker and pandas libraries
- **MySQL**: Database design, storage, and complex queries
- **Tableau**: Data visualization and interactive dashboard creation

## Author
[tendaisinkala83-ship-it](https://github.com/tendaisinkala83-ship-it)

## Contact
For questions or feedback about this project, please feel free to reach out or open an issue in the repository.