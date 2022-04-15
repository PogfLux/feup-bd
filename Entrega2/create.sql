
--Deletion of already existent tables
DROP TABLE IF EXISTS Profile;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Following;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS FollowsArtist;
DROP TABLE IF EXISTS Playlist;
DROP TABLE IF EXISTS PlaylistSongPosition;
DROP TABLE IF EXISTS CreatesPlaylist;
DROP TABLE IF EXISTS SavesPlaylist;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS SavesSong;
DROP TABLE IF EXISTS PlaysSong;
DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS SongToGenre;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS AlbumSongPosition;
DROP TABLE IF EXISTS ReleasesAlbum;
DROP TABLE IF EXISTS SavesAlbum;
DROP TABLE IF EXISTS AlbumType;
DROP TABLE IF EXISTS AlbumToAlbumType;


--Profile table
CREATE TABLE Profile(
  id                    INTEGER,
  name                  VARCHAR(255) NOT NULL,
  profilePic            TEXT,
  CONSTRAINT profilePK PRIMARY KEY (id)
);

--User table
CREATE TABLE User(
  profileID             INTEGER,
  email                 TEXT NOT NULL,
  password              VARCHAR(255) NOT NULL,
  dateOfBirth           DATE,
  subscriptionPlan      TEXT CHECK (subscriptionPlan LIKE "PREMIUM"),
  CONSTRAINT userPK PRIMARY KEY (profileID),
  CONSTRAINT userFK1 FOREIGN KEY (profileID) REFERENCES Profile(id)
);

--Following table
CREATE TABLE Following(
  userID                INTEGER,
  followedUserID        INTEGER NOT NULL CHECK (followedUserID != userID),
  CONSTRAINT followingPK PRIMARY KEY (userID, followedUserID),
  CONSTRAINT followingFK1 FOREIGN KEY (userID) REFERENCES User(profileID),
  CONSTRAINT followingFK2 FOREIGN KEY (followedUserID) REFERENCES User(profileID)  
);

--Artist table
CREATE TABLE Artist(
  profileID             INTEGER,
  numFollowers          INTEGER NOT NULL,
  numListeners          INTEGER NOT NULL,
  CONSTRAINT artistPK PRIMARY KEY (profileID),
  CONSTRAINT artistFK1 FOREIGN KEY (profileID) REFERENCES Profile(id),
  CONSTRAINT artistFollowersNotNegative CHECK (numFollowers >= 0),
  CONSTRAINT artistListenersNotNegative CHECK (numListeners >= 0)
);

--Users following Artists table
CREATE TABLE FollowsArtist(
  userID              INTEGER,
  artistID            INTEGER NOT NULL CHECK (userID != artistID),
  CONSTRAINT followsArtistPK PRIMARY KEY (userID, artistID),
  CONSTRAINT followsArtistFK1 FOREIGN KEY (userID) REFERENCES User(profileID), 
  CONSTRAINT followsArtistFK2 FOREIGN KEY (artistID) REFERENCES Artist(profileID)
);

--Playlist table
CREATE TABLE Playlist(
  playlistID            INTEGER,
  name                  VARCHAR(255) NOT NULL,
  length                INTEGER DEFAULT 0 NOT NULL,
  numSongs              INTEGER DEFAULT 0 NOT NULL,
  CONSTRAINT playlistPK PRIMARY KEY (playlistID),
  CONSTRAINT lengthLargerZero CHECK (length >= 0),
  CONSTRAINT numSongsNotNegative CHECK (numSongs >= 0)
);

--Playlist's songs table
CREATE TABLE PlaylistSongPosition(
  playlistID             INTEGER REFERENCES Playlist(playlistID),
  songID                 INTEGER REFERENCES Song(songID),
  songPos                INTEGER NOT NULL CHECK (songPos >= 0),
  CONSTRAINT playlistSongPositionPK PRIMARY KEY (playlistID, songID)
);

--User's created Playlists table
CREATE TABLE CreatesPlaylist(
  userID                 INTEGER,
  playlistID             INTEGER NOT NULL,
  CONSTRAINT createsPlaylistPK PRIMARY KEY (playlistID),
  CONSTRAINT createsPlaylistFK1 FOREIGN KEY (userID) REFERENCES User(profileID),
  CONSTRAINT createsPlaylistFK2 FOREIGN KEY (playlistID) REFERENCES Playlist(playlistID)
);

