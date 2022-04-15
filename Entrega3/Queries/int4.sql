.mode columns
.headers on
.nullvalue NULL

-- Select all songs by an artist inside all of their own albums

SELECT Profile.name AS 'Artist Name',
		  Song.name AS 'Song Name'
FROM ReleasesAlbum
	JOIN AlbumSongPosition ON ReleasesAlbum.albumID = AlbumSongPosition.albumID
    JOIN Song ON AlbumSongPosition.songID = Song.songID
    JOIN Artist ON ReleasesAlbum.artistID = Artist.profileID
    JOIN Profile ON Artist.profileID = Profile.id
WHERE artistID = 4;