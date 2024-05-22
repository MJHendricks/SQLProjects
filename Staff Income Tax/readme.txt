Staff Income Tax

This project was initally designed for the Week 6 2024 Data Preparation Challenge (https://www.preppindata.com/challenges) to be completed in Tableau. However, it has been entirely implemented using SQL.

Dataset
There is 1 csv file containing the monthly salary for staff. If a team member has a change in their pay, their new salary is recorded as a later record.

Objective
Determine the expected income tax for all staff members.

Tools
- SQL Server Management Studio

Instructions
The following instructions were given in order to complete the challenge:
- Import the data.
- Add a row number
- Find the largest row number for each staffID to capture the individuals correct salary information
- Find each team member's annual salary
- Find each team member's maximum tax band based on their annual salary
	- 20% rate
	- 40% rate
	- 45% rate 
- Work out how much tax an individual paid for each of the following % bands:
	- 20% tax rate paid
	- 40% tax rate paid
	- 45% tax rate paid
- Total the tax paid across all three % bands in a field called 'Total Tax Paid' 
- Output the data

Output
The final result is a single file with the following columns: 
- StaffID
- Salary
- Max Tax Rate
- Total Tax Paid
- 20% Tax Rate Paid
- 40% Tax Rate Paid
- 45% Tax Rate Paid

The results were exported as a csv file, output.csv.

Acknowledgements
Special thanks to preppindata.com for providng an endless supply of datasets and challenges.
