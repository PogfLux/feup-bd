.mode columns
.header ON
.nullvalue NULL

.print ''
.print 'Checking for length of existent playlist'
.print ''

SELECT Playlist.length, Playlist.numSongs FROM Playlist WHERE playlistID = 2;

.print ''
.print 'Inserting song into playlist with ID = 2'
.print ''

INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(2, 1, 6);

.print ''
.print 'Verifying that it has updated the length of the playlist upon adding a song to it'
.print ''

SELECT Playlist.length, Playlist.numSongs FROM Playlist WHERE playlistID = 2;

.print ''
.print 'Deleting song from playlist with ID = 2'
.print ''

DELETE FROM PlaylistSongPosition WHERE playlistID = 2 AND songID = 1;

.print ''
.print 'Verifying that it has updated the length of the playlist upon adding a song to it'
.print ''

SELECT Playlist.length, Playlist.numSongs FROM Playlist WHERE playlistID = 2;