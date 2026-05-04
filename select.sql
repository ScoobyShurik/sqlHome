select name, duration 
from track 
where duration = (select max(duration) from track)

select name, duration 
from track 
where duration >= '00:03:30'

select name 
from collection 
where "year" between 2018 and 2020

select name
from singers 
where name not like '% %'

SELECT name 
FROM track 
WHERE LOWER(name) ~ '\y(my|мой)\y';


select j.name as jenre, count(js.singer) as singer_count
from jenre j 
join jenres_singers js on js.jenre = j.id
group by j.name
order by singer_count desc


select 
    COUNT(t.id) as tracks_count
from track t
join album a on t.album  = a.id
where a.year between 2019 and 2020;


select 
    a.name as album,
    a.year as year,
    AVG(t.duration) as avg_duration
from album a
join track t on a.id = t.album 
GROUP BY a.name, a.year
ORDER BY avg_duration desc;

select 
    s.name as artist
from singers s 
where s.id not in (
    select distinct s2.id
    from singers s2
    join album_singer as1 on s2.id = as1.singer 
    join album al on as1.album  = al.id
    where al.year = 2020
)
ORDER BY s.name;


select distinct 
    c.name as compilation
from collection c
join track_collection tc on c.id = tc.collection 
join track t on tc.track = t.id
join album a on t.album = a.id
join album_singer as2 on a.id = as2.album
join singers s on as2.singer = s.id
where s.name = 'Queen';
