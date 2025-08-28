# 🌍 Global Population Analysis with SQL (1970–2023)

## Overview

This project performs a detailed **SQL-based analysis** of global population data for **235 countries** spanning from **1970 to 2023**.  
The goal is to use **SQL queries** to explore population trends, growth rates, density, and continental distributions, and prepare results that can be integrated into dashboards or further data analysis.

The analysis leverages **MySQL** with datasets loaded via `LOAD DATA INFILE`.

---

## Dataset

The dataset `population_dashboard_ready.csv` contains the following columns:

- `global_rank` – Country rank by 2023 population
- `cca3` – ISO3 country code
- `country` – Country name
- `continent` – Continent of the country
- `population_1970 … population_2023` – Population by year
- `area_km2` – Country area in square kilometers
- `density_km2` – Population density
- `growth_rate` – Population growth rate (%)
- `world_percentage` – Share of world population

---

## Objectives

1. **Load data into MySQL** using `LOAD DATA LOCAL INFILE`.
2. **Create queries** to summarize key statistics:
   - Global population totals
   - Top 10 countries by population
   - Population by continent
3. **Explore growth trends**:
   - Population changes across decades
   - Growth rate variations
4. **Prepare clean outputs** for visualization dashboards.

---

## Key Findings

### Global Population Growth

- Reached ~8 billion in 2023.
- Asia accounts for the largest share, with India and China combined making up ~35%.

### Top Countries

- India overtook China as the most populous nation in 2023.
- USA remains 3rd, but far behind Asia’s giants.

### Continental Trends

- Africa shows the fastest growth.
  -Europe has stagnated or even declined in some countries.

### Growth Rates

-High in Africa and parts of Asia.
-Low or negative in Europe, East Asia.

---

## Steps and Methods

### 1. Database & Table Creation

````sql
CREATE DATABASE population_db;
USE population_db;

CREATE TABLE world_population (
    global_rank INT,
    cca3 CHAR(3),
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
    area_km2 DOUBLE,
    density_km2 DOUBLE,
    growth_rate DOUBLE,
    world_percentage DOUBLE
);

### 1. Load data

```sql
mysql -u root -p --local-infile=1 population_db \
    -e "LOAD DATA LOCAL INFILE 'datasets/population_dashboard_ready.csv'
    INTO TABLE world_population
    FIELDS TERMINATED BY ','
    ENCLOSED BY '\"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;"

````

### 3. Example SQL Queries

## Total global population (2023)

```sql
SELECT SUM(population_2023) AS global_population_2023
FROM world_population;
```

## Top 10 most populous countries (2023)

```sql
SELECT country, population_2023
FROM world_population
ORDER BY population_2023 DESC
LIMIT 10;
```

### Tools & Technologies

- MySQL 8.0 – database engine
- SQL – data analysis & querying
- CSV Loader – LOAD DATA LOCAL INFILE for efficient import

### Usage

## Run the SQL script

```sql
mysql -u root -p --local-infile=1 < scripts/World_population_analysis.sql
```
