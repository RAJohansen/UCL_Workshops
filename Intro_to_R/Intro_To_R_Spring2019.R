#########################################################
##########          INTRODUCTION TO R          ##########
#########################################################

#Richard A. Johansen
#University of Cincinnati
#Science and Engineering Libraries
#Research & Data Services: https://libraries.uc.edu/digital-scholarship/data-services.html
#GitHub: RAJohansen
#Twitter: @DataVizJohansen


### R Interface Basics--------------------------------------------------------------
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

## Creating a list of numbers
list <- c(1,2,3,4,5,6,7,8,9,10)

#However what if you wanted to create a list to 100?
list <- 1:100

# Easy because the list is in order but now we want a list of 1:100 by 2?
# This is were we want to introduce functions
#Simple function format: function_name(argument #1 = value #1, argument #2 = value #2)

#To accomplish this goal we will use the sequence or seq() function
#The first thing I do when using a new functions is to look at the documentation.
#HINT: Use the ? to find R documentation on an object
?seq()

# Task #1:
#Using this function how would you create a sequence from 1 to 100? 
seq(1,10)

# TASK 1B #
#Create a sequence of numbers from 1 to 100 by 2 and save it to an object called Seq1
Seq <- seq(1, 100, by =2) #define step by value

