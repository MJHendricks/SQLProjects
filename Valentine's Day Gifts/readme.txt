Valentine's Day Gifts

This project was initally designed for the Week 7 2024 Data Preparation Challenge (https://www.preppindata.com/challenges) to be completed in Tableau. However, it has been entirely implemented using SQL.

Dataset
There is one Excel worksheet file containing two sheets:
- 'Couples': A list of the couples and the date their relationship began.
- 'Gifts': A guide on the type of gift each couple should receive based on the number of years they have been together.

Objective
Count the number of Valentine's Days that the couples have been together, then provide a suggestion on the theme of the gift based on the guide provided.

Tools
- SQL Server Management Studio

Instructions
The following instructions were given in order to complete the challenge:
- Import the data.
- Fix the Relationship Start field so that it has a "Date" data type
- Create a field for today's date (24/05/2024)
- Count the number of Valentine's days
- Make the Year field match the data type of the Number of Valentine's field
- Join the 2 datasets together
- Remove unnecessary fields
- Output the data

Output
The final result is a single file with the following columns: 
- Couple
- Number of Valentine's Days as a Couple
- Gift

The results were exported as a csv file, output.csv.

Acknowledgements
Special thanks to preppindata.com for providng an endless supply of datasets and challenges.
