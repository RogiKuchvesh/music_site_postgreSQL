INSERT INTO performers (name_performer)
values('Kino'),
('Alisa'),
('Piknik'),
('Alla Pugacheva'),
('Beethoven'),
('Bach'),
('Fil Kirkorov'),
('Chaykovskiy');

INSERT INTO ganres (name_ganre)
values('classic'),
('rock'),
('pop'),
('disco'),
('hip_hop');

INSERT INTO GenresPerformers (ganre_id, performer_id) 
VALUES (1, 5),
(1, 6),
(1, 8),
(2, 1),
(2, 2),
(2, 3),
(3, 4),
(3, 7),
(3, 2);

INSERT INTO Albums (name_album , year_release_album)
VALUES ('Its no love', 1985),
('Circus', 2018),
('Smoke', 1982),
('Alla', 1990),
('music_Beethoven', 1803),
('music_Classic', 1749),
('Filipp', 1990),
('Opera', 1869),
('New_album', 2019),
('Another_album', 2020);

INSERT INTO PerformersAlbums (performer_id, album_id) 
VALUES (1, 1),
(2, 2),
(3, 3),
(3, 9),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(7, 10),
(8, 8);

INSERT INTO Songs (name_song, duration_song, album_id) 
VALUES ('Spring', 120, 1),
('Its no love', 208, 1),
('Sasha', 196, 1),
('Music', 234, 2),
('Shance', 448, 2),
('Evening', 313, 3),
('Night', 418, 3),
('Three_happy_days', 340, 4),
('Old friend', 308, 4),
('Simphony_2', 287, 5),
('Messa_si_minor', 342, 6),
('Hobby', 204, 7),
('Snow', 275, 7),
('Undina', 1246, 8),
('Voevoda', 1586, 8),
('New_song', 327, 9),
('Another_song', 553, 10);

INSERT INTO Collections (name_collection , year_collection)
VALUES ('Songs_Kino', 2019),
('Best_of_Alica', 2018),
('Russian_Rock', 2000),
('Happy_New_Year', 1990),
('Best_of_Beethoven', 2003),
('Best_of_Classic', 1999),
('Russian_Pop', 2009),
('Best_of_Ilyich', 2020);

INSERT INTO CollectionsSongs (song_id, collection_id) 
VALUES (1, 1),
(2, 1),
(3, 3),
(4, 2),
(5, 3),
(6, 3),
(7, 3),
(8, 4),
(9, 7),
(10, 5),
(11, 5),
(12, 4),
(13, 7),
(14, 6),
(15, 8);
