PRAGMA FOREIGN_KEYS = ON;

--Profile table population
INSERT INTO Profile(id, name, profilePic) VALUES(1, "João Lucas", "https://static.wikia.nocookie.net/sonic/images/2/2d/TSR_Sonic.png/revision/latest?cb=20210916082638");
INSERT INTO Profile(id, name, profilePic) VALUES(2, "José Castro", NULL);
INSERT INTO Profile(id, name, profilePic) VALUES(3, "António Santos", "https://upload.wikimedia.org/wikipedia/pt/b/b5/Capa_de_Loveless.jpg");
INSERT INTO Profile(id, name, profilePic) VALUES(4, "Radiohead", NULL);
INSERT INTO Profile(id, name, profilePic) VALUES(5, "The Strokes", NULL);
INSERT INTO Profile(id, name, profilePic) VALUES(6, "Bjork", NULL);
INSERT INTO Profile(id, name, profilePic) VALUES(7, "Kendrick Lamar", NULL);
INSERT INTO Profile(id, name, profilePic) VALUES(8, "Ornatos Violeta", NULL);


--User table population
INSERT INTO User(profileID, email, password, dateOfBirth, subscriptionPlan) VALUES(1, "joaolucasmendes2000@gmail.com", "abc123", "23-09-2000", "PREMIUM");
INSERT INTO User(profileID, email, password, dateOfBirth, subscriptionPlan) VALUES(2, "zeCastroFanAccount@hotmail.com", "abc124", "06-06-2002", NULL);
INSERT INTO User(profileID, email, password, dateOfBirth, subscriptionPlan) VALUES(3, "toniGaming@gmail.com", "abc126", NULL, NULL);

--Artist table population
INSERT INTO Artist(profileID, numFollowers, numListeners) VALUES(2, 100000, 6062002);
INSERT INTO Artist(profileID, numFollowers, numListeners) VALUES(4, 200000, 9745436);
INSERT INTO Artist(profileID, numFollowers, numListeners) VALUES(5, 300000, 14523876);
INSERT INTO Artist(profileID, numFollowers, numListeners) VALUES(6, 400000, 30196004);
INSERT INTO Artist(profileID, numFollowers, numListeners) VALUES(7, 500000, 1778081);
INSERT INTO Artist(profileID, numFollowers, numListeners) VALUES(8, 16000, 97805);

--Playlist table population
INSERT INTO Playlist(playlistID, name, length, numSongs) VALUES(1, "some songs i like", 2421, 526);
INSERT INTO Playlist(playlistID, name, length, numSongs) VALUES(2, "main character", 221, 55);
INSERT INTO Playlist(playlistID, name, length, numSongs) VALUES(3, "7th heaven jukebox", 144, 39);
INSERT INTO Playlist(playlistID, name, length, numSongs) VALUES(4, "jrpg+ ost to study to", 190, 47);
INSERT INTO Playlist(playlistID, name, length, numSongs) VALUES(5, "Hip-hop playlist", 1080, 200);
INSERT INTO Playlist(playlistID, name, length, numSongs) VALUES(6, "Rock playlist", 720, 100);

--Album table population
INSERT INTO Album(albumID, name, length, numSongs, releaseYear, cover) VALUES(1, "In Rainbows", 2558, 10, 2007, "https://upload.wikimedia.org/wikipedia/pt/9/96/Radiohead_-_In_Rainbows.jpg");
INSERT INTO Album(albumID, name, length, numSongs, releaseYear, cover) VALUES(2, "To Pimp a Butterly", 4680, 18, 2015, NULL);
INSERT INTO Album(albumID, name, length, numSongs, releaseYear, cover) VALUES(3, "O Monstro Precisa de Amigos", 2998, 13, 1999, NULL);
INSERT INTO Album(albumID, name, length, numSongs, releaseYear, cover) VALUES(4, "Hidden Place (Vol.1)", 774, 3, 2001, NULL);
INSERT INTO Album(albumID, name, length, numSongs, releaseYear, cover) VALUES(5, "Soma", 196, 1, 2001, NULL);


--Song table population
INSERT INTO Song(songID, name, length) VALUES(1, "Jigsaw Falling Into Place", 333);
INSERT INTO Song(songID, name, length) VALUES(2, "Nude", 255);
INSERT INTO Song(songID, name, length) VALUES(3, "For Free?", 130);
INSERT INTO Song(songID, name, length) VALUES(4, "How Much a Dollar Cost?", 261);
INSERT INTO Song(songID, name, length) VALUES(5, "Chaga", 182);
INSERT INTO Song(songID, name, length) VALUES(6, "Coisas", 355);
INSERT INTO Song(songID, name, length) VALUES(7, "Hidden Place", 290);
INSERT INTO Song(songID, name, length) VALUES(8, "Soma", 220);


