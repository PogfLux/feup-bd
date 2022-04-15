.mode columns
.headers on
.nullvalue NULL

-- Select all songs that have a particular genre
-- all rock song names as example

SELECT Genre.name AS Genre,
		Song.name AS Song

FROM SongToGenre
	JOIN Genre ON SongToGenre.genreID=genre.genreID
	JOIN Song ON SongToGenre.songid=Song.songID

WHERE Genre.name = 'Rock';