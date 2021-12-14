# 012-Top-Spotify-Songs
Original Dataset from: [Top Spotify songs from 2010-2019 - BY YEAR](https://www.kaggle.com/leonardopena/top-spotify-songs-from-20102019-by-year)

## Overview 
This section will show the way to access our data visualization from the dataset 'Top Spotify songs from 2010-2019' by using Power BI Dashboard to display it, including explain the steps to do hypothesis testing and its conclusion. By bringing a cleaned dataset from the part of [Exploratory Data Analysis](https://github.com/sit-2021-int214/012-Top-Spotify-Songs/blob/main/01-EDA.md) to study and statistical inference with representing statistical significance after.

## Steps
1. [Setup dataset and tools](#setup-dataset-and-tools)
2. [Data Visualization](#data-visualization)
3. [Analytical Inferential Statistics](#analytical-inferential-statistics)

## Setup dataset and tools
### Import cleaned dataset
```r
top10s_spotify <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/012-Top-Spotify-Songs/main/top10s-spotify-cleaned.csv")
```
### Import necessary packages
```r
install.packages("tidyverse") # When never had installed it before
library(tidyverse)
```

**Also, including check its statistics summary before.** (with summary() function)

```
      ...1          Title              Artist             Genre          
 Min.   :  1.0   Length:603         Length:603         Length:603        
 1st Qu.:151.5   Class :character   Class :character   Class :character  
 Median :302.0   Mode  :character   Mode  :character   Mode  :character  
 Mean   :302.0                                                           
 3rd Qu.:452.5                                                           
 Max.   :603.0                                                           
                                                                         
      Year           BPM            Energy       Danceability    Loudness dB     
 Min.   :2010   Min.   : 43.0   Min.   : 4.00   Min.   :23.00   Min.   :-15.000  
 1st Qu.:2013   1st Qu.:100.0   1st Qu.:61.00   1st Qu.:57.00   1st Qu.: -6.000  
 Median :2015   Median :120.0   Median :74.00   Median :66.00   Median : -5.000  
 Mean   :2015   Mean   :118.7   Mean   :70.62   Mean   :64.49   Mean   : -5.488  
 3rd Qu.:2017   3rd Qu.:129.0   3rd Qu.:82.00   3rd Qu.:73.00   3rd Qu.: -4.000  
 Max.   :2019   Max.   :206.0   Max.   :98.00   Max.   :97.00   Max.   : -2.000  
                NA's   :1       NA's   :1       NA's   :1       NA's   :1        
    Liveness       Valence         Duration      Acousticness    Speechiness    
 Min.   : 2.0   Min.   : 4.00   Min.   :134.0   Min.   : 0.00   Min.   : 3.000  
 1st Qu.: 9.0   1st Qu.:35.00   1st Qu.:202.0   1st Qu.: 2.00   1st Qu.: 4.000  
 Median :12.0   Median :52.00   Median :221.0   Median : 6.00   Median : 5.000  
 Mean   :17.8   Mean   :52.31   Mean   :224.7   Mean   :14.35   Mean   : 8.372  
 3rd Qu.:24.0   3rd Qu.:69.00   3rd Qu.:239.5   3rd Qu.:17.00   3rd Qu.: 9.000  
 Max.   :74.0   Max.   :98.00   Max.   :424.0   Max.   :99.00   Max.   :48.000  
 NA's   :1      NA's   :1                       NA's   :1       NA's   :1       
   Popularity   
 Min.   : 7.00  
 1st Qu.:60.00  
 Median :69.00  
 Mean   :67.08  
 3rd Qu.:76.00  
 Max.   :99.00  
 NA's   :5   
```

## Data Visualization
In this part, we create and display the data on the dashboard by BI Tools named 'Power BI' then you could access them with click on this link. >>> [Top Spotify songs from 2010-2019 : Data-visualization](https://app.powerbi.com/view?r=eyJrIjoiMGU1ZWM4NTgtYmM1NS00MGNkLWI1MGUtYTA2MmVjMzhhMjNlIiwidCI6IjZmNDQzMmRjLTIwZDItNDQxZC1iMWRiLWFjMzM4MGJhNjMzZCIsImMiOjEwfQ%3D%3D)

## Analytical Inferential Statistics

### Our hypothesis
Explore a sample of 603 songs that had been the top Spotify songs by the year 2010 - 2019. About a variable of all which show each song's tempo or 'BPM'. And consider verifying whether BPM that attains a value of 120 (which is the median in this data) and more, involves Spotify user group popularity. By finding that the sample BPM mean is 118.7425 and the sample BPM standard deviation is 24.3395 approximately.

### Step 0: Assign variables
```r
n <- 603
sd <- 24.3395
xbar <- 118.7425
u0 <- 120
```

### Step 1: State the hypothesis
```r
#h0: u0 >= 120
#ha: u0 < 120
```

### Step 2: Level of significance
```r
# let confidence level = 95%, means alpha = 5%
alpha <- 0.05
```

### Step 3: Test statistic
```r
t <- (xbar - u0) / (sd/sqrt(n))
# t = -1.268688
```

### Step 4: Finding Critical Value approach
```r
# P-value approach
pvalue <- pnorm(z)
# pvalue = 0.1022761

# Or

# Critical Value approach
talpha <- qt(alpha,n-1) 
# talpha = -1.647389
```

### Step 5: Compare
```r
# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Or

# When using critical value
if(t<=talpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# All result: Accept H0

```

### Step 6: Conclusion
<!-- In Accept H0: -->
Between BPM that attains a value of 120 and more, and Spotify user group popularity have enough evidence or indicator more to certainly summarise that these two factors were interrelated.
<!-- In Reject H0: Between BPM that attains a value of 120 and more, and Spotify user group popularity didn't have enough evidence or indicator more to certainly summarise whether these two factors were interrelated. -->
