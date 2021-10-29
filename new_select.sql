SELECT name, COUNT(id) FROM genre as g
	JOIN genresinger as gs ON g.id = gs.genre_id
	GROUP BY name
	ORDER BY COUNT(id);
	
SELECT COUNT(name) FROM track
    LEFT JOIN album ON track.album_id = album.id
    WHERE year_of_issue BETWEEN 2018 AND 2021;

SELECT album_name,AVG(length) FROM track
    LEFT JOIN album ON track.album_id = album.id
    GROUP BY album_name
    ORDER BY AVG(length);

SELECT name FROM singer
    LEFT JOIN singeralbum ON singer.id = singeralbum.singer_id
    LEFT JOIN album ON album.id = singeralbum.album_id
    WHERE year_of_issue != 2020;

SELECT collection.name FROM collection
    JOIN trackcollection ON collection.id = trackcollection.collection_id
    JOIN track ON track.id = trackcollection.track_id
    JOIN album ON album.id = track.album_id
    JOIN singeralbum ON album.id = singeralbum.album_id
    JOIN singer ON singer.id = singeralbum.singer_id
    WHERE alias LIKE 'Korzh' ;
    
SELECT album.album_name FROM album
    JOIN singeralbum ON album.id = singeralbum.album_id
    JOIN singer ON singer.id = singeralbum.singer_id
    JOIN genresinger ON singer.id = genresinger.singer_id
    JOIN genre ON genre.id = genresinger.genre_id 
    GROUP by album.album_name
    HAVING COUNT(distinct genre.name) > 1;

SELECT track.name FROM track
    LEFT JOIN trackcollection ON track.id = trackcollection.track_id
    WHERE trackcollection.track_id = null ;

SELECT singer.alias, track.length FROM singer
    JOIN singeralbum ON singer.id = singeralbum.singer_id
    JOIN album ON album.id = singeralbum.album_id
    JOIN track ON track.album_id = album.id
    GROUP BY track.length, singer.alias
    HAVING track.length = (SELECT MIN(length) FROM track);

SELECT album.album_name FROM album
	JOIN track ON album.id = track.album_id
	WHERE track.album_id = (
		SELECT album_id FROM track
		GROUP BY album_id
		HAVING count(id) = (
			SELECT count(id) FROM track
			GROUP BY album_id
			ORDER BY COUNT
			LIMIT 1));




