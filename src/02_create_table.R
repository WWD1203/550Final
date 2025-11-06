# src/02_create_table.R

# Summary statistics for numeric variables
num_summary <- data %>%
  summarise(
    Mean_Age = mean(Age, na.rm = TRUE),
    SD_Age   = sd(Age, na.rm = TRUE),
    Mean_Sleep = mean(Sleep_Hours, na.rm = TRUE),
    SD_Sleep   = sd(Sleep_Hours, na.rm = TRUE),
    Mean_WorkHrs = mean(Work_Hours, na.rm = TRUE),
    SD_WorkHrs   = sd(Work_Hours, na.rm = TRUE)
  )

# Distribution of stress levels
stress_dist <- data %>%
  count(Stress_Level) %>%
  mutate(Percent = round(n / sum(n) * 100, 1))

# Distribution of reported mental health conditions
mental_dist <- data %>%
  count(Mental_Health_Condition) %>%
  mutate(Percent = round(n / sum(n) * 100, 1))
