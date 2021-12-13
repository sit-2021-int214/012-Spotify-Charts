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

## Data Visualization
In this part, we create and display the data on the dashboard by BI Tools named 'Power BI' then you could access them with click on this link. >>> [Top Spotify songs from 2010-2019 : Data-visualization](https://app.powerbi.com/view?r=eyJrIjoiMGU1ZWM4NTgtYmM1NS00MGNkLWI1MGUtYTA2MmVjMzhhMjNlIiwidCI6IjZmNDQzMmRjLTIwZDItNDQxZC1iMWRiLWFjMzM4MGJhNjMzZCIsImMiOjEwfQ%3D%3D)

## Analytical Inferential Statistics

### Our hypothesis
Explore a sample of 603 songs that had been the top Spotify songs by the year 2010 - 2019. About a variable of all which show each song's tempo or 'BPM'. And consider verifying whether BPM that attains a value of 120 and more, involves Spotify user group popularity. By finding that the sample BPM mean is 118.7425 and the sample BPM standard deviation is 24.3395.

### Step 0: Assign variables
```r
n <- 603
sd <- 24.3395
xbar <- 118.7425
U0 <- 120
```

### Step 1: State the hypothesis
```r
#h0: U0 >= 120
#ha: U0 < 120
```

### Step 2: Level of significance
```r
alpha <- 0.10
```

### Step 3: Test statistic
```r
z <- (xbar - U0) / (sd/sqrt(n))
# z = -1.268688
```

### Step 4: Finding Critical Value approach
```r
# Critical Value approach
zalpha <- qnorm(alpha)
# zalpha = -1.281552
```

### Step 5: Compare
```r
# When using critical value
if(z<zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Result: Accept H0

```

### Step 6: Conclusion
BPM that attains a value of 120 and more, truly involves and affects Spotify user group popularity.
