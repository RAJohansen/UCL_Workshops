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

#### 1.  R as a Calculator ####

#simple to complex equations 
1+2
[1] 3

sin(pi*15)/100
[1] 5.389623e-17

#### 2.  Objects and Assignment Statements ####

x <- 1+2
x
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

#### Using Comments ####
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

#### 4. Getting Help in R ####
help(mean)
#HINT: if you can't remember exactly what function you are looking for, Use Tab
me #press tab

#Not sure what its called 
#Try a fuzzy search
apropos("mea") 



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

# Task #1:
# Work with your neighbor or by yourself and explore the documentation

#Create a sequence from 1 to 10 using the seq() function
seq(1,10)

# TASK 1B
#Create a sequence of numbers from 50 to 150 by 3
seq(50, 150, by =3) #define step by value

# TASK 1C
#Create a sequence of numbers from 25 to 0 decreasing by 5 and save it an object called "my_seq"
my_seq <- seq(25, 0, by =-5) #define step by value


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

#### 3, Importing data ####
# Just like saving, there are many ways to import data but we will stick with csv for this exercise

# Importing our comapny data from our computer using read.csv and call it company_data
?read.csv()
# Alternatively, you can use the import dataset button in the top right (but using code is always beter)

company_data <- read.csv("C:/temp/data.csv")
df <- readxl::read_xlsx("C:/myfolder/mydata/data.xlsx")



### Section III: Exploring & Manipulating data----------------------------------------------------------------
Look at:
  R_Tidyr_Basics
  R_Stringr_Basics
  R_Transformation_Basics
  Introduction_to_the_Tidyverse




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


### Section IV: Programming with R ####
Look at:
  R_Interations_Purrr_Basics
  R_Programming_Basics

