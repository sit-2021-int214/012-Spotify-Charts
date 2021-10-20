# Install and import libraries
#install.packages("tidyverse")
library(tidyverse)
#install.packages("DescTools") 
library(DescTools)
#install.packages("magrittr")
library(magrittr)
#install.packages("assertive")
library(assertive)

# Load the data
top10s_spotify <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/012-Spotify-Charts/main/top10s-spotify-original.csv")

# Inspect the data
glimpse(top10s_spotify)

# Check if their is any duplicate data
top10s_spotify %>% duplicated() %>% sum() > 0

# Check the summary statistics for each variable
summary(top10s_spotify)

# Select only the data have their BPM equals to 0
top10s_spotify %>% filter(top10s_spotify$bpm == 0)

# Change column name
top10s_spotify <- top10s_spotify %>% 
  rename(Title = title,
         Artist = artist,
         Genre = `top genre`, 
         Year = year,
         BPM = bpm,
         Energy = nrgy, 
         Danceability = dnce,
         `Loudness dB` = dB, 
         Liveness = live,
         Valence = val, 
         Duration = dur, 
         Acousticness = acous, 
         Speechiness = spch, 
         Popularity = pop)

# Replace 0s and -60 dB with NAs 
top10s_spotify %>%
  filter(BPM == 0) %>%
  na_if(0) %>%
  mutate(`Loudness dB` = NA)
