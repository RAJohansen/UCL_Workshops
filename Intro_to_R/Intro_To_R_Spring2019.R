#########################################################
##########          INTRODUCTION TO R          ##########
#########################################################

#Richard A. Johansen
#University of Cincinnati
#Science and Engineering Libraries
#Research & Data Services: https://libraries.uc.edu/digital-scholarship/data-services.html
#GitHub: RAJohansen
#Twitter: @DataVizJohansen


### Section 1: R Basics--------------------------------------------------------------
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

### Section 2: Importing and Exporting data ----------------------------------------------------------------
# Vectors: vectors (a row of numbers, also called 1-dimensional arrays)
# Matrices: Matrices are nothing more than 2-dimensional vectors.
# Data Frames: A data frame is a matrix with names above the columns 
# Lists: The main advantage of lists is that the columns or collection of vectors
  #don't have to be of the same length, unlike matrices and data frames.

## Most of the time you will be working with Data frames
#Additionally, these data sets will be from else where so you need to import them

# Saving (writing) data
write_csv(my_seq, "C:/temp/data.csv")

# Importing data 
df <- read.csv("C:/temp/data.csv")
df <- readxl::read_xlsx("C:/myfolder/mydata/data.xlsx")
# Or using the import dataset button in the top right

### Section 3: Exploring data-------------------------------------------------------------
#Lets explore data using a data set thats contained in R
mtcars  <- mtcars

#View our table
#click the df object under the Data window or
View(mtcars)

# Lists the variables 
names(mtcars)

#Lets look at the structure of the data
str(mtcars)
#This will become very useful when we visualize the data
#Make sure your variables are in the appropiate format!!

## Statistical summary of the data
summary(mtcars)

## Finding values from out data table
# Lets look at column 2 
mtcars[,2]

#Lets look at row 5
mtcars[5,]

#What value is in row 5 column 3?
mtcars[5,3]

# Based on this idea, we can make more complicated searches
#Lets take the first ten mtcars and look at their MPG (1), HP(4), and qsec(7)
mtcars[1:10,c(1,4,7)]

# What if we want to know the max mpg
max(mtcars$mpg)
#Lets find the row number of the vehicle with the highest mpg
which(mtcars== max(mtcars$mpg))
#Then show me all columns for row 20
df[20,]

#**More efficiently
df[which.max(mtcars$mpg),]

#TASK 2
#find the fastest car with 6 cylinders
mtcars_6 <- mtcars[which(mtcars$cyl== 6),]
mtcars_6[which.min(mtcars_6$qsec),]

### Section 4: Plotting using base plot -------------------------------------------------
#Useful resources for using base plot in R
#https://www.harding.edu/fmccown/r/
#https://www.statmethods.net/graphs/index.html

### Default Plot
plot(mtcars$mpg)

### Dotchart
dotchart(mtcars$mpg)
# Adding details and labels to a Simple Dotplot
dotchart(mtcars$mpg,
         labels=row.names(mtcars),
         main="Gas Milage for Car Models", 
         xlab="Miles Per Gallon")

### Histogram
hist(mtcars$mpg)
# Colored Histogram with Different Number of Bins
hist(mtcars$mpg, breaks=10, col="red")

### Kernel Density Plot
d <- density(mtcars$mpg) # returns the density data 
plot(d) # plots the results
#Using polygon to fill in the density plot
polygon(d, col = "red")

### Barplot
barplot(mtcars$cyl) #???

#Need to create a variable called count to count the number of each group
counts <- table(mtcars$cyl)
#Barplot of counts
barplot(counts)

#Add title and axis lable
barplot(counts, 
        main="Car Distribution", 
        xlab="Number of Gears")

# Stacked Bar Plot with Colors and legend
counts <- table(mtcars$cyl, mtcars$gear)
barplot(counts,
        main="Car Distribution by Cylinders and Gears",
        xlab="Number of Gears",
        col = c("darkred","darkblue","orange"),
        legend = rownames(counts))

