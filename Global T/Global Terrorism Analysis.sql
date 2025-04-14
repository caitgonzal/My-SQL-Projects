USE global_terrorism;

-- Trend Analysis

-- -- Attacks per year
SELECT 
	year
    , COUNT(*) as attacks_per_year
FROM threats
GROUP BY year
ORDER BY year
;

-- Geographical Hotspots

-- -- Attacks per country

SELECT 
	country
    , COUNT(*) as attacks_per_country
FROM threats
GROUP BY country
ORDER BY attacks_per_country DESC
;

-- -- Affected Users per country due to attacks

SELECT 
	country
    , SUM(number_of_affected_users) as affected_users
FROM threats
GROUP BY country
ORDER BY affected_users DESC
;

-- Attack Methods & Targets

-- -- Attacks per attack type

SELECT 
	attack_type
    , COUNT(*) as attacks_per_type
FROM threats
GROUP BY attack_type
ORDER BY attacks_per_type DESC
;

-- -- AVG hours til resolution

SELECT 
	attack_type
    , AVG(Incident_Resolution_Time_Hours) as hours_til_resolute
FROM threats
GROUP BY attack_type
ORDER BY hours_til_resolute DESC
;

-- -- Number of affected users per attack type

SELECT 
	attack_type
    , SUM(Number_of_Affected_Users) as target_count
FROM threats
GROUP BY attack_type
ORDER BY target_count DESC
;

-- -- Targets per industry

SELECT 
	Target_Industry
    , SUM(Number_of_Affected_Users) as target_count
FROM threats
GROUP BY Target_Industry
ORDER BY target_count DESC
;

-- Terrorist Group Analysis

-- -- Attacks per attack source

SELECT 
	Attack_Source
    , COUNT(*) as total_attacks
FROM threats
GROUP BY Attack_Source
ORDER BY total_attacks DESC
;

-- -- Affected Users per attack source

SELECT 
	Attack_Source
    , SUM(Number_of_Affected_Users) as affected_users
FROM threats
GROUP BY Attack_Source
ORDER BY affected_users DESC
;

-- Success Rate & Impact

-- -- Financial loss per country

SELECT 
	country
    , ROUND(SUM(Financial_Loss_in_millions), 2) as financial_loss
FROM threats
GROUP BY country
ORDER BY financial_loss DESC
;

-- -- Financial loss per attack source


SELECT 
	Attack_Source
    , ROUND(SUM(Financial_Loss_in_millions), 2) as financial_loss
FROM threats
GROUP BY Attack_Source
ORDER BY financial_loss DESC
;
