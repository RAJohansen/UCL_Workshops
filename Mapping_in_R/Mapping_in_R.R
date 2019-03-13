#########################
###   Mapping in R    ###
###  Richard Johansen ###
###  April 18th 2019  ###
#########################

#Code: https://github.com/RAJohansen/UCL_Workshops/tree/master/Mapping_in_R
#Data Source: www.gapminder.org/data/


### Introduction to R and Gapminder Data --------------------------------------
#Install & Load Packages
#install.packages("gapminder")
library(dplyr)
library(gapminder)

## Create R Object (data frame) from gapminder
df <- gapminder

###Explore data frame
View(df)
# How many variables
# How many observations
# What type of data is this?
# Do you have expectations at this point?

## Lets look at the data structure of this data set
str(df)
head(df)
tail(df)
# What are the different data types?
# Why does this matter?
# What is a factor?

##Explore Factor Variables
table(df$country)
table(df$continent)

## Explore Numerical Variables
summary(df)


### Visualizing Gapminder
plot(lifeExp ~ year, gapminder, subset = country == "Afghanistan", type = "b")
plot(lifeExp ~ year, gapminder, subset = country == "United States", type = "b")

#Ploting LifeExp vs. GDP
plot(lifeExp ~ gdpPercap, gapminder, subset = year == 2007)
#What if we change the X-axis scale to log?
plot(lifeExp ~ gdpPercap, gapminder, subset = year == 2007, log = "x")

#***CAUTION: How you choose to visualize information can lead readers to different answers

## Example of grouping data
GM_group <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(medlifeExp = median(lifeExp), medGDP = median(gdpPercap))

plot(x = GM_group$medlifeExp,
     y = GM_group$medGDP,
     col = GM_group$continent,
     legend(x = 55, y = 25000, legend = levels(GM_group$continent), col = 1:3), pch = 16)

### Mapping with baseplot ------------------------------------------------------

### Mapping with ggplot --------------------------------------------------------
geom_sf()
### Interactive Mapping with Leaflet -------------------------------------------

### Tmap -----------------------------------------------------------------------

#Others?