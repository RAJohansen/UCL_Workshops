# Step #1: Load required packages
# (These are just a few to get you started)
library(tidyverse)
library(tmap)
library(sf)

#Step #2: # Import spatial object (Shapefile)
shapefile <-  st_read("Mapping_in_R/Hands-on Lab/us_states.shp")

#Step #3: Import non-spatial data frame
#HINT: Use the "foreign" package and the "read.dbf" function to load the census dbf file
df <- foreign::read.dbf("Mapping_in_R/Hands-on Lab/census.dbf") # Data from external source

#Step #4: Create identical join field on the data frame
#df$join_name <- df$name
df$ST_FIPS <- df$STATE_FIPS

#Step #5:Merge the spatial object and data frame using the merge function
#new_spatial_object <- merge(<Spatial Object>,< data frame>, by = <"join_name">)
States_Census <- merge(shapefile,df, by = "ST_FIPS")


#Step #6: Create a map of the USA using tmap
# For Help see "Mapping in R" script
tm_shape(States_Census) +
  tm_fill(col = "MOBILEHOME", style = "cont", colorNA = NULL) + 
  tm_borders()

