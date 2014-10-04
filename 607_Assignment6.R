#IS 607 - Assignment 6

#R.version
#install the devtools package
library(devtools)
build_github_devtools()
install.packages("devtools.zip", repos = NULL)
install_github("hadley/rvest")
unlink("devtools.zip")

#load and validate the rvest package
library(rvest)
lego_movie <- html("http://www.imdb.com/title/tt1490017/")
rating <- lego_movie %>% 
  html_nodes("strong span") %>%
  html_text() #%>%
  as.numeric()
rating

#check out the rvest demos
demo(package="rvest")
demo("tripadvisor", "rvest")
demo("united", "rvest")
demo("zillow", "rvest")

#parse the webpage to bring back the restaurant name & address
yelp <- html("http://www.yelp.com/biz/il-passatore-brooklyn")
name <- yelp %>% html_nodes("h1") %>% html_text()
#trim function sourced from stackoverflow
#http://stackoverflow.com/questions/2261079/how-to-trim-leading-and-trailing-whitespace-in-r
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
fullname <- trim(name)
address <- yelp %>% html_nodes("address span") %>% html_text()
fulladdress <- paste(address [1:length(address)], collapse = ", ")
print(paste("Restaurant Name: ", fullname, sep=""))
print(paste("Restaurant Address: ", fulladdress, sep=""))