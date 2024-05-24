SELECT *
FROM [Couples$]

SELECT [Year],[Gift]
FROM [Gifts$]

-- set Relationship Start field to Date type
ALTER TABLE [Couples$]
ALTER COLUMN [Relationship Start] DATE;

-- create a field for todays date
ALTER TABLE [Couples$]
ADD Today DATE;

UPDATE [Couples$]
SET Today = GETDATE()
WHERE Today IS NULL;

-- count the number of valentines days between the start date and the current date

ALTER TABLE [Couples$]
ADD [Number of Valentine's Days Together] INT;


UPDATE [Couples$]
SET [Number of Valentine's Days Together] =
    CASE 
        WHEN MONTH([Relationship Start]) < 2 OR (MONTH([Relationship Start]) = 2 AND DAY([Relationship Start]) < 14)
			THEN DATEDIFF(YEAR, [Relationship Start], [Today]) + 1
        ELSE DATEDIFF(YEAR, [Relationship Start], [Today])
    END;

-- alter year value in gifts to be an INT
UPDATE [Gifts$]
SET Year = LEFT(Year, LEN(Year) - 2);

ALTER TABLE [Gifts$]
ALTER COLUMN [Year] INT;


-- join on year (OUTPUT)

SELECT [Couples$].Couple, [Couples$].[Number of Valentine's Days Together], [Gifts$].Gift  FROM [Couples$]
JOIN [Gifts$]
ON [Couples$].[Number of Valentine's Days Together] = [Gifts$].[Year]
ORDER BY [Gifts$].[Year];

