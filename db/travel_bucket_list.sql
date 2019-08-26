DROP TABLE adventures;
DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries (
  id SERIAL4 PRIMARY KEY,
  country VARCHAR(255)
);

CREATE TABLE cities (
  id SERIAL4 PRIMARY KEY,
  city VARCHAR(255),
  country_id INT4 REFERENCES countries(id)
);

CREATE TABLE adventures (
  id SERIAL4 PRIMARY KEY,
  city_id INT4 REFERENCES cities(id),
  visited BOOLEAN,
  RATING INT4
);
