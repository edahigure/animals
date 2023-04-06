/* Database schema to keep the structure of entire database. */

CREATE TABLE owners(
  id            INT GENERATED ALWAYS AS IDENTITY,
  full_name    		VARCHAR(100),
  age               INT,
  PRIMARY KEY(id)
);

CREATE TABLE species(
  id            INT GENERATED ALWAYS AS IDENTITY,
  name    		VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE animals(
  id            INT GENERATED ALWAYS AS IDENTITY,
  name    		VARCHAR(100),
  date_of_birth         DATE,
  escape_attempts    INT,
  neutered     boolean,
  weight_kg    REAL,
  species_id INT references species(id),
  owners_id INT references owners(id),
  CONSTRAINT fk_species
      FOREIGN KEY(species_id) 
	  REFERENCES species(id)
      ON DELETE SET NULL,
  CONSTRAINT fk_owners
      FOREIGN KEY(owners_id) 
	  REFERENCES owners(id)
      ON DELETE SET NULL,
  PRIMARY KEY(id)
);