--Genre table population
INSERT INTO Genre(genreID, name) VALUES(1, "Rock");
INSERT INTO Genre(genreID, name) VALUES(2, "Hip-Hop");
INSERT INTO Genre(genreID, name) VALUES(3, "Metal");
INSERT INTO Genre(genreID, name) VALUES(4, "Pop");
INSERT INTO Genre(genreID, name) VALUES(5, "Alternative");
INSERT INTO Genre(genreID, name) VALUES(6, "Jazz");
INSERT INTO Genre(genreID, name) VALUES(7, "Classical");

--AlbumType table population
INSERT INTO AlbumType(albumTypeID, type) VALUES(1, "LP");
INSERT INTO AlbumType(albumTypeID, type) VALUES(2, "EP");
INSERT INTO AlbumType(albumTypeID, type) VALUES(3, "Single");

--AlbumTypeToAlbum table population
INSERT INTO AlbumToAlbumType(albumID, albumTypeID) VALUES(1, 1);
INSERT INTO AlbumToAlbumType(albumID, albumTypeID) VALUES(2, 1);
INSERT INTO AlbumToAlbumType(albumID, albumTypeID) VALUES(3, 1);
INSERT INTO AlbumToAlbumType(albumID, albumTypeID) VALUES(4, 2);
INSERT INTO AlbumToAlbumType(albumID, albumTypeID) VALUES(5, 3);

--Following table population
INSERT INTO Following(userID, followedUserID) VALUES(1, 2);
INSERT INTO Following(userID, followedUserID) VALUES(1, 3);
INSERT INTO Following(userID, followedUserID) VALUES(2, 3);
INSERT INTO Following(userID, followedUserID) VALUES(2, 1);
INSERT INTO Following(userID, followedUserID) VALUES(3, 1);

--FollowsArtist table population
INSERT INTO FollowsArtist(userID, artistID) VALUES(1, 2);
INSERT INTO FollowsArtist(userID, artistID) VALUES(1, 7);
INSERT INTO FollowsArtist(userID, artistID) VALUES(2, 6);
INSERT INTO FollowsArtist(userID, artistID) VALUES(2, 5);
INSERT INTO FollowsArtist(userID, artistID) VALUES(2, 8);
INSERT INTO FollowsArtist(userID, artistID) VALUES(3, 4);

--CreatesPlaylist table population
INSERT INTO CreatesPlaylist(userID, playlistID) VALUES(1, 2);
INSERT INTO CreatesPlaylist(userID, playlistID) VALUES(2, 1);
INSERT INTO CreatesPlaylist(userID, playlistID) VALUES(2, 3);
INSERT INTO CreatesPlaylist(userID, playlistID) VALUES(2, 4);
INSERT INTO CreatesPlaylist(userID, playlistID) VALUES(3, 5);
INSERT INTO CreatesPlaylist(userID, playlistID) VALUES(3, 6);

--SavesPlaylist table population
INSERT INTO SavesPlaylist(userID, playlistID) VALUES(1, 1);
INSERT INTO SavesPlaylist(userID, playlistID) VALUES(1, 2);
INSERT INTO SavesPlaylist(userID, playlistID) VALUES(1, 3);
INSERT INTO SavesPlaylist(userID, playlistID) VALUES(2, 2);
INSERT INTO SavesPlaylist(userID, playlistID) VALUES(2, 3);
INSERT INTO SavesPlaylist(userID, playlistID) VALUES(2, 6);
INSERT INTO SavesPlaylist(userID, playlistID) VALUES(3, 5);
INSERT INTO SavesPlaylist(userID, playlistID) VALUES(3, 4);

--PlaylistSongPosition table population
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(1, 1, 0);
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(1, 2, 1);
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(1, 3, 2);
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(1, 4, 3);
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(1, 5, 4);
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(1, 6, 5);
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(1, 7, 6);
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(1, 8, 7);
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(2, 2, 0);
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(2, 3, 1);
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(2, 4, 2);
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(2, 5, 3);
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(2, 6, 4);
INSERT INTO PlaylistSongPosition(playlistID, songID, songPos) VALUES(2, 7, 5);

