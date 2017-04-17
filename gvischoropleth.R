GeoStates2 <- gvisGeoChart(data96, "region", "FATALperVMT", 
                           options=list(region="US",
                                        displayMode = "regions",
                                        resolution = "provinces",
                                        width = 600,
                                        height = 400))
                           
plot(GeoStates2)

