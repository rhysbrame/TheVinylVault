DROP TABLE records;
DROP TABLE artists;
DROP TABLE genres;

CREATE TABLE artists(
  id SERIAL8 primary key,
  artist_name VARCHAR(255) NOT NULL
);

CREATE TABLE genres(
  id SERIAL8 primary key,
  genre_type VARCHAR(255) NOT NULL
);

CREATE TABLE records(
  id SERIAL8 primary key,
  record_title VARCHAR(255) NOT NULL,
  artist_id INT8 REFERENCES artists(id),
  genre_id INT8 REFERENCES genres(id)
);