insert into singers (name) values 
('The Beatles'),
('Queen'),
('Pink Floyd'),
('David Bowie'),
('Sting'),
('Dua Lipa');

insert into jenre  (name) values 
('Rock'),
('Pop'),
('Progressive Rock');

insert into album  (name, year) values 
('Abbey Road', 1969),
('A Night at the Opera', 1975),
('The Dark Side of the Moon', 1973),
('My Songs', 2019),
('Future Nostalgia', 2020);


insert into track (name, duration, album) values 
('Come Together', '00:04:31', 1),
('Something', '00:03:15', 1),
('Bohemian Rhapsody', '00:05:09', 2),
('You''re My Best Friend', '00:03:06', 2),
('Time', '00:07:08', 3),
('Money', '00:06:36', 3),
('My Soul', '00:04:00', 4),
('Мой день', '00:03:58',4),
('Don''t Start Now', '00:03:05', 5),
('Break My Heart', '00:04:08', 5); 


insert into collection  (name, year) values 
('Greatest Hits I', 1981),
('Rock Legends Vol. 1', 2005),
('70s Classics', 2010),
('British Invasion', 1999),
('Best of 2019', 2019),
('Hits 2020', 2020);

insert into jenres_singers  (singer, jenre) values 
(1, 1), (1, 2),
(2, 1), (2, 2), 
(3, 3), (3, 1), 
(4, 1), (4, 2), 
(5, 1), (5, 2), 
(6, 2);         


insert into album_singer  (singer, album) values 
(1, 1), 
(2, 2),
(3, 3), 
(5, 4), 
(6, 5); 



insert into track_collection  (collection, track) values 
(1, 3), (1, 4),
(2, 1), (2, 5),
(3, 6), (3, 2),
(4, 1), (4, 3),
(5, 7), (5, 9),
(6, 8), (6, 10);

