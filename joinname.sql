select fixtures.game_id,
T1.team_name AS HOME,
T2.team_name AS AWAY
FROM southperth.fixtures
INNER JOIN teams as T1
on T1.team_id = fixtures.home_team 
INNER JOIN teams AS T2
on T2.team_id = fixtures.away_team 
