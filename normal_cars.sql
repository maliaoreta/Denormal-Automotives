-- CREATE TABLE make_codes_titles 
-- AS SELECT DISTINCT make_code, make_title FROM car_models;
-- ALTER TABLE make_codes_titles ADD COLUMN
--   id SERIAL PRIMARY KEY;

-- ALTER TABLE car_models ADD COLUMN
--   makes_id INTEGER REFERENCES make_codes_titles (id);

-- UPDATE car_models SET makes_id = (
--   SELECT id FROM make_codes_titles
--   WHERE car_models.make_title = make_codes_titles.make_title
-- );


-- CREATE TABLE model_codes_titles AS SELECT DISTINCT model_code, model_title FROM car_models;

-- ALTER TABLE model_codes_titles ADD COLUMN
--   id SERIAL PRIMARY KEY;

-- ALTER TABLE model_codes_titles ADD COLUMN
--   makes_id INTEGER REFERENCES make_codes_titles (id);

-- UPDATE model_codes_titles SET makes_id = car_models.makes_id
-- FROM car_models
-- WHERE car_models.model_code = model_codes_titles.model_code;

-- ALTER TABLE car_models ADD COLUMN
--   models_id INTEGER REFERENCES model_codes_titles (id);

-- UPDATE car_models SET models_id = model_codes_titles.id
-- FROM model_codes_titles
-- WHERE car_models.model_code = model_codes_titles.model_code;

-- ************** double check create cars, missing rows ***********
-- CREATE TABLE cars (
--   models_id INTEGER REFERENCES model_codes_titles (id),
--   year INTEGER
-- );
-- INSERT INTO cars (year, models_id)
--   SELECT DISTINCT year, models_id FROM car_models ORDER BY models_id;

-- Create a query to get a list of all make_title values in the car_models table. (should have 71 results)
-- SELECT make_title FROM make_codes_titles;

-- Create a query to list all model_title values where the make_code is 'VOLKS' (should have 27 results)
-- SELECT model_title FROM model_codes_titles
-- INNER JOIN make_codes_titles
-- ON make_codes_titles.id = model_codes_titles.makes_id
-- WHERE make_code = 'VOLKS';

-- Create a query to list all make_code, model_code, model_title, and year from car_models where the make_code is 'LAM' (should have 136 rows)
-- SELECT make_code, model_code, model_title, year FROM cars
-- INNER JOIN model_codes_titles
-- ON model_codes_titles.id = cars.models_id
-- INNER JOIN make_codes_titles
-- ON make_codes_titles.id = model_codes_titles.makes_id
-- WHERE make_code = 'LAM';

-- Create a query to list all fields from all car_models in years between 2010 and 2015 (should have 7884 rows)
-- SELECT make_code, make_title, model_code, model_title, year FROM cars
-- INNER JOIN model_codes_titles
-- ON model_codes_titles.id = cars.models_id
-- INNER JOIN make_codes_titles
-- ON make_codes_titles.id = model_codes_titles.makes_id
-- WHERE year BETWEEN 2010 AND 2015;