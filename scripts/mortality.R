here::i_am("scripts/mortality.R")

# Load the data
dat <- read.csv(here::here("data", "data_clean.csv"))

head(dat)
View(dat)

table(dat$ICU, dat$INTUBED)

# ICU Admission Rate
ICU_rate <- prop.table(table(dat$ICU)) * 100
print(ICU_rate)

# Intubation Rate
intubation_rate <- prop.table(table(dat$INTUBED)) * 100
print(intubation_rate)

# Mortality Rate
dat$death <- ifelse(!is.na(dat$DATE_DIED), 1, 0)
mortality_rate <- sum(dat$death == 1) / nrow(dat) * 100
print(mortality_rate)

summary_table <- data.frame(
  Metric = c("ICU Admission Rate (No)", "ICU Admission Rate (Yes)", 
             "Intubation Rate (No)", "Intubation Rate (Yes)", 
             "Mortality Rate (No)", "Mortality Rate (Yes)"),
  Rate = c(ICU_rate["No"], ICU_rate["Yes"], 
           intubation_rate["No"], intubation_rate["Yes"],
           100 - mortality_rate, mortality_rate)  # Mortality is the rate of 'Yes' death
)

summary_table


library(ggplot2)
# Bar plot for mortality by whether pregnancy or not
ggplot(data=dat, aes(x = factor(PREGNANT), y = mortality_rate, fill = factor(PREGNANT))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  scale_fill_manual(values = c("lightblue", "lightcoral"), labels = c("Not Pregnant", "Pregnant")) +
  labs(
    title = "Mortality Rate by Pregnancy Status",
    x = "Pregnancy Status",
    y = "Mortality Rate (%)"
  ) +
  theme_minimal()

