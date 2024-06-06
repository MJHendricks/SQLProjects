  -- join datasets

SELECT stu.F1, att.student_name, att.attendance_percentage, stu.F2, stu.F3, stu.F4
INTO MergedDatasets
FROM ['Attendance Figures$'] att
JOIN ['Student Test Scores$'] stu
ON att.[student_name] = stu.F2;

SELECT * FROM MergedDatasets

-- correct spelling mistakes

-- Determine The source of spelling errors in the subject column
SELECT DISTINCT(F3) FROM MergedDatasets;
--"Engish" should be "English", "Sciece" should be "Science"

UPDATE MergedDatasets
SET F3 = REPLACE ( F3, 'Engish', 'English');

UPDATE MergedDatasets
SET F3 = REPLACE ( F3, 'Sciece', 'Science');

-- round test score col

UPDATE MergedDatasets
SET F4 = ROUND(F4,0)

-- split student name into first name and surname
ALTER TABLE MergedDatasets
ADD first_name VARCHAR(64), last_name VARCHAR(64);

UPDATE MergedDatasets
SET first_name = LEFT(student_name, CHARINDEX('_', student_name) -1),
	last_name = SUBSTRING(student_name, CHARINDEX('_', student_name) + 1, LEN(student_name) - CHARINDEX('_', student_name))
WHERE CHARINDEX('_', student_name) > 0;

-- set attendance flag

ALTER TABLE MergedDatasets
ADD "Attendance Flag" VARCHAR(128);

UPDATE MergedDatasets
SET "Attendance Flag" =
(
	CASE 
		WHEN attendance_percentage < 0.7 THEN 'Low Attendance'
		WHEN attendance_percentage > 0.9 THEN 'High Attendance'
		ELSE 'Medium Attendance'
	END
)
WHERE attendance_percentage > 0;

-- output
SELECT 
	"Attendance Flag", 
	first_name AS 'First Name',
	last_name AS 'Surname',
	attendance_percentage,
	F1 AS 'Student_ID',
	F3 AS 'Subject',
	F4 AS 'Test Score'

FROM MergedDatasets
ORDER BY Subject;

