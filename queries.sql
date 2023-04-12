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




SELECT  full_name, name
   FROM animals
   INNER JOIN owners
   ON animals.owners_id = owners.id
WHERE owners_id = 4;


SELECT  animals.name, species.name
   FROM animals
   INNER JOIN species
   ON animals.species_id = species.id
WHERE species.name = 'Pokemon';
  

SELECT  full_name, name
   FROM animals
   RIGHT JOIN owners
   ON animals.owners_id = owners.id;


SELECT  species.name, count(animals.name)
   FROM animals
   INNER JOIN species
   ON animals.species_id = species.id
GROUP BY species.name;


SELECT  animals.name, full_name, species.name as species_name
   FROM animals
   INNER JOIN owners 
   ON animals.owners_id = owners.id
   INNER JOIN species 
   ON animals.species_id = species.id
where full_name = 'Jennifer Orwell' and species.name = 'Digimon';


SELECT  animals.name, full_name, escape_attempts
   FROM animals
   INNER JOIN owners 
   ON animals.owners_id = owners.id
   INNER JOIN species 
   ON animals.species_id = species.id
where full_name = 'Dean Winchester' and escape_attempts = 0;


SELECT full_name, COUNT(animals.name)
     FROM animals
     INNER JOIN owners 
     ON animals.owners_id = owners.id
  GROUP BY full_name
  order by COUNT(animals.name) DESC LIMIT 1;


SELECT  animals.name, vets.name, visits.visit_date
   FROM animals
   INNER JOIN visits
   ON animals.id = visits.animals_id
   INNER JOIN vets 
   ON vets.id = visits.vets_id
where vets.name = 'William Tatcher'
order by visits.visit_date DESC LIMIT 1;


SELECT  COUNT(animals.name), vets.name
   FROM animals
   INNER JOIN visits
   ON animals.id = visits.animals_id
   INNER JOIN vets 
   ON vets.id = visits.vets_id
where vets.name = 'Stephanie Mendez'
GROUP BY vets.name;


SELECT vets.name, species.name 
   FROM vets
   LEFT JOIN specializations
   ON vets.id = specializations.vets_id
   LEFT JOIN species
   ON species.id = specializations.species_id;


SELECT  animals.name,  visits.visit_date
   FROM animals
   INNER JOIN visits
   ON animals.id = visits.animals_id
   INNER JOIN vets 
   ON vets.id = visits.vets_id
where vets.name = 'Stephanie Mendez' and  visits.visit_date  BETWEEN '2020-04-01' AND '2020-08-30';


SELECT  animals.name, COUNT(animals.name) 
   FROM animals
   INNER JOIN visits
   ON animals.id = visits.animals_id
   INNER JOIN vets 
   ON vets.id = visits.vets_id
group by animals.name
order by COUNT(animals.name) DESC LIMIT 1;


SELECT  animals.name, vets.name, visits.visit_date
   FROM animals
   INNER JOIN visits
   ON animals.id = visits.animals_id
   INNER JOIN vets 
   ON vets.id = visits.vets_id
where vets.name = 'Maisy Smith'
order by visits.visit_date ASC LIMIT 1;


SELECT  animals.name as animal_name, date_of_birth , escape_attempts, neutered, weight_kg, animals.species_id,  vets.name as vets_name, vets.age, vets.date_of_graduation,  specializations.species_id, visits.visit_date
   FROM animals
   INNER JOIN visits
   ON animals.id = visits.animals_id
   INNER JOIN vets 
   ON vets.id = visits.vets_id
   LEFT JOIN specializations
   ON  vets.id = specializations.vets_id;
   
SELECT  count (animals.name)
   FROM animals
   INNER JOIN visits
   ON animals.id = visits.animals_id
   INNER JOIN vets 
   ON vets.id = visits.vets_id
   LEFT JOIN specializations
   ON  vets.id = specializations.vets_id
where animals.species_id != specializations.species_id OR  specializations.species_id IS NULL;


SELECT species.name, count(*) as number_of_visits
   FROM animals
   INNER JOIN visits
   ON animals.id = visits.animals_id
   INNER JOIN vets 
   ON vets.id = visits.vets_id
   LEFT JOIN specializations
   ON  vets.id = specializations.vets_id

   INNER JOIN species
   ON species.id = animals.species_id


where vets.name = 'Maisy Smith'
group by species.name;



CREATE INDEX animal_id_asc ON visits(animal_id ASC);
CREATE INDEX vet_id_asc ON visits(vet_id ASC);
CREATE INDEX email_asc ON owners(email ASC);

