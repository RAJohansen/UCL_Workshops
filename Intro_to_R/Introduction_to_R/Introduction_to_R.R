#########################################################
##########          INTRODUCTION TO R          ##########
#########################################################

#Richard A. Johansen
#University of Cincinnati
#Research & Data Services: 
browseURL("https://libraries.uc.edu/research-teaching-support/research-data-services.html")

#GitHub:
browseURL("https://github.com/RAJohansen")

#Twitter:
browseURL("https://twitter.com/johansen_phd")

### Section I: Coding Basics --------------------------------------------------------------
#### 1. R as a Calculator/Working with Mathematical Operators ####

# Addition (+)
1+2 

# Subtraction (-)
15-8

#Multiplication (*)
12*20

#Division (/)20/5


#Equation 
sin(pi*15)/100


#### 2.  Objects and Assignment Statements ####
# R stores values and objects so they can be reused throughout an equation or script

# Object Assignment
x <- 1+2
x

#Working with multiple objects
y <- x +1
y

#Hint alt - is a shortcut for the < -  

#### 3. Naming Convention ####

#short and sweet but relevent to you and any other readers of your script
#Case sensative x != X
#Must Start with a letter
#Only numbers, letters, _, and .
#Cases
#snake case "i_use_snake_case" 
#Camel Case  "iUseCamelCase"
#periods "i.use.periods"
#combinations "iCant_decide.which_toUse"

#### 4. Using Comments ####
#Using the # sign to create a comment
#Comments are essential for reproducible code
#Your most likely collaborator is future you!!

# Simple example
1+1 # This is the formula for 1+1

# More complicated
p <- 3.14
RoC <- 4
x <- p*RoC^2

# What is this calculating?
#Can we rewrite this so others have an easier time understanding it?

pi <- 3.14 #rounded value of pi
r <- 4 #radius of a circle
area <- pi*r^2 #formula for calculating the area of a circle 

#This still is somewhat intuitive but what if you're making your own formula?
# Do not use "magic" numbers
#Every number standalone number should have a description Example p above.

#### 5. Creating a series of numbers ####  
#Lets say you want to create a series of numbers from 1-10 and call the object "series"
# You can use the c function to combine elements together
series <- c(1,2,3,4,5,6,7,8,9,10)

#However what if you wanted to create a series to 100?
#Using c would take too long, so we use a range of values by using the ":"
series <- 1:100

# Easy right? This is because the series is in order but what if we want a series of 1:100 by 2?
# This is were we want to introduce functions

#### 6. Understanding how to interpret functions ####
#General recipe for functions: function_name(argument #1 = value #1, argument #2 = value #2)

# Going back to our series task
# We want to create a series of numbers from 1 to 100 by 2
# Luckily there are many functions already available to use in base R (many many more available from packages, which we will discuss later)

# Given that we are just learning R, I will tell you that the function is called "seq()"
#The first thing I do when using a new functions is to look at the documentation.
#Use the ? to find R documentation on an object
?seq()
#HINT!!: Scroll to the bottom of the help page for workable examples.


### Getting Help in R
help(mean)
#HINT: if you can't remember exactly what function you are looking for, Use Tab
me #press tab

#Not sure what its called 
#Try a fuzzy search
apropos("mea") 

#### Section I Tasks ####
# Task 1A:
# Work with your neighbor or by yourself and explore the documentation

#Create a sequence from 1 to 10 using the seq() function
seq(1,10)

# Task 1B
#Create a sequence of numbers from 50 to 150 by 3
seq(50, 150, by =3) #define step by value

# TASK 1C
#Create a sequence of numbers from 25 to 0 decreasing by 5 and save it an object called "my_seq"
my_seq <- seq(25, 0, by =-5) #define step by value

####---------------------------------####
####---------------------------------####
### Section II: Creating, Importing and Exporting data ----------------------------------------------------------------
# Vectors: vectors (a row of numbers, also called 1-dimensional arrays)
# Matrices: Matrices are nothing more than 2-dimensional vectors.
# Data Frames: A data frame is a matrix with names above the columns 
# Lists: The main advantage of lists is that the columns or collection of vectors
#don't have to be of the same length, unlike matrices and data frames.

