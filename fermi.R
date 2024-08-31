#Install the required package
install.packages('googlesheets4')
#Load the required library 
library(googlesheets4)

#Read google sheets data into R
fermi-data <- read_sheet('https://docs.google.com/spreadsheets/d/1U2KGbs83lJuNeXfdHzO-vRCJi8RuwFfhWcA5v5xf4XM/edit?gid=0#gid=0')

