# Install and import libraries
install.packages("tidyverse")
library(tidyverse)


# Inspect the data
glimpse(top10s_spotify)

# Change column name
top10s_spotify <- top10s_spotify %>% rename(Genre=`top genre`, Energy = nrgy, Danceability = dnce,`Loudness dB`= dB, Liveness = live,Valence = val, Duration = dur,  Acousticness = acous, Speechiness = spch, Popularity = pop)
