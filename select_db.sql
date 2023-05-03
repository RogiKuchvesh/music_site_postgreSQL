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

-- количество исполнителей в каждом жанре
SELECT name_ganre, count(*) FROM genres g
JOIN genresperformers gp ON g.ganre_id = gp.ganre_id
GROUP BY name_ganre
ORDER BY name_ganre;

-- количество треков, вошедших в альбомы 2019–2020 годов (объединением таблиц)
SELECT COUNT(song_id) FROM songs s
JOIN albums a ON a.album_id = s.album_id
WHERE year_release_album BETWEEN 2019 AND 2020;

-- общее количество треков, вошедших в альбомы 2019–2020 годов (вложенными запросами)
SELECT COUNT(*) 
FROM songs 
WHERE album_id IN (SELECT album_id 
                   FROM albums 
                   WHERE year_release_album BETWEEN 2019 AND 2020);

-- средняя продолжительность треков по каждому альбому без названия альбомов
SELECT AVG(duration_song) FROM songs s
GROUP BY album_id
ORDER BY album_id;

-- средняя продолжительность треков по каждому альбому с названиями альбомов (порядок - по средней продолжительности)
SELECT a.name_album, AVG(duration_song) FROM songs s
JOIN albums a ON a.album_id = s.album_id
GROUP BY a.album_id
ORDER BY AVG(duration_song);

-- все исполнители, которые не выпустили альбомы в 2020 году (вложенными запросами)
SELECT name_performer 
FROM performers p  
WHERE performer_id NOT IN (SELECT performer_id 
				FROM performersalbums pa
				WHERE album_id IN (SELECT album_id 
							FROM albums
							WHERE year_release_album = 2020));
						
-- все исполнители, которые не выпустили альбомы в 2020 году (объединеним таблиц)
SELECT name_performer
FROM performers p
WHERE performer_id NOT IN (
    SELECT performer_id FROM performersalbums pa
    JOIN albums a ON a.album_id = pa.album_id
    WHERE year_release_album = 2020);

-- названия сборников, в которых присутствует конкретный исполнитель
SELECT DISTINCT name_collection FROM collections c
JOIN collectionssongs cs ON c.collection_id = cs.collection_id
JOIN songs s ON cs.song_id = s.song_id
JOIN albums a ON s.album_id = a.album_id
JOIN performersalbums pa ON a.album_id = pa.album_id
JOIN performers p ON pa.performer_id = p.performer_id
WHERE name_performer = 'Kino';

-- названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT name_album
FROM albums a
JOIN performersalbums pa ON a.album_id = pa.album_id
JOIN genresperformers gp ON pa.performer_id = gp.performer_id
GROUP BY a.album_id, gp.performer_id
HAVING COUNT(gp.ganre_id) > 1;


-- наименования треков, которые не входят в сборники
SELECT DISTINCT name_song FROM songs s
WHERE name_song NOT IN (SELECT DISTINCT name_song FROM songs s
JOIN collectionssongs cs ON s.song_id = cs.song_id);

-- исполнитель или исполнители, написавшие самый короткий по продолжительности трек, 
-- теоретически таких треков может быть несколько
SELECT name_performer, MIN(duration_song) FROM performers p
JOIN performersalbums pa ON pa.performer_id = p.performer_id
JOIN albums a ON a.album_id = pa.album_id
JOIN songs s ON s.album_id = a.album_id
WHERE s.duration_song = (SELECT MIN(duration_song) FROM songs)
GROUP BY name_performer, duration_song;

-- названия альбомов, содержащих наименьшее количество треков (вложенными запросами)
SELECT DISTINCT name_album FROM albums a
WHERE a.album_id IN (SELECT album_id FROM songs
					GROUP BY album_id
					HAVING COUNT(*) = (SELECT MIN(cnt) FROM 
												(SELECT COUNT(*) AS cnt 
															FROM songs 
															GROUP BY album_id) AS c));

-- названия альбомов, содержащих наименьшее количество треков (объединением таблиц)															
SELECT name_album
FROM albums a JOIN songs s ON a.album_id = s.album_id
GROUP BY a.album_id
HAVING COUNT(song_id) = (
    SELECT COUNT(song_id) FROM songs s
    GROUP BY s.album_id
    ORDER BY 1
    LIMIT 1);