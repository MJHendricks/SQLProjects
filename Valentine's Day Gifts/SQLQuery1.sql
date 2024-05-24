SELECT *
FROM [PD 2024 Wk 6 Input]

-- add row numbers

ALTER TABLE [PD 2024 Wk 6 Input]
ADD RowNumber INT;

SELECT *,
ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS RowNum
FROM [PD 2024 Wk 6 Input]



ALTER TABLE [PD 2024 Wk 6 Input]
DROP COLUMN RowNumber;