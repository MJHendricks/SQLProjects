SELECT [Country]
      ,[Pet adoption: (01/09/2016 - 01/09/2021)]
      ,[Online streamer: (01/09/2016 - 01/09/2021)]
      ,[Staycation: (01/09/2016 - 01/09/2021)]
FROM ['Country Breakdown$']

SELECT * 
FROM [Timeline$]

SELECT *
FROM Averages;

-- average index for each term

SELECT 
	AVG([Pet adoption: (Worldwide)]) AS "Average Pet Adoption", 
	AVG([Online streamer: (Worldwide)]) AS "Average Online Streamer",
	AVG([Staycation: (Worldwide)]) AS "Average Staycation"
INTO Averages
FROM [Timeline$];

-- find peak dates for each query
ALTER TABLE Averages
ADD "Pet Adoption Peak Date" DATE, "Online Streamer Peak Date" DATE, "Staycation Peak Date" DATE;

UPDATE Averages
SET "Pet Adoption Peak Date" = 
	(
	SELECT TOP 1 Week -- only first value
	FROM [Timeline$]
	WHERE [Pet adoption: (Worldwide)] = (SELECT MAX([Pet adoption: (Worldwide)]) FROM [Timeline$])
	ORDER BY Week ASC -- ordering by week asc to ensure only the earliest date is provided, as requested.
	);

UPDATE Averages
SET "Online Streamer Peak Date" = 
	(
	SELECT TOP 1 Week -- only first value
	FROM [Timeline$]
	WHERE [Online streamer: (Worldwide)] = (SELECT MAX([Online streamer: (Worldwide)]) FROM [Timeline$])
	ORDER BY Week ASC -- ordering by week asc to ensure only the first date is provided, as requested.
	);

UPDATE Averages
SET "Staycation Peak Date" = 
	(
	SELECT TOP 1 Week -- only first value
	FROM [Timeline$]
	WHERE [Staycation: (Worldwide)] = (SELECT MAX([Staycation: (Worldwide)]) FROM [Timeline$])
	ORDER BY Week ASC -- ordering by week asc to ensure only the first date is provided, as requested.
	);

-- average index for each year

-- add columns for each search term for each year
ALTER TABLE Averages
ADD "AVG Pet Adoption 16/17" FLOAT, 
	"AVG Pet Adoption 17/18" FLOAT, 
	"AVG Pet Adoption 18/19" FLOAT,
	"AVG Pet Adoption 19/20" FLOAT, 
	"AVG Pet Adoption 20/21" FLOAT,

	"AVG Online Streamer 16/17" FLOAT, 
	"AVG Online Streamer 17/18" FLOAT, 
	"AVG Online Streamer 18/19" FLOAT,
	"AVG Online Streamer 19/20" FLOAT, 
	"AVG Online Streamer 20/21" FLOAT,

	"AVG Staycation 16/17" FLOAT, 
	"AVG Staycation 17/18" FLOAT, 
	"AVG Staycation 18/19" FLOAT,
	"AVG Staycation 19/20" FLOAT, 
	"AVG Staycation 20/21" FLOAT;

-- update table with averages for each search term for each year

UPDATE Averages
SET "AVG Pet Adoption 16/17" = (
SELECT AVG([Pet adoption: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2016-09-01' AND '2017-08-31');

UPDATE Averages
SET "AVG Pet Adoption 17/18" = (
SELECT AVG([Pet adoption: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2017-09-01' AND '2018-08-31');

UPDATE Averages
SET "AVG Pet Adoption 18/19" = (
SELECT AVG([Pet adoption: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2018-09-01' AND '2019-08-31');

UPDATE Averages
SET "AVG Pet Adoption 19/20" = (
SELECT AVG([Pet adoption: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2019-09-01' AND '2020-08-31');

UPDATE Averages
SET "AVG Pet Adoption 20/21" = (
SELECT AVG([Pet adoption: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2020-09-01' AND '2021-08-31');

UPDATE Averages
SET "AVG Online Streamer 16/17" = (
SELECT AVG([Online streamer: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2016-09-01' AND '2017-08-31');

UPDATE Averages
SET "AVG Online Streamer 17/18" = (
SELECT AVG([Online streamer: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2017-09-01' AND '2018-08-31');

UPDATE Averages
SET "AVG Online Streamer 18/19" = (
SELECT AVG([Online streamer: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2018-09-01' AND '2019-08-31');

UPDATE Averages
SET "AVG Online Streamer 19/20" = (
SELECT AVG([Online streamer: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2019-09-01' AND '2020-08-31');

UPDATE Averages
SET "AVG Online Streamer 20/21" = (
SELECT AVG([Online streamer: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2020-09-01' AND '2021-08-31');

UPDATE Averages
SET "AVG Staycation 16/17" = (
SELECT AVG([Staycation: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2016-09-01' AND '2017-08-31');

UPDATE Averages
SET "AVG Staycation 17/18" = (
SELECT AVG([Staycation: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2017-09-01' AND '2018-08-31');

UPDATE Averages
SET "AVG Staycation 18/19" = (
SELECT AVG([Staycation: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2018-09-01' AND '2019-08-31');

UPDATE Averages
SET "AVG Staycation 19/20" = (
SELECT AVG([Staycation: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2019-09-01' AND '2020-08-31');

UPDATE Averages
SET "AVG Staycation 20/21" = (
SELECT AVG([Staycation: (Worldwide)])
FROM [Timeline$]
WHERE WEEK BETWEEN '2020-09-01' AND '2021-08-31');

