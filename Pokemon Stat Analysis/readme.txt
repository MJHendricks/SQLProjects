Pokemon Stat Analysis

This project was initally designed for the Week 8 2022 Data Preparation Challenge (https://www.preppindata.com/challenges) to be completed in Tableau. However, it has been entirely implemented using SQL.

Dataset
There is 1 Excel file containing 2 sheets in total, containing the stats and evolution line for a selection of Pokemon.

Objective
Determine which Pokemon stats decrease from evolving.

Tools
- SQL Server Management Studio

Instructions
The following instructions were given in order to complete the challenge:
- Import the data.
- From pkmn_stats dataset remove the columns 'height', 'weight' and 'evolves_from'.
- Pivot (wide to long) pkmn_stats so that hp, attack, defense, special_attack, special_defense, and speed become a column called 'combat_factors'.
- Using the evolutions data look up the combat_factors for each Pokémon at each stage, making sure that the combat_factors match across the row, i.e. we should be able to see the hp for Bulbasaur, Ivysaur and Venusaur on one row.
- Remove any columns for 'pokedex_number' and 'gen_introduced'.
- If a Pokémon doesn't evolve remove it from the dataset.
- Find the combat power values relating to the Pokémon's last evolution stage.
- Sum together each Pokémon's combat_factors.
- Find the percentage increase in combat power from the first & last evolution stage.
- Sort the dataset, ascending by percentage increase.   
- Output the data

Output
The final result is a single file with the following columns: 
- Stage_1
- Stage_2
- Stage_3
- initial_combat_power
- final_combat_power
- combat_power_increase

The results are ordered by lowest to highest change in stats and exported as a csv file, output.csv.

Acknowledgements
Special thanks to preppindata.com for providng an endless supply of datasets and challenges.