## Most of the time you will be working with Data frames

#### 1. Creating A data frame ####
# We can create a data frame by combining multiple vectors together

employee <- c('John','Peter','Abby','Hope','Robert', 'Emily')
salary <- c(15000, 23400, 26800, 22000,35000,45000)
experience <- c(1,2,3,2,4,7)

# Using the data.frame function we can combine multiple vectors into a data frame
company <- data.frame(employee, salary, experience)

# You can view the data by clicking in the upper right hand corrner on Company
# or use code through the View() function
View(company)


#### 2. Saving A data frame ####
# There are many ways and types of formats to save but most commonly will be csv
# For more information explore the readr package
  #read_csv() #read csv into a tibble #read.csv() reads into a dataframe
  #read_csv2() # semicolon sv into a tibble #read.csv2() reads into a dataframe
  #read_tsv()  #Reads tab-deliminated into a tibble
  #read_delim() # reads files with any delimiter
  #read_fwf() #reads fixed width files
  #read_table() #reads common variation of fixed-width files separated by white space

# Saving (writing) data is simple in R
?write.csv()
#write.csv(x = <Name of R object>, file  = <"C:/temp/my_data.csv">)

# Lets save our company data to our computer
write.csv(my_seq, "C:/temp/data.csv")

#### 3. Importing data ####
# Just like saving, there are many ways to import data but we will stick with csv for this exercise

# Importing our comapny data from our computer using read.csv and call it company_data
?read.csv()
# Alternatively, you can use the import dataset button in the top right (but using code is always beter)

company_data <- read.csv("C:/temp/data.csv")

# Example for importing with Excel
df <- readxl::read_xlsx("C:/myfolder/mydata/fake_data.xlsx")


####---------------------------------####
####---------------------------------####
### Section III: Exploring the Tidyverse!----------------------------------------------------------------

# Install and Load the tidyverse package
require("tidyverse")
require("gapminder")

#Explore the Tidyverse 
browseURL("https://www.tidyverse.org/")

# R packages must be installed once but loaded everytime
# Using require is a nice way to make sure every script has the packages required
#Combines
install.packages() 
library()

#### 1. Basic Data Exploration ####
#For this section we will use the gapminder data set thats contained in Base R

#Lets assign this to gapminder
gapminder <- gapminder

#View our table
#click the df object under the Data window or
View(gapminder)

# Lists the variables 
names(gapminder)

#Lets look at the structure of the data
str(gapminder)
#This will become very useful when we visualize the data
#Make sure your variables are in the appropiate format!!

## Statistical summary of the data
summary(gapminder)

## Finding values from out data table
# Lets look at column 2 
gapminder[,2]

#Lets look at row 5
gapminder[5,]

#What value is in row 5 column 3?
gapminder[5,3]

# Based on this idea, we can make more complicated searches
#Lets take the first ten observations and look at the variables:
# Country (1), Continent(2), Year (3), and population (5)
gapminder[1:10,c(1:3, 5)]

# What if we want to know the highest gpdPercap
max(gapminder$gdpPercap)

#Lets find the row number of the country with the highest gpdpercap
which.max(gapminder$gdpPercap)

#Then show me all columns for row 20
gapminder[854,]


#### 2. The filter verb ####
#The filter verb is used to look at a subset of a data set
# Typically you combine filter with a pipe %>%

gapminder %>% 
  filter(country == "United States")

#Multiple Conditions
gapminder %>% 
  filter(year == 2007, country == "United States")

### The arrange verb ----------------------------------
#Used for sorting data by ascending or descending condition

#Default is lowest or smallest value
gapminder %>% 
  arrange(gdpPercap)

# To sort by descending value
gapminder %>% 
  arrange(desc(gdpPercap))

### Combining verbs
gapminder %>% 
  filter(year == 2007) %>% 
  arrange(gdpPercap)

