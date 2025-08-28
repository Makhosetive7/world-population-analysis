# Global Population Analysis (1970–2023)

## Overview

This project performs a detailed analysis of global population data for **235 countries** spanning from **1970 to 2023**.  
The goal is to **explore population trends, growth rates, density, and continental distributions**, and produce **interactive and eye-catching visualizations** suitable for dashboards or presentations.

The analysis leverages **Python**, using **Pandas** for data processing, **Matplotlib** and **Seaborn** for static visualizations, and **Plotly** for interactive charts.

---

## Dataset

The dataset `population_data.csv` contains the following columns:

- `rank` – Country rank by 2023 population  
- `cca3` – ISO3 country code  
- `country` – Country name  
- `continent` – Continent of the country  
- `1970 population` … `2023 population` – Population by year  
- `area (km²)` – Country area in square kilometers  
- `density (km²)` – Population density  
- `growth rate` – Population growth rate (%)  
- `world percentage` – Share of world population  

---

## Objectives

1. **Clean and prepare the dataset** for analysis.  
2. **Summarize key statistics**, including:
   - Global population
   - Top 10 countries by population
   - Population by continent  
3. **Visualize trends and distributions**:
   - Population growth of top countries
   - Continental growth
   - Population density vs area
   - Heatmaps for growth rates  
4. **Create interactive visualizations** for dashboards using Plotly.  
5. **Provide a dashboard-ready CSV** for further analysis.

---

## Steps and Methods

### 1. Data Cleaning

- Converted population, area, density, and growth rate columns to numeric types.
- Handled percentage strings in `growth rate`.
- Ensured all calculations and plots could be done accurately.

### 2. Descriptive Statistics

- Calculated total global population for 2023.
- Ranked countries by population to find the top 10.
- Aggregated population by continent.

### 3. Static Visualizations

- **Top 10 Countries Bar Chart**: Highlights the largest populations.  
- **Continent Pie Chart**: Shows share of world population by continent.  
- **Population Growth Line Chart**: Tracks top 5 countries over decades.  
- **Growth Rate Heatmap**: Identifies fastest-growing or shrinking countries.  
- **Population vs Area Scatter Plot**: Bubble size = density, log scale for clarity.  
- **Stacked Area Chart**: Shows continental population growth over decades (1970–2023).  
- **Animated Choropleth Map**: Displays how population evolved in each country across decades.  
- **Interactive Scatter Plot**: Allows users to explore population vs area interactively.

### 5. Dashboard-ready Dataset

- Cleaned and enriched dataset saved as `population_dashboard_ready.csv`.

mysql -u root -p --local-infile=1 < /home/makhoe_7/projects/DataAnalysis/worldPopulation/World_population_analysis.sql

---

## Key Findings

1. **Global Population Growth**
   - The world population continues to grow steadily, reaching **~8 billion in 2023**.  
   - Asia dominates global population, with India and China together accounting for **~35% of the world population**.  

2. **Top Countries**
   - **India** overtook China as the most populous country in 2023.  
   - The United States remains the third most populous country, significantly behind India and China.  

3. **Continental Trends**
   - **Asia**: largest population, steady growth  
   - **Africa**: fastest growth rate among continents  
   - **Europe**: slower growth, some countries declining  

4. **Population Density vs Area**
   - Large countries like Russia have low density, while small countries like Bangladesh have extremely high density.  
   - Bubble scatter plot clearly shows this relationship.

5. **Growth Rates**
   - Some countries (e.g., in Africa) are growing rapidly.  
   - Others (e.g., in Europe or East Asia) have very low or negative growth rates.  

6. **Visual Insights**
   - Stacked area chart shows **Africa’s rising share** of global population.  
   - Animated map highlights **dynamic changes** over decades, showing which regions are driving global growth.

---

## Tools & Libraries

- **Python 3.x**  
- **Pandas** – data manipulation  
- **Matplotlib** – static visualizations  
- **Seaborn** – enhanced visualizations  
- **Plotly Express** – interactive charts  

---

## Usage

1. Place `population_data.csv` in the same folder as the script.  
2. Run the script:

```bash
python population_analysis_advanced.py
