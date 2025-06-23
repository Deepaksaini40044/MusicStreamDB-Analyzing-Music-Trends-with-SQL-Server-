select  name from sys.databases

use pizza
SELECT * FROM  Dbo.datasets_csv

---question 1  list all track by gorillaz

select artist,track 
from datasets_csv
where artist='gorillaz'

---question2   Display the top 10 tracks with the highest views

select  top 10
track,views 
from datasets_csv
order by views desc

-----question 3   show all albums of type 'single'

select * from datasets_csv
where Album_type='single'


-----question 4    List distinct values in the album_type column.

select 
distinct(Album_type) 
from datasets_csv

---question 5  Find all tracks that contain 'love' in the title

select * 
from datasets_csv
where Title like '%love%'

---question 6 List channels that start with the letter 'S'.

select Distinct(channel)
from datasets_csv
where Channel like 'S%';

---question 7 show all track titles that end with (official video)

select  track,title from datasets_csv
where Title like '%official_video'

---question 8  find the average, minimum and ,maximum energy of all tracks

select 
AVG(TRY_CAST(Energy AS FLOAT)) as avg_energy,
min(TRY_CAST(energy as float )) as min_energy,
max(TRY_CAST(energy AS FLOAT)) as max_energy

from datasets_csv


---question 9 how many tracks have a Licensed value of 'TRUE'.

select count(*)
from datasets_csv
where Licensed ='TRUE'

---question 10 what is the total number of views for all tracks by 'Coldplay'


select
sum(try_cast(views as float)) as	Total_views
from datasets_csv
where Artist='coldplay'

---question 11 find the number of unique artist in the dataset


 select 
 count(distinct(Artist)) as Unique_artist
 from datasets_csv

 ---question 12 calculate the average like per channel.


 select channel,
 avg(try_cast(likes as float))  as avg_likes
 from datasets_csv
 group by Channel

 ---question 13 show tracks where the danceability is greater than 0.8 and energy is above 0.7.

 select 
 Track,
 danceability,
 Energy 
 from datasets_csv
 where
 try_cast(danceability as float)>0.8 
 and 
 try_cast(Energy as float)>0.7

 ---question 14 List the track with acousticness
 --greater than 0.5 and instrumentalness less than 0.1.

 select
 track,Artist,
 acousticness,
 instrumentalness
 from datasets_csv
 where try_cast(acousticness as float)>0.5 
 and 
 try_cast(instrumentalness as float)<0.1

  ---question  15 find all track where the official_video is 'False' 
  --but have more then 1 million views.

  with cte1 as(
  select * from datasets_csv
  where try_cast(Views as float)>1000000)
  
  select 
  track,
  official_video,
  Views  from cte1
  where official_video='False'
  
---question 16 find all track where the most_playedon is 'Spotify'
--and views are above average views



select 
track,
Views,
most_playedon from datasets_csv 
where
try_cast(views as BIGINT)>
(select avg(try_cast(views as BIGINT))
from datasets_csv)
and most_playedon='Spotify'

---question 17 group by album_types and count the number of tracks in each types

select 
album_type,
count(*)  from datasets_csv
group by album_type

---question 18 find the top 5 artists with the highest average number of streams.

select top 5 
Artist,
avg(try_cast(stream as float))  as avg_stream
from datasets_csv
group by Artist 
order by avg_stream desc

---qustion 19   group by artist and show the total number of views
---for each,only for those with more than 5 tracks.

select artist,count(*) as track_count,sum(try_cast(views as float)) as Total_shows from datasets_csv
group by Artist
having count(*)>5


---question 20  find the average duration of tracks uploaded on youtube


select
avg(try_cast(Duration_min as float)) as avg_duration
from datasets_csv
 where
 most_playedon ='youtube'   

 