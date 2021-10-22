# 012-Top-Spotify-Songs
Original Dataset from: [Top Spotify songs from 2010-2019 - BY YEAR](https://www.kaggle.com/leonardopena/top-spotify-songs-from-20102019-by-year)

# Exploratory Data Analysis

## Steps
1. [Define the questions](#step-1--define-the-questions)
2. [Explore data from original dataset](#step-2--explore-data-from-original-dataset)
3. [Data Cleaning and Data Transformation](#step-3--data-cleaning-and-data-transformation)
4. [Exploratory Data Analysis](#step-4--exploratory-data-analysis)


# Step 1 : Define the questions
1. ศิลปินแต่ละคนเคยมีเพลงติดท็อปกี่เพลง?
2. ในช่วงปี 2010 - 2019 ศิลปินคนใดที่มีเพลงติดท็อปมากที่สุดและมีกี่เพลง?
3. ศิลปินคนใดที่มีเพลงติดท็อปติดต่อกันหลายปีที่สุด และติดต่อกันกี่ปี?
4. เพลงที่มี BPM ไม่เกิน 100 BPM ที่เป็นที่นิยมในปี 2019?
5. ปีใดที่ The Weeknd มีเพลงติดท็อปมากที่สุด เพลงอะไรบ้าง?
6. แนวเพลงที่ได้รับความนิยมมากที่สุดในแต่ละปี มีอะไรบ้าง?
7. ปีใดที่มีความหลากหลายของอารมณ์เพลงมากที่สุด?
8. ความยาวของเพลงที่ติดท็อปในแต่ละปี มีแนวโน้มเพิ่มขึ้นหรือลดลง อย่างไร?

# Step 2 : Explore data from original dataset

## 1. Install and import libraries

```r
install.packages("tidyverse")
install.packages("DescTools") 
install.packages("magrittr")
install.packages("assertive")

library(tidyverse)
library(DescTools)
library(magrittr)
library(assertive)
```


## 2. Import the dataset

```r
top10s_spotify <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/012-Top-Spotify-Songs/main/top10s-spotify-original.csv")
```


## 3. Observe the data and its summary statistics

```r
glimpse(top10s_spotify)
```

**Result**
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

```r
summary(top10s_spotify)
```

**Result**
```
      ...1          title              artist           top genre              year           bpm       
 Min.   :  1.0   Length:603         Length:603         Length:603         Min.   :2010   Min.   :  0.0  
 1st Qu.:151.5   Class :character   Class :character   Class :character   1st Qu.:2013   1st Qu.:100.0  
 Median :302.0   Mode  :character   Mode  :character   Mode  :character   Median :2015   Median :120.0  
 Mean   :302.0                                                            Mean   :2015   Mean   :118.5  
 3rd Qu.:452.5                                                            3rd Qu.:2017   3rd Qu.:129.0  
 Max.   :603.0                                                            Max.   :2019   Max.   :206.0  
      nrgy           dnce             dB               live            val             dur       
 Min.   : 0.0   Min.   : 0.00   Min.   :-60.000   Min.   : 0.00   Min.   : 0.00   Min.   :134.0  
 1st Qu.:61.0   1st Qu.:57.00   1st Qu.: -6.000   1st Qu.: 9.00   1st Qu.:35.00   1st Qu.:202.0  
 Median :74.0   Median :66.00   Median : -5.000   Median :12.00   Median :52.00   Median :221.0  
 Mean   :70.5   Mean   :64.38   Mean   : -5.579   Mean   :17.77   Mean   :52.23   Mean   :224.7  
 3rd Qu.:82.0   3rd Qu.:73.00   3rd Qu.: -4.000   3rd Qu.:24.00   3rd Qu.:69.00   3rd Qu.:239.5  
 Max.   :98.0   Max.   :97.00   Max.   : -2.000   Max.   :74.00   Max.   :98.00   Max.   :424.0  
     acous            spch             pop       
 Min.   : 0.00   Min.   : 0.000   Min.   : 0.00  
 1st Qu.: 2.00   1st Qu.: 4.000   1st Qu.:60.00  
 Median : 6.00   Median : 5.000   Median :69.00  
 Mean   :14.33   Mean   : 8.358   Mean   :66.52  
 3rd Qu.:17.00   3rd Qu.: 9.000   3rd Qu.:76.00  
 Max.   :99.00   Max.   :48.000   Max.   :99.00
```

Dataset ชุดนี้มีข้อมูลทั้งหมด 603 แถว และมีตัวแปร 15 ตัว ดังนี้
1. `ID` คือ ลำดับของข้อมูล มีค่าตั้งแต่ 1 ถึง 603 มีประเภทเป็น `double`
2. `title` คือ ชื่อของเพลงที่ติดท็อป มีประเภทเป็น `character`
3. `artist` คือ ชื่อศิลปินเจ้าของเพลง มีประเภทเป็น `character`
4. `top genre` คือ ประเภทของเพลง มีประเภทเป็น `character`
5. `year` คือ ปีที่เพลงติดท็อปบน Spoity
6. `bpm` คือ ความเร็วของเพลง มีหน่วยเป็นจังหวะต่อนาที (BPM หรือ Beats Per Minute) พบค่าตั้งแต่ 0 จนถึง 220 มีประเภทเป็น `double`
7. `nrgy` คือ พลังงานของเพลง พบค่าตั้งแต่ 0 (น้อย) จนถึง 100 (มาก) (มีค่ามากแสดงว่ามีพลังงานมาก) มีประเภทเป็น `double`
8. `dnce` คือ ความเหมาะสมของเพลงกับการเต้น (โดยอิงจากการผสมผสานขององค์ประกอบทางดนตรี) พบค่าตั้งแต่ 0 (น้อย) จนถึง 100 (มาก) (มีค่ามากแสดงว่าเหมาะกับการเต้นมาก) มีประเภทเป็น `double`
9. `dB` คือ ความดังของเพลง มีหน่วยเป็นเดซิเบล (dB หรือ decibel) พบค่าตั้งแต่ -60 (เบา) จนถึง 0 (ดัง) (มีค่ามากแสดงว่ามีความดังมาก) มีประเภทเป็น `double`
10. `live` คือ ความสดใหม่ของเสียงเพลง พบค่าตั้งแต่ 0 (น้อย) จนถึง 75 (มาก) (มีค่ามากแสดงว่ามีโอกาสเป็นการบันทึกสด (live recording) มาก) มีประเภทเป็น `double`
11. `val` คือ อารมณ์ของเพลง พบค่าตั้งแต่ 0 (ด้านลบ) จนถึง 100 (ด้านบวก) (มีค่ามากแสดงว่าให้อารมณ์ด้านบวกมาก) มีประเภทเป็น `double`
12. `dur` คือ ความยาวเพลง เป็นระยะเวลาของเสียงเพลงดังต่อเนื่องกัน พบค่าตั้งแต่ 120 จนถึง 440 มีหน่วยเป็นวินาที (second) มีประเภทเป็น `double`
13. `acous` คือ ความเป็นอะคูสติก พบค่าตั้งแต่ 0 (น้อย) จนถึง 100 (มาก) (มีค่ามากแสดงว่ามีโอกาสเป็นอะคูสติก (acoustic) มาก) มีประเภทเป็น `double`
14. `spch` คือ ปริมาณเสียงคำพูดที่มีปรากฏ พบค่าตั้งแต่ 0 (น้อย) จนถึง 50 (มาก) (มีค่ามากแสดงว่ามีโอกาสเป็นการบันทึกเสียงพูดโดยเฉพาะมาก เช่น ทอล์กโชว์ หนังสือเสียง เป็นต้น) มีประเภทเป็น `double`
15. `pop` คือ ความนิยมของเพลง พบค่าตั้งแต่ 0 (น้อย) จนถึง 100 (มาก) (มีค่ามากแสดงว่าเป็นที่นิยมมาก) มีประเภทเป็น `double`

โดยเบื้องต้นพบว่า
- ควรเปลี่ยนชื่อคอลัมน์เพื่อความเข้าใจง่ายในการอ่านข้อมูล
- ควรแปลงตอลัมน์ top genre (ประเภทของเพลง) เป็น factor
- มีคอลัมน์ที่มีค่าต่ำสุดเป็น 0 อยู่หลายคอลัมน์ ส่วนใหญ่เป็นคุณลักษณะของเพลง แต่คอลัมน์ที่ไม่ควรจะมีค่าเป็น 0 ได้ คือ
  - bpm หรือ ความเร็วของเพลง ไม่สามารถเป็น 0 ได้
  - pop หรือ ความนิยมของเพลง สำหรับเพลงที่ติดท็อปไม่ควรมีค่าเป็น 0
- dB หรือ ความดังของเพลง -60 dB เป็นไปได้ยาก เพราะถือว่าเบามาก

จึงต้องมีการตรวจสอบว่าความผิดปกติดังกล่าวมาจากข้อมูลชุดใดบ้าง และทำการแก้ไขข้อมูลตามความเหมาะสม


# Step 3 : Data Cleaning and Data Transformation

## 1. Rename columns for readability

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

**Result**
```
[1] FALSE
```

ไม่พบข้อมูลซ้ำใน dataset นี้


## 3. Check for songs with missing data

```r
top10s_spotify %>% filter(BPM == 0 | Popularity == 0)
```

**Result**
```
# A tibble: 5 x 15
   ...1 Title    Artist   Genre   Year   BPM Energy Danceability `Loudness dB` Liveness Valence Duration Acousticness Speechiness Popularity
  <dbl> <chr>    <chr>    <chr>  <dbl> <dbl>  <dbl>        <dbl>         <dbl>    <dbl>   <dbl>    <dbl>        <dbl>       <dbl>      <dbl>
1    51 Hello    Martin ~ big r~  2010   128     98           67            -3       10      45      191            1           3          0
2   139 Blow Me~ P!nk     dance~  2012   114     92           60            -3       25      75      256            0           4          0
3   268 Not a B~ Justin ~ dance~  2014    86     73           59            -6       38      46      266           27           6          0
4   363 L.A.LOV~ Fergie   dance~  2015   202     39           48            -8       26      27      193            2           9          0
5   443 Million~ Adele    briti~  2016     0      0            0           -60        0       0      227            0           0          0
```

พบว่ามีเพลงที่ Popularity เป็น 0 อยู่ทั้งหมด 5 เพลง แต่การตัดข้อมูลชุดนี้ออกไปเลยอาจส่งผลต่อการวิเคราะห์ข้อมูลอื่น ๆ เช่น จำนวนเพลงที่ติดท็อปของศิลปิน เป็นต้น เราจึงเลือกที่จะเก็บไว้ และทำการแทนค่า Popularity ด้วย NA

ส่วนเพลง Million Years Ago ของ Adele ซึ่งมี BPM และคุณลักษณะของเพลงเป็น 0 เกือบทั้งหมด ไม่สามารถบอกได้ว่าค่าไหนสามารถนำไปใช้ได้บ้าง จึงต้องแทนค่าที่เป็น 0 ทุกตัวด้วย NA


## 4. Replace missing values with NA

```r
top10s_spotify <-
  top10s_spotify %>%
  mutate(Popularity = ifelse(Popularity == 0, NA, Popularity))
```

```r
top10s_spotify <-
  top10s_spotify %>%
  mutate(
    across(everything(), ~ ifelse(Title == 'Million Years Ago' & . == 0, NA, .)))
```


## 5. Check loudness in ascending order

ตรวจสอบ Loudness dB ของเพลงอื่น ๆ เพื่อดูความเป็นไปได้ของ -60 dB โดยเรียงจากเบาไปดัง
```r
top10s_spotify %>% select(Title, `Loudness dB`) %>% arrange(`Loudness dB`)
```

**Result**
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


## 6. Replace -60 dB with NA

พบว่าเพลงที่เบาสุดจริง ๆ ควรดังอย่างน้อย -15 dB ขึ้นไป จึงทำการแทนค่า -60 dB ด้วย NA
```r
top10s_spotify <-
  top10s_spotify %>%
  mutate(`Loudness dB` = ifelse(`Loudness dB` == -60, NA, `Loudness dB`))
```


## 7. Convert genre to factor

แนวเพลงเป็นค่าแบบ categorical เราจึงควรแปลงเป็นค่า factor
```r
top10s_spotify <-
  top10s_spotify %>%
  mutate(Genre = as.factor(Genre))
```


# Step 4 : Exploratory Data Analysis

## 1. ศิลปินคนใดที่มีภาพรวมของเพลงที่ติดท็อปเป็นเพลงช้า ให้พลังงานน้อย หรือเหมาะกับการเต้นน้อยที่สุดเป็น 5 อันดับแรก และมีใครบ้าง?

```r
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
```

**Result**
```
# A tibble: 5 x 2
  Artist            Score
  <chr>             <dbl>
1 Passenger          34.5
2 John Legend        35.4
3 A Great Big World  39.4
4 Sleeping At Last   39.4
5 Christina Perri    42.9
```

**Summary**

ศิลปินที่ภาพรวมของเพลงที่ติดท็อปเป็นเพลงช้า ให้พลังงานน้อย หรือเหมาะกับการเต้นน้อยที่สุด คือ Passenger ตามด้วย John Legend, A Great Big World, Sleeping At Last และ Christina Perri


## 2. ในช่วงปี 2010 - 2019 ศิลปินคนใดที่มีเพลงติดท็อปมากที่สุดเป็น 5 อันดับแรก และแต่ละคนนับได้กี่เพลง?

```r
top10s_spotify %>%
  group_by(Artist) %>%
  summarise(count_song = n()) %>%
  arrange(desc(count_song)) %>%
  head(5)
```

**Result**
```
# A tibble: 5 x 2
  Artist        count_song
  <chr>              <int>
1 Katy Perry            17
2 Justin Bieber         16
3 Maroon 5              15
4 Rihanna               15
5 Lady Gaga             14
```

**Summary**

ในช่วงปี 2010 - 2019 
ศิลปินที่มีเพลงติดท็อปมากที่สุดเป็นอันดับที่หนึ่ง คือ Katy Perry ที่มีจำนวนเพลงติดท็อปรวม 17 เพลง
อันดับที่สอง คือ Justin Bieber ที่มีจำนวนเพลงติดท็อปรวม 16 เพลง
อันดับที่สามร่วมกัน คือ Maroon 5 และ Rihanna ที่ต่างมีจำนวนเพลงติดท็อปรวม 15 เพลงเท่ากัน
และอันดับที่ห้า คือ Lady Gaga ที่มีจำนวนเพลงติดท็อปรวม 14 เพลง


## 3. ศิลปินคนใดที่มีเพลงติดท็อปติดต่อกันหลายปีที่สุด และติดต่อกันกี่ปี?

```r
top10s_spotify %>%
  group_by(Artist) %>%
  distinct(Year) %>%
  arrange(Year) %>%
  mutate(ConsecutiveYear = c(1, diff(Year)) %>% rle() %>% with(max(lengths[values == 1]))) %>%
  arrange(desc(ConsecutiveYear), Artist) %>%
  distinct(ConsecutiveYear)
```

**Result**
```
# A tibble: 184 x 2
# Groups:   Artist [184]
   Artist         ConsecutiveYear
   <chr>                    <int>
 1 Katy Perry                   8
 2 Calvin Harris                7
 3 Ariana Grande                6
 4 David Guetta                 6
 5 Jennifer Lopez               6
 6 Maroon 5                     6
 7 Pitbull                      5
 8 Shawn Mendes                 5
 9 Zedd                         5
10 Demi Lovato                  4
# ... with 174 more rows
```

**Summary**

Katy Perry เป็นศิลปินที่มีเพลงติดท็อปติดต่อกันหลายปีที่สุด และติดต่อกันเป็นเวลา 8 ปี รองลงมาคือ Calvin Harris และ Ariana Grande ด้วยระยะเวลา 7 ปี และ 6 ปี ตามลำดับ


## 4. เพลงที่มี BPM ไม่เกิน 100 BPM ที่เป็นที่นิยมในปี 2019?

```r
top10s_spotify %>% filter(Year == "2019", BPM < 100) %>% select(Title, Artist, BPM)
```

**Result**
```
# A tibble: 10 x 3
   Title                                                Artist           BPM
   <chr>                                                <chr>          <dbl>
 1 Memories                                             Maroon 5          91
 2 South of the Border (feat. Camila Cabello & Cardi B) Ed Sheeran        98
 3 Good as Hell (feat. Ariana Grande) - Remix           Lizzo             96
 4 Only Human                                           Jonas Brothers    94
 5 Beautiful People (feat. Khalid)                      Ed Sheeran        93
 6 Don't Call Me Up                                     Mabel             99
 7 No Guidance (feat. Drake)                            Chris Brown       93
 8 Taki Taki (feat. Selena Gomez, Ozuna & Cardi B)      DJ Snake          96
 9 Con Calma - Remix                                    Daddy Yankee      94
10 Cross Me (feat. Chance the Rapper & PnB Rock)        Ed Sheeran        95
```

**Summary**

เพลงที่มี BPM ไม่เกิน 100 BPM ที่เป็นที่นิยมในปี 2019 มีทั้งหมด 10 เพลง


## 5. ปีใดที่ The Weeknd มีเพลงติดท็อปมากที่สุด เพลงอะไรบ้าง?

```r
top10s_spotify %>%
  filter(Artist == "The Weeknd") %>%
  group_by(Year) %>%
  mutate(Count = n()) %>%
  ungroup() %>%
  filter(Count == max(Count)) %>%
  select(Title, Year)
```

**Result**
```
# A tibble: 4 x 2
  Title                                                                              Year
  <chr>                                                                             <dbl>
1 "The Hills"                                                                        2015
2 "Earned It (Fifty Shades Of Grey) - From The \"Fifty Shades Of Grey\" Soundtrack"  2015
3 "Starboy"                                                                          2017
4 "I Feel It Coming"                                                                 2017
```

**Summary**

The Weeknd มีเพลงติดท็อปมากที่สุดในปี 2015 และ 2017 ปีละ 2 เพลง ดังนี้
- 2015
  - The Hills
  - Earned It (Fifty Shades Of Grey) - From The "Fifty Shades Of Grey" Soundtrack
- 2017
  - Starboy
  - I Feel It Coming


## 6. แนวเพลงที่ได้รับความนิยมมากที่สุดในแต่ละปี มีอะไรบ้าง?

```r
top10s_spotify %>%
  group_by(Year, Genre) %>%
  summarise(Count = n()) %>%
  arrange(Year, desc(Count)) %>%
  slice(1)
```

**Result**
```
# A tibble: 10 x 3
# Groups:   Year [10]
    Year Genre     Count
   <dbl> <fct>     <int>
 1  2010 dance pop    31
 2  2011 dance pop    38
 3  2012 dance pop    15
 4  2013 dance pop    42
 5  2014 dance pop    27
 6  2015 dance pop    52
 7  2016 dance pop    46
 8  2017 dance pop    31
 9  2018 dance pop    38
10  2019 pop           9
```

**Summary**
- ปี 2010 ถึง 2018 - **Dance pop** เป็นแนวเพลงที่ได้รับความนิยมมากที่สุด
- ปี 2019 - **Pop** เป็นแนวเพลงที่ได้รับความนิยมมากที่สุด


## 7. ปีใดที่มีความหลากหลายของอารมณ์เพลงมากที่สุด?

```r
top10s_spotify %>%
  group_by(Year) %>%
  summarise(ValenceVariation = sd(Valence, na.rm = T)) %>%
  arrange(desc(ValenceVariation))
```

**Result**
```
# A tibble: 10 x 2
    Year ValenceVariation
   <dbl>            <dbl>
 1  2014             25.1
 2  2015             24.6
 3  2019             22.7
 4  2010             22.0
 5  2018             21.8
 6  2017             21.7
 7  2013             21.2
 8  2011             20.8
 9  2016             20.6
10  2012             19.0
```

**Summary**

ปี 2014 เป็นปีที่มีความหลากหลายของอารมณ์เพลงระหว่าง เพลงที่ให้ความรู้สึกด้านบวกและเพลงที่ให้ความรู้สึกด้านลบมากที่สุด รองลงมาคือปี 2015 และ 2019 ตามลำดับ


## 8. ความยาวของเพลงที่ติดท็อปในแต่ละปี มีแนวโน้มเพิ่มขึ้นหรือลดลง อย่างไร?

```r
cor(top10s_spotify$Year, top10s_spotify$Duration)
```

**Result**
```
[1] -0.2153436
```

> ค่าที่ได้จากการหา correlation coefficient จะอยู่ระหว่าง -1 และ 1 โดย
> - -1 คือ ค่าทั้งสองตัวแปรไปคนละทางอย่างสิ้นเชิง
> - 1 คือ ค่าทั้งสองตัวแปรเป็นไปในทางเดียวกัน

**Summary**

ความยาวของเพลงที่ติดท็อปมีแนวโน้มที่จะลดลงเมื่อเวลาผ่านไปเรื่อย ๆ โดยมีความสัมพันธ์ในทางลบอยู่ในระดับที่เบา
