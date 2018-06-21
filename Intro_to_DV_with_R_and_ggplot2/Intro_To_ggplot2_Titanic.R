#"An Introduction to Data Visualization with R using ggplot2" 
#Modeled off of Data Science Dojo's "An Introduction to Data Visualization with R and ggplot2" 

### Install and load the required packages
#install.packages("ggplot2")
#install.packages("titanic")
library(ggplot2)
library(titanic)

### Load the Titanic data set
titanic <- read.csv("C:/titanic.csv")
#or  
titanic <- titanic::titanic_train #This data is in a CRAN package called titanic 

#View the data
View(titanic)

#Look at the variable structures
str(titanic)

#Set up factors
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Survived <- as.factor(titanic$Survived)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)
str(titanic)

#Summarize the data
summary(titanic)

### INTRODUCTION TO GGPLOT2 ---------------------------------------------------

#FULL TEMPLATE
ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>),
                  stat = <STAT>,
                  position = <POSITION>) +
  <COORDINATE_FUNCTION> +
  <FACET_FUNCTION> + 
  <SCALE_FUNCTION> +
  <THEME_FUNCTION>

#DONT FREAK OUT!!!
  
#REAL EXAMPLE
ggplot(data = mpg) + 
  geom_point(mapping = aes(x= cty, y = hwy))

# R is a language and can manipulated like a real language
#SIMPLIFIED EXAMPLE
ggplot(mpg) + geom_point(aes(cty,hwy))
ggplot(mpg, aes(cty,hwy)) + geom_point()

### Part 1 Using Categorical Data ----------------------------------------------

## First question: What was the survial rate or what was the distribution of survived vs. perished?
# Do you remember what type of variable survived is?

#Plot a bar graph of survival 
ggplot(data = titanic, aes(x = Survived)) + geom_bar()

#Sometimes it is difficult to visualize the exact distributions
#So we can look up the percentages using prop.table()
prop.table(table(titanic$Survived))
#~61% perished and ~38% survived

# Lets clean this graph up a bit
#This simple bit of code produced publishable graphics (You just did data visualization!!)
ggplot(titanic, aes(Survived)) + geom_bar() +
  labs(y = "Passenger Count", title = "Passenger Survival Rate") + 
  theme_bw()

##Second Question: What was the survival rate by gender?
#Remember the addage "women and children first"? Is this true?
ggplot(data = titanic, aes(x=Sex, fill = Survived)) + geom_bar()

ggplot(titanic, aes(Sex, fill =Survived)) + geom_bar() +
  labs(x = "Gender",y = "Passenger Count", title = "Passenger Survival Rate by Gender") + 
  theme_bw()

## Question 3: What was the survival rate by ticket class (proxy for socio-economic status)?
#Reproducibility example: copy and paste gender code and just change x variable and lables
ggplot(data = titanic, aes(x=Pclass, fill = Survived)) + geom_bar()

ggplot(titanic, aes(Pclass, fill =Survived)) + geom_bar() +
  labs(x = "Ticket Class",y = "Passenger Count", title = "Passenger Survival Rate by Ticket Class") + 
  theme_bw()

## Question 4: What was the survival rate of gender AND Ticket class?
# Use facet_wrap to examine how multiple variables interact and allow us to dive deeper into the data
#Look up facet_wrap()
?facet_wrap

ggplot(titanic, aes(Sex, fill =Survived)) + 
  geom_bar() +
  facet_wrap(~Pclass) +
  labs(x = "Gender",y = "Passenger Count", title = "Passenger Survival Rate by Gender") + 
  theme_bw()

#What trends do you see? What gender and ticket classes are most and least likely to survive?


###Part 2 using numerical data -------------------------------------------------
#Question 5: What was the distribution of passenger ages
#Histogram are similiar to bar charts except they use numerical/continuous data
ggplot(titanic, aes(x = Age)) + geom_histogram()

#You can specify the number of bins
ggplot(titanic, aes(x = Age)) + geom_histogram(bins = 10)

#Or define the bin width (column groupings)
ggplot(titanic, aes(x = Age)) + geom_histogram(binwidth = 5)

