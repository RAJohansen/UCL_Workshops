#########################################################
##########          INTRODUCTION TO R          ##########
#########################################################

#Richard A. Johansen
#University of Cincinnati
#Science and Engineering Libraries
#Research & Data Services: https://libraries.uc.edu/digital-scholarship/data-services.html
#GitHub: RAJohansen
#Twitter: @DataVizJohansen


### R Basics--------------------------------------------------------------
## R as a Calculator
#simple to complex equations
1+2
[1] 3

sin(pi*15)/100
[1] 5.389623e-17

# Objects and Assignment Statements
#Hint alt - is a shortcut for the < - 
x <- 1+2
x
y <- x +1
y

## Naming Convention
#short and sweet but relevent to you and any other readers of your script
#Case sensative x != X
#Must Start with a letter
#Only numbers, letters, _, and .
#Cases
#snake case "i_use_snake_case" 
#Camel Case  "iUseCamelCase"
#periods "i.use.periods"
#combinations "iCant_decide.which_toUse"

## Commenting
#Using the # sign to create a comment

1+1 # This is the formula for 1+1

## Getting Help in R
help(mean)
#HINT: if you can't remember exactly what function you are looking for, Use Tab
me "Tab"

#Not sure what its called 
#Try a fuzzy search
apropos("mea") 

## Creating a series of numbers
series <- c(1,2,3,4,5,6,7,8,9,10)

#However what if you wanted to create a series to 100?
series <- 1:100

# Easy because the series is in order but now we want a series of 1:100 by 2?
# This is were we want to introduce functions
#Simple function format: function_name(argument #1 = value #1, argument #2 = value #2)

#To accomplish this goal we will use the sequence or seq() function
#The first thing I do when using a new functions is to look at the documentation.
#Use the ? to find R documentation on an object
?seq()

#HINT!!: Scroll to the bottom of the help page for workable examples.

# Task #1:
#Using this function how would you create a sequence from 1 to 100? 
seq(1,10)

# TASK 1B
#Create a sequence of numbers from 1 to 100 by 2 called my_seq
my_seq <- seq(1, 100, by =2) #define step by value

### Importing and Exporting data ----------------------------------------------------------------
# Vectors: vectors (a row of numbers, also called 1-dimensional arrays)
# Matrices: Matrices are nothing more than 2-dimensional vectors.
# Data Frames: A data frame is a matrix with names above the columns 
# Lists: The main advantage of lists is that the columns or collection of vectors
  #don't have to be of the same length, unlike matrices and data frames.

## Most of the time you will be working with Data frames
#Additionally, these data sets will be from else where so you need to import them

# Importing data 
df <- read.csv("C:/myfolder/mydata/data.csv")
df <- readxl::read_xlsx("C:/myfolder/mydata/data.xlsx")
# Or using the import dataset button in the top right

# Saving (writing) data
write_csv(df, "C:/myfolder/data.csv")

### Exploring data-------------------------------------------------------------
#Lets explore data using a data set thats contained in R
cars  <- mtcars

#View our table
#click the df object under the Data window or
View(cars)

# Lists the variables 
names(cars)

#Lets look at the structure of the data
str(cars)
#This will become very useful when we visualize the data
#Make sure your variables are in the appropiate format!!

## Statistical summary of the data
summary(cars)

## Finding values from out data table
# Lets look at column 2 
cars[,2]

#Lets look at row 5
cars[5,]

#What value is in row 5 column 3?
cars[5,3]

# Based on this idea, we can make more complicated searches
#Lets take the first ten cars and look at their MPG (1), HP(4), and qsec(7)
cars[1:10,c(1,4,7)]

# What if we want to know the max mpg
max(cars$mpg)
#Lets find the row number of the vehicle with the highest mpg
which(cars== max(cars$mpg))
#Then show me all columns for row 20
df[20,]

#**More efficiently
df[which.max(cars$mpg),]

#TASK 2
#find the fastest car with 6 cylinders
cars_6 <- cars[which(cars$cyl== 6),]
cars_6[which.min(cars_6$qsec),]

###Plotting using base plot -------------------------------------------------

### Default Plot
plot(mtcars$mpg)

### Dotchart
dotchart(mtcars$mpg)
# Adding details and labels to a Simple Dotplot
dotchart(mtcars$mpg,labels=row.names(mtcars),cex=.7,
         main="Gas Milage for Car Models", 
         xlab="Miles Per Gallon")

### Histogram
hist(cars$mpg)
# Colored Histogram with Different Number of Bins
hist(mtcars$mpg, breaks=10, col="red")

### Kernel Density Plot
d <- density(mtcars$mpg) # returns the density data 
plot(d) # plots the results
#Using polygon to fill in the density plot
polygon(d, col = "red")

#Barplot
barplot(cars$mpg)

#2-D Scatterplot
plot(cars$mpg,cars$qsec)


## OPTIONAL: Visualization with ggplot2
#install.packages("ggplot2")
library(ggplot2)

## OPTIONAL: Deeper look into statistics
#Lots of files to explore in Data_Vis project under R_Stats

# using the pastecs package
#install.packages("pastecs")
library(pastecs)
?stat.desc()
stat.desc(df)
