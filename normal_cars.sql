CREATE TABLE make_codes_titles AS SELECT DISTINCT make_code, make_title FROM car_models;

ALTER TABLE make_codes_titles ADD COLUMN
  id SERIAL PRIMARY KEY;