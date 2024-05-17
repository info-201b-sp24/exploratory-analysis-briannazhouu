library(ggplot2)

setwd("~/Documents/archive")
data <- read.csv("test.csv")
ggplot(data, mapping = aes(x = education, y = occupation, color = gender)) +
  geom_point(position = "dodge") + 
  labs(x = "Education", y = "Occupation", fill = "Gender", title = "Comparing 
       education and occupation")


