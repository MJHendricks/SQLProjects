SELECT * FROM [All_Seat_Prices];


-- combine tables into [All_Seat_Prices]
SELECT *
INTO [All_Seat_Prices]
FROM [PD 2024 Wk 1 Output Flow Card];
INSERT INTO [All_Seat_Prices]
SELECT * FROM [PD 2024 Wk 1 Output Non-Flow Card];

-- convert date field into quarter number
ALTER TABLE [All_Seat_Prices]
ADD "Quarter" INT; ;

UPDATE [All_Seat_Prices]
SET "Quarter" = DATEPART(QUARTER, CONVERT(DATE, Date, 103));

-- Aggregate Data by min, median, max

SELECT "Quarter", "Flow Card?", Class, MIN(Price) AS "Min_Price"
INTO [Min_Seat_Prices]
FROM [All_Seat_Prices]
GROUP BY "Quarter", "Flow Card?", Class;

SELECT "Quarter", "Flow Card?", Class, MAX(Price) AS "Max_Price"
INTO [Max_Seat_Prices]
FROM [All_Seat_Prices]
GROUP BY "Quarter", "Flow Card?", Class;

SELECT DISTINCT "Quarter", "Flow Card?", Class, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY CONVERT(NUMERIC, Price)) OVER(PARTITION BY "Quarter", "Flow Card?", Class) AS "Median_Price"
INTO [Median_Seat_Prices]
FROM [All_Seat_Prices];

-- Pivot each class into seperate columns
SELECT * 
INTO [Med_Pivot]
FROM [Median_Seat_Prices]
PIVOT (MAX(Median_Price) FOR Class IN ("Economy", "Premium Economy", "First Class", "Business Class")) medSeat;


-- Join all tables together
SELECT * 
INTO [Final_Seat_Prices]
FROM [Min_Pivot];

INSERT INTO [Final_Seat_Prices]
SELECT * FROM [Max_Pivot];

INSERT INTO [Final_Seat_Prices]
SELECT * FROM [Med_Pivot];

SELECT * FROM [Final_Seat_Prices];

-- rename columns as specified in instructions
EXEC sp_rename '[Final_Seat_Prices].Economy', 'First', 'COLUMN'
EXEC sp_rename '[Final_Seat_Prices].First Class', 'Economy', 'COLUMN'
EXEC sp_rename '[Final_Seat_Prices].Business Class', 'Premium', 'COLUMN'
EXEC sp_rename '[Final_Seat_Prices].Premium Economy', 'Business', 'COLUMN'

-- Output data
SELECT "Flow Card?", "Quarter", "Economy", "Premium", "Business", "First"
FROM [Final_Seat_Prices];

