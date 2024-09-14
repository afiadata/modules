# Dementia Spending
# Load libraries
library(rio)
library(tidyverse)

# Import data
data <- import("data/dementia_spending.csv")

# let's get the names of the columns
names(data)

# Get data from east africa
east_africa <- c("Kenya","Uganda","Tanzania")
east_africa_data <- data %>% 
  filter(location_name == east_africa)

# Get Attributable dementia spending
attributable_spending <- east_africa_data %>% 
  filter(model_output == "Attributable dementia spending")

attributable_spending %>%
  ggplot(aes(year_id, val, colour = location_name))+
  geom_line()

# Using additional packages and methods to improve output
library(ggthemes)
library(scales)

attributable_spending %>%
  ggplot(aes(year_id, val, colour = location_name))+
  geom_line()+
  geom_point()+
  labs(title = "Attributable Dementia Spending",
       subtitle = " in East Africa Countries",
       x = "year",
       y = "value")+
  scale_y_continuous(labels = comma)+
  theme_minimal()