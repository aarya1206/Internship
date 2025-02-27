create database internship;

use internship;

SELECT Country, AVG(`Cost of Living Index`) AS Avg_Cost_of_Living
FROM cost_of_living_index_2022
GROUP BY Country
ORDER BY Avg_Cost_of_Living DESC
limit 5;

Select Country, `Rent Index` from cost_of_living_index_2022 order by `Rent Index` desc limit 5;

Select Country, `Local Purchasing Power Index` from cost_of_living_index_2022 
where `Local Purchasing Power Index` > (SELECT AVG(`Local Purchasing Power Index`) FROM cost_of_living_index_2022)
order by `Local Purchasing Power Index` desc;

SELECT COUNT(Country) AS Low_Cost_Countries
FROM cost_of_living_index_2022
WHERE `Cost of Living Index` < 50;

SELECT `Groceries Index`, `Cost of Living Index`
FROM cost_of_living_index_2022
ORDER BY `Groceries Index` DESC;

SELECT STDDEV(`Rent Index`) AS Rent_Index_StdDev
FROM cost_of_living_index_2022;

SELECT Country, `Restaurant Price Index`
FROM cost_of_living_index_2022
ORDER BY `Restaurant Price Index` ASC
LIMIT 10;

SELECT Country, AVG(`Cost of Living Plus Rent Index`) AS Avg_Combined_Index
FROM cost_of_living_index_2022
GROUP BY Country
ORDER BY Avg_Combined_Index DESC;

SELECT Country, `Local Purchasing Power Index`
FROM cost_of_living_index_2022
WHERE `Cost of Living Index` < (SELECT AVG(`Cost of Living Index`) FROM cost_of_living_index_2022)
ORDER BY `Local Purchasing Power Index` DESC
LIMIT 5;

WITH MinMaxRent AS (
    SELECT MIN(`Rent Index`) AS MinRent, MAX(`Rent Index`) AS MaxRent
    FROM cost_of_living_index_2022
)
SELECT MAX(`Groceries Index`) - MIN(`Groceries Index`) AS Diff_Groceries_Index
FROM cost_of_living_index_2022, MinMaxRent
WHERE `Rent Index` = MinMaxRent.MinRent OR `Rent Index` = MinMaxRent.MaxRent;




