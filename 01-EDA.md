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
### Inspect the data
```r
glimpse(top10s_spotify)
```
Result
```
Rows: 603
Columns: 15
$ ...1        <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,~
$ title       <chr> "Hey, Soul Sister", "Love The Way You Lie", "TiK ToK", "Bad Romance", "Just the Way You Are", "Baby", "Dynamite", "Sec~
$ artist      <chr> "Train", "Eminem", "Kesha", "Lady Gaga", "Bruno Mars", "Justin Bieber", "Taio Cruz", "OneRepublic", "Alicia Keys", "Ri~
$ `top genre` <chr> "neo mellow", "detroit hip hop", "dance pop", "dance pop", "pop", "canadian pop", "dance pop", "dance pop", "hip pop",~
$ year        <dbl> 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010, 2010~
$ bpm         <dbl> 97, 87, 120, 119, 109, 65, 120, 148, 93, 126, 128, 145, 130, 122, 125, 130, 121, 128, 99, 120, 130, 186, 125, 103, 146~
$ nrgy        <dbl> 89, 93, 84, 92, 84, 86, 78, 76, 37, 72, 87, 83, 82, 83, 84, 75, 61, 81, 80, 61, 63, 68, 68, 81, 95, 83, 90, 94, 80, 75~
$ dnce        <dbl> 67, 75, 76, 70, 64, 73, 75, 52, 48, 79, 62, 62, 77, 83, 44, 78, 72, 82, 63, 83, 80, 44, 73, 70, 53, 48, 61, 65, 72, 79~
$ dB          <dbl> -4, -5, -3, -4, -5, -5, -4, -6, -8, -4, -4, -5, -5, -6, -8, -6, -4, -8, -7, -4, -7, -5, -5, -5, -4, -6, -5, -3, -5, -4~
$ live        <dbl> 8, 52, 29, 8, 9, 11, 4, 12, 12, 7, 6, 10, 70, 11, 12, 36, 11, 60, 36, 9, 32, 6, 9, 22, 28, 38, 5, 6, 13, 18, 14, 36, 4~
$ val         <dbl> 80, 64, 71, 71, 43, 54, 82, 38, 14, 61, 47, 48, 63, 71, 78, 33, 83, 44, 37, 76, 40, 45, 74, 73, 65, 74, 88, 73, 59, 40~
$ dur         <dbl> 217, 263, 200, 295, 221, 214, 203, 225, 216, 235, 235, 230, 213, 221, 217, 269, 202, 308, 274, 187, 284, 227, 215, 216~
$ acous       <dbl> 19, 24, 10, 0, 2, 4, 0, 7, 74, 13, 3, 33, 18, 1, 1, 20, 5, 7, 0, 1, 0, 1, 0, 0, 26, 0, 2, 2, 2, 0, 5, 1, 8, 18, 16, 8,~
$ spch        <dbl> 4, 23, 14, 4, 4, 14, 9, 4, 3, 4, 3, 4, 5, 4, 45, 3, 3, 7, 5, 10, 7, 5, 3, 4, 5, 4, 5, 9, 4, 5, 5, 8, 12, 37, 11, 5, 3,~
$ pop         <dbl> 83, 82, 80, 79, 78, 77, 77, 77, 76, 73, 73, 73, 73, 73, 72, 72, 71, 70, 69, 69, 68, 66, 66, 65, 65, 65, 64, 63, 63, 62~
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

### Check the summary statistics for each variable
```r
summary(top10s_spotify)
```
Result
```
      ...1          title              artist           top genre              year           bpm             nrgy           dnce      
 Min.   :  1.0   Length:603         Length:603         Length:603         Min.   :2010   Min.   :  0.0   Min.   : 0.0   Min.   : 0.00  
 1st Qu.:151.5   Class :character   Class :character   Class :character   1st Qu.:2013   1st Qu.:100.0   1st Qu.:61.0   1st Qu.:57.00  
 Median :302.0   Mode  :character   Mode  :character   Mode  :character   Median :2015   Median :120.0   Median :74.0   Median :66.00  
 Mean   :302.0                                                            Mean   :2015   Mean   :118.5   Mean   :70.5   Mean   :64.38  
 3rd Qu.:452.5                                                            3rd Qu.:2017   3rd Qu.:129.0   3rd Qu.:82.0   3rd Qu.:73.00  
 Max.   :603.0                                                            Max.   :2019   Max.   :206.0   Max.   :98.0   Max.   :97.00  
       dB               live            val             dur            acous            spch             pop       
 Min.   :-60.000   Min.   : 0.00   Min.   : 0.00   Min.   :134.0   Min.   : 0.00   Min.   : 0.000   Min.   : 0.00  
 1st Qu.: -6.000   1st Qu.: 9.00   1st Qu.:35.00   1st Qu.:202.0   1st Qu.: 2.00   1st Qu.: 4.000   1st Qu.:60.00  
 Median : -5.000   Median :12.00   Median :52.00   Median :221.0   Median : 6.00   Median : 5.000   Median :69.00  
 Mean   : -5.579   Mean   :17.77   Mean   :52.23   Mean   :224.7   Mean   :14.33   Mean   : 8.358   Mean   :66.52  
 3rd Qu.: -4.000   3rd Qu.:24.00   3rd Qu.:69.00   3rd Qu.:239.5   3rd Qu.:17.00   3rd Qu.: 9.000   3rd Qu.:76.00  
 Max.   : -2.000   Max.   :74.00   Max.   :98.00   Max.   :424.0   Max.   :99.00   Max.   :48.000   Max.   :99.00
