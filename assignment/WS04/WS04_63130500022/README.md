# R-Assignment 4

**Created by Chinnawat Kaewnongsang (ID: 63130500022)**

Choose Dataset:
  Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)

### Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2

## Part 1: Explore the dataset

```
# Library
library(dplyr)
library(readr)

# Dataset
programing_book <- read.csv('https://raw.githubusercontent.com/sit-2021-int214/012-Top-Spotify-Songs/main/assignment/WS04/WS04_63130500022/prog_book.csv')
```

In this dataset has 
```
Rows: 271
Columns: 7
$ Rating          <dbl> 4.17, 4.01, 3.33, 3.97, 4.06, 3.84, 4.09, 4.15, 3.87, 4.62, 4.03, 3.78, 3.73, 3.87, 3.87, ~
$ Reviews         <chr> "3,829", "1,406", "0", "1,658", "1,325", "117", "5,938", "1,817", "2,093", "0", "160", "48~
$ Book_title      <chr> "The Elements of Style", "The Information: A History, a Theory, a Flood", "Responsive Web ~
$ Description     <chr> "This style manual offers practical advice on improving writing skills. Throughout, the em~
$ Number_Of_Pages <int> 105, 527, 50, 393, 305, 288, 256, 368, 259, 128, 352, 352, 200, 328, 240, 288, 392, 304, 3~
$ Type            <chr> "Hardcover", "Hardcover", "Kindle Edition", "Hardcover", "Kindle Edition", "Paperback", "H~
$ Price           <dbl> 9.323529, 11.000000, 11.267647, 12.873529, 13.164706, 14.188235, 14.232353, 14.364706, 14.~
```
- Rating คะแนนของหนังสือ
- Reviews จำนวนความคิดเห็น
- Book_title ชื่อหนังสือ
- Description รายละเอียดของหนังสือ
- Number_of_Pages จำนวนหน้าของหนังสือ
- Type ประเภทของหนังสือ
- Price ราคาของหนังสือ

## Part 2: Learning function from Tidyverse

- Function `summarise()` from package [dplyr](https://dplyr.tidyverse.org/reference/summarise.html)). It using for summarise columns

```
summarise(programing_book,mean(Number_Of_Pages,na.rm =T))
```
** สามารถสรุปข้อมูลโดยเราจะสามารถเจาะจงได้ว่าเราต้องการอะไรของอะไร ( อย่างเช่น mean min max เป็นต้น)

## Part 3: Transform data with dplyr and finding insight the data

//Explain here

```
#Code here
```

Result:

```
#Copy Result from console to here
```
//Explain

- list 1
- list 2

## Part 4: Visualization with GGplot2
### 1.) Graph show relation between height and mass
```
scat_plot <- starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass))+
  geom_point(aes(color=gender))

scat_plot+geom_smooth()
```
Result:

![Graph 1](graph1.png)

**Guideline:
Embed Image by using this syntax in markdown file
````
![Name](imageFile)
````
