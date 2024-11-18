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

# Comorbidity Analysis (Coder 2): Yueran Cao
Analyze pre-existing conditions.
(Diabetes, copd, asthma, inmsupr, hypertension, cardiovascular, renal chronic, other disease, obesity, tobacco)
Conducted the comorbidity analysis, focusing on pre-existing conditions and their prevalence among COVID-19 patients, with visual and tabular outputs.


# Severity and Treatment Type (Coder 3): Tania Armour
Provides insights into specific health conditions and their interactions among COVID-19 patients, with a focus on visualizing relationships between pneumonia, pregnancy, asthma, diabetes, death status, and COVID-19 severity classification.

## Outputs:

Pneumonia vs. Pregnancy Bar Chart:
This bar chart compares the count of COVID-19 patients with and without pneumonia, segmented by pregnancy status.

Death Status by Severity Classification Bar Chart:
Displays the distribution of death status ("Yes" or "No") across different COVID-19 severity classifications.

Severity Classification by Asthma and Diabetes:
A faceted bar chart showing the distribution of severity classification, segmented by asthma and diabetes status.

COVID-19 Classification Pie Chart:
A pie chart representing the distribution of severity classifications among COVID-19 patients.

## Files:

pneumonia_vs_pregnancy.png: Pneumonia and pregnancy comparison bar chart saved in output/.
death_status_by_severity.png: Death status by severity classification bar chart saved in output/.
severity_by_asthma_diabetes.png: Severity classification by asthma and diabetes bar chart saved in output/.
classification_pie_chart.png: COVID-19 classification pie chart saved in output/.



# Outcome and Mortality Analysis (Coder 4): Chiao Yu Huang
Analyzes mortality-related outcomes among COVID-19 patients, focusing on ICU admission rates, intubation rates, and mortality rates. Additionally, it explores mortality differences based on pregnancy status.

## Outputs:
Summary Table:
A table that provides the rates for ICU admission, intubation, and mortality among COVID-19 patients.

Mortality Rate by Pregnancy Status Plot:
A bar chart showing mortality rates based on pregnancy status.

## Files:

summary_table.rds: The summary table, saved as an RDS file in output/.

mortality_by_pregnancy.png: The mortality rate plot by pregnancy status, saved as a .png file in output/.



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


