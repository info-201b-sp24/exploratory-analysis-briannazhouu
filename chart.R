library(ggplot2)
library(dplyr)


summary_data <- test %>%
  group_by(gender, education) %>%
  summarise(Count = n()) %>%
  ungroup()


ggplot(summary_data, aes(x = education, y = Count, fill = gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Comparison of Gender and Education",
       x = "Education Level",
       y = "Count",
       fill = "Gender") 
