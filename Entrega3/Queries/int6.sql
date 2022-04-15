.mode columns
.headers on
.nullvalue NULL

-- Select the number of songs in each album as well as their album type

SELECT Album.name AS 'Album',
    AlbumType.type AS 'Type of album',
    Album.numSongs AS 'Number of Songs'
FROM
    Album
    JOIN AlbumToAlbumType ON AlbumToAlbumType.albumID == Album.albumID
    JOIN AlbumType ON AlbumType.albumTypeID == AlbumToAlbumType.albumTypeID
ORDER BY Album.numSongs ASC;