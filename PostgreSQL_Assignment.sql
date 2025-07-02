-- Create a new database named conservation_db
CREATE DATABASE conservation_db;

-- Create table for rangers
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100)
);

-- Create table for species
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

-- Create table for sightings
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT NOT NULL,
    species_id INT NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id),
    FOREIGN KEY (species_id) REFERENCES species(species_id)
);

-- Insert sample data into rangers table
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

-- Insert sample data into species table
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

-- Insert sample data into sightings table
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


-- Problem 1: Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers (name, region) VALUES
('Derek Fox', 'Coastal Plains');


-- Problem 2: Count unique species ever sighted.
SELECT count(DISTINCT species_id) AS unique_species_count FROM sightings;

-- Problem 3: Find all sightings where the location includes "Pass".
SELECT * FROM sightings WHERE location LIKE '%Pass%';

-- Problem 4: List each ranger's name and their total number of sightings.
SELECT name, count(sighting_id) AS total_sightings FROM sightings NATURAL JOIN rangers GROUP BY name ORDER BY name;

-- Problem 5: List species that have never been sighted.
SELECT common_name FROM sightings 
RIGHT JOIN species ON sightings.species_id = species.species_id 
WHERE sightings.sighting_id IS NULL;

-- Problem 6: Show the most recent 2 sightings.
SELECT common_name, sighting_time, name FROM sightings 
NATURAL JOIN species NATURAL JOIN rangers 
ORDER BY sighting_time DESC LIMIT 2;

-- Problem 7: Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species 
SET conservation_status = 'Historic' 
WHERE discovery_date < '1800-01-01';

-- Problem 8: Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT sighting_id, 
       CASE 
           WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
           WHEN EXTRACT(HOUR FROM sighting_time) < 18 THEN 'Afternoon'
           ELSE 'Evening'
       END AS time_of_day FROM sightings;

-- Problem 9: Delete rangers who have never sighted any species
DELETE FROM rangers 
WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings);

SELECT * FROM rangers;

SELECT * FROM species;

SELECT * FROM sightings;