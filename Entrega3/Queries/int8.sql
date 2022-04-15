.mode columns
.headers on
.nullvalue NULL

-- Select playlists based on how many people saved said playlist

SELECT 
    Playlist.name AS 'Playlist',
    COUNT(SavesPlaylist.userID) AS 'Num. of saves'
FROM
    SavesPlaylist
    JOIN Playlist ON SavesPlaylist.playlistID == Playlist.playlistID
GROUP BY SavesPlaylist.playlistID;    