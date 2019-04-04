# Load required packages
# A few to get you started
library(tidyverse)
library(tmap)
library(spData)

# Load in your spatial data
#world <- world

# Load in non-spatial data frame
#df <- read.csv("C:/temp/mydata.csv") # Data from external source

# IF NEEDED
# Duplicate column in data frame to allow join between csv & spatial object
#df$join_name <- df$name

# Use the merge function to combine your spatial object with your data frame
#new_spatial_object <- merge(<Spatial Object>,< data frame>, by = <"join_name">)

# Finally use tmap functions to create a final map
# For Help see Mapping in R script