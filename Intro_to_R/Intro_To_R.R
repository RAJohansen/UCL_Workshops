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

##Functions
#function format: function_name(arg1 = val1, arg2 = val2)

# TASK 1A#
#Create a sequence of numbers from 1 to 10 using the seq() function
#HINT: if you can't remember exactly what function you are looking for, Use Tab
se "Tab"

#Now that you found the function, How do you use it?
#HINT: Use the ? to find R documentation on an object
?seq()

seq(1,10)

# TASK 1B #
#Create a sequence of numbers from 1 to 10 by 0.5 and save it to an object called Seq1
Seq <- seq(1,10, by =0.5) #define step by value
Seq2 <- seq(1,10, length.out = 5) #Defined number of values


### Working with data table (Tibble)------------------------------------------------------
##Installing R package from CRAN Repository

# Install the tidyverse package
# You only need to install a package once on your PC
#install.packages("tidyverse")

#Run the package
#This has to be done everytime you open a new R session
library(tidyverse)
?tidyverse

##Quibbles with Tibbles - Stolen from a tweet from Hadley Wickham
#Tibbles are data frames, but they slight differences than the base R data.frames to make life a little easier.
vignette("tibble")

#Lets create a tibble with 4 variables with 10 values from diffent methods 
df_exp <- tibble::tibble(
  a = seq(1,10),
  b = rnorm(10),
  c = c(11:20),
  d = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0)
)

# TASK 2A # 
#Create a new tibble called "df" with two variables ("A" and "B") each with 20 different sets of observations
df1 <- tibble(
  A = seq(1,20),
  B = rnorm(20)
)

#Lets create a new column from a calculation of our existing columns A&B
# We will create a new table with three columns (but you can just add a new column to your existing table)
#Introducing dplyr and mutate which is a package/function already contained in tidyverse 
# pipe (%>%) is a function that continues code like an "and do this"

df <- df1 %>% dplyr::mutate(C = A/B)
#Hint - ctrl shift m is the hot key for pipe (%>%)

## Finding values from out data table
# Lets look at column 2 
df[,2]

#Lets look at row 5
df[5,]

# TASK 2B #
#What value is in row 10 column 3?
df[10,3]

# TASK 2C #
# Based on this idea, how do you think you would subset the first 5 rows for all three columns?
df[1:5,]

## Saving data table to csv
write_csv(df, "C:/temp/my_table.csv")

### Exploring and Summarizing Data -----------------------------------------------------

##Load our data from our csv file
df <- read.csv("C:/temp/my_table.csv")

# Lets add a new column called Name and give thise column text values
df$Name <- paste(letters[1:20])

#View our table
#click the df object under the Data window or
View(df)

# Lists the variables 
names(df)

#Lets look at the structure of the data
str(df)
#This will become very useful when we visualize the data
#Make sure your variables are in the appropiate format!!

## Statistical summary of the data
summary(df)

# Deeper look into statistics using the pastecs package
#install.packages("pastecs")
library(pastecs)
stat.desc(df)

# TASK 3A #
#How does this function compare to the speed and simplicity of your current abilities to find this information?
#What tools do you currently use?


### Visualizing and plotting Data --------------------------------------------------------------------
#install.packages("ggplot2")
library("ggplot2")

##load the default mtcars dataset from R inself
mpg <- mpg

##Explore the new dataset
View(mpg)
summary(mpg)
str(mpg)

#Grammar of Graphics Template
ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>),
                  stat = <STAT>,
                  position = <POSITION>) +
  <COORDINATE_FUNCTION> +
  <FACET_FUNCTION> + 
  <SCALE_FUNCTION> +
  <THEME_FUNCTION>
  
#Explore the Geoms
geom_
    
##Lets create Bar charts using geom_bar and geom_col
#Counts of each class
ggplot(data=mpg) + 
  geom_bar(mapping = aes(x=class))

#Counts of each manufacturer
ggplot(data=mpg) + 
  geom_bar(mapping = aes(x=manufacturer))  

#Once you are comfortable you can remove the argument names
ggplot(mpg) + 
  geom_bar(aes(class))

ggplot(mpg) + 
  geom_bar(aes(manufacturer))  

##Lets add another dimension using a stacked chart
ggplot(data=mpg) + 
  geom_bar(mapping = aes(x=manufacturer, fill = cyl),
           position = "stack")

#What is wrong with this graph? What do we need to change about the cyl variable?

#Lets convert cylinders to factors instead of numbers
mpg$cyl <- as.factor(mpg$cyl)
ggplot(data=mpg) + geom_bar(mapping = aes(x=manufacturer, fill = cyl),
                            position = "stack")  

##Lets create a scatter plot using two variables 
ggplot(data=mpg) +
  geom_point(mapping = aes(x=cty, y=hwy))

# Lets add a third variable using Color
#We can also use shape and size to delineate features
#Hint size should be for quantitative values and shapes can be difficult to delineate
ggplot(data=mpg) +
  geom_point(mapping = aes(x=cty, y=hwy, color = class))

##Facets are used to divide the results into multiple charts by a variable
#Look back at the grammar of graphics template
ggplot(data=mpg) + 
  geom_point(mapping = aes(x=cty, y=hwy)) + 
  facet_wrap(~class)

## This graphic needs some cleaning up
#Add a theme
#Add Title
#Add X and Y Labels
ggplot(data=mpg) + 
  geom_point(mapping = aes(x=cty, y=hwy)) + 
  facet_wrap(~class) +
  theme_bw() +
  labs(title = "Vehicle Fuel Efficiency", x="City (MPG)", y = "Highway (MPG)")
  
# TASK 4 # 
# Use the table you created from section 2, to create your own data visualization

my_plot <- ggplot(df) + 
  geom_point(aes(x=A, y=B, color = C)) +
  theme_classic() +
  labs(title = "My First R Plot", x="A", y = "B")

#Save your output
ggsave(filename = "My_Plot",plot = my_plot, device = "png", path = "C:/temp")

