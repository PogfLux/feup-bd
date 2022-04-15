.mode columns
.headers on
.nullvalue NULL

-- Select the users that follow an artist, sorting them by age

SELECT 
    Profile.name AS 'User',
    User.dateOfBirth AS 'DOB'
FROM
    FollowsArtist
    JOIN User ON User.profileID = FollowsArtist.userID
    JOIN Profile ON Profile.id = User.profileID
WHERE
    FollowsArtist.artistID = 6
ORDER BY
    User.dateOfBirth;