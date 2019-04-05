# Load required packages
# A few to get you started
library(tidyverse)
library(tmap)
library(sf)

# Load in your spatial data
#Import Shapefile of Area of Interest
shapefile <-  st_read("Mapping_in_R/Hands-on Lab/us_states.shp")

# Load in non-spatial data frame
# Use the package foreign and function read.dbf to load the census file
df <- foreign::read.dbf("Mapping_in_R/Hands-on Lab/census.dbf") # Data from external source

# IF NEEDED
# Duplicate column in data frame to allow join between csv & spatial object
#df$join_name <- df$name
df$ST_FIPS <- df$STATE_FIPS

# Use the merge function to combine your spatial object with your data frame
#new_spatial_object <- merge(<Spatial Object>,< data frame>, by = <"join_name">)
States_Census <- merge(shapefile,df, by = "ST_FIPS")


# Finally use tmap functions to create a final map
# For Help see "Mapping in R" script

tm_shape(States_Census) +
  tm_fill(col = "MOBILEHOME", style = "cont", colorNA = NULL) + 
  tm_borders()