```
พบว่ามีข้อมูลที่มีคุณลักษณะของเพลงเป็น 0 ทุกค่า
check ข้อมูลที่มี bpm เป็น 0 เพราะไม่ควรมีเพลงที่มีค่า bmp เป็น 0
```r
top10s_spotify %>% filter(top10s_spotify$bpm == 0)
```
Result
```
     title            artist  top genre   year   bpm  nrgy  dnce    dB  live   val   dur acous  spch   pop
443 Million Years Ago Adele  british soul  2016     0     0     0   -60     0     0   227     0     0     0
```
## Step X:

### 1. ศิลปินแต่ละคนเคยมีเพลงติด Chart กี่เพลง?
```r

```
Result
```

```

Summary\
กหฟกฟ

### 2. ในช่วงปี 2010 - 2019 ศิลปินคนใดที่มีเพลงติดท็อปมากที่สุดและมีกี่เพลง?
```r

```

Result
```

```

Summary\
กหฟกฟ

### 3. ศิลปินคนใดที่มีเพลงติดท็อปติดต่อกันหลายปีที่สุด และติดต่อกันกี่ปี?
```r
top10s_spotify %>%
  group_by(artist) %>%
  distinct(year) %>%
  arrange(year) %>%
  mutate(n = c(1, diff(year)) %>% rle() %>% with(max(lengths[values == 1]))) %>%
  arrange(desc(n), artist) %>%
  distinct(n)
```

Result
```
# A tibble: 184 x 2
# Groups:   artist [184]
   artist             n
   <chr>          <int>
 1 Katy Perry         8
 2 Calvin Harris      7
 3 Ariana Grande      6
 4 David Guetta       6
 5 Jennifer Lopez     6
 6 Maroon 5           6
 7 Pitbull            5
 8 Shawn Mendes       5
 9 Zedd               5
10 Demi Lovato        4
# ... with 174 more rows
```

Summary\
Katy Perry เป็นศิลปินที่มีเพลงติดท็อปติดต่อกันหลายปีที่สุด และติดต่อกันเป็นเวลา 8 ปี รองลงมาคือ Calvin Harris และ Ariana Grande ด้วยระยะเวลา 7 ปี และ 6 ปี ตามลำดับ

### 4. เพลงที่มี BPM ไม่เกิน 100 BPM ที่เป็นที่นิยมในปี 2019?
```r

```

Result
```