--SavesSong table population
INSERT INTO SavesSong(songID, userID) VALUES(1, 1);
INSERT INTO SavesSong(songID, userID) VALUES(1, 2);
INSERT INTO SavesSong(songID, userID) VALUES(2, 2);
INSERT INTO SavesSong(songID, userID) VALUES(3, 2);
INSERT INTO SavesSong(songID, userID) VALUES(4, 3);
INSERT INTO SavesSong(songID, userID) VALUES(5, 3);
INSERT INTO SavesSong(songID, userID) VALUES(6, 2);
INSERT INTO SavesSong(songID, userID) VALUES(7, 1);
INSERT INTO SavesSong(songID, userID) VALUES(8, 1);

--PlaysSong table population
INSERT INTO PlaysSong(songID, userID, numberPlays) VALUES(1, 1, 1);
INSERT INTO PlaysSong(songID, userID, numberPlays) VALUES(1, 2, 21);
INSERT INTO PlaysSong(songID, userID, numberPlays) VALUES(2, 2, 18);
INSERT INTO PlaysSong(songID, userID, numberPlays) VALUES(3, 2, 30);
INSERT INTO PlaysSong(songID, userID, numberPlays) VALUES(4, 3, 1);
INSERT INTO PlaysSong(songID, userID, numberPlays) VALUES(5, 3, 1);
INSERT INTO PlaysSong(songID, userID, numberPlays) VALUES(6, 2, 1);
INSERT INTO PlaysSong(songID, userID, numberPlays) VALUES(7, 1, 1);
INSERT INTO PlaysSong(songID, userID, numberPlays) VALUES(8, 1, 1);

--SongToGenre table population
INSERT INTO SongToGenre(songID, genreID) VALUES(1, 1);
INSERT INTO SongToGenre(songID, genreID) VALUES(1, 5);
INSERT INTO SongToGenre(songID, genreID) VALUES(2, 5);
INSERT INTO SongToGenre(songID, genreID) VALUES(3, 2);
INSERT INTO SongToGenre(songID, genreID) VALUES(4, 2);
INSERT INTO SongToGenre(songID, genreID) VALUES(5, 1);
INSERT INTO SongToGenre(songID, genreID) VALUES(6, 1);
INSERT INTO SongToGenre(songID, genreID) VALUES(7, 4);
INSERT INTO SongToGenre(songID, genreID) VALUES(8, 1);

--AlbumSongPosition table population
INSERT INTO AlbumSongPosition(albumID, songID, songPos) VALUES(1, 1, 0);
INSERT INTO AlbumSongPosition(albumID, songID, songPos) VALUES(1, 2, 1);
INSERT INTO AlbumSongPosition(albumID, songID, songPos) VALUES(2, 3, 0);
INSERT INTO AlbumSongPosition(albumID, songID, songPos) VALUES(2, 4, 1);
INSERT INTO AlbumSongPosition(albumID, songID, songPos) VALUES(3, 5, 0);
INSERT INTO AlbumSongPosition(albumID, songID, songPos) VALUES(3, 6, 1);
INSERT INTO AlbumSongPosition(albumID, songID, songPos) VALUES(4, 7, 0);
INSERT INTO AlbumSongPosition(albumID, songID, songPos) VALUES(5, 8, 0);

--ReleasesAlbum table population
INSERT INTO ReleasesAlbum(artistID, albumID) VALUES(4, 1);
INSERT INTO ReleasesAlbum(artistID, albumID) VALUES(5, 1);
INSERT INTO ReleasesAlbum(artistID, albumID) VALUES(5, 5);
INSERT INTO ReleasesAlbum(artistID, albumID) VALUES(8, 3);
INSERT INTO ReleasesAlbum(artistID, albumID) VALUES(7, 2);
INSERT INTO ReleasesAlbum(artistID, albumID) VALUES(6, 4);

--SavesAlbum table population
INSERT INTO SavesAlbum(userID, albumID) VALUES(1, 2);
INSERT INTO SavesAlbum(userID, albumID) VALUES(2, 1);
INSERT INTO SavesAlbum(userID, albumID) VALUES(2, 2);
INSERT INTO SavesAlbum(userID, albumID) VALUES(2, 3);
INSERT INTO SavesAlbum(userID, albumID) VALUES(2, 5);
INSERT INTO SavesAlbum(userID, albumID) VALUES(3, 2);
INSERT INTO SavesAlbum(userID, albumID) VALUES(3, 1);
INSERT INTO SavesAlbum(userID, albumID) VALUES(3, 3);