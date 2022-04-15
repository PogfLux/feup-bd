.mode columns
.header ON
.nullvalue NULL

--Updates artist's number of followers when a user follows them

CREATE TRIGGER IF NOT EXISTS IncrementFollowCount

AFTER INSERT ON FollowsArtist

    BEGIN
        UPDATE Artist
        SET numFollowers = numFollowers + 1
        WHERE Artist.profileID = NEW.artistID;
    END;


CREATE TRIGGER IF NOT EXISTS DecrementFollowCount

AFTER DELETE ON FollowsArtist

    BEGIN
        UPDATE Artist
        SET numFollowers = numFollowers - 1
        WHERE Artist.profileID = OLD.artistID;
    END;