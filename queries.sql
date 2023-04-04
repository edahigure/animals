/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animals WHERE name LIKE '%mon';

SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2018-12-31';

SELECT * FROM animals WHERE neutered IN('1') AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN('Agumon','Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT name FROM animals WHERE neutered  IN('1');

SELECT name FROM animals WHERE name  NOT IN('Gabumon');

SELECT name FROM animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;



BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';

UPDATE animals
SET species = 'digimon'
WHERE  name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE  name NOT LIKE '%mon';

COMMIT TRANSACTION;


BEGIN TRANSACTION;
DELETE FROM animals;
select * from animals;
ROLLBACK TRANSACTION;


BEGIN TRANSACTION;
DELETE FROM animals
WHERE date_of_birth >= '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg= -1*weight_kg;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg= -1*weight_kg WHERE weight_kg < 0;
COMMIT TRANSACTION;


SELECT COUNT(name) FROM animals;

SELECT COUNT(escape_attempts) 
FROM 
    animals 
WHERE escape_attempts = 0;


SELECT AVG(weight_kg) FROM animals;


SELECT  neutered, COUNT(name) as escape_attempts
FROM 
    animals 
WHERE escape_attempts > 0
GROUP BY neutered;


SELECT species, MIN(weight_kg) as min ,  MAX(weight_kg) as max
FROM
    animals
GROUP BY species;


SELECT species, AVG(escape_attempts)
FROM
    animals
WHERE  date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;


