# Steps
1. Define the questions
2. Find and observe data
3. Explore data from original data
4. Cleaning and Transformation data
5. Exploratory Data Analysis

# Define the questions
1. ศิลปินแต่ละคนเคยมีเพลงติด Chart กี่เพลง?
2. ในช่วงปี 2010 - 2019 ศิลปินคนใดที่มีเพลงติดท็อปมากที่สุดและมีกี่เพลง?
3. ศิลปินคนใดที่มีเพลงติดท็อปติดต่อกันหลายปีที่สุด และติดต่อกันกี่ปี?
4. เพลงที่มี BPM ไม่เกิน 100 BPM ที่เป็นที่นิยมในปี 2019?
5. ในปี 2016 มีเพลงอะไร ศิลปินอะไร ประเภทไหนที่ติด top บ้าง?

# Data Exploration
## Step 0: Setup
Install and import libraries
```r
install.packages("tidyverse")
library(tidyverse)
```
Load the data
```r
top10s_spotify <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/012-Spotify-Charts/main/top10s-spotify-original.csv")
```

## Step 1: Explore the data
Inspect the data
```r
glimpse(top10s_spotify)
```
The dataset has 15 variables.
1. `ID` คือ ลำดับของข้อมูลตั้งแต่ 1 ถึง 603 มีประเภทเป็น `double`
2. `Title` Song's title
3. `Artist` Song's artist
4. `Top genre` The genre of the track
5. `Year` Song's year in the Billboard
6. `bmp` (Beats Per Minute) - The tempo of the song
7. `nrgy` (Energy) - The energy of a song - the higher the value, the more energtic song
8. `dnce` (Danceability) - The higher the value, the easier it is to dance to this song
9. `dB` (Loudness in decibel - The higher the value, the louder the song
10. `live` Liveness - The higher the value, the more likely the song is a live recording
11. `val` Valence - The higher the value, the more positive mood for the song
12. `dur` Length - The duration of the song
13. `acous`  Acousticness - The higher the value the more acoustic the song is
14. `spch` Speechiness - The higher the value the more spoken word the song contains
15. `pop` Popularity - The higher the value the more popular the song is