#Install Packages if needed
if (!requireNamespace("BiocManager", quietly=TRUE))
  install.packages("BiocManager")
BiocManager::install("ChemmineR")

#Load Packages
library("ChemmineR") # Loads the package
library(help="ChemmineR") # Lists all functions and classes 

#Open Vignette to explore documentation
vignette("ChemmineR") # Opens this PDF manual from R 

#Load Dataset
data(sdfsample) 

#Create new object from datast
sdfset <- sdfsample
#View Dataset
sdfset