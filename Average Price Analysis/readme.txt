Average Price Analysis

This project was initally designed for the [Week 2 2024 Data Preparation Challenge](https://www.preppindata.com/challenges) to be completed in Tableau. However, it has been entirely implemented using SQL.

Dataset
There are 2 Excel files in total, both depicting the seat prices for various classes in an airline. One Excel Workbook contains information on seat prices for those who have a Flow Card, and the other for those who don't.

Objective
The challenge is to clean the data and rectify any issues.

Tools
- SQL Server Management Studio

Instructions
The following instructions were given in order to complete the challenge:
- Input the two csv files
- Union the files together
- Convert the Date field to a Quarter Number instead
	- Name this field Quarter
- Aggregate the data in the following ways:
	- Median price per Quarter, Flow Card? and Class
        - Minimum price per Quarter, Flow Card? and Class
        - Maximum price per Quarter, Flow Card? and Class

- Create three separate flows where you have only one of the aggregated measures in each. 
        - One for the  minimum price
        - One for the median price
        - One for the maximum price
- Pivot the data to have a column per class for each quarter and whether the passenger had a flow card or not
- Union these flows back together
- Change the name of the following columns:
        - Economy to First
        - First Class to Economy
        - Business Class to Premium
        - Premium Economy to Business
- Output the data

Output
As specified in the requirements of the challenge, the final result should be a single file with the following columns: 
- Flow Card?
- Quarter
- Economy
- Premium
- Business
- First

The result has been exported as a csv file, output.csv.

Acknowledgements
Special thanks to [preppindata.com](https://www.preppindata.com) for providng an endless supply of datasets and challenges.
