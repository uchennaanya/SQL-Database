SELECT matchid, player FROM goal
  WHERE teamid = 'GER'

SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER'

SELECT team1, team2, player 
  FROM game JOIN goal ON (id=matchid) WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid =id)
    WHERE gtime<=10

SELECT mdate, teamname 
    FROM game JOIN eteam ON (team1=eteam.id) 
            WHERE coach = 'Fernando Santos'

SELECT player FROM game JOIN goal ON (id=matchid) 
    WHERE stadium = 'National Stadium, Warsaw'

SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY (teamname)
 ORDER BY teamname

SELECT stadium, COUNT(stadium) FROM game JOIN goal ON (id = matchid) GROUP BY stadium

SELECT matchid,mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid, mdate

SELECT matchid, mdate, COUNT(player)
FROM game JOIN goal ON id = matchid
WHERE teamid = 'GER' AND 'GER' IN (game.team1, game.team2)
GROUP BY matchid, mdate

SELECT
  mdate,
  team1,
  sum(
    CASE
      WHEN teamid = team1 THEN 1
      ELSE 0
    END
  ) score1,
  team2,
  sum(
    CASE
      WHEN teamid = team2 THEN 1
      ELSE 0
    END
  ) score2
FROM
  game
  LEFT JOIN goal ON id = matchid
GROUP BY
  mdate,
  team1,
  team2
ORDER BY
  mdate,
  matchid,
  team1,
  team2;