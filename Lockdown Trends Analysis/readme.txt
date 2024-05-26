Lockdown Trends Analysis

This project was initally designed for the Week 36 2021 Data Preparation Challenge (https://www.preppindata.com/challenges) to be completed in Tableau. However, it has been entirely implemented using SQL.

Dataset
There is 1 Excel File containing 2 sheets:
1. Timeline - Indexes how popular the search term is.
2. Country Breakdown - Popularity of each term by country.

Objective
Determine if the 3 search terms, "Pet adoption", "Online Streamer", and "Staycations" remained as popular after peak lockdown, and how popular these trends were throughout the world.

Tools
- SQL Server Management Studio

Instructions
The following instructions were given in order to complete the challenge:
- Input the data.
- Calculate the overall average index for each search term.
- Work out the earliest peak for each of these search terms.
- For each year (1st September - 31st August), calculate the average index.
- Classify each search term as either a "Lockdown Fad" or "Still Trendy" based on whether the average index has increased or decreased since last year.
- Filter the countries so that only those with values for each search term remain.
- For each search term, work out which country has the highest percentage.
- Compile the data into a single output.
- Output the data.

Output
As specified in the requirements of the challenge, the final result should be a single file with the following columns: 
- Search Term
- Status
- 2020/21 avg index
- Avg index
- Index Peak
- First Peak
- Country with highest percentage

The result has been exported as a csv file, output.csv.

Acknowledgements
Special thanks to preppindata.com for providng an endless supply of datasets and challenges.
