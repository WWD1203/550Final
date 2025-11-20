# src/01_prep_data.R

# 1. Load Required Libraries
library(tidyverse)
library(knitr)
library(here)

# 2. Load Data
# Note: Path is relative to the project root directory where 'make' is executed.
data <- read_csv(here("data", "Mental_Health_Lifestyle_Dataset.csv"))

# 3. Data Cleaning / Renaming (Crucial for handling spaces in column names)
data <- data %>%
  rename(
    Exercise_Level = `Exercise Level`,
    Diet_Type = `Diet Type`,
    Sleep_Hours = `Sleep Hours`,
    Stress_Level = `Stress Level`,
    Mental_Health_Condition = `Mental Health Condition`,
    Work_Hours = `Work Hours per Week`,
    Screen_Time = `Screen Time per Day (Hours)`,
    Social_Score = `Social Interaction Score`,
    Happiness_Score = `Happiness Score`
    # Note: 'Country', 'Age', 'Gender' are already clean
  )


saveRDS(data, file = here("data", "processed_data.rds"))