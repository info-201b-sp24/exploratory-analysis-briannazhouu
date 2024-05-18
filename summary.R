# Load necessary libraries
library(dplyr)

# Load the dataset
data <- read.csv("./income_data.csv")

# Compute summary information
summary_info <- list()
summary_info$num_observations <- nrow(data)

# Most common race
summary_info$most_common_race <- data %>%
  group_by(race) %>%
  summarise(count = n()) %>%
  filter(count == max(count)) %>%
  pull(race)

# Gender distribution
summary_info$gender_distribution <- data %>%
  group_by(gender) %>%
  summarise(count = n())

summary_info$most_common_job_women <- data %>%
  filter(gender == "Female") %>%
  group_by(occupation) %>%
  summarise(count = n()) %>%
  filter(count == max(count)) %>%
  pull(occupation)

summary_info$most_common_job_men <- data %>%
  filter(gender == "Male") %>%
  group_by(occupation) %>%
  summarise(count = n()) %>%
  filter(count == max(count)) %>%
  pull(occupation)

# Average age
summary_info$avg_age <- mean(data$age, na.rm = TRUE)

# Education levels distribution
summary_info$education_levels <- data %>%
  group_by(education) %>%
  summarise(
    total_count = n(),
    black_count = sum(race == "Black", na.rm = TRUE),
    white_count = sum(race == "White", na.rm = TRUE)
  )

# Print summary information
print(summary_info)

aggregate_table <- data %>%
  group_by(education) %>%
  summarise(
    `Total Count` = n(),
    `Average Age` = round(mean(age, na.rm = TRUE), 1),
    `Black Count` = sum(race == "Black", na.rm = TRUE),
    `White Count` = sum(race == "White", na.rm = TRUE),
    `Male Count` = sum(gender == "Male", na.rm = TRUE),
    `Female Count` = sum(gender == "Female", na.rm = TRUE)
  ) %>%
  arrange(desc(`Total Count`))

# Print the aggregate table
print(aggregate_table)
