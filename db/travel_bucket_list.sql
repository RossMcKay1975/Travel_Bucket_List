DROP TABLE bucket_list;
DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE cities (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  country_id INT4 REFERENCES countries(id)
);

CREATE TABLE bucket_list (
  id SERIAL4 PRIMARY KEY,
  city_id INT4 REFERENCES cities(id) UNIQUE,
  visited BOOLEAN,
  RATING INT4
);
