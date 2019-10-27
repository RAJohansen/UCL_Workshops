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

