-- ===========================================
-- COVID-19 Data Analysis using SQL
-- ===========================================


-- 1 Calculate total global cases, deaths, and death percentage
SELECT 
    SUM(new_cases) AS total_cases,
    SUM(new_deaths) AS total_deaths,
    (SUM(new_deaths) / SUM(new_cases)) * 100 AS DeathPercentage
FROM
    covid_19.coviddeaths;
-- This query calculates the total number of cases and deaths worldwide,
-- then computes the death percentage to measure global fatality.


-- ____________________________________________


-- 2 Total deaths by continent
SELECT 
    continent, 
    SUM(new_deaths) AS total_death
FROM
    covid_19.coviddeaths
GROUP BY continent
ORDER BY total_death;
-- This query groups deaths by continent to identify
-- which continent recorded the highest death count.


-- ____________________________________________


-- 3 Countries with the highest infection percentage
SELECT 
    location,
    population,
    MAX(total_cases) AS Highest_Total_Cases,
    MAX(ROUND((total_cases / population) * 100, 2)) AS Infection_Percetage
FROM
    covid_19.coviddeaths
GROUP BY location, population
ORDER BY Infection_Percetage DESC;
-- This query calculates the infection percentage per country,
-- showing which countries had the highest infection rate relative to population.


-- ____________________________________________


-- 4 Total deaths by country
SELECT 
    location,
    SUM(new_deaths) AS total_deaths
FROM
    covid_19.coviddeaths
GROUP BY location
ORDER BY location;
--  Summarizes total deaths for each country to compare between locations.


-- ____________________________________________


-- 5 Daily new deaths trend
SELECT 
    date,
    new_deaths
FROM
    covid_19.coviddeaths;
--  Displays the number of new deaths per day (useful for trend visualization).
