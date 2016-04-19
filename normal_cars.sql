-- \c normal_cars

-- \i ./scripts/denormal_data.sql

-- CREATE TABLE makes (
--   id SERIAL PRIMARY KEY,
--   title VARCHAR( 125 ),
--   code VARCHAR( 125 )
-- );

-- INSERT INTO makes ( title, code )
-- SELECT DISTINCT make_title, make_code FROM car_models;

-- CREATE TABLE models (
--   id SERIAL PRIMARY KEY,
--   makes_id INTEGER REFERENCES makes (id),
--   title VARCHAR( 125 ),
--   code VARCHAR( 125 )
-- );

-- INSERT INTO models ( title, code )
-- SELECT DISTINCT model_title, model_code FROM car_models;

-- ALTER TABLE car_models
-- ADD COLUMN makes_id INTEGER;
-- UPDATE car_models SET makes_id = (
--   SELECT id FROM makes
--   WHERE car_models.make_code = makes.code
--   AND car_models.make_title = makes.title
-- );

-- UPDATE models SET makes_id = (
--   SELECT DISTINCT makes_id
--   FROM car_models
--   WHERE car_models.model_title = models.title
--   AND car_models.model_code = models.code
-- );

-- CREATE TABLE cars (
--   id SERIAL PRIMARY KEY,
--   models_id INTEGER REFERENCES models (id),
--   year INTEGER
-- );

-- ALTER TABLE car_models 
-- ADD COLUMN model_id INTEGER;

-- UPDATE car_models SET model_id = (
--   SELECT id 
--   FROM models
--   WHERE car_models.model_title = models.title
--   AND car_models.model_code = models.code
-- );

-- INSERT INTO cars ( year, models_id ) 
-- SELECT DISTINCT year, model_id FROM car_models;



-- queries after normalizing tables (ref jons gist)
-- In normal.sql Create a query to get a list of all make_title values in the car_models table. (should have 71 results)
-- SELECT title FROM makes;

-- In normal.sql Create a query to list all model_title values where the make_code is 'VOLKS' (should have 27 results)
-- the AS m is an alias
-- SELECT m.title FROM models AS m
-- INNER JOIN makes
-- ON makes.id = m.makes_id
-- WHERE makes.code = 'VOLKS';

-- In normal.sql Create a query to list all make_code, model_code, model_title, and year from car_models where the make_code is 'LAM' (should have 136 rows)
-- SELECT mk.code make_code, md.code model_code, md.title model_title, year
-- FROM makes AS mk
-- INNER JOIN models AS md
-- ON mk.id = md.makes_id -- cannot join to another table without ON
-- INNER JOIN cars AS c
-- ON c.models_id = md.id
-- WHERE mk.code = 'LAM';

-- In normal.sql Create a query to list all fields from all car_models in years between 2010 and 2015 (should have 7884 rows)
-- SELECT models.*
-- FROM models
-- INNER JOIN cars
-- ON cars.models_id = models.id
-- WHERE cars.year BETWEEN 2010 AND 2015;