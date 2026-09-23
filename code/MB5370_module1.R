#Basic arthmetic (e.g. wrangling sea surface temperatures)
24.5+1.2
32.0/4

#------------------------------------#
# MB5370: Techniques in Marine Science 1
# Programming Fundamentals
# < Kaytlin Edwards > 
# < 15 September 2026 >

#------------------------------------#
# Workshop 01. Introduction ####

# R syntax and working in scripts ####
# This section introduces us to R by running simple calculations inside a script.

2+1
1:30
6*2

# R Functions and arguments ####
# This section introduces us to different built-in functions in R.

years_old <- 25.7
round(years_old) # rounds up
floor(years_old) # rounds down

# This section explains how each function has arguments. The function 'Round' has an argument that lets you specify how many decimal places you want to round a number to. 
years_old <- 25.765
round(years_old, 2) # comma after the object/function (years_old) to specify the argument. 

# This section helps you discover what options are available for each function using args
?round # When you run this you'll go to help
args(round) # Use args in your console

# Objects and Assignment
## This section focuses on understanding how data is stored in R and why that matters. Storing data (42) inside an object/ or variable (coral count).

coral_count <- 42  # assignment operator <- saves '42' to 'coral count'

# Saving a single value 
coral_count <- 42

# Save a vector of multiple fish lengths (in mm)
fish_lengths <- c(124, 152, 98, 221, 146) 

# Assignment operator keyboard short cut [Option-]

# Manipulating Objects 
coral_count + 1
coral_count + coral_count

#Debugging codes

# Field survey data
quadrat_area_m2 <- 0.25
number_of_quadrats <- 16
total_area_surveyed <- quadrat_area_m2 * number_of_quadrats

# Let's print out the result
print(total_area_surveyed)

#1.5 Packages and installing ####
#install.packages("tidyverse") # download and install 
library(tidyverse)
library(dplyr)
library(ggplot2)

#1.6 Data Types ####
# This section introduces the 4 main data types you'll encounter as a marine biologist: numeric, integer, character, logical.

## Checking structures
# Assign variable values
site_name <- "Heron_Island"
transect_depth_m <- 12.5
bleaching_present <- TRUE

# Check using function class()
class(site_name)
class(transect_depth_m)
class(bleaching_present)

# Check using function str()
str(site_name)
str(transect_depth_m)
str(bleaching_present)

## Exercise rounding numbers 
# Tracking the age of an old-growth Porites coral colony
years_old <- 25.765

# Clean this up for our summary report
round(years_old, 2)

## Manipulating variables
# Make variables
years_old <- 25.765
rounded_age <- round(years_old, 2)

# Combine text and data variables
paste("Average colony age is", rounded_age, "years old")

# The Discrepancy: Look at your printed output string. It reads "Average colony age is 25.76 years old". Now imagine the field protocol for this survey requires all data to be recorded at one decimal place. How could we achieve this?
# Task: Modify the arguments inside the round() function above so that the mathematical truncation matches the expected field report text exactly.
rounded_age <- round(years_old, 1)

#1.7 Data Structures
## Vectors are. a collection of elements

fish_lengths <- c(124, 152, 98, 221, 146) #vector with numeric variables

coral_spp <- c("Porites", "Acropora", "Montastrea") #vector with character elements

#Interrogating the type
class(fish_lengths)
class(coral_spp)

notes <- c("Acropora", 27.5, TRUE)
notes

## Lists. unlike vectors, lists can be severakl different types

notes <- list("Acropora", 27.5, TRUE)
notes

# Data Frames and Tibbles ####
my_dataframe <- data.frame (no = c(1,2,3), c("Plectropomus", "Scarus", "Pomacentrus"), c(TRUE, FALSE, TRUE))
my_dataframe 
str (my_dataframe)


my_dataframe$no = as.factor(my_dataframe$no)
str (my_dataframe)

#------------------------------------#
# MB5370: Techniques in Marine Science 1
# Programming Fundamentals
# < Kaytlin Edwards > 
# < 15 September 2026 >

#------------------------------------#
# Workshop 02. Visualization ####

library(tidyverse)

#2.17 Create your first ggplot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#2.18 Understand the ‘grammar of graphics’
##2.18.1 Graphing template
ggplot() 
ggplot(data = mpg)

##2.18.2 Aesthetic mappings
### change point color by class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))

###change point size by class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

###change point transparency by class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

###change point shape by class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

###changing points manually, picking a specific colour blue 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#2.20 Facet and panel plots
##breaking a simple complex into many subplots, a common practice in scientific literature.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

##facets
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(. ~ cyl)

#2.21 Fitting simple lines
##to display data as points
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

##to display data as a smooth line
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

##change line type within a single variable 
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

##setting group aesthetic to a categorical variable (drv)
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

##changing color of each line based on drv value 
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE,
  )

##plotting multiple geoms: smooth line, grouped, and points 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

##programmatically more efficient way of plotting multiple geoms.. alows you to display different aesthetics for different layers!
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)


#Exercise:
## What geom would you use to draw a line chart? A boxplot? A histogram? An area chart?
geom_line()
geom_histogram()
geom_boxplot()
geom_area()

## Run this code in your head and predict what the output will look like. Then, run the code in R and check your predictions. Will these two graphs look different? Why/why not?


ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy), method = "gam")

## 2.22.1plotting statistics diamond dataset
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

##using geoms and stats interchangeably 
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))


demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)
demo

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")

##override a default mapping from transformed variables to aesthetics
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop), group = 1))

##Plotting statistical details
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

##2.23 Aesthetic adjustments
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

##aesthetics by color
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

#To alter transparency (alpha)
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")

#To color the bar outlines with no fill color
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")

#position fill works like stacking, but makes each set of stacked bars the same height.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

#position "dodge" places overlapping objects directly beside one another.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

#position = "jitter" adds a small amount of random noise to each point to avoid overplotting when points overlap. This is useful for scatterplots but not barplots.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")


