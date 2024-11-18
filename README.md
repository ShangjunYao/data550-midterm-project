# COVID-19 Data Analysis Project

This project analyzes COVID-19 data from Mexico, covering patient demographics, health conditions, treatment types, and outcomes.

## Features: 
21 variables covering patient demographics, health conditions, treatment types, and outcomes, including attributes like sex, age, covid classification, pre-existing conditions, and ICU admission status.

##Source: 
Mexican government dataset on COVID-19 cases in Mexico

# Team designations
Team Lead: Shangjun Yao
Responsibilities: Setting up the GitHub repository, organizing the project structure, managing the configuration file, merging/testing code from team members, and compiling the final report.

# Demographic Analysis (Coder 1): Xiaxian Ou:
## Summarize patient demographics.
## outputs: 
Tables:

A summary table grouped by age group and sex.

Visualizations:

Age Distribution Histogram: Shows the distribution of patient ages.
Classification by Age Group: Illustrates COVID-19 classification distribution segmented by age group.

## Files:
table_Demographic.rds: Generated summary table saved to output/output_demographic/.
plot_age_distribution.rds: Histogram of age distribution saved to output/output_demographic/.
plot_class_age_bar.rds: Bar plot of classification distribution by age group saved to output/output_demographic/.

Comorbidity Analysis (Coder 2): Yueran Cao
Analyze pre-existing conditions.
(Diabetes, copd, asthma, inmsupr, hypertension, cardiovascular, renal chronic, other disease, obesity, tobacco)
Show prevalence rates of these conditions among COVID-19 patients, using bar charts and tables.

Severity and Treatment Type (Coder 3): Tania Armour
Summarize COVID-19 severity levels and types of care received (e.g., outpatient vs. hospitalized).
(Classification, patient type, pneumonia, pregnancy)
Create visualizations, such as pie charts for the classification of cases and bar charts for patient types.

Outcome and Mortality Analysis (Coder 4): Chiao Yu Huang
Focus on ICU admissions, intubation status, and mortality data.
(Intubed, icu, usmr, medical unit, date died)
Generate tables and survival rate graphs, and assess ICU and intubation rates based on comorbidities.



## Project Structure

- `/data/`: Contains datasets, including `covid_sub.csv`,`covid_sub.cvs`.
- `/data_clean/`: how to clean the data. (keep date_died missing data, then clean rest of the missing data).
- `/scripts/`: Analysis scripts are organized by type (e.g., demographics, comorbidities).
- `/output/`: Stores generated tables, figures, and the final report.
- `/config/`: Contains configuration files to adjust parameters (e.g., file paths, report titles).
- `/report/`: Contains the final compiled report.(midterm_report.Rmd)


## Customization
Config File: This file will allow adjustments to parameters like date ranges, output formats, and specific conditions.

Customization Examples:
Adjust the age range for demographic analysis.
Filter comorbidity results by age or sex.
Include or exclude certain conditions based on the analysis needs.


