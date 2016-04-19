-- CREATE TABLE make_codes_titles AS SELECT DISTINCT make_code, make_title FROM car_models;
-- ALTER TABLE make_codes_titles ADD COLUMN
--   id SERIAL PRIMARY KEY;

-- CREATE TABLE model_codes_titles AS SELECT DISTINCT model_code, model_title FROM car_models;
-- ALTER TABLE model_codes_titles ADD COLUMN
--   id SERIAL PRIMARY KEY;

CREATE TABLE years AS SELECT DISTINCT year FROM car_models ORDER BY year ASC;
ALTER TABLE years ADD COLUMN
  id SERIAL PRIMARY KEY;