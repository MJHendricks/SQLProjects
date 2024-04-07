SELECT * FROM [pkmn_stats$];
SELECT * FROM [pkmn_evolutions$];

-- remove height, weight, evolves_from
ALTER TABLE [pkmn_stats$]
DROP COLUMN height, weight, evolves_from;

-- unpivot stats
SELECT *
INTO pkmn_stats_unpivot
FROM [pkmn_stats$]
UNPIVOT(combat_factors FOR stat IN (hp, attack, defense, special_attack, special_defense, speed)) df1;

-- remove pokedex num and gen introduced
ALTER TABLE pkmn_stats_unpivot
DROP COLUMN pokedex_number, gen_introduced;

-- match the pokemon to their evolutions and display stats for comparison, also removes pokemon with no evolutions
SELECT 
    evo.Stage_1, 
    stat1.stat AS stage1_stat_name,
    stat1.combat_factors AS stage1_combat_factor, 
    evo.Stage_2, 
    stat2.stat AS stage2_stat_name,
    stat2.combat_factors AS stage2_combat_factor, 
    evo.Stage_3, 
    stat3.stat AS stage3_stat_name,
    stat3.combat_factors AS stage3_combat_factor
INTO pkmn_stat_comparisons
FROM 
    [pkmn_evolutions$] evo
JOIN 
    pkmn_stats_unpivot stat1 ON stat1.name = evo.Stage_1 
JOIN 
    pkmn_stats_unpivot stat2 ON stat2.name = evo.Stage_2 AND stat1.stat = stat2.stat
LEFT JOIN 
    pkmn_stats_unpivot stat3 ON stat3.name = evo.Stage_3 AND stat2.stat = stat3.stat
ORDER BY Stage_1;

SELECT * FROM pkmn_stat_comparisons

-- for each pokemon determine the initial and final combat powers
SELECT Stage_1, Stage_2, Stage_3, SUM(stage1_combat_factor) AS initial_combat_power,
CASE
	WHEN Stage_3 IS NOT NULL 
	THEN SUM(stage3_combat_factor)
	ELSE 
	SUM(stage2_combat_factor)
	END AS "final_combat_power",
CASE -- usually would check for 0 values for dividing but there will be done in this case
	WHEN Stage_3 IS NOT NULL 
	THEN ((SUM(stage3_combat_factor)-SUM(stage1_combat_factor))/SUM(stage1_combat_factor)*100)
	ELSE 
	((SUM(stage2_combat_factor)-SUM(stage1_combat_factor))/SUM(stage1_combat_factor)*100)
	END AS "combat_power_increase"

FROM pkmn_stat_comparisons
GROUP BY Stage_1, Stage_2, Stage_3
ORDER BY combat_power_increase;