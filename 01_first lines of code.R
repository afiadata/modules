# Welcome to this script, where we will be covering our first lines of code.

# Introduction to R
print('Hello World')
# > run code

# Valid variable names
my_variable <- 5
myVariable <- 10
.myVariable <- 15
my.variable <- 20
my_variable2 <- 25

# Invalid variable names
my_variable <- 30   # Cannot start with a number
my-variable <- 35    # Hyphens are not allowed


## Once a particular value is assigned to a variable, it becomes an object
# Objects can also hold complex data structures like matrices, lists, dataframes

# Vector
my_vector <- c(1, 2, 3, 4, 5)

# Matrix
my_matrix <- matrix(1:9, nrow = 3, ncol = 3)

# List
my_list <- list(name = "John", age = 30, scores = c(85, 90, 95))

# Data Frame
my_data_frame <- data.frame(
  name = c("Alice", "Bob", "Charlie"),
  age = c(25, 30, 35),
  score = c(88, 92, 95)
)

# Factor
my_factor <- factor(c("low", "medium", "high", "low", "medium"))


# Functions
# Basic mathematical functions
sum(1, 2, 3)            # Returns 6
mean(c(1, 2, 3, 4, 5))  # Returns 3
sqrt(16)                # Returns 4

# Character manipulation functions
toupper("hello")        # Returns "HELLO"
nchar("hello")          # Returns 5

# Statistical functions
sd(c(1, 2, 3, 4, 5))    # Returns the standard deviation


library(rio)
library(tidyverse)

# using the rio package to import data
data <- import('dementia_spending.csv')

east_africa <- c("Kenya","Uganda","Tanzania")

east_africa_data <- data %>%
  filter(location_name == east_africa)

# The filter() function is used to subset a data frame, retaining all rows 
# that satisfy your conditions. To be retained, the row must produce a value 
# of TRUE for all conditions.

# our data is already in long format
# we can do a basic plot to see how some of the variables appear

east_africa_data %>%
  ggplot(aes(year_id,val))+
  geom_line()

# using the ggplot function, we can get a basic plot of a line graph
# However, there's much to be done for us to understand what's happening
# We need to see the trend per country.
# And see which unit had the most spending.
# Label our plots.... etc