library(tidyverse)
library(rvest)

page <- read_html("https://www.fhwa.dot.gov/policyinformation/statistics.cfm")

baseURL <- "https://www.fhwa.dot.gov"

nodes <- page %>% html_nodes("option") %>% html_attr("value")

nodesLink <- paste0(baseURL, nodes)


linkText <- page %>% html_nodes("option") %>% html_text()


read_html(nodesLink) %>% html_nodes("a") %>% html_attr("href")

findSection5 <- function(url) {
  data <- read_html(url) %>%
    html_nodes("a") %>%
    html_attr("href")
  

  return(data)
}

test <- lapply(nodesLink, findSection5)