### The mutate verb ----------------------------------
#Change or Add variables to a data set

#Change a variable
gapminder %>% 
  mutate(pop = pop/1000000)

#Add a new variable called gdp
gapminder %>% 
  mutate(gdp = gdpPercap * pop)

### Combine all three verbs 
gapminder %>% 
  mutate(gdp = gdpPercap * pop) %>% 
  filter(year == 2007) %>% 
  arrange(desc(gdp))

## The Summarize Verb --------------------------------------------
# Summarize entire data set
gapminder %>% 
  summarize(meanLifeExp = mean(lifeExp))

#Returns the mean of all rows (one value)

#What if we want to return the mean life exp just for 2007
gapminder %>% 
  filter(year == 2007) %>% 
  summarize(meanLifeExp = mean(lifeExp))

# Creating multiple Summaries
gapminder %>% 
  filter(year == 2007) %>% 
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

str(gapminder)
#What data tyep is pop?
gapminder$pop <- as.numeric(gapminder$pop)

### The group_by Verb --------------------------------------------
# The group_by verb is useful for creating groups to summarize

# Summarize by each unique year
gapminder %>% 
  group_by(year) %>% 
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

# Summarize data from 2007 by continent
gapminder %>% 
  filter(year == 2007) %>% 
  group_by(continent) %>% 
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

### What if we want to summarize by continent over all years?
#Simply add an additional arguement to the group_by verb
gapminder %>% 
  group_by(year, continent) %>% 
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

#### Section III Tasks ####
# Answer the following questions using the mtcars dataset
mtcars <- mtcars
View(mtcars)
# Task 3A. find the median mpg & wt for each group of cylinders  
mtcars %>% 
  group_by(cyl) %>% 
  summarize(median_mpg = median(mpg),
            median_wt = median(wt))

# Task 3B. find the mean of hp and drat for each group of gear and cyl & 
          #find the ratio between mean hp and mean drat
mtcars %>% 
  group_by(cyl,gear) %>% 
  summarize(mean_drat = mean(drat),
            mean_hp = mean(hp),
            hp_drat_ratio = mean_hp/mean_drat)

####---------------------------------####
####---------------------------------####
### Section IV: Programming with R ####
### Writing Functions ####
#Functions are like black boxes but in this case you are creating the box
#you do not care exactly how these are calculated just that it works.

#Function recipe
my_fun <- function(arg1, arg2) {
  body
}

#Example #1
#Lets write a function that outputs 3x the input called triple()

#Triple function
triple <- function(x) {
  x*3
}

#Test triple function
triple(6)
#Hint: the last argument of the r function is automatically returned

#Example #2
#Lets write a function that outputs the area of circle
# We only need one input, the radius, since pi constant

AoC <- function(x) {
  pi*(x)^2
}

#Test AoC function
AoC(4)
AoC(10)

### Apply Family ####
# Running loops is extremely common in programming 
# R has built in functions that make running loops easier than using traditional for and while loops
# These are the apply family, which we will briefly cover.
?lapply()
?sapply()

### 
areas <- list(2.37,2.49,2.18,2.22,2.47,2.32)

AoC <- function(x) {
  pi*(x)^2
}

# lapply was designed for lists
lapply(areas, AoC)
#unlist(lapply(areas, AoC))

# sapply simplifies this task because all objects are the same data type.
sapply(areas, AoC)


####---------------------------------####
####---------------------------------####
#### OPTIONAL: Loops ####
### While Loops ####
#Recipe
while (condition) {
  expression
}

#Lets set a counter (ctr) to run while ctr is less than 7
# And print ctr is set to "counter"
ctr <- 1

while( ctr <= 7) {
  print(paste("ctr is set to", ctr))
  ctr <- ctr + 1
}

### For Loops ####

#Recipe
for (var in seq){
  expression
}

# Example
cities  <- c("New York", "Paris", "London",
             "Tokyo", "Rio de Janeiro", "Cape Town")

for (city in cities){
  print(city)
}

?mtcars
