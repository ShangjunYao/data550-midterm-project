# Load libraries
library(dplyr)
library(ggplot2)

# Open Data
library(readr)
data_clean <- read_csv("data/data_clean.csv")

# See how data is structured
str(data_clean)

# Graph 1: Comparing pneumonia and pregnancy data
plot1 <- ggplot(data_clean, aes(x = PNEUMONIA, fill = PREGNANT)) +
  geom_bar(position = "dodge") +
  theme_minimal() +
  labs(title = "Pneumonia vs. Pregnancy in COVID-19 Patients",
       x = "Pneumonia (Yes/No)", y = "Count",
       fill = "Pregnancy (Yes/No)") +
  scale_fill_manual(values = c("lightblue", "salmon"))

# Save Graph 1
ggsave("output/pneumonia_vs_pregnancy.png", plot = plot1, width = 8, height = 6)
print(plot1)
# Graph 2: Create a new column for Death status (Yes/No)
data_clean$DEATH_STATUS <- ifelse(is.na(data_clean$DATE_DIED), "No", "Yes")

# Comparing death status by severity classification
plot2 <- ggplot(data_clean, aes(x = CLASIFFICATION_FINAL, fill = DEATH_STATUS)) +
  geom_bar(position = "stack") +
  theme_minimal() +
  labs(title = "Death Status by COVID-19 Severity Classification",
       x = "Severity Classification",
       y = "Count",
       fill = "Death Status") +
  scale_fill_manual(values = c("lightblue", "salmon"))

# Save Graph 2
ggsave("output/death_status_by_severity.png", plot = plot2, width = 8, height = 6)

# Graph 3: Showing Asthma and Diabetes Cases based on classification
plot3 <- ggplot(data_clean, aes(x = CLASIFFICATION_FINAL, fill = factor(ASTHMA))) +
  geom_bar(position = "dodge") +
  facet_grid(~ DIABETES) + 
  theme_minimal() +
  labs(title = "Severity Classification by Asthma and Diabetes",
       x = "Severity Classification",
       y = "Count",
       fill = "Asthma (Yes/No)") +
  scale_fill_manual(values = c("lightblue", "salmon")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save Graph 3
ggsave("output/severity_by_asthma_diabetes.png", plot = plot3, width = 10, height = 6)

# Graph 4: Count the classification categories
classification_counts <- data_clean %>%
  count(CLASIFFICATION_FINAL) %>%
  arrange(desc(n))

# Create a pie chart for classification
plot4 <- ggplot(classification_counts, aes(x = "", y = n, fill = factor(CLASIFFICATION_FINAL))) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Classification of COVID-19 Cases", fill = "Classification") +
  theme_void()

# Save Graph 4
ggsave("output/classification_pie_chart.png", plot = plot4, width = 8, height = 6)


