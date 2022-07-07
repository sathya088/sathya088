library(maptools)
library(raster)
library(ncdf4)
library(rgeos)
shp<- readShapePoly(file.choose()) # read shapefile
data<-brick(file.choose()) # read netcdf file
output<-mask(data, shp) # mask netcdf data using shp
writeRaster(output, "new.nc", overwrite=TRUE, format="CDF", varname="pr", varunit="kg m-2 S-2", longname="precipitation", xname="lon", yname="lat", zunit="numeric") 
# save output in netcdf format (nw.nc)

#But this script invert the original latitude values of "new.nc" file. So we have to correct the latitude values.It can be done using "invertlat" function in climate data operator (CDO) software.
