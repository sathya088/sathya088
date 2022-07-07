setwd("G:\\GCM_Data\\GCM_CCCR_IITM\\hist_precipitation\\precipitation")
library(sp)
library(rgdal)
library(raster)
library(ncdf4)
library(chron)
library(RColorBrewer)
library(lattice)
library(ncdf.tools)
library(RNetcdf)
library(cruts)
library(data.table)
library(raster)
library(gtools)
library(readxl)
library(openxlsx)
#ReadFiles
files = 'G:\\GCM_Data\\GCM_CCCR_IITM\\hist_precipitation\\precipitation\\LMDZ_Hist_mon_1951-1960_precip.nc'

dim.data.frame(files)
print(files)


#open shapefiles
shp = readOGR('G:\\GCM_Data\\GCM_Hist_X_Y.shp')
bound = extent(shp)

#Creating database for storing loop vales
c = as.data.frame(matrix(NA,nrow=1, ncol = 1))
# Develop loop

for (i in 1:length(files))
{
  ncin.brick = brick(files[i])
  ri_extract = raster::extract(ncin.brick.shp, df=TRUE, na.rm = TRUE)
  y = read.csv("stations.csv")
  c = cbind(y, r1_extract, c)
  c1 = t(c)
  write.xlsx(c, file = "GCM_Extract.xlsx", overwrite = TRUE, sep =',', header = TRUE, col.names = TRUE, row.names = FALSE, append = FALSE)
}

