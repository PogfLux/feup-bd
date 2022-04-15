.mode columns
.header ON
.nullvalue NULL

.print 'Checking for existing value'

SELECT numFollowers FROM Artist WHERE profileID = 8;

.print ''
.print 'Following artist'
.print ''

INSERT INTO FollowsArtist(userID, artistID) VALUES(1, 8);

.print ''
.print 'Verifying that it has updated their follow count'
.print ''

SELECT numFollowers FROM Artist WHERE profileID = 8;

.print ''
.print 'Unfollowing artist'
.print ''

DELETE FROM FollowsArtist WHERE artistID = 8 AND userID = 1;

.print ''
.print 'Verifying that it has updated their follow count'
.print ''

SELECT numFollowers FROM Artist WHERE profileID = 8;