USE population_db;

CREATE TABLE IF NOT EXISTS world_population (
    global_rank INT,
    cca3 CHAR(3) PRIMARY KEY,
    country VARCHAR(100),
    continent VARCHAR(50),
    population_1970 BIGINT,
    population_1980 BIGINT,
    population_1990 BIGINT,
    population_2000 BIGINT,
    population_2010 BIGINT,
    population_2015 BIGINT,
    population_2020 BIGINT,
    population_2022 BIGINT,
    population_2023 BIGINT,
    area_km2 BIGINT,
    density_km2 DECIMAL(10,2),
    growth_rate DECIMAL(5,2),
    world_percentage DECIMAL(5,2)
);

-- load csv into table

LOAD DATA LOCAL INFILE '/home/makhoe_7/projects/DataAnalysis/worldPopulation/datasets/processed/population_dashboard_ready.csv'
INTO TABLE world_population
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(global_rank, cca3, country, continent,
 @pop2023, @pop2022, @pop2020, @pop2015, @pop2010,
 @pop2000, @pop1990, @pop1980, @pop1970,
 area_km2, density_km2, @growth_rate, @world_percentage)
SET
    population_1970 = @pop1970,
    population_1980 = @pop1980,
    population_1990 = @pop1990,
    population_2000 = @pop2000,
    population_2010 = @pop2010,
    population_2015 = @pop2015,
    population_2020 = @pop2020,
    population_2022 = @pop2022,
    population_2023 = @pop2023,
    growth_rate = REPLACE(@growth_rate, '%', ''),
    world_percentage = REPLACE(@world_percentage, '%', '');


-- Verify data load

 SELECT * FROM world_population LIMIT 10;

-- Descriptive Statistics

SELECT SUM(`population_2023`) AS population_2023
FROM world_population; \G

-- Top 10 countries by population in 2023

SELECT country, population_2023 AS global_population_2023
FROM world_population
ORDER BY population_2023 DESC
LIMIT 10; \G

-- Population by continent in 2023

SELECT continent, SUM(`population_2023`) AS continent_population_2023
FROM world_population
GROUP BY continent
ORDER BY continent_population_2023 DESC; \G

-- Average growth_rate by continent

SELECT continent, AVG(`growth_rate`) AS avg_growth_rate
FROM world_population
GROUP BY continent
ORDER BY avg_growth_rate DESC; \G

-- Population growth analysis

-- absolute growth from 1970 to 2023

SELECT country, 
       `population_1970`, 
       `population_2023`,
       (`population_2023` - `population_1970`) AS growth_1970_2023
FROM world_population
ORDER BY growth_1970_2023 DESC
LIMIT 10;


-- Growth rate check (+ or -)

SELECT country, `growth_rate`
FROM world_population
WHERE `growth_rate` < 0
ORDER BY `growth_rate` ASC;

-- Top 5 countries population growth over decades

SELECT country,
       `population_1970`,
       `population_1980`,
       `population_1990`,
       `population_2000`,
       `population_2010`,
       `population_2015`,
       `population_2020`,
       `population_2022`,
       `population_2023`
FROM world_population
ORDER BY `population_2023` DESC
LIMIT 5;

-- Density and Area Analysis

-- Top 10 most densely populated countries

SELECT country, `density_km2`, `population_2023`, ` area_km2`
FROM world_population
ORDER BY `density_km2` DESC
LIMIT 10;

-- Top 10 largest countries by area

SELECT country, `area_km2`, `population_2023`
FROM world_population
ORDER BY `area_km2` DESC
LIMIT 10;

-- Percent of World Population

-- Top 10 countries contributing most to world population

SELECT country, `world_percentage`
FROM world_population
ORDER BY `world_percentage` DESC
LIMIT 10;



-- Continental population growth over decades

SELECT continent,
       SUM(`population_1970`) AS pop_1970,
       SUM(`population_1980`) AS pop_1980,
       SUM(`population_1990`) AS pop_1990,
       SUM(`population_2000`) AS pop_2000,
       SUM(`population_2010`) AS pop_2010,
       SUM(`population 2020`) AS pop_2020,
       SUM(`population_2023`) AS pop_2023
FROM world_population
GROUP BY continent
ORDER BY pop_2023 DESC;

-- Average growth rate by continent

SELECT continent, AVG(`growth_rate `) AS avg_growth_rate
FROM world_population
GROUP BY continent
ORDER BY avg_growth_rate DESC;