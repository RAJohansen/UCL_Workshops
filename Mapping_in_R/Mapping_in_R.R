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

#country factor with 142 levels
#continent factor with 5 levels
#year ranges from 1952 to 2007 in increments of 5 years
#lifeExp life expectancy at birth, in years
#pop population
#gdpPercap GDP per capita (US$, inflation-adjusted)

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
boxplot(df$lifeExp ~ df$continent)
boxplot(df$gdpPercap ~ df$continent, log = "y")

# Combine two plots into one window
par(mfrow=c(1,2))
boxplot(df$lifeExp ~ df$continent)
boxplot(df$gdpPercap ~ df$continent, log = "y")
#Clear plots
dev.off() 


### Mapping with base plot --------------------------------------------------------
#Install & Load Packages
library(raster)
library(maps)
library(maptools)
library(ggmap)
library(rgdal)

#load a simple basemap
data("wrld_simpl")
data
# Plot World Basemap
plot(wrld_simpl)

#Define Area of Interest
plot(wrld_simpl,
     xlim=c(-130,-60),
     ylim=c(25,50))

#Add colors to map
plot(wrld_simpl,
     xlim=xlim,
     ylim=ylim,
     col='olivedrab3', #Countries
     bg='lightblue') #***Background in this case thats the ocean

# Adding points from Lat Long
coords <- matrix(c(-84.518986, 39.132979),ncol=2)
coords <- coordinates(coords)
spoints <- SpatialPoints(coords)
df <- data.frame(location=c("UC"))
spointsdf <- SpatialPointsDataFrame(spoints,df)
plot(spointsdf,add=T,col=c('red'),pch=16) # add = T; adds this to existing plot

# Lets add the USA
# This pulls data from the internet
USA <- getData('GADM', country="USA", level=1)
plot(USA)

#Remove Alaska and Hawaii
USA_Cont <- subset(USA, NAME_1 != "Alaska" & NAME_1 != "Hawaii")

#Plot Continential USA and Add UC
plot(USA_Cont)
plot(spointsdf,add=T,col=c('red'),pch=16) # add = T; adds this to existing plot
text(-84.518986, 39.132979,labels="University of \n Cincinnati",pos=4, offset=0.3) # add label to an individual plot

### ggplot ---------------------------------------------------------------------
geom_sf()
### Interactive Mapping with Leaflet -------------------------------------------

### Tmap -----------------------------------------------------------------------

#Others?