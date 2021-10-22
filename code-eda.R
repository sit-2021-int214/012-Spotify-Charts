# Step 2

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

# Check the summary statistics for each variable
summary(top10s_spotify)


# Step 3

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


# Write to CSV
write_csv(top10s_spotify, "top10s-spotify-cleaned.csv")


# Step 4

# 1. What is the top 3 artists who on average, produced the slow and least energetic songs?
# use values from Danceability, Energy, and normalized BPM
top10s_spotify %>%
  na.omit() %>%
  mutate(
    NormBPM = (BPM - min(BPM)) / (max(BPM) - min(BPM)) * 100,
    PartialScore = (Danceability + Energy + NormBPM) / 3) %>%
  group_by(Artist) %>%
  summarise(
    Score = mean(PartialScore)) %>%
  arrange(Score) %>%
  head(5)
  
# 2. ในช่วงปี 2010 - 2019 ศิลปินคนใดที่มีเพลงติดท็อปมากที่สุดเป็น 5 อันดับแรก และแต่ละคนนับได้กี่เพลง?
top10s_spotify %>%
  group_by(Artist) %>%
  summarise(count_song = n()) %>%
  arrange(desc(count_song)) %>%
  head(5)

# 3. ศิลปินคนใดที่มีเพลงติดท็อปติดต่อกันหลายปีที่สุด และติดต่อกันกี่ปี?
top10s_spotify %>%
  group_by(Artist) %>%
  distinct(Year) %>%
  arrange(Year) %>%
  mutate(ConsecutiveYear = c(1, diff(Year)) %>% rle() %>% with(max(lengths[values == 1]))) %>%
  arrange(desc(ConsecutiveYear), Artist) %>%
  distinct(ConsecutiveYear)

# 4. เพลงที่มี BPM ไม่เกิน 100 BPM ที่เป็นที่นิยมในปี 2019?
top10s_spotify %>% filter(Year == "2019", BPM < 100) %>% select(Title, Artist, BPM)

# 5. ปีใดที่ The Weeknd มีเพลงติดท็อปมากที่สุด เพลงอะไรบ้าง?
top10s_spotify %>%
  filter(Artist == "The Weeknd") %>%
  group_by(Year) %>%
  mutate(Count = n()) %>%
  ungroup() %>%
  filter(Count == max(Count)) %>%
  select(Title, Year)

# 6. แนวเพลงที่ได้รับความนิยมมากที่สุดในแต่ละปี มีอะไรบ้าง
top10s_spotify %>%
  group_by(Year, Genre) %>%
  summarise(Count = n()) %>%
  arrange(Year, desc(Count)) %>%
  slice(1)

# 7. ปีใดที่มีความหลากหลายของอารมณ์เพลงมากที่สุด
top10s_spotify %>%
  group_by(Year) %>%
  summarise(ValenceVariation = sd(Valence, na.rm = T)) %>%
  arrange(desc(ValenceVariation))

# 8. ความยาวของเพลงที่ติดท็อปในแต่ละปี มีแนวโน้มเพิ่มขึ้นหรือลดลง อย่างไร?
cor(top10s_spotify$Year, top10s_spotify$Duration)
