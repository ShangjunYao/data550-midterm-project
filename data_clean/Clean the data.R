library(dplyr)

data <- read.csv("/Users/shangjunyao/DATA550/midterm_project/covid_sub.csv")

#Check the missing data
colSums(is.na(data))

#Clean the missing data except date_died
columns_to_filter <- c("SEX", "INTUBED", "PNEUMONIA", "AGE", "PREGNANT", "DIABETES", 
                       "COPD", "ASTHMA", "INMSUPR", "HIPERTENSION", "OTHER_DISEASE", 
                       "CARDIOVASCULAR", "OBESITY", "RENAL_CHRONIC", "TOBACCO", "ICU")

data_clean <- data %>% 
  filter(if_all(all_of(columns_to_filter), ~ !is.na(.)))

# Check the result
colSums(is.na(data_clean))

write.csv(data_clean, "/Users/shangjunyao/DATA550/midterm_project/data/data_clean.csv", row.names=FALSE)