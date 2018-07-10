# @parameter fileType is the
# @paramater year is four digit year value
createRoadWayFileUrl <- function(fileType, year) {
  base <- "https://www.fhwa.dot.gov/"
  
  fileType <- tolower(fileType)
  
  if (year > 2016) {
    warning("Data for this year is not avialable yet")
  } else if (year >= 2007) {
    further <- paste("policyinformation/statistics/",
                     year, "/xls/", sep = "")
  } else if (year >= 2002) {
    further <- paste("policy/ohim/hs",
                     sprintf('%02d', year %% 100),
                     "/xls/",
                     sep = "")
  } else if (year == 2001) {
    further <-
      paste("ohim/hs", sprintf('%02d', year %% 100), "/xls/", sep = "")
  } else if (year == 2000) {
    further <-
      paste("ohim/hs", sprintf('%02d', year %% 100), "/xls/", sep = "")
  } else if (year >= 1999) {
    further <-
      paste("ohim/hs", sprintf('%02d', year %% 100), "/excel/", sep = "")
  } else if (year == 1998) {
    further <- "policyinformation/statistics/1998/xls/"
  } else if (year == 1997) {
    further <- "ohim/hs97/xls/"
  } else if (year == 1996) {
    further <- "ohim/1996/"
  } else {
    warning("Data is not available for this year")
  }
  
  if (year == 1996) {
    fileExtension = ".xlw"
  } else {
    fileExtension = ".xls"
  }
  
  if (year == 2000 & fileType == "hm20") {
    url <- paste(base, further, fileType, "r", fileExtension, sep = "")
  } else {
    url <- paste(base, further, fileType, fileExtension, sep = "")
  }
  
  return(url)
}

createRoadWayFileUrl("HM20", 2014)

downloadRoadWayFile <- function(fileType, year) {
  fileUrl <- createRoadWayFileUrl(fileType, year)
  
  httr::GET(fileUrl, httr::write_disk(tf <- tempfile()))
  
  fileType <- tolower(fileType)
  
  if (fileType == "vm2") {
    column <- "VehicleMilesTraveled"
  } else if (fileType == "hm20") {
    column <- "CenterLaneMiles"
  } else if (fileType == "hm60") {
    column <- "LaneMiles"
  } else {
    warning("Please select one of the following file types HM20, HM60, or VM2")
  }
  
  if (year == 2016) {
    file <- readxl::read_excel(tf, sheet =2, skip=13)
    file <- dplyr::select(file,1,18)
  } else if (year == 2013 & fileType %in% c("hm20", "hm60")) {
    file <- readxl::read_excel(tf, sheet =2, skip=13)
    file <- dplyr::select(file,1,18)
  } else if (year >= 2009) {
     file <- readxl::read_excel(tf, sheet =1, skip=13)
     file <- dplyr::select(file,1,18)
   } else {
    file <- readxl::read_excel(tf, skip=13)
    file <- dplyr::select(file, 1, 16)
  }

  file <- file[1:51,]
  file["Year"] <- year
  file["Measure"] <- column
  names(file) <- c("State", "Value", "Year", "Measure")
  file["State"] <- trimws(gsub("[0-9]/", "", file$State), which="both")
  file["State"] <- trimws(gsub("\\([0-9]\\)", "", file$State), which="both")
  file["State"] <- trimws(gsub("District of Columbia", "Dist. of Columbia", file$State), which="both")
  
  unlink(tf)
  
  return(file)
}

createRoadWayYear <- function(year) {
  files <- c("VM2", "HM20", "HM60")
  
  yearFiles <- lapply(files, downloadRoadWayFile, year)
  
  year <- do.call("rbind", yearFiles)

  return(year)
}

roadwayTotals <- lapply(seq(1997,2016,1), createRoadWayYear)
roadwayTotals <- do.call("rbind", roadwayTotals) %>%
  spread(Measure, Value)

write.table(roadwayTotals, "roadwayTotals.csv", row.names=F, sep=",")
