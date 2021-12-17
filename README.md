# 012-Top-Spotify-Songs
Dataset from: [Top Spotify songs from 2010-2019](https://github.com/sit-2021-int214/012-Spotify-Charts/blob/main/top10s-spotify-original.csv)

## About's Top Spotify Songs Dataset
The Top Spotify Songs from 2010-2019 were stracted from http://organizeyourmusic.playlistmachinery.com/. This dataset about's the top Spotify songs during 2010-2019 that all of them are based on Billboard, and each song has 1 variable for ID and 14 specific variables that are included and displayed on **Contents** part below. 


### Contents
1. `ID`
2. `Title` Song's title
3. `Artist` Song's artist
4. `Top genre` The genre of the track
5. `Year` Song's year in the Billboard
6. `bmp` Beats Per Minute - The tempo of the song
7. `nrgy` Energy - The energy of a song - the higher the value, the more energtic song
8. `dnce` Danceability - The higher the value, the easier it is to dance to this song
9. `dB` Loudness dB - The higher the value, the louder the song
10. `live` Liveness - The higher the value, the more likely the song is a live recording
11. `val` Valence - The higher the value, the more positive mood for the song
12. `dur` Length - The duration of the song
13. `acous`  Acousticness - The higher the value the more acoustic the song is
14. `spch` Speechiness - The higher the value the more spoken word the song contains
15. `pop` Popularity - The higher the value the more popular the song is

## Overview
เป็นการวิเคราะห์ข้อมูลเชิงสถิติเกี่ยวกับรายการเพลงยอดนิยมบน Spotify ศิลปินเจ้าของเพลง ประเภทของเพลง ลักษณะเสียงของเพลง และอื่นๆ โดยได้นำเข้าชุดข้อมูลดังกล่าวมาจากแหล่งรวมชุดข้อมูลบนอินเทอร์เน็ต (Kaggle) ตามที่ปรากฏในแหล่งอ้างอิง นำมาทำความสะอาดและวิเคราะห์โดยใช้ภาษา R เพื่อหาความสัมพันธ์ระหว่างแต่ละข้อมูล

### Steps

1. Define the questions
2. Explore data from original dataset
3. Data Cleaning and Data Transformation
4. Exploratory Data Analysis
5. Data Visualization
6. Analytical Inferential Statistics

### Tools

- R Language
- R Studio Desktop
- Power BI

## Table of Contents

- [Exploratory Data Analysis](https://github.com/sit-2021-int214/012-Spotify-Charts/blob/main/01-EDA.md)
- [Analytical Inferential Statistics](https://github.com/sit-2021-int214/012-Top-Spotify-Songs/blob/main/02-AIS.md)
- [Data Visualization](https://app.powerbi.com/view?r=eyJrIjoiMTQ4N2JjNDgtNmZhNy00NDEzLWFjYTktMTU5YmM3YzJkNjczIiwidCI6IjZmNDQzMmRjLTIwZDItNDQxZC1iMWRiLWFjMzM4MGJhNjMzZCIsImMiOjEwfQ%3D%3D)

## Resources

### Important Files in Repository
- [code-eda.R](./code-eda.R): Exploratory Data Analysis
- [top10s-spotify-original.csv](./top10s-spotify-original.csv): Original Dataset
- [top10s-spotify-cleaned.csv](https://raw.githubusercontent.com/sit-2021-int214/012-Top-Spotify-Songs/main/top10s-spotify-cleaned.csv): Cleaned Dataset

### References
- [Top Spotify songs from 2010-2019 - BY YEAR](https://www.kaggle.com/leonardopena/top-spotify-songs-from-20102019-by-year)
- [Is my Spotify music boring? An analysis involving music, data, and machine learning](https://towardsdatascience.com/is-my-spotify-music-boring-an-analysis-involving-music-data-and-machine-learning-47550ae931de)
- [ifelse: Conditional Element Selection](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/ifelse)
- [Apply a function (or functions) across multiple columns](https://dplyr.tidyverse.org/reference/across.html)
- [R - count maximum number of consecutive dates](https://stackoverflow.com/a/53713204)
- [Music 101: What Is Tempo? How Is Tempo Used in Music?](https://www.masterclass.com/articles/music-101-what-is-tempo-how-is-tempo-used-in-music#what-is-tempo)
- [Effects of Musical Tempo on Musicians’ and Non-musicians’ Emotional Experience When Listening to Music](https://www.frontiersin.org/articles/10.3389/fpsyg.2018.02118/full)



## About Us
งานนี้เป็นส่วนของวิชา INT214 Statistics for Information technology <br/> ภาคเรียนที่ 1 ปีการศึกษา 2564 คณะเทคโนโลยีสารสนเทศ <br/> มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี
### Team: Stat bros
| No. | Name              | Student ID   |
|:---:|-------------------|--------------|
|  1  | นาย ชินวัฒน์ แก้วหนองสังข์      | 63130500022  |
|  2  | นางสาว ณัฏฐ์นรี สีไสว   | 63130500030  |
|  3  | นาย ณัฐชนน อัศวชิน   | 63130500032 |
|  4  | นาย ตะวัน หมวดหมื่นไวย์   | 63130500041 |
|  5  | นาย ธราดล แสนมาตร   | 63130500054 |
### Instructor
- ATCHARA TRAN-U-RAIKUL
- JATAWAT XIE (Git: [safesit23](https://github.com/safesit23))