#Lets clean this graph up
ggplot(titanic, aes(x = Age)) +
  geom_histogram(binwidth = 5, color = "white") +
  labs(x = "Age (binwidth = 5)",y = "Passenger Count", title = "Titanic Age Distribution") + 
  theme_bw()
  
#Question 6: What were the survival rate of passengers by age?
ggplot(titanic, aes(x = Age, fill = Survived)) +
  geom_histogram(binwidth = 5, color = "white") +
  labs(x = "Age (binwidth = 5)",y = "Passenger Count", title = "Survival Rate by age") + 
  theme_bw()

#Alternative: We want to derive basic statistics on survial rates by age?
#box-and-whisker
ggplot(titanic, aes(x = Survived, y = Age)) +
  geom_boxplot() +
  labs(x = "Survived",y = "Age", title = "Survival Rate by age") + 
  theme_bw()
#No real discernible pattern between survival and age

#Need help remembering how to interpt a box-and-whisker graph?
?geom_boxplot #Computed variables


###Part 3: Telling a the Story with a single visualization---------------------

ggplot(titanic, aes(x = Age, fill = Survived)) +
  geom_density(alpha = 0.5) + #Alpha is transparency control
  facet_wrap(Sex ~ Pclass) +
  labs(x = "Age",y = "Passengers", title = "Titanic Survival Rate by age and gender") + 
  theme_bw()

#Personally I find the interpretation of the density map a litte difficult 
#So I prefer a histogram
ggplot(titanic, aes(x = Age, fill = Survived)) +
  geom_histogram(binwidth = 5,color = "white") +
  facet_wrap(Sex ~ Pclass) +
  labs(x = "Age",y = "Passengers", title = "Titanic Survival Rate by age and gender") + 
  theme_bw()

 
###Part 4 (Optional): Exploring other visualizations----------------------------

#Scatterpot
ggplot(titanic, aes(Age,Fare)) +geom_point()

#Smoothed average
ggplot(titanic, aes(Age,Fare)) +geom_smooth()

#Combined scatter with smoothed average
ggplot(titanic, aes(Age,Fare)) +
  geom_point() +
  geom_smooth(se = FALSE)

##Violin Graphs
ggplot(titanic, aes(Pclass,Age)) +
  geom_violin()

###Part 5 (Optional): Themes and Layouts----------------------------
#Basic Plot
ggplot(titanic, aes(x = Age, fill = Survived)) + 
  geom_histogram(binwidth = 5,color = "white")

#Flipping Axes
#ONlY IF IT MAKES SENSE
ggplot(titanic, aes(x = Age, fill = Survived)) +
  geom_histogram(binwidth = 5,color = "white") +
  coord_flip()

#Add Title and Axis labels
ggplot(titanic, aes(x = Age, fill = Survived)) +
  geom_histogram(binwidth = 5,color = "white") +
  labs(x = "Age",y = "Passengers", title = "Passenger Survival Rate by age") +

#Add a theme
ggplot(titanic, aes(x = Age, fill = Survived)) +
  geom_histogram(binwidth = 5,color = "white") +
  labs(x = "Age",y = "Passengers", title = "Passenger Survival Rate by age") +
  theme_classic() # Look through themes_

#Change Axis range to only view ages 10-60 without clipping
#if you want to remove data use xlim() ylim() NOT RECOMMENDED!
ggplot(titanic, aes(x = Age, fill = Survived)) +
  geom_histogram(binwidth = 5,color = "white") +
  labs(x = "Age",y = "Passengers", title = "Passenger Survival Rate by age") +
  theme_classic() + 
  coord_cartesian(xlim = c(10,60))
  
#Change colors of bars
my_plot <- ggplot(titanic, aes(x = Age, fill = Survived)) +
  geom_histogram(binwidth = 5,color = "white") +
  labs(x = "Age",y = "Passengers", title = "Passenger Survival Rate by age") +
  theme_classic() + 
  coord_cartesian(xlim = c(10,60)) +
  scale_fill_manual(values = c("darkgray", "darkblue"))

#Saving Plots
#Saves last plot unless specified
ggsave("Final_Plot.png", width = 10, height =10, path = "C:/temp")
ggsave("Final_Plot.png", plot = my_plot, width = 10, height =10, path = "C:/temp")

