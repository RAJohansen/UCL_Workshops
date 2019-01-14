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

## Creating a list of numbers
list <- c(1,2,3,4,5,6,7,8,9,10)

#However what if you wanted to create a list to 100?
list <- 1:100

# Easy because the list is in order but now we want a list of 1:100 by 2?
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

##Plotting using base plot
#We will come back to plotting
#But I want to show how quick and easy it is to plot in R

#Plot our sequence from Task 1B
plot(my_seq)
#Create a histogram of 100 random normal values
hist(rnorm(100))

### Working with Data ----------------------------------------------------------------
# Vectors: vectors (a row of numbers, also called arrays –1-dimensional)
# Matrices: Matrices are nothing more than 2-dimensional vectors.
# Data Frames: A data frame is a matrix with names above the columns 
# Lists: The main advantage of lists is that the “columns” or collection of vectors
  #don’t have to be of the same length, unlike matrices and data frames.

## Most of the time you will be working with Data frames
#Additionally, these data sets will be from else where so you need to import them

## Importing data 
read.csv("C:/myfolder/mydata/data.csv")
readxl::read_xlsx("C:/myfolder/mydata/data.xlsx")
mtcars  <- mtcars
