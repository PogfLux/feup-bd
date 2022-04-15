.mode columns
.headers on
.nullvalue NULL


DROP VIEW IF EXISTS userNames;
CREATE VIEW userNames AS 
SELECT 
    User.profileID as 'UserID',
    Profile.name AS 'User'
FROM 
    User
    JOIN Profile ON User.profileID == Profile.id;


DROP VIEW IF EXISTS artistNames;
CREATE VIEW artistNames AS 
SELECT 
    Artist.profileID as 'ArtistID',
    Profile.name AS 'Artist'
FROM 
    Artist
    JOIN Profile ON Artist.profileID == Profile.id;

-- Select the artists that every user follows

SELECT 
    userNames.User AS 'User',
    artistNames.Artist AS 'Followed Artists'
FROM
    FollowsArtist
    JOIN artistNames ON FollowsArtist.artistID == artistNames.ArtistID
    JOIN userNames ON FollowsArtist.userID == userNames.UserID;