--User's saved Playlists table
CREATE TABLE SavesPlaylist(
  userID                 INTEGER,
  playlistID             INTEGER NOT NULL,
  CONSTRAINT savesPlaylistPK PRIMARY KEY (userID, playlistID),
  CONSTRAINT savesPlaylistFK1 FOREIGN KEY (userID) REFERENCES User(profileID),
  CONSTRAINT savesPlaylistFK2 FOREIGN KEY (playlistID) REFERENCES Playlist(playlistID)
);

--Song table
CREATE TABLE Song(
  songID               INTEGER,
  name                 VARCHAR(255) NOT NULL,
  length               INTEGER DEFAULT 0 NOT NULL,
  CONSTRAINT songPK PRIMARY KEY (songID),
  CONSTRAINT lengthLargerZero CHECK (length >= 0)
);

--User's saved Songs table
CREATE TABLE SavesSong(
  songID               INTEGER REFERENCES Song(songID),
  userID               INTEGER REFERENCES User(profileID),
  CONSTRAINT savesSongPK PRIMARY KEY (songID, userID)
);

--Table for a user playing a song
CREATE TABLE PlaysSong(
  songID               INTEGER REFERENCES Song(songID),
  userID               INTEGER REFERENCES User(profileID),
  numberPlays          INTEGER NOT NULL CHECK (numberPlays > 0),
  CONSTRAINT playsSongPK PRIMARY KEY (songID, userID)
);

--Genre table
CREATE TABLE Genre(
  genreID              INTEGER,
  name                 VARCHAR(255) UNIQUE,
  CONSTRAINT genrePK PRIMARY KEY (genreID)
);

--Song to Genre relation table
CREATE TABLE SongToGenre(
  songID               INTEGER REFERENCES Song(songID),
  genreID              INTEGER REFERENCES Genre(genreID),
  CONSTRAINT songToGenrePK PRIMARY KEY (songID, genreID)
);

--Album table
CREATE TABLE Album(
  albumID              INTEGER,
  name                 VARCHAR(255) NOT NULL,
  length               INTEGER DEFAULT 0 NOT NULL,
  numSongs             INTEGER DEFAULT 0 NOT NULL,
  releaseYear          INTEGER NOT NULL,
  cover                TEXT,
  CONSTRAINT albumPK PRIMARY KEY (albumID),
  CONSTRAINT lengthLargerZero CHECK (length >= 0)
);

--Songs featured in Albums table
CREATE TABLE AlbumSongPosition(
  albumID               INTEGER REFERENCES Album(albumID),
  songID                INTEGER REFERENCES Song(songID),
  songPos               INTEGER DEFAULT 0 CHECK (songPos >= 0),
  CONSTRAINT albumSongPositionPK PRIMARY KEY (albumID, songID, songPos)
);

--Artist's released Albums table
CREATE TABLE ReleasesAlbum(
  artistID              INTEGER REFERENCES Artist(profileID),
  albumID               INTEGER REFERENCES Album(albumID),
  CONSTRAINT releasesAlbumPK PRIMARY KEY (artistID, albumID)
);

--User's saved Albums table
CREATE TABLE SavesAlbum(
  userID               INTEGER REFERENCES User(profileID),
  albumID              INTEGER REFERENCES Album(albumID),
  CONSTRAINT savesAlbumPK PRIMARY KEY (userID, albumID)
);

--Album Type table
CREATE TABLE AlbumType(
  albumTypeID          INTEGER,
  type                 VARCHAR(255) UNIQUE NOT NULL,
  CONSTRAINT albumTypePK PRIMARY KEY (albumTypeID),
  CONSTRAINT validType CHECK (type LIKE "LP" OR type LIKE "EP" OR type LIKE "Single")
);

--Album and respective Type relation table
CREATE TABLE AlbumToAlbumType(
  albumID              INTEGER REFERENCES Album(albumID),
  albumTypeID          INTEGER REFERENCES AlbumType(albumTypeID),
  CONSTRAINT albumToAlbumTypePK PRIMARY KEY (albumID, albumTypeID)
);
