DROP TABLE adventure;
DROP TABLE cities;
DROP TABLE countries;


CREATE TABLE country (
  id SERIAL4 PRIMARY KEY,
  country_name VARCHAR(255)
);

CREATE TABLE city (
  id SERIAL4 PRIMARY KEY,
  city_name VARCHAR(255),
  country_id INT4 REFERENCES country(id)
);

CREATE TABLE adventure (
  id SERIAL4 PRIMARY KEY,
  city_id INT4 REFERENCES city(id),
  visited BOOLEAN,
  RATING INT4
);
