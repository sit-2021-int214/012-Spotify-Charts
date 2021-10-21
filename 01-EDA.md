# 012-Top-Spotify-Songs
Original Dataset from: [Top Spotify songs from 2010-2019 - BY YEAR](https://www.kaggle.com/leonardopena/top-spotify-songs-from-20102019-by-year)

# Exploratory Data Analysis

## Steps
1. Define the questions
2. Explore data from original data
3. Cleaning and Transformation data
4. Exploratory Data Analysis

# Step 1 : Define the questions
1. ศิลปินแต่ละคนเคยมีเพลงติดท็อปกี่เพลง?
2. ในช่วงปี 2010 - 2019 ศิลปินคนใดที่มีเพลงติดท็อปมากที่สุดและมีกี่เพลง?
3. ศิลปินคนใดที่มีเพลงติดท็อปติดต่อกันหลายปีที่สุด และติดต่อกันกี่ปี?
4. เพลงที่มี BPM ไม่เกิน 100 BPM ที่เป็นที่นิยมในปี 2019?
5. ในปี 2016 มีเพลงชื่ออะไร ศิลปินชื่ออะไร เป็นเพลงประเภทไหนที่ติดท็อปบ้าง?

# Step 2 : Explore data from original data

## Setup : Loading libraries and dataset
Install and import libraries
```r
install.packages("tidyverse")
library(tidyverse)
install.packages("DescTools") 
library(DescTools)
install.packages("magrittr")
library(magrittr)
install.packages("assertive")
library(assertive)

```
Load the data
```r
top10s_spotify <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/012-Spotify-Charts/main/top10s-spotify-original.csv")

```

## Inspect the data
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
1. `ID` คือ ลำดับของข้อมูล มีค่าตั้งแต่ 1 ถึง 603 มีประเภทเป็น `double`
2. `Title` คือ ชื่อของเพลงที่ติดท็อป มีประเภทเป็น `character`
3. `Artist` คือ ชื่อศิลปินเจ้าของเพลง มีประเภทเป็น `character`
4. `Top genre` คือ ประเภทของเพลง มีประเภทเป็น `character`
5. `Year` คือ ปีที่เพลงติดท็อปบน Spoity
6. `bmp` คือ ความเร็วของเพลง (มีหน่วยเป็นจังหวะต่อนาที (BPM หรือ Beats Per Minute)) พบค่าตั้งแต่ 0 จนถึง 220 มีประเภทเป็น `double`
7. `nrgy` คือ พลังงานของเพลง พบค่าตั้งแต่ 0 (น้อย) จนถึง 100 (มาก) (มีค่ามากแสดงว่ามีพลังงานมาก) มีประเภทเป็น `double`
8. `dnce` คือ ความเหมาะสมของเพลงกับการเต้น(โดยอิงจากการผสมผสานขององค์ประกอบทางดนตรี) พบค่าตั้งแต่ 0 (น้อย) จนถึง 100 (มาก) (มีค่ามากแสดงว่าเหมาะกับการเต้นมาก) มีประเภทเป็น `double`
9. `dB` คือ ความดังของเพลง มีหน่วยเป็นเดซิเบล (dB หรือ decibel) พบค่าตั้งแต่ -60 (เบา) จนถึง 0 (ดัง) (มีค่ามากแสดงว่ามีความดังมาก) มีประเภทเป็น `double`
10. `live` คือ ความสดใหม่ของเสียงเพลง พบค่าตั้งแต่ 0 (น้อย) จนถึง 75 (มาก) (มีค่ามากแสดงว่ามีโอกาสเป็นการบันทึกสด (live recording) มาก) มีประเภทเป็น `double`
11. `val` คือ อารมณ์ของเพลง พบค่าตั้งแต่ 0 (ด้านลบ) จนถึง 100 (ด้านบวก) (มีค่ามากแสดงว่าให้อารมณ์ด้านบวกมาก) มีประเภทเป็น `double`
12. `dur` คือ ความยาวเพลง เป็นระยะเวลาของเสียงเพลงดังต่อเนื่องกัน พบค่าตั้งแต่ 120 จนถึง 440 มีหน่วยเป็นวินาที (second) มีประเภทเป็น `double`
13. `acous` คือ ความเป็นอะคูสติก พบค่าตั้งแต่ 0 (น้อย) จนถึง 100 (มาก) (มีค่ามากแสดงว่ามีโอกาสเป็นอะคูสติก (acoustic) มาก) มีประเภทเป็น `double`
14. `spch` คือ ปริมาณเสียงคำพูดที่มีปรากฏ พบค่าตั้งแต่ 0 (น้อย) จนถึง 50 (มาก) (มีค่ามากแสดงว่ามีโอกาสเป็นการบันทึกเสียงพูดโดยเฉพาะมาก เช่น ทอล์กโชว์ หนังสือเสียง เป็นต้น) มีประเภทเป็น `double`
15. `pop` คือ ความนิยมของเพลง พบค่าตั้งแต่ 0 (น้อย) จนถึง 100 (มาก) (มีค่ามากแสดงว่าเป็นที่นิยมมาก) มีประเภทเป็น `double`


## Step 3 : Cleaning and Transformation data
### 1. Rename columns for readability
```r
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
```
title -> Title\
artist -> Artist\
top genre -> Genre\
year -> Year\
bpm -> BPM\
nrgy -> Energy\
dnce -> Danceability\
dB -> Loudness dB\
live -> Liveness\
val -> Valence\
dur -> Duration\
acous -> Acousticness\
spch -> Speechiness\
pop -> Popularity


## 2. Check if their is any duplicate data
```r
top10s_spotify %>% duplicated() %>% sum() > 0
```
Result
```
[1] FALSE
```
ไม่พบข้อมูลซ้ำ


## Check the summary statistics for each variable
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
พบว่ามีคอลัมน์ที่มีค่าต่ำสุดเป็น 0 อยู่หลายคอลัมน์ ส่วนใหญ่เป็นคุณลักษณะของเพลง

แต่คอลัมน์ที่ไม่ควรจะมีค่าเป็น 0 ได้ มีดังนี้
- bpm คือ ความเร็วของเพลง
- pop คือ ความนิยมของเพลง

และ dB หรือค่าความดัง -60 dB ก็เป็นไปได้ยากเช่นเดียวกัน จึงต้องทำการตรวจสอบว่าค่าดังกล่าวมาจากข้อมูลชุดใดบ้าง


## Check for songs with missing data
```r
top10s_spotify %>% filter(bpm == 0 | pop == 0)
```
Result
```
# A tibble: 5 x 15
   ...1 title                   artist            `top genre`   year   bpm  nrgy  dnce    dB  live   val   dur acous  spch   pop
  <dbl> <chr>                   <chr>             <chr>        <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
1    51 Hello                   Martin Solveig    big room      2010   128    98    67    -3    10    45   191     1     3     0
2   139 Blow Me (One Last Kiss) P!nk              dance pop     2012   114    92    60    -3    25    75   256     0     4     0
3   268 Not a Bad Thing         Justin Timberlake dance pop     2014    86    73    59    -6    38    46   266    27     6     0
4   363 L.A.LOVE (la la)        Fergie            dance pop     2015   202    39    48    -8    26    27   193     2     9     0
5   443 Million Years Ago       Adele             british soul  2016     0     0     0   -60     0     0   227     0     0     0
```


## Replace 0-popularity values with NA
พบว่ามีเพลงที่ Popularity เป็น 0 อยู่ทั้งหมด 5 เพลง แต่การตัดข้อมูลชุดนี้ออกไปเลยอาจส่งผลต่อการวิเคราะห์ข้อมูลอื่น ๆ เช่น จำนวนเพลงที่ติดท็อปของศิลปิน เป็นต้น เราจึงเลือกที่จะเก็บไว้ และทำการแทนค่า Popularity ด้วย NA
```r
top10s_spotify <-
  top10s_spotify %>%
  mutate(Popularity = ifelse(Popularity == 0, NA, Popularity))
```

ส่วนเพลง Million Years Ago ของ Adele ซึ่งมี BPM และคุณลักษณะของเพลงเป็น 0 เกือบหมด ไม่สามารถบอกได้ว่าค่าไหนสามารถนำไปใช้ได้ จึงแทนค่า 0 ทุกตัวด้วย NA
```r
top10s_spotify <-
  top10s_spotify %>%
  mutate(
    across(everything(), ~ ifelse(Title == 'Million Years Ago' & . == 0, NA, .)))
```

## Check loudness in ascending order
ตรวจ Loudness dB ของเพลงอื่น ๆ เพื่อดูความเป็นไปได้ของ -60 dB โดยเรียงจากเบาไปดัง
```r
top10s_spotify %>% select(Title, `Loudness dB`) %>% arrange(`Loudness dB`)
```
Result
```
# A tibble: 603 x 2
   Title                         `Loudness dB`
   <chr>                                 <dbl>
 1 Million Years Ago                       -60
 2 Start                                   -15
 3 Beautiful Birds (feat. Birdy)           -13
 4 Partition                               -12
 5 Foolish Games                           -11
 6 What Do You Mean? - Acoustic            -11
 7 St Jude                                 -11
 8 Love                                    -11
 9 Not About Angels                        -10
10 Love Yourself                           -10
# ... with 593 more rows
```


## Replace -60 dB with NA
พบว่าเพลงที่เบาสุดจริง ๆ ควรดังอย่างน้อย -15 dB ขึ้นไป จึงทำการแทนค่า -60 dB ด้วย NA
```r
top10s_spotify <-
  top10s_spotify %>%
  mutate(`Loudness dB` = ifelse(`Loudness dB` == -60, NA, `Loudness dB`))
```

## Convert genre to factor
แนวเพลงเป็นค่าแบบ categorical เราจึงควรแปลงเป็นค่า factor
```r
top10s_spotify <-
  top10s_spotify %>%
  mutate(Genre = as.factor(Genre))
```


## Step 4 : Exploratory Data Analysis

### 1. ศิลปินแต่ละคนเคยมีเพลงติดท็อปกี่เพลง?
```r

```
Result
```

```

Summary\
สรุป

### 2. ในช่วงปี 2010 - 2019 ศิลปินคนใดที่มีเพลงติดท็อปมากที่สุดเป็น 5 อันดับแรก และแต่ละคนนับได้กี่เพลง?
```r
head((topsong10s %>% group_by(artist) %>%
        summarise(count_song = n()) %>%
        arrange(desc(count_song))),5)
```

Result
```
# A tibble: 5 x 2
  artist        count_song
  <chr>              <int>
1 Katy Perry            17
2 Justin Bieber         16
3 Maroon 5              15
4 Rihanna               15
5 Lady Gaga             14
```

Summary\
ในช่วงปี 2010 - 2019 
ศิลปินที่มีเพลงติดท็อปมากที่สุดเป็นอันดับที่หนึ่ง คือ Katy Perry ที่มีจำนวนเพลงติดท็อปรวม 17 เพลง
อันดับที่สอง คือ Justin Bieber ที่มีจำนวนเพลงติดท็อปรวม 16 เพลง
อันดับที่สามร่วมกัน คือ Maroon 5 และ Rihanna ที่ต่างมีจำนวนเพลงติดท็อปรวม 15 เพลงเท่ากัน
และอันดับที่ห้า คือ Lady Gaga ที่มีจำนวนเพลงติดท็อปรวม 14 เพลง

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
top10s_spotify %>% filter(year == 2019)%>% filter (bpm <= 100) %>% select(title)
```

Result
```
                                                  title
1                                              Memories
2  South of the Border (feat. Camila Cabello & Cardi B)
3                                               Happier
4            Good as Hell (feat. Ariana Grande) - Remix
5                                            Only Human
6                       Beautiful People (feat. Khalid)
7                                      Don't Call Me Up
8                                              Takeaway
9                             No Guidance (feat. Drake)
10      Taki Taki (feat. Selena Gomez, Ozuna & Cardi B)
11                                    Con Calma - Remix
12        Cross Me (feat. Chance the Rapper & PnB Rock)
```

Summary\
เพลงที่มี BPM ไม่เกิน 100 BPM ที่เป็นที่นิยมในปี 2019 มีทั้งหมด 12 เพลง

### 5. ในปี 2016 มีเพลงชื่ออะไร ศิลปินชื่ออะไร เป็นเพลงประเภทไหนที่ติดท็อปบ้าง?
```r
top10s_spotify %>% filter(year == 2016) %>% select(title,artist,top.genre) %>% view()
```

Result
```
                                                                                                  title                 artist                 top.genre
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
ในปี 2016 มีเพลงทั้งหมด 80 เพลงที่ติดท็อป
