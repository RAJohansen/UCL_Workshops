#Install Packages if needed
if (!requireNamespace("BiocManager", quietly=TRUE))
  install.packages("BiocManager")
BiocManager::install("ChemmineR")

#Load Packages
library("ChemmineR") # Loads the package

#Open Vignette to explore documentation
library(help="ChemmineR") # Lists all functions and classes 
vignette("ChemmineR") # Opens this PDF manual from R 

#Load Dataset
data(sdfsample) 

#Create new object from datast
sdfset <- sdfsample
#View Dataset
sdfset

# Subsetting of object
sdfset[1:4]

#View First Object
sdfset[[1]]

#View all objects (summarized)
view(sdfset[1:4])
#Returns complete content of many SDFs
as(sdfset[1:4], "list") 

#OR
header(sdfset[1:4])
header(sdfset[[1]])

#atomblock
?atomblock()
atomblock(sdfset[1:4])
atomblock(sdfset[[1]])[1:4,] 

#bondblock
?bondblock
bondblock(sdfset[1:4])
bondblock(sdfset[[1]])[1:4,] 

#datablock
datablock(sdfset[1:4])
datablock(sdfset[[1]])[1:4] 


#Assigning compound IDs and keeping them unique:
cid(sdfset)[1:4] # Returns IDs from SDFset object
sdfid(sdfset)[1:4] # Returns IDs from SD file header block
unique_ids <- makeUnique(sdfid(sdfset))
cid(sdfset) <- unique_ids 

#Converting the data blocks in an SDFset to a matrix:
blockmatrix <- datablock2ma(datablocklist=datablock(sdfset)) # Converts data block to matrix 
numchar <- splitNumChar(blockmatrix=blockmatrix) # Splits to numeric and character matrix 
numchar[[1]][1:2,1:2] # Slice of numeric matrix 
numchar[[2]][1:2,10:11] # Slice of character matrix 

#Compute atom frequency matrix, molecular weight and formula:
propma <- data.frame(MF=MF(sdfset), MW=MW(sdfset), atomcountMA(sdfset))
propma[1:4, ] 

#Assign matrix data to data block:
  
datablock(sdfset) <- propma 
datablock(sdfset[1]) 

#String searching in SDFset:
grepSDFset("650001", sdfset, field="datablock", mode="subset") # Returns summary view of matches. Not printed here.
grepSDFset("650001", sdfset, field="datablock", mode="index") 

#Export SDFset to SD file:
write.SDF(sdfset[1:4], file="C:/temp/mydata.sdf", sig=TRUE) 

#Plot molecule structure of one or many SDFs:
plot(sdfset[1:4], print=FALSE) # Plots structures to R graphics device 














