CREATE DATABASE  TOURNAMENT;

CREATE TABLE TEAMS (

id_team  SERIAL primary key,
nickname varchar(15)
);

CREATE TABLE MATCHES (
id_match  SERIAL primary key,
date_match DATE,
goals_local int,
goals_visitor int,



);

CREATE TABLE TOURNAMENT (
    id_tournament SERIAL primary key,
    start_date DATE,
    end_date DATE,
    place varchar(30)
);

