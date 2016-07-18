-- SQLZOO SELECT from WORLD Tutorial

-- table <http://sqlzoo.net/wiki/Read_the_notes_about_this_table. >

# 1. Observe the result of running a simple SQL command.
SELECT name, continent, population FROM world;


# 2. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros
SELECT name FROM world
WHERE population>200000000;


# 3. Give the name and the per capita GDP for those countries with a population of at least 200 million.
# per capita GDP is the GDP divided by the population GDP/population
SELECT name, GDP/POPULATION as 'per capita GDP'
FROM world
WHERE population>= 200000000;


# 4. Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, population/1000000 as 'population in millions'
FROM world
WHERE continent LIKE 'South America';


# 5. Show the name and population for France, Germany, Italy
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');


# 6. Show the countries which have a name that includes the word 'United'
SELECT name
FROM world
WHERE name LIKE '%United%'


# 7. Show the countries that are big by area or big by population. Show name, population and area.
-- Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
SELECT name, population, area
FROM world
WHERE area>3000000 OR population>250000000;


# 8. Show the countries that are big by area or big by population but not both. Show name, population and area.
SELECT name, population, area
FROM world
WHERE area>3000000 XOR population>250000000;


# 9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'.
SELECT name, ROUND(population/1000000, 2) as 'Population in Millions', ROUND(GDP/1000000000, 2) as 'GDP in Billions'
FROM world
WHERE continent LIKE 'South America';


# 10. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
SELECT name, ROUND(GDP/population, -3) as 'per capita GDP'
FROM world
WHERE GDP>= 1000000000000;


# 11. Show the name - but substitute Australasia for Oceania - for countries beginning with N.
SELECT name,
       CASE WHEN continent='Oceania' THEN 'Australasia'
            ELSE continent END
  FROM world
 WHERE name LIKE 'N%';


 # 12. Show the name and the continent - but substitute Eurasia for Europe and Asia; substitute America - for each country in North America or South America or Caribbean. Show countries beginning with A or B
 SELECT name, 
     CASE
            WHEN continent IN ('Europe', 'Asia') THEN 'Eurasia'
            WHEN continent IN ('North America', 'South America', 'Caribbean') THEN 'America'
            ELSE continent END
FROM world
WHERE name LIKE 'A%' OR name LIKE 'B%';


# 13. Show the name, the original continent and the new continent of all countries.
SELECT name, continent,
         CASE
               WHEN continent='Oceania' THEN 'Australasia'
               WHEN continent='Eurasia' THEN 'Europe/Asia'
               WHEN name='Turkey' THEN continent = 'Europe/Asia'
               WHEN continent='Caribbean' AND name LIKE 'B%' THEN 'North America'
               WHEN continent='Caribbean' AND name NOT LIKE 'B%' THEN 'South America'
               ELSE continent END
FROM world
ORDER BY name;








