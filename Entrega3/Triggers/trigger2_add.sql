.mode columns
.header ON
.nullvalue NULL

--Updates playlist length when adding a song to it

CREATE TRIGGER IF NOT EXISTS IncrementPlaylistDuration

AFTER INSERT ON PlaylistSongPosition

    BEGIN
        UPDATE Playlist
        SET length = Playlist.length + (SELECT length
                                        FROM Song
                                        WHERE songID = NEW.songID),
        numSongs = numSongs + 1
        WHERE Playlist.playlistID = NEW.playlistID;
    END;


CREATE TRIGGER IF NOT EXISTS DecrementPlaylistDuration

AFTER DELETE ON PlaylistSongPosition

    BEGIN
        UPDATE Playlist
        SET length = Playlist.length - (SELECT length
                                        FROM Song
                                        WHERE songID = OLD.songID),
        numSongs = numSongs - 1
        WHERE Playlist.playlistID = OLD.playlistID;
    END;