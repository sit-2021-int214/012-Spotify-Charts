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
library(...)
```
Load the data
```r
top10s_spotify <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/012-Spotify-Charts/main/top10s-spotify-original.csv")
```


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
1. `ID` คือ ลำดับของข้อมูล มีค่าตั้งแต่ 1 ถึง 603 มีประเภทเป็น `double`
2. `Title` คือ ชื่อของเพลงที่ติดท็อป มีประเภทเป็น `character`
3. `Artist` คือ ชื่อศิลปินเจ้าของเพลง มีประเภทเป็น `character`
4. `Top genre` คือ ประเภทของเพลง มีประเภทเป็น `character`
5. `Year` คือ ปีที่เพลงติดท็อปบน Spoity
6. `bmp` คือ ความเร็วของเพลง (มีหน่วยเป็นจังหวะต่อนาที (BPM หรือ Beats Per Minute)) พบค่าตั้งแต่ 0 จนถึง 220 มีประเภทเป็น `double`
7. `nrgy` คือ พลังงานของเพลง - (มีค่ามากแสดงว่ามีพลังงานมาก) มีค่าตั้งแต่ 0 (น้อย) จนถึง 100 (มาก) มีประเภทเป็น `double`
8. `dnce` คือ ความเหมาะสมของเพลงกับการเต้น(โดยอิงจากการผสมผสานขององค์ประกอบทางดนตรี) มีค่าตั้งแต่ 0 (น้อย) จนถึง 100 (มาก) (มีค่ามากแสดงว่าเหมาะกับการเต้นมาก) มีประเภทเป็น `double`
9. `dB` คือ ความดังของเพลง มีหน่วยเป็นเดซิเบล (dB) มีค่าตั้งแต่ -60 (เบา) จนถึง 0 (ดัง) (มีค่ามากแสดงว่ามีความดังมาก) มีประเภทเป็น `double`
10. `live` คือ ความสดใหม่ของเสียงเพลง - มีค่าตั้งแต่ 0 (น้อย) จนถึง 75 (มาก) (มีค่ามากแสดงว่ามีโอกาสเป็นการบันทึกสด (live recording) มาก) มีประเภทเป็น `double`
11. `val` คือ อารมณ์ของเพลง - มีค่าตั้งแต่ 0 (ด้านลบ) จนถึง 100 (ด้านบวก) (มีค่ามากแสดงว่าให้อารมณ์ด้านบวกมาก) มีประเภทเป็น `double`
12. `dur` คือ ความยาวเพลง - ระยะเวลาของเสียงเพลงดังต่อเนื่องกัน พบค่าตั้งแต่ 120 จนถึง 440 มีประเภทเป็น `double`
13. `acous` คือ ความเป็นอะคูสติก - มีค่าตั้งแต่ 0 (น้อย) จนถึง 100 (มาก) (มีค่ามากแสดงว่ามีโอกาสเป็นอะคูสติก (acoustic) มาก) มีประเภทเป็น `double`
14. `spch` คือ ปริมาณเสียงคำพูดที่มีปรากฏ - มีค่าตั้งแต่ 0 (น้อย) จนถึง 50 (มาก) (มีค่ามากแสดงว่ามีโอกาสเป็นการบันทึกเสียงพูดโดยเฉพาะมาก เช่น ทอล์กโชว์ หนังสือเสียง เป็นต้น) มีประเภทเป็น `double`
15. `pop` คือ ความนิยมของเพลง - มีค่าตั้งแต่ 0 (น้อย) จนถึง 100 (มาก) (มีค่ามากแสดงว่าเป็นที่นิยมมาก) มีประเภทเป็น `double`

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

## Step 3 : Cleaning and Transformation data
```r


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

### 2. ในช่วงปี 2010 - 2019 ศิลปินคนใดที่มีเพลงติดท็อปมากที่สุดและมีกี่เพลง?
```r

```

Result
```

```

Summary\
สรุป

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
สรุป

### 5. ในปี 2016 มีเพลงชื่ออะไร ศิลปินชื่ออะไร เป็นเพลงประเภทไหนที่ติดท็อปบ้าง?
```r

```

Result
```

```

Summary\
สรุป
