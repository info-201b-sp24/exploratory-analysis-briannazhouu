install.packages("tidyverse")

```{r setup, include=FALSE, , cache=TRUE}
knitr::opts_chunk$set(echo = FALSE)
library(tidyverse)
library(readr)
```

```{r code}
data <- read_csv("test.csv")
ggplot(data, aes(x = race, fill = workclass)) + 
  geom_bar(position = "dodge") +
  labs(x = "Race", y = "Count", fill = "Work Class", title = "Comparing Race and Work Class")
```
