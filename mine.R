install.packages(tidyverse)
library(tidyverse)

top10s_spotify <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/012-Spotify-Charts/main/top10s-spotify-original.csv")

glimpse(top10s_spotify)

gl <- function(x) {
  y <- c(unclass(diff(x)))  # c and unclass -- preparing it for rle
  r <- rle(y)
  with(r, max(lengths[values==1]))
}


top10s_spotify <- top10s_spotify %>% 
  rename(Title = title,
         Artist = artist,
         Genre =`top genre`, 
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

top10s_spotify

# The artist with most consecutive years
top10s_spotify %>%
  group_by(artist) %>%
  arrange(year) %>%
  select(year) %>%
  unique() %>%
  mutate(n = diff(year) %>% rle() %>% with(max(lengths[values == 1]))) %>%
  filter(n %>% is.finite()) %>%
  arrange(desc(n)) %>%
  group_by(artist) %>%
  select(n) %>%
  unique()

# OLD
top10s_spotify %>%
  group_by(artist) %>%
  select(year) %>%
  unique() %>%
  arrange(year) %>%
  mutate(n = c(1, diff(year)) %>% rle() %>% with(max(lengths[values == 1]))) %>%
  arrange(desc(n)) %>%
  ungroup() %>%
  filter(n == max(n))


# THIS sus tho (slice()'s assumption lead to cutting the wrong chunk)
top10s_spotify %>%
  group_by(artist) %>%
  select(year) %>%
  unique() %>%
  arrange(year) %>%
  mutate(n = c(1, diff(year)) %>% rle() %>% with(max(lengths[values == 1]))) %>%
  slice(1:n) %>%
  arrange(desc(n), artist) %>%
  view()


top10s_spotify %>%
  group_by(artist) %>%
  distinct(year) %>%
  arrange(year) %>%
  mutate(n = c(1, diff(year)) %>% rle() %>% with(max(lengths[values == 1]))) %>%
  arrange(desc(n), artist) %>%
  distinct(n)

view(top10s_spotify)


year <- c(2010, 2011, 2012, 2012, 2012, 2014, 2017)

top10s_spotify %>%
  filter(val > 0) %>%
  group_by(year) %>%
  select(val) %>%
  summary()


mean(c(2,3,4,5))
mean(c(0,2,3,4,5))
mean(c(NA,2,3,4,5), na.rm = T)
