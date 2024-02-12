-- Tutorial 0:
    SELECT population FROM world WHERE name = 'Germany'
    SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');
    SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000

-- Tutorial 1:
    SELECT name, continent, population FROM world
    SELECT name FROM world WHERE population > 200000000
    SELECT name,gdp/population FROM world WHERE population > 200000000
    SELECT name,population/1000000 FROM world WHERE continent = 'South America'
    SELECT name,population FROM world WHERE name = 'France' OR name = 'Germany' OR name = 'Italy'
    SELECT name FROM world WHERE name LIKE 'United%'
    SELECT name,population,area FROM world WHERE area > 3000000 OR population > 250000000
    SELECT name,population,area FROM world WHERE area > 3000000 XOR population > 250000000
    SELECT name,ROUND(population/1000000,2),ROUND(gdp/1000000000,2) FROM world WHERE continent = 'South America'
    SELECT name,ROUND(gdp/population, -3) FROM world WHERE gdp > 1000000000000
    SELECT name, capital FROM world WHERE LENGTH(name) = LENGTH(capital)
    SELECT name, capital FROM world WHERE LEFT(name,1) = LEFT(capital,1) XOR name = capital
    SELECT name FROM world WHERE name LIKE '%a%'AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %'

-- Tutorial 2:
    SELECT yr, subject, winner FROM nobel WHERE yr = 1950
    SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'literature'
    SELECT yr,subject FROM nobel WHERE winner = 'Albert Einstein'
    SELECT winner winner_peace FROM nobel WHERE subject = 'Peace' AND yr >= 2000
    SELECT * FROM nobel WHERE subject = 'literature' AND yr >= 1980 AND yr <= 1989
    SELECT * FROM nobel WHERE winner IN ('Theodore Roosevelt', 'Thomas Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')
    SELECT winner FROM nobel WHERE winner LIKE 'John%'
    SELECT yr,subject,winner FROM nobel WHERE subject = 'physics' AND yr = '1980' OR subject = 'chemistry' AND yr = '1984'
    SELECT yr,subject,winner FROM nobel WHERE yr='1980' AND subject != 'chemistry' AND subject != 'medicine'
    SELECT yr,subject,winner FROM nobel WHERE yr < '1910' AND subject = 'medicine' OR yr >= '2004' AND subject = 'literature'
    SELECT * FROM nobel WHERE winner LIKE 'PETER GR%NBERG'
    SELECT * FROM nobel WHERE winner = 'EUGENE O''NEILL'
    SELECT winner,yr,subject FROM nobel WHERE winner LIKE 'sir%' ORDER BY yr DESC, winner
    SELECT winner, subject FROM nobel WHERE yr=1984 ORDER BY subject IN ('physics','chemistry'),subject,winner

-- Tutorial 3:SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name='Russia')
    SELECT name FROM world WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name='United Kingdom')
    SELECT name, continent FROM world WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia')) ORDER BY name
    SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom') AND population < (SELECT population FROM world WHERE name = 'Germany')
    SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany')), '%') FROM world WHERE continent = 'Europe'
    SELECT name FROM world WHERE gdp >= ALL(SELECT gdp FROM world WHERE gdp >=0 AND continent = 'Europe') AND continent != 'Europe'
    SELECT continent, name, area FROM world x WHERE area >= ALL (SELECT area FROM world y WHERE y.continent=x.continent AND area>0)
    SELECT continent, name FROM world x WHERE name <= ALL(SELECT name FROM world y WHERE y.continent = x.continent)
    SELECT name, continent, population FROM world x WHERE 25000000  > ALL(SELECT population FROM world y WHERE x.continent = y.continent AND y.population > 0)
    SELECT name, continent FROM world x WHERE population > ALL(SELECT population*3 FROM world y WHERE x.continent = y.continent AND population > 0 AND y.name != x.name)