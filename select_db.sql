SELECT name_album , year_release_album FROM Albums
WHERE year_release_album = 2018;

SELECT name_song, duration_song FROM Songs
WHERE duration_song = (SELECT MAX(duration_song) FROM Songs);

SELECT name_song FROM Songs
WHERE duration_song >= 230;

SELECT name_collection FROM Collections
WHERE year_collection BETWEEN 2018 AND 2020;

SELECT name_performer FROM Performers
WHERE split_part(name_performer, ' ', 1) = name_performer;

SELECT name_song FROM Songs
WHERE name_song LIKE '%мой%' OR name_song LIKE '%my%';