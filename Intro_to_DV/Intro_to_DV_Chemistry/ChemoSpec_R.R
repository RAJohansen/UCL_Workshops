#Install and Load Package
install.packages("ChemoSpec")
install.packages("readJDX")
library("ChemoSpec")
library(readJDX)

browseVignettes("ChemoSpec")

ssp <- files2SpectraObject(
  gr.crit =c("sspA", "sspB"),
  gr.cols =c("red", "blue"),
  freq.unit = "ppm",
  int.unit = "peak intensity",
  descrip = "Subspecies Study",
  out.file = "subsp")

SubspeciesNMR <-loadObject("subsp.RData")

# Grab an included file
ed <- system.file("extdata", package = "ChemoSpec")
tf <- "PCRF.jdx"
chk <- file.copy(from = file.path(ed, tf), to = file.path(getwd(), tf),
                 overwrite = TRUE)

# Now read in the file, and plot
spec <- files2SpectraObject(gr.crit = "PCRF", freq.unit = "ppm", int.unit = "intensity",
                            descrip = "test import", fileExt = "\\.jdx")
sumSpectra(spec)
plotSpectra(spec, lab.pos = 3.5, main = "Reduced Fat Potato Chip")
