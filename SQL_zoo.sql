SELECT population FROM world
  WHERE name = 'Germany'
  
  SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
  
  SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 25000
  
  SELECT name, continent, population FROM world
  
  SELECT name FROM world
 WHERE population > 20000000
 
 SELECT name, gdp/population FROM world 
WHERE population >200000000


SELECT name, Population/1000000 AS population FROM world
WHERE continent = 'South America'

SELECT name, population FROM world WHERE name IN('France', 'Germany', 'Italy')

SELECT name  FROM world
WHERE name LIKE 'United%'

SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000

SELECT name, population, area FROM world
WHERE area > 3000000 AND population < 250000000 OR area < 3000000 
AND population > 250000000

SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2) FROM world
WHERE continent = 'South America'

SELECT name, ROUND(GDP/population, -3) FROM world
WHERE GDP >= 1000000000000

SELECT name, capital FROM world
WHERE LENGTH(name) = LENGTH(capital) 

SELECT name, capital FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital

SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%'
 AND name NOT LIKE '% %' AND name LIKE '%o%' AND name LIKE '%u%'

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

SELECT yr, Subject FROM nobel
WHERE winner = 'Albert Einstein'

SELECT winner FROM nobel
WHERE yr >= 2000 AND subject = 'Peace'

SELECT yr,subject, winner FROM nobel
WHERE yr BETWEEN 1980 AND 1989 AND subject ='Literature'

SELECT * FROM nobel
 WHERE 
   winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

SELECT winner FROM nobel
WHERE winner LIKE 'John%'

SELECT * FROM nobel
WHERE (yr = 1980 AND Subject ='Physics' OR yr = 1984 AND subject = 'Chemistry')

SELECT * FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine')

SELECT * FROM nobel
WHERE yr < 1910 AND subject = 'Medicine' OR yr >= 2004 AND subject = 'Literature'

SELECT * FROM nobel
WHERE winner LIKE 'PETER GRÜNBERG'

SELECT * FROM nobel
WHERE winner LIKE 'EUGENE O_NEILL'

SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'sir%' 
ORDER BY yr DESC 

SELECT winner,subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'),subject,winner

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name FROM world
WHERE GDP/Population >(SELECT GDP/population FROM world
WHERE name = 'United Kingdom') AND continent = 'Europe'

-- nested select-->

SELECT SUM(population)
FROM world

SELECT DISTINCT continent FROM world

SELECT SUM(GDP) FROM world
WHERE continent = 'Africa'

SELECT COUNT(area) FROM world
WHERE area >= 1000000

SELECT SUM(population)FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

SELECT continent, COUNT(name) FROM world
GROUP BY continent

SELECT  continent, COUNT(population) FROM world
WHERE population >= 10000000
GROUP BY continent

  -- SUM and Counting number 8->
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

SELECT DISTINCT id,stadium,team1,team2
  FROM game
INNER JOIN goal
ON game.id = goal.matchid
WHERE matchid = 1012

SELECT player,  teamid, stadium, mdate
  FROM game INNER JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

SELECT team1, team2, player FROM game
JOIN goal
ON id = matchid
WHERE player LIKE 'Mario%'

SELECT player, teamid,coach, gtime
  FROM goal
JOIN eteam
ON teamid = id
 WHERE gtime<=10

SELECT mdate, teamname FROM game
JOIN eteam
ON eteam.id = team1
WHERE coach = 'Fernando Santos'

SELECT player FROM game
JOIN goal
ON id = matchid
WHERE stadium = 'National Stadium, Warsaw'

SELECT id, title
 FROM movie
 WHERE yr=1962

SELECT yr FROM movie
WHERE title = 'Citizen Kane'

SELECT id, title, yr FROM movie
WHERE title LIKE'Star Trek%'
ORDER BY yr

SELECT id FROM actor
WHERE name = 'Glenn Close'

SELECT id FROM movie
WHERE title = 'Casablanca'

SELECT name FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON actor.id = casting.actorid
WHERE movieid=11768

SELECT name FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON actor.id = casting.actorid
WHERE title =  'Alien'

SELECT title FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON actor.id = casting.actorid
WHERE name =  'Harrison Ford'

SELECT title FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON actor.id = casting.actorid
WHERE name =  'Harrison Ford' AND ord !=1

--Using NULL
1. SELECT name FROM teacher
WHERE dept IS NULL

2. SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

3. SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

4. SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

5. SELECT name, COALESCE(mobile,  '07986 444 2266') FROM teacher
6. SELECT teacher.name, COALESCE(dept.name, 'None')
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
7. SELECT COUNT(name), COUNT(mobile) FROM teacher

8. SELECT dept.name, COUNT( teacher.name)
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)
GROUP BY dept.name

9. SELECT name, CASE WHEN dept =1 THEN 'Sci' 
WHEN dept = 2 THEN  'Sci'
ELSE 'Art'
END
FROM teacher

10.  SELECT name, CASE WHEN dept =1 THEN 'Sci' 
WHEN dept = 2 THEN  'Sci'
WHEN dept = 3 THEN 'Art'
ELSE 'None'
END
FROM teacher

--SELF JOIN
SELECT COUNT(id) FROM stops

SELECT id FROM stops
WHERE name = 'Craiglockhart'

SELECT id, name FROM stops
JOIN route 
ON stops.id = route.stop
WHERE num = 4 AND company = 'LRT'

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) > 1
