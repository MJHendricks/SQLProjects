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

-- create output table

CREATE TABLE Trends ("Search Term" VARCHAR(64));

INSERT INTO Trends ("Search Term")
VALUES ('Pet Adoption');

INSERT INTO Trends ("Search Term")
VALUES ('Online Streamer');

INSERT INTO Trends ("Search Term")
VALUES ('Staycation');

SELECT * FROM Trends;
-- Classify each search term as either "Lockdown Fad" or "Still Trendy" based on if 19/20 is less than or greater than 20/21

ALTER TABLE Trends
ADD "Status" VARCHAR(64);

UPDATE Trends
SET "Status" = (
SELECT 
	CASE
		WHEN "AVG Pet Adoption 19/20" > "AVG Pet Adoption 20/21"
		THEN 'Lockdown Fad'
		ELSE 'Still Trendy'
		END AS 'Status'
FROM Averages)
WHERE "Search Term" = 'Pet Adoption';

UPDATE Trends
SET "Status" = (
SELECT 
	CASE
		WHEN "AVG Online Streamer 19/20" > "AVG Online Streamer 20/21"
		THEN 'Lockdown Fad'
		ELSE 'Still Trendy'
		END AS 'Status'
FROM Averages)
WHERE "Search Term" = 'Online Streamer';

UPDATE Trends
SET "Status" = (
SELECT 
	CASE
		WHEN "AVG Staycation 19/20" > "AVG Staycation 20/21"
		THEN 'Lockdown Fad'
		ELSE 'Still Trendy'
		END AS 'Status'
FROM Averages)
WHERE "Search Term" = 'Staycation';

-- remove all rows from Countries where there are null values

DELETE FROM ['Country Breakdown$']
WHERE [Pet adoption: (01/09/2016 - 01/09/2021)] IS NULL 
	OR [Online streamer: (01/09/2016 - 01/09/2021)] IS NULL
	OR [Staycation: (01/09/2016 - 01/09/2021)] IS NULL;

-- Find country with highest percentage for each search term 
ALTER TABLE Trends
ADD "Country with Highest Percentage" VARCHAR(128);

UPDATE Trends
SET "Country with Highest Percentage" = (
	SELECT Country FROM ['Country Breakdown$']
	WHERE [Pet adoption: (01/09/2016 - 01/09/2021)] = (SELECT MAX([Pet adoption: (01/09/2016 - 01/09/2021)]) FROM ['Country Breakdown$'])
)
WHERE "Search Term" = 'Pet Adoption';

UPDATE Trends
SET "Country with Highest Percentage" = (
	SELECT Country FROM ['Country Breakdown$']
	WHERE [Online streamer: (01/09/2016 - 01/09/2021)] = (SELECT MAX([Online streamer: (01/09/2016 - 01/09/2021)]) FROM ['Country Breakdown$'])
)
WHERE "Search Term" = 'Online Streamer';

UPDATE Trends
SET "Country with Highest Percentage" = (
	SELECT Country FROM ['Country Breakdown$']
	WHERE [Staycation: (01/09/2016 - 01/09/2021)] = (SELECT MAX([Staycation: (01/09/2016 - 01/09/2021)]) FROM ['Country Breakdown$'])
)
WHERE "Search Term" = 'Staycation';

-- Compile all requested information into Trends Table , then output to file
SELECT * FROM Trends;

ALTER TABLE Trends 
ADD "2020/21 AVG Index" FLOAT, "AVG Index" FLOAT, "Index Peak" FLOAT, "First Peak" DATE;

-- set avg index for 2020/2021
UPDATE Trends
SET "2020/21 AVG Index" = 
(
SELECT ROUND([AVG Pet Adoption 20/21],2)
FROM Averages
)
WHERE "Search Term" = 'Pet Adoption';

UPDATE Trends
SET "2020/21 AVG Index" = 
(
SELECT ROUND([AVG Online Streamer 20/21],2)
FROM Averages
)
WHERE "Search Term" = 'Online Streamer';

UPDATE Trends
SET "2020/21 AVG Index" = 
(
SELECT ROUND([AVG Staycation 20/21],2)
FROM Averages
)
WHERE "Search Term" = 'Staycation';

-- set overall avg index 

UPDATE Trends
SET "AVG Index" = 
(
SELECT ROUND([Average Pet Adoption],2)
FROM Averages
)
WHERE "Search Term" = 'Pet Adoption';

UPDATE Trends
SET "AVG Index" = 
(
SELECT ROUND([Average Online Streamer],2)
FROM Averages
)
WHERE "Search Term" = 'Online Streamer';

UPDATE Trends
SET "AVG Index" = 
(
SELECT ROUND([Average Staycation],2)
FROM Averages
)
WHERE "Search Term" = 'Staycation';

-- set index peak

UPDATE Trends
SET "Index Peak" = 
(
SELECT ROUND(MAX([Pet adoption: (Worldwide)]),2)
FROM [Timeline$]
)
WHERE "Search Term" = 'Pet Adoption';

UPDATE Trends
SET "Index Peak" = 
(
SELECT ROUND(MAX([Online streamer: (Worldwide)]),2)
FROM [Timeline$]
)
WHERE "Search Term" = 'Online Streamer';

UPDATE Trends
SET "Index Peak" = 
(
SELECT ROUND(MAX([Staycation: (Worldwide)]),2)
FROM [Timeline$]
)
WHERE "Search Term" = 'Staycation';

-- set first peak date

UPDATE Trends
SET "First Peak" = 
(
SELECT [Pet Adoption Peak Date]
FROM Averages
)
WHERE "Search Term" = 'Pet Adoption';

UPDATE Trends
SET "First Peak" = 
(
SELECT [Online Streamer Peak Date]
FROM Averages
)
WHERE "Search Term" = 'Online Streamer';

UPDATE Trends
SET "First Peak" = 
(
SELECT [Staycation Peak Date]
FROM Averages
)
WHERE "Search Term" = 'Staycation';

SELECT * FROM Trends