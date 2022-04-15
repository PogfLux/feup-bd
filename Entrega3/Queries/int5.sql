.mode columns
.headers on
.nullvalue NULL

-- Select all songs, sorting them by their deviation from average song length

SELECT name AS 'Song Name',
       length - (SELECT AVG(length) FROM Song) AS 'Deviation from average'
FROM Song
ORDER BY 'Standard deviation';