```

Summary\
กหฟกฟ

### 5. ในปี 2016 มีเพลงอะไร ศิลปินอะไร ประเภทไหนที่ติด top บ้าง?
```r
top10s_spotify %>% filter(year == 2016) %>% select(title,artist,top.genre) %>% view()
```

Result
```
1                                                                                             The Hills             The Weeknd canadian contemporary r&b
2                                                                                         Love Yourself          Justin Bieber              canadian pop
3                                                                                     Cake By The Ocean                   DNCE                 dance pop
4                                                                                     Don't Let Me Down       The Chainsmokers                electropop
5                                                                                   In the Name of Love          Martin Garrix                  big room
6                                                                                              Into You          Ariana Grande                 dance pop
7                                                                             This Is What You Came For          Calvin Harris                 dance pop
8                                                                                       Million Reasons              Lady Gaga                 dance pop
9                                                                                             Needed Me                Rihanna             barbadian pop
10                                                                                              7 Years           Lukas Graham                danish pop
11                         CAN'T STOP THE FEELING! (Original Song from DreamWorks Animation's "TROLLS")      Justin Timberlake                 dance pop
12                                                                 Work from Home (feat. Ty Dolla $ign)          Fifth Harmony                 dance pop
13                                                                              Scars To Your Beautiful           Alessia Cara canadian contemporary r&b
14                                                          Like I'm Gonna Lose You (feat. John Legend)         Meghan Trainor                 dance pop
15                                                                                                 Work                Rihanna             barbadian pop
16                                                                                             Stitches           Shawn Mendes              canadian pop
17                                                                                       Me, Myself & I                 G-Eazy                   hip hop
18                                                                  I Took A Pill In Ibiza - Seeb Remix            Mike Posner                 dance pop
19                                                                                      Dangerous Woman          Ariana Grande                 dance pop
20                                                                                             Starving       Hailee Steinfeld                 dance pop
21                                                                                   Shout Out to My Ex             Little Mix                 dance pop
22                                                                                        Electric Love                   BุRNS                electropop
23                                                                                            Confident            Demi Lovato                 dance pop
24                                                                                             Too Good                  Drake          canadian hip hop
25                                                                                                Roses       The Chainsmokers                electropop
26                                                                 Cold Water (feat. Justin Bieber & Mุ)            Major Lazer                 dance pop
27                                                                                               Me Too         Meghan Trainor                 dance pop
28                                                          Light It Up (feat. Nyla & Fuse ODG) [Remix]            Major Lazer                 dance pop
29                                                                                      Ain't Your Mama         Jennifer Lopez                 dance pop
30                                                                                                Close             Nick Jonas                 dance pop
31                                                                                           Toothbrush                   DNCE                 dance pop
32                                                                                          All We Know       The Chainsmokers                electropop
33                                                                                           Final Song                      Mุ                 dance pop
34                                                                                              Company          Justin Bieber              canadian pop
35                                                                                      Hands To Myself           Selena Gomez                 dance pop
36                                                                                            All I Ask                  Adele              british soul
37                  Just Like Fire (From the Original Motion Picture "Alice Through The Looking Glass")                   P!nk                 dance pop
38                                                                                                   NO         Meghan Trainor                 dance pop
39                                                                                Kill Em With Kindness           Selena Gomez                 dance pop
40                                                                                            Cool Girl                Tove Lo                 dance pop
41                                                                                Runnin' (Lose It All)            Naughty Boy            tropical house
42                                                                                                 Here           Alessia Cara canadian contemporary r&b
43                                                                                     Perfect Illusion              Lady Gaga                 dance pop
44                                                                                           PILLOWTALK                   ZAYN                 dance pop
45                                                                                     Out Of The Woods           Taylor Swift                       pop
46                                                                                                 Rise             Katy Perry                 dance pop
47                                                                                        Wherever I Go            OneRepublic                 dance pop
48                                                                                             Body Say            Demi Lovato                 dance pop
49                                                                                      Don't Be A Fool           Shawn Mendes              canadian pop
50                                                                                         LIKE I WOULD                   ZAYN                 dance pop
51                                                                                        Cheap Thrills                    Sia          australian dance
52                                                                                            I Got You             Bebe Rexha                 dance pop
53                                                                                     Run Away With Me       Carly Rae Jepsen              canadian pop
54                                                                                   Cruel (feat. ZAYN)              Snakehips                 dance pop
55                                                                     Send My Love (To Your New Lover)                  Adele              british soul
56                                                                                WTF (Where They From)          Missy Elliott                 dance pop
57                                                                                               Desire          Years & Years                 dance pop
58                                                                                   When We Were Young                  Adele              british soul
59                                                                      I Know What You Did Last Summer           Shawn Mendes              canadian pop
60 Wish That You Were Here - From “Miss Peregrine’s Home for Peculiar Children” Original Motion Picture Florence + The Machine                   art pop
61                                                                                                Hurts             Emeli Sand้                 dance pop
62                                                                                               Change     Christina Aguilera                 dance pop
63                                                                            Make Me... (feat. G-Eazy)         Britney Spears                 dance pop
64                                                                                 Keeping Your Head Up                  Birdy                neo mellow
65                                                                                          True Colors                   Zedd                complextro
66                                                                                     Make Me Like You           Gwen Stefani                 dance pop
67                                                                                   Champagne Problems             Nick Jonas                 dance pop
68                                                                                                Blown                   DNCE                 dance pop
69                                                                                                Start            John Legend                neo mellow
70                                                                                            Pep Rally          Missy Elliott                 dance pop
71                                                                                               Higher       Carly Rae Jepsen              canadian pop
72                                                                                           Invitation         Britney Spears                 dance pop
73                                                                   One Call Away (feat. Tyga) - Remix           Charlie Puth                 dance pop
74                                                                        Beautiful Birds (feat. Birdy)              Passenger                  folk-pop
75                                                                                          Little Lies            Hilary Duff                 dance pop
76                                                                              Do You Wanna Come Over?         Britney Spears                 dance pop
77                                                                                            BURNITUP!          Janet Jackson                 dance pop
78                                                                                        Picky - Remix           Joey Montana                     latin
79                                                                                     Behind Your Back          Nelly Furtado            canadian latin
80                                                                                    Million Years Ago                  Adele              british soul
```

Summary\
ในปี 2016 มีเพลงทั้งหมด 80 เพลง ที่ติดท็อป