### Box Plots
# Boxplot of MPG by Car Cylinders 
boxplot(mtcars$mpg~mtcars$cyl)
# Boxplot with labels
boxplot(mpg~cyl,
        data=mtcars,
        main="Car Milage Data", 
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon")

### Pie Charts
slices <- table(mtcars$cyl)
lbls <- c("Four", "Six", "Eight")
pie(slices,
    labels = lbls,
    main="Pie Chart of mtcars Cylindars")

### Scatterplot
# Simple Scatterplot
plot(mtcars$wt,mtcars$mpg)

#Add labels
plot(mtcars$wt, mtcars$mpg,
     main="Scatterplot Example", 
     xlab="Car Weight ",
     ylab="Miles Per Gallon ",
     pch=19)
#Add linear regression line 
abline(lm(mtcars$mpg~mtcars$wt), col="red") # regression line (y~x) 

###Line Graphs
lines <- c(1:2,4,7,5,8,10,7)
plot(lines)

# Graph line using blue points overlayed by a line 
plot(lines, type="o", col="blue")
#Add a title
title(main="My Line Graph")

### Section 5: Basic Stats with R ----------------------------------------------
# Statistics are used to summerize data!
#We use stats because it is difficult to memorize and decipher raw numbers

#Example 1:
#Car traffic per day for a week
total <- sum(5,16,15,16,13,20,25)
days <- 7
total/days
# Average daily traffic is 15.7 mtcars

#Two basic types of Statistics
#Descriptive Stats: uses data to describe the characteristics of a group
#Inferential Stats: uses the data to make predictions or draw conclusions

### Descriptive Statistics -----------------------------------------------------
#One variable
summary(mtcars$mpg)
#Entire Data set
summary(mtcars)

#Tukey's five-number summary: Min, Lower-hinge, Median, Upper-Hinge, Max (Not Labeled)
#These five numbers that define a boxplot
fivenum(cars$mpg)

###Althernative Descriptive Stats I
#install.packages("psych")
library("psych")
describe(mtcars)  #vars, n, mean, sd, median, trimmed, mad, min, max, range, skew, kurtosis, se

###Alternative Descriptive Stats II
#install.packages("pastecs")
library(pastecs)
?stat.desc()
stat.desc(mtcars)

### Analyzing by Subgroup ------------------------------------------------------
#Load the iris dataset
data(iris)
View(iris)
mean(iris$Petal.Width)

#Split the data file and repeat analysis using "aggregate"
#Allowing for the comparison of means by group
aggregate(iris$Petal.Width ~ iris$Species, FUN = mean) # ~ means a function of...
means <- aggregate(iris$Petal.Width ~ iris$Species, FUN = mean)
plot(means)
# there is significant difference between species 

#Using cbind we can conduct multiple calculations at once
#Note: the results do not keep the column headers so you need to remember the order
#you specified them or rename the variables
aggregate(cbind(iris$Petal.Width, iris$Petal.Length)~ iris$Species, FUN = mean)

### Calculating Correlations ---------------------------------------------------
mtcars <- mtcars
#Explore how all variables relate using a correlation matrix
cor(mtcars)
#round the results to 2 digits for easier readability
round(cor(swiss), 2)

# Test one pair of variables at a time
# derives r, hypothesis test, and CI
# Pearson's product-moment correlation
cor.test(mtcars$mpg, mtcars$wt)

### Computing a bivariate regression--------------------------------------------
#Quick Graphical check
hist(mtcars$mpg)
hist(mtcars$wt)
plot(mtcars$wt, mtcars$mpg)
abline(lm(mtcars$mpg~mtcars$wt))

#Linear regression model
#Correlation: is the strength of the association
#Regression: is a function that can be used to predict values of another variable
reg1 <- lm(mpg~wt, data = mtcars)
reg1
#Coefficients: (y= mx + b)
#  (Intercept)        Girth  
#37.285        -5.344 

summary(reg1)
# The slope being statsitcally significant
# means that wt is a good predictor of mpg
# weight can accounts for 0.75 or 75% of the variation in mpg

### Multiple Regression formula
#Save as an object to be able to extract additional information from model
# Six Predictors for one result
reg1 <- lm(mpg ~cyl + disp + hp + wt + gear + carb, 
           data = mtcars)

#Simple Coefficents 
reg1

# More detailed descriptions
#summary(reg1)
#anova(reg1)
#coef(reg1)
#confint(reg1) #Confindence intervals for coefficients
#resid(reg1)
#hist(residuals(reg1)) #histogram of the residuals

#### Get Inspired!!!   -------------------------------
# Lets Make scatterplot matrix by Creating Scatterplots matrices
data("iris")

#To rcreate a basic scatterplot matrix just requires using the pairs function
pairs(iris[1:4]) #only quantitative variables

#Modified scatterplot matricies
require("RColorBrewer")
display.brewer.pal(3,"Pastel1") #display colorpalette

#Put Histograms on the diagonal (from "pairs" Help)
#Creating new function
panel.hist  <- function(x,...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0,1.5) )
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, ...)
}

#Re-run pairs using the panel.hist function
pairs(iris[1:4],
      panel = panel.smooth,
      main = "Scatterplot Maxtris for Iris Data Using pairs Function",
      diag.panel = panel.hist,
      pch = 16,
      col = brewer.pal(3, "Pastel1")[unclass(iris$Species)])
