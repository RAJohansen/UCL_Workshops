### ------------------------------------------------------------------------ ### 
# Title: Mapping in R
# Authors: Richard Johansen
# University of Cincinnati Libraries
# 4/18/2019

#Code: https://github.com/RAJohansen/UCL_Workshops/tree/master/Mapping_in_R

# REFERENCES:
# Data: www.gapminder.org/data/
# Geocomputation in R: https://geocompr.robinlovelace.net/ 
### ------------------------------------------------------------------------ ### 
### Introduction to R and Gapminder Data --------------------------------------
### Install Required Packages
install.packages(c("tidyverse","gapminder", "maptools","tmap", "marmap", "spData", "spDataLarge", "spDataLarge", "cartogram"))

#Load Packages
library(gapminder)
library(tidyverse)

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
library(maptools)

#load a simple basemap
data("wrld_simpl")

# Plot World Basemap
plot(wrld_simpl)

#Define Area of Interest
plot(wrld_simpl,
     xlim=c(-130,-60),
     ylim=c(25,50))

#Add colors to map
plot(wrld_simpl,
     xlim=c(-130,-60),
     ylim=c(25,50),
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

### Mapping using tmap -----------------------------
library(tmap)
library(spData)        # load geographic data

#Lets create an object for Countries
world <- world

#Explore at the variables
names(world)

#Plot the variables for world
plot(world)

#Plot just population
plot(world["pop"]) 

# Plot world using tm functions
tm_shape(world) +
  tm_fill()

# Add boarders to countries
tm_shape(world) +
  tm_fill() + 
  tm_borders() 

# Add population density by countries
#Default style is pretty (rounded numbers)
tm_shape(world) +
  tm_fill(col = "pop") + 
  tm_borders() 

###Alternative legend settings for quantitative values
# Defining number of groupings
tm_shape(world) +
  tm_fill(col = "pop", n =  5) + 
  tm_borders() 

# Using breaks in population
breaks = c(0,10^6, 10^7, 10^8, 10^9, 10^10)
tm_shape(world) +
  tm_fill(col = "pop", breaks = breaks) + 
  tm_borders() 

# Using jenks
tm_shape(world) +
  tm_fill(col = "pop", style = "jenks") + 
  tm_borders() 

# Continuous scale
tm_shape(world) +
  tm_fill(col = "pop", style = "cont") + 
  tm_borders() 

# Changing palettes
tmaptools::palette_explorer()
tm_shape(world) +
  tm_fill(col = "pop", style = "cont", palette = "magma") + 
  tm_borders() 

### Mapping catagorical values
tm_shape(world) +
  tm_fill(col = "continent", style = "cat") + 
  tm_borders()

### Making a "pretty" map
tm_shape(world) +
  tm_fill(col = "continent", style = "cat") + 
  tm_borders() +
  tm_layout(title = "World Countries by Continent",
            title.size = 2,
            frame = FALSE,
            inner.margins = 0.1,
            legend.title.size = 1,
            legend.text.size = 0.75,
            legend.outside = TRUE) +
  tm_compass(type = "arrow", position = c("right", "top"), size = 1) +
  tm_scale_bar(breaks = c(0, 5000, 10000),size = 0.5, position = c(0.6,0.075))

### Mapping a globe color coded by continent isn't helpful
# Lets use the same technique above to map Life expectancy 

tm_shape(world) +
  tm_fill(col = "lifeExp", style = "cont", colorNA = NULL) + 
  tm_borders() +
  tm_layout(title = "Life Expectancies by Country",
            title.size = 2,
            frame = FALSE,
            inner.margins = 0.1,
            legend.title.size = 1,
            legend.text.size = 0.75,
            legend.outside = TRUE) +
  tm_compass(type = "arrow", position = c("right", "top"), size = 1) +
  tm_scale_bar(breaks = c(0, 5000, 10000),size = 0.5, position = c(0.6,0.075))


### Advanced Applications ****OPTIONAL***--------------------------------------

### Interactive Mapping with Leaflet
# We can convert our static tmap into an interactive map by using leaflet
library(leaflet)

map <- tm_shape(world) +
  tm_fill(col = "lifeExp",
          colorNA = NULL,
          style = "cont",
          palette = "RdYlGn",
          id = "NAME",
          popup.vars = c("name_long","lifeExp"))

tmap_leaflet(map)


### Cartograms
library(cartogram)

#Contiguous Cartograms
nz_carto = cartogram_cont(nz, "Median_income", itermax = 5)
tm_shape(nz_carto) + tm_polygons("Median_income")
tm_shape(nz) + tm_polygons("Median_income")

#Non-contiguious
us_states2163 = st_transform(us_states, 2163)
us_states2163_ncont = cartogram_ncont(us_states2163, "total_pop_15")
tm_shape(us_states2163_ncont) + tm_polygons("total_pop_15")


### Raster Data
library(spDataLarge)   # load larger geographic data

raster_filepath = system.file("raster/srtm.tif", package = "spDataLarge")
srtm_raster = raster(raster_filepath)
plot(srtm_raster)

### Bathymetric Mapping from NOAA
library(marmap)
library(lattice)

blues <- colorRampPalette(c("darkblue", "cyan"))
greys <- colorRampPalette(c(grey(0.4),grey(0.99)))
Gulf<- getNOAA.bathy(-100,-79,33,23,resolution=10)

plot.bathy(Gulf,
           image = TRUE,
           land = TRUE,
           n=0,
           bpal = list(c(0, max(Gulf), greys(100)),
                       c(min(Gulf), 0, blues(100))))

wireframe(unclass(Gulf), drape = TRUE,
          aspect = c(1, 0.1),
          scales = list(draw=F,arrows=F),
          xlab="",ylab="",zlab="",
          at=c(min(Gulf)/100*(99:0),max(Gulf)/100*(1:99)),
          col.regions = c(blues(100),greys(100)),
          col='transparent')

wireframe(unclass(Gulf), shade = TRUE,
          aspect = c(1, 0.1),
          scales = list(draw=F,arrows=F),
          xlab="",ylab="",zlab="")
