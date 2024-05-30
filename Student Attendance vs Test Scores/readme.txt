Student Attendance vs Test Scores

This project was initally designed for the Week 22 2023 Data Preparation Challenge (https://www.preppindata.com/challenges) to be completed in Tableau. However, it has been entirely implemented using SQL.

Dataset
There is 1 Excel File containing 2 sheets, "Attendance Figures", which provides the attendence percentage for each student, and "Student Test Scores", which provides the grade each student scored for tests across multiple subjects.

Objective
Analyse the correlation between student attendance and test scores.

Tools
- SQL Server Management Studio

Instructions
The following instructions were given in order to complete the challenge:
- Input the data
- Join the test score data set and the additional class attendance data set 
- Correct the Spelling Mistakes
- Clean up the test score column, so each number is a rounded to the nearest whole number
- Split the student name column so we can see the first name and surname in two separate columns, named appropriately
- If any student has an attendance percentage less than 70%, flag it as "Low Attendance" in a new column "attendance flag". Conversely, if above 90%, flag as “high attendance”. And anything else as “Medium”.  
- Output the data

Output
As specified in the requirements of the challenge, the final result should be a single file with the following columns: 
- Attendance Flag
- First Name
- Surname
- Attendance_Percentage
- Student_ID
- Subject
- Test_score
- TestScoreInteger

The result has been exported as a csv file, output.csv.

Acknowledgements
Special thanks to preppindata.com for providng an endless supply of datasets and challenges.
