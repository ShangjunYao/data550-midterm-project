# path
here::i_am("scripts/Demographic.R")

# library packages
pacman::p_load(tidyverse, gtsummary, labelled,ggplot2)

# load data
Covid_dt <- read.csv(here::here("data", "data_clean.csv"))
str(Covid_dt)


# ************************************
#         1. table               -----
# ************************************

median_age<-median(Covid_dt$AGE)
Covid_dt <- Covid_dt |> mutate(
  AGE_group = if_else(AGE >median_age, ">55 years old", "<= 55 years old")
)

# (1) label variables
Covid_dt <- Covid_dt |> 
  set_variable_labels(
    MEDICAL_UNIT = "Number of medical units",
    SEX = "Sex",
    PATIENT_TYPE = "Type of admission",
    DATE_DIED = "Date of death",
    INTUBED = "Intubation status",
    PNEUMONIA = "Pneumonia",
    AGE_group = "Age",
    PREGNANT = "Pregnancy status",
    DIABETES = "Diabetes",
    COPD = "COPD",
    ASTHMA = "Asthma",
    INMSUPR = "Immunosuppression",
    HIPERTENSION = "Hypertension",
    OTHER_DISEASE = "Other diseases",
    CARDIOVASCULAR = "Ccardiovascular conditions",
    OBESITY = "Obesity",
    RENAL_CHRONIC = "Chronic renal disease",
    TOBACCO = "Tobacco use",
    CLASIFFICATION_FINAL = "Final classification",
    ICU = "Admission to ICU"
  )


# (2) table
table_Demographic <- Covid_dt |> 
  group_by(SEX) |> 
  tbl_summary(
    by = AGE_group, 
    include = c( 
                TOBACCO,
                PREGNANT,DIABETES,COPD,ASTHMA,INMSUPR,HIPERTENSION,OBESITY,RENAL_CHRONIC, CARDIOVASCULAR, OTHER_DISEASE,
                MEDICAL_UNIT, INTUBED, PNEUMONIA,
                CLASIFFICATION_FINAL, ICU),
    missing = "no", 
    digits = list(all_continuous() ~ c(2, 2),
                  all_dichotomous() ~ c(0, 1),
                  all_categorical() ~ c(0, 1))
  ) |> 
  add_overall() |> 
  add_p(pvalue_fun =purrr::partial(style_pvalue, digits =3)) |> 
  modify_caption("**Table: Summary of patient characteristics by age groups**") |> 
  modify_header(label ~ "**Variables**") |> 
  bold_labels()


saveRDS(table_Demographic, file = here::here("output/output_demographic/", "table_Demographic.rds") )

# ************************************
#         2. figure              -----
# ************************************

# (1) Age distribution histogram
ggplot(Covid_dt, aes(x = AGE)) +
  geom_histogram(binwidth = 5, fill = "grey", colour = "grey60", alpha = 0.7) +
  theme_bw() +
  labs(
    title = "Age Distribution of COVID-19 Patients",
    x = "Age (Years)", 
    y = "Frequency",
    caption = "Data source: COVID-19 Patient Database\nHistogram uses a bin width of 10 years"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),   # Title style
    axis.title.x = element_text(size = 12, face = "bold"),             # X-axis label style
    axis.title.y = element_text(size = 12, face = "bold"),             # Y-axis label style
    axis.text = element_text(size = 10),                               # Axis text style
    plot.caption = element_text(size = 9, hjust = 1, face = "italic")                              # Remove minor grid lines
  ) -> plot_age_distribution


saveRDS(plot_age_distribution, file = here::here("output/output_demographic/", "plot_age_distribution.rds") )



# (2) CLASIFFICATION_FINAL across age group
class_age_summary <- Covid_dt %>%
  group_by(CLASIFFICATION_FINAL, AGE_group) %>%
  summarise(Count = n())


ggplot(class_age_summary, aes(x = as.factor(CLASIFFICATION_FINAL), y = Count, fill = AGE_group)) +
  geom_bar(stat = "identity", 
           position = position_dodge(width = 0.6), # Increase distance between bars of the same x
           width = 0.6,                           # Widen the bars
           colour = "black") +
  scale_fill_manual(
    values = c("skyblue", "orange"), 
    name = "Age Group",
    labels = c("≤ 55 years old", "> 55 years old")
  ) +
  labs(
    title = "Distribution of COVID-19 Patients by Classification and Age Group",
    x = "Final Classification",
    y = "Frequency",
    caption = "Data source: COVID-19 Patient Database"
  ) +
  theme_bw() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),   # Title style
    axis.title.x = element_text(size = 14, face = "bold"),             # X-axis label style
    axis.title.y = element_text(size = 14, face = "bold"),             # Y-axis label style
    axis.text.x = element_text(size = 12),                             # X-axis tick labels
    axis.text.y = element_text(size = 12),                             # Y-axis tick labels
    legend.title = element_text(size = 12, face = "bold"),             # Legend title style
    legend.text = element_text(size = 12),                             # Legend text style
    plot.caption = element_text(size = 10, hjust = 1, face = "italic")                                 # Remove minor grid lines
  ) -> plot_class_age_bar

saveRDS(plot_class_age_bar, file = here::here("output/output_demographic/", "plot_class_age_bar.rds") )
