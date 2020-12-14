SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

SELECT name FROM world
  WHERE population = 200000000

SELECT name, population FROM world 
  WHERE name IN ('France', 'Germany', 'Italy')

  