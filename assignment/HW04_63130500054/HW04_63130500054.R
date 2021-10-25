# Import libraries
library(dplyr)
library(readr)
library(stringr)
library(ggplot2)

# Import dataset
progBooks <- read.csv('https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv')

# Inspect dataset
glimpse(progBooks)

# Learning function `str_detect` from Tidyverse (stringr)
progBooks %>% filter(str_detect(progBooks$Book_title, "JavaScript")) %>% select(Book_title)

# Convert and Transform data type of `Review` column from `Character` to `Numeric`
progBooks <- progBooks %>% mutate(Reviews = as.integer(str_remove(Reviews, ",")))
# Inspect `Review` column.
glimpse(progBooks$Reviews)
# Write cleaned dataset to local csv file
write_csv(progBooks, "progBooks-cleaned.csv")
# 1.The books that have book price more than 210.
progBooks %>% filter(Price > 210) %>% select(Book_title, Price)
# 2.The books that have book title keyword "Mathematics".
progBooks %>% filter(str_detect(progBooks$Book_title, "Mathematics")) %>% select(Book_title)
# 3.Top 5 books that have book reviews more that reviews average ordered by Review descending.
progBooks %>% filter(Reviews > mean(Reviews)) %>% 
              head(5) %>% 
              select(Book_title, Reviews) %>%
              arrange(desc(Reviews))
# 4.The books that have description word length less that 100.
progBooks %>% filter(str_count(Description) < 100) %>% 
              mutate(DescWordLength = str_count(Description))  %>% 
              select(Book_title, DescWordLength) %>%
              arrange(DescWordLength)
# 5.The book that has maximum rating.
progBooks %>% filter(Rating >= max(Rating)) %>% select(Book_title, Rating)
# 6.Does number of page affected to the book rating.
cor(progBooks$Number_Of_Pages, progBooks$Rating)

# Visualization with GGplot2

# 1.Graph show number of book of each rating
barplot(
  table(progBooks$Rating), 
  main="Number of book of each rating", 
  xlab = "Rating", 
  ylab = "Number of Book",
)
# 2.Graph show relationship between Review and Rating
ggplot(
  progBooks,
  aes(x = Reviews, y = Rating)
) + geom_point()

