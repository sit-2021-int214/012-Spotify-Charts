
# Library
library(dplyr)
library(readr)
library(stringr)
library(ggplot2)

# Data set
programing_book <- read.csv('https://raw.githubusercontent.com/sit-2021-int214/012-Top-Spotify-Songs/main/assignment/WS04/WS04_63130500022/prog_book.csv')
rm(programing_book)

#show data type each columns
glimpse(programing_book)

#Learning function from Tidyverse
summarise(programing_book,mean(Number_Of_Pages,na.rm =T))

#Highest Rating
is.numeric(programing_book$Rating)
programing_book  %>% filter(Rating == max(Rating)) %>%  select(Book_title,Price,Rating)

#Highest Reviews
is.numeric(programing_book$Reviews)
programing_book$Reviews <- programing_book$Reviews %>% str_remove(",") %>% str_trim() %>% as.numeric()
programing_book$Reviews <- as.numeric(as.character(programing_book$Reviews))
programing_book  %>% filter(Reviews == max(Reviews)) %>%  select(Book_title,Price,Reviews)

#Highest Price
is.numeric(programing_book$Price)
programing_book  %>% filter(Price == max(Price)) %>%  select(Book_title,Price)

#All books with rating > 4.1 and review > 100
programing_book %>% filter(Rating > 4.1,Reviews >100) %>%  select(Book_title,Price)

#All books with page > 500 and price < 50
programing_book %>% filter(Number_Of_Pages > 500,Price <50) %>%  select(Book_title,Price)

#All books with paperback type
programing_book %>% filter(Type == "Paperback",Rating >4.5) %>%  select(Book_title,Price)

#graph 1
Typeplot <- table(programing_book$Type)
barplot(Typeplot,main="Type Of Book",xlab = "Type",ylab = "Number of Book",col=rgb(0.1,0.6,0.8))

#graph 2
scatplot <- programing_book %>% filter(Number_Of_Pages > 500,Price <50) %>% ggplot(aes(x=Price,y=Number_Of_Pages))+geom_point(aes(color=Price))
scatplot+geom_smooth()

