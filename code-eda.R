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

# Check if their is any duplicate data
top10s_spotify %>% duplicated() %>% sum() > 0

# Check the summary statistics for each variable
summary(top10s_spotify)

# Show only the data that have their BPM or Popularity equals to 0
top10s_spotify %>% filter(BPM == 0 | Popularity == 0)

# Replace 0-Popularity values with NAs
top10s_spotify <-
  top10s_spotify %>%
  mutate(Popularity = ifelse(Popularity == 0, NA, Popularity))

# Replace Adele's Million Years Ago features with NAs
top10s_spotify <-
  top10s_spotify %>%
  mutate(
    across(everything(), ~ ifelse(Title == 'Million Years Ago' & . == 0, NA, .)))

# Check neighbors' loudness
top10s_spotify %>% select(Title, `Loudness dB`) %>% arrange(`Loudness dB`)

# Replace -60 dB with NAs 
top10s_spotify <-
  top10s_spotify %>%
  mutate(`Loudness dB` = ifelse(`Loudness dB` == -60, NA, `Loudness dB`))

# Convert genre to factor
top10s_spotify <-
  top10s_spotify %>%
  mutate(Genre = as.factor(Genre))