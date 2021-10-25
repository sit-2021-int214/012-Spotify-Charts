# Install a package for first time
install.packages("DescTools")
install.packages("assertive")
install.packages("magrittr")
install.packages("tidyverse")

# Import libraries
library(DescTools)
library(assertive)
library(magrittr)
library(tidyverse)

# Import Dataset
prog_books_org <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

# Change to tibble new one to confirm, and seperate from original
top_prog_books <- as_tibble(prog_books_org)

### For observation the dataset
glimpse(top_prog_books)

## Transform data and finding insight the data

### Check duplicate book title (with stringr functions)
top_prog_books %>% duplicated() %>% sum() > 0

### Change data type
#### Reviews: character -> numeric 
top_prog_books$Reviews <-
  top_prog_books$Reviews %>% str_trim() %>% str_squish() %>% str_remove(",") %>% as.numeric()
#### Type: character -> factor
top_prog_books <-
  top_prog_books %>% mutate(Type = as.factor(Type))

### Write to CSV for keeping the changes before finding insight
write_csv(top_prog_books, "top-prog-books-cleaned.csv")

### Summary
summary(top_prog_books)

### Finding insight the data

# the Computer Science / Programming books which are the highest rating books
# Seperate the highest rating books from all the data
highest_rating_books <- top_prog_books %>% filter(Rating == 5.00)
# To show the highest rating books and its data 
str_glue_data(highest_rating_books,
  "{Book_title}\nPrice: ${Price}\nType: {Type}\nThere is a description likes:\n{Description}")

# the maximum and minimum price each book type
top_prog_books %>% group_by(Type) %>%
  summarise(max_price=max(Price),min_price=min(Price)) %>% 
  arrange(desc(max_price))

# the maximum and minimum number of pages each book type 
top_prog_books %>% group_by(Type) %>% 
  summarise(max_page=max(Number_Of_Pages),min_page=min(Number_Of_Pages)) %>% 
  arrange(desc(max_page))

# the top 10 books that have the highest rating without the number of reviews
head((top_prog_books %>% select(Book_title,Rating,Type) %>% arrange(desc(Rating))),10)

# the top 10 books that have the highest reviews together with the number of rating and its price
head((top_prog_books %>% select(Book_title,Rating,Reviews,Price,Type) %>% 
    arrange(desc(Reviews),desc(Rating))),10)

# the top 10 books that are the most expensive books together with the number of reviews and rating
head((top_prog_books %>% select(Book_title,Rating,Reviews,Price,Type) %>% 
    arrange(desc(Price),desc(Reviews),desc(Rating))),10)

# the top 10 books that are the cheapest together with the number of reviews and rating
head((top_prog_books %>% select(Book_title,Rating,Reviews,Price,Type) %>% 
    arrange(Price,desc(Reviews),desc(Rating))),10)

## Plotting with GGplot2

### 1.) Graph show a relation in the group of books which rating are equal to or more than 4 and number of pages are less then 1000 between the number of pages and the number of reviews.
top_books_rating_4to5 <- top_prog_books %>% filter(Rating >= 4) %>% arrange(desc(Rating))
num_pages_reviews_plot <- ggplot(top_books_rating_4to5,aes(y=Reviews,x=Number_Of_Pages))
num_pages_reviews_plot+geom_jitter()+ggtitle("Relation between the number of pages and the number of reviews")

### 2.) Graph show the number of pages each book by separating `Type` with colors.
num_pages_each_book_plot <-
    ggplot(top_prog_books,aes(x=Book_title,y=Number_Of_Pages))+geom_point(aes(color=Type))
num_pages_each_book_plot+ggtitle("The number of pages each book by separating type")+ylab("The Number of Pages")+xlab("Book Names")