-- CREATE TABLE make_codes_titles AS SELECT DISTINCT make_code, make_title FROM car_models;
-- ALTER TABLE make_codes_titles ADD COLUMN
--   id SERIAL PRIMARY KEY;

-- CREATE TABLE model_codes_titles AS SELECT DISTINCT model_code, model_title FROM car_models;
-- ALTER TABLE model_codes_titles ADD COLUMN
--   id SERIAL PRIMARY KEY;

-- CREATE TABLE years AS SELECT DISTINCT year FROM car_models ORDER BY year ASC;
-- ALTER TABLE years ADD COLUMN
--   id SERIAL PRIMARY KEY;

-- CREATE TABLE cars (
--   id SERIAL PRIMARY KEY,
--   make_id INTEGER REFERENCES make_codes_titles,
--   model_id INTEGER REFERENCES model_codes_titles,
--   year_id INTEGER REFERENCES years
-- );

INSERT INTO cars (make_id, model_id, year_id)
  SELECT 
  (SELECT id FROM make_codes_titles WHERE make_code = 'ACURA'),
  (SELECT id FROM model_codes_titles WHERE model_code = 'CL_MODELS'),
  id
  FROM years
  WHERE year > 1999;




-- sample subquery:
-- SELECT (SELECT id FROM make_codes_titles WHERE make_code = 'ACURA') AS make_id
