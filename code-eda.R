# Install and import libraries
install.packages("tidyverse")
library(tidyverse)


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
