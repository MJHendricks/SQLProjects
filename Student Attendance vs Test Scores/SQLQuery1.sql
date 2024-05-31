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


