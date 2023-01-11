-- creating schema for PostgreSQL
create database freaky_league;
-- \c freaky_league
create table tournaments (
id serial primary key,
start_date date,
end_date date,
place text
);
create table teams (id serial primary key, nickname text);
-- tinyint exists in MariaDB but not in PostgreSQL
create table matches (
id serial primary key,
match_date date,
id_home int references matches (id),
id_visitor int references matches (id),
goals_home smallint,

goals_visitor smallint,
tournament int references tournaments (id)
);

-- creating schema for MariaDB
create database freaky_league;
-- \c freaky_league
create table tournaments (
id int auto_increment primary key,
start_date date,
end_date date,
place text
);
create table teams (id int auto_increment primary key, nickname text);
-- tinyint exists in MariaDB but not in PostgreSQL
create table matches (
id int auto_increment primary key,
match_date date,
id_home int references matches (id),
id_visitor int references matches (id),
tournament int references tournaments (id)
goals_home smallint,
goals_visitor smallint
);
4.- Populate the tables with data:
-- populating tables (it works for MariaDB and PostgreSQL).
INSERT INTO teams (id, nickname)
VALUES (1, 'Monkey'),
(2, 'Dog'),
(3, 'Earnie'),
(4, 'Flip');
INSERT INTO tournaments (start_date, end_date, place)
VALUES ('2016-1-2', '2016-1-2', 'Can Miki'),
('2016-2-13', '2016-2-13', 'Can Sergi'),
('2016-5-6', '2016-5-6', 'Can Miki');
INSERT INTO matches (
id_home,
id_visitor,
goals_home,
goals_visitor,
match_date,
tournament
)
VALUES (1, 2, 2, 3, '2016-1-2', 1),
(3, 4, 1, 1, '2016-1-2', 1),
(2, 1, 1, 2, '2016-1-2', 1),
(4, 3, 1, 0, '2016-1-2', 1),
(1, 3, 4, 1, '2016-1-2', 1),
(2, 4, 0, 1, '2016-1-2', 1),
(3, 1, 1, 1, '2016-1-2', 1),

(4, 2, 0, 3, '2016-1-2', 1),
(1, 2, 3, 3, '2016-2-13', 2),
(3, 4, 3, 1, '2016-2-13', 2),
(2, 1, 1, 4, '2016-2-13', 2),
(4, 3, 0, 2, '2016-2-13', 2),
(1, 3, 4, 2, '2016-2-13', 2),
(2, 4, 4, 2, '2016-2-13', 2),
(3, 1, 2, 1, '2016-2-13', 2),
(4, 2, 4, 3, '2016-2-13', 2),
(1, 2, 0, 1, '2016-5-6', 3),
(3, 4, 2, 1, '2016-5-6', 3),
(2, 1, 1, 1, '2016-5-6', 3),
(4, 3, 3, 2, '2016-5-6', 3),
(1, 3, 1, 2, '2016-5-6', 3),
(2, 4, 2, 3, '2016-5-6', 3),
(3, 1, 2, 1, '2016-5-6', 3),
(4, 2, 1, 2, '2016-5-6', 3);
5.- Execute the following query:
SELECT Team,
SUM(Points) As Points,
SUM(Won) As Won,
SUM(Drawn) As Drawn,
SUM(Lost) As Lost,
SUM(GF) As GF,
SUM(GA) As GA,
(SUM(GF) - SUM(GA)) AS GD
FROM (
(
SELECT nickname AS Team,
SUM(
CASE
WHEN goals_home > goals_visitor THEN 3
WHEN goals_home = goals_visitor THEN 1
ELSE 0
END
) AS Points,
SUM(
CASE
WHEN goals_home > goals_visitor THEN 1
ELSE 0
END
) AS Won,
SUM(
CASE
WHEN goals_home = goals_visitor THEN 1
ELSE 0
END
) AS Drawn,
SUM(
CASE
WHEN goals_home < goals_visitor THEN 1
ELSE 0
END

) AS Lost,
SUM(goals_home) AS GF,
SUM(goals_visitor) AS GA
FROM matches m,
teams thome
WHERE m.id_home = thome.id
GROUP BY nickname
)
UNION ALL
(
SELECT nickname AS Team,
SUM(
CASE
WHEN goals_visitor > goals_home THEN 3
WHEN goals_home = goals_visitor THEN 1
ELSE 0
END
) AS Points,
SUM(
CASE
WHEN goals_visitor > goals_home THEN 1
ELSE 0
END
) AS Won,
SUM(
CASE
WHEN goals_visitor = goals_home THEN 1
ELSE 0
END
) AS Drawn,
SUM(
CASE
WHEN goals_visitor < goals_home THEN 1
ELSE 0
END
) AS Lost,
SUM(goals_visitor) AS GF,
SUM(goals_home) AS GA
FROM matches m,
teams tvisitor
WHERE m.id_visitor = tvisitor.id
GROUP BY nickname
)
) tmpTable
GROUP BY Team
ORDER BY Points DESC;

5.a. What does it do exactly?
Displays the table with the score taking into account all the matches of all the tournaments.

6.- Execute the following query:

-- query 2
SELECT Team,
SUM(Points) As Points,
SUM(Won) As Won,
SUM(Drawn) As Drawn,
SUM(Lost) As Lost,
SUM(GF) As GF,
SUM(GA) As GA,
(SUM(GF) - SUM(GA)) AS GD
FROM (
(
SELECT nickname AS Team,
SUM(
CASE
WHEN goals_home > goals_visitor THEN 3
WHEN goals_home = goals_visitor THEN 1
ELSE 0
END
) AS Points,
SUM(
CASE
WHEN goals_home > goals_visitor THEN 1
ELSE 0
END
) AS Won,
SUM(
CASE
WHEN goals_home = goals_visitor THEN 1
ELSE 0
END
) AS Drawn,
SUM(
CASE
WHEN goals_home < goals_visitor THEN 1
ELSE 0
END
) AS Lost,
SUM(goals_home) AS GF,
SUM(goals_visitor) AS GA
FROM matches m,
teams thome
WHERE m.id_home = thome.id
and m.tournament = 2
GROUP BY nickname
)
UNION ALL
(
SELECT nickname AS Team,
SUM(
CASE
WHEN goals_visitor > goals_home THEN 3
WHEN goals_home = goals_visitor THEN 1
ELSE 0
END

) AS Points,
SUM(
CASE
WHEN goals_visitor > goals_home THEN 1
ELSE 0
END
) AS Won,
SUM(
CASE
WHEN goals_visitor = goals_home THEN 1
ELSE 0
END
) AS Drawn,
SUM(
CASE
WHEN goals_visitor < goals_home THEN 1
ELSE 0
END
) AS Lost,
SUM(goals_visitor) AS GF,
SUM(goals_home) AS GA
FROM matches m,
teams tvisitor
WHERE m.id_visitor = tvisitor.id
and m.tournament = 2
GROUP BY nickname
)
) tmpTable
GROUP BY Team
ORDER BY Points DESC;
6.a. What does it do exactly?
Displays the table with the score taking into account only tournament matches with id equal to 2.