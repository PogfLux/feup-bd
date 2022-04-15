.mode columns
.headers on
.nullvalue NULL

-- Select the artist with the highest number of
-- followers followed by one of the users, example user 1

SELECT Profile.name, Artist.numFollowers 

FROM FollowsArtist
	JOIN Artist ON FollowsArtist.artistID=Artist.profileID
    JOIN Profile ON Artist.profileID=Profile.id
    
WHERE FollowsArtist.userID = 1
ORDER BY Artist.numfollowers DESC
LIMIT 1;