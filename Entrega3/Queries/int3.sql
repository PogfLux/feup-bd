.mode columns
.headers on
.nullvalue NULL

DROP view IF EXISTS numberOfViews;
CREATE view numberOfViews AS 
SELECT songID, sum(numberPlays) AS 'totalViews'
FROM PlaysSong GROUP BY songID;

-- select all the songs inside a playlist ordered by their
-- number of overall plays. For this example, we selected playlist
-- with ID = 1


SELECT Playlist.name AS 'Playlist Name',
	   Song.name AS 'Song Name',
       numberOfViews.totalViews AS 'Views'
FROM PlaylistSongPosition
    JOIN Playlist ON PlaylistSongPosition.playlistID = Playlist.playlistID
    JOIN Song ON PlaylistSongPosition.songID = Song.songID
    JOIN numberOfViews ON PlaylistSongPosition.songID = numberOfViews.songID
WHERE Playlist.playlistID = 1 
ORDER BY totalViews DESC;
