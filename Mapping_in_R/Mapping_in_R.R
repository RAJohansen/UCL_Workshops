#########################
###   Mapping in R    ###
###  Richard Johansen ###
###  April 18th 2019  ###
#########################


### Introduction to R and Gapminder Data --------------------------------------
#Install & Load Packages
#install.packages("gapminder")
library(gapminder)

#Create R Object (data frame) from gapminder
df <- gapminder

#Explore data frame
View(df)
# How many variables
# How many observations
# What type of data is this?
# Do you have expectations at this point?

# Lets look at the data structure of this data set
str(df)
head(df)
tail(df)
# What are the different data types?
# Why does this matter?
# What is a factor?

# Get a simple statistical summary of the data
summary(df)


#Mapping with baseplot

#Mapping with ggplot
geom_sf()
#Interactive Mapping with Leaflet

#Tmap

#Others?