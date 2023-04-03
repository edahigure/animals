/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animals WHERE name LIKE '%mon';

SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2018-12-31';

SELECT * FROM animals WHERE neutered IN('1') AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN('Agumon','Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT name FROM animals WHERE neutered  IN('1');

SELECT name FROM animals WHERE name  NOT IN('Gabumon');

SELECT name FROM animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;

