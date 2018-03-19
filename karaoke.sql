DROP TABLE occupants;
DROP TABLE playlist;
DROP TABLE customers;
DROP TABLE songs;
DROP TABLE rooms;


CREATE TABLE songs(
  id SERIAL8 PRIMARY KEY,
  artist VARCHAR(255),
  title VARCHAR(255)
);

CREATE TABLE customers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR,
  cash INT,
  favorite_song INT8 REFERENCES songs(id)
);


CREATE TABLE rooms(
  id SERIAL8 PRIMARY KEY,
  name INT,
  max_capacity INT,
  capacity INT,
  entry_fee INT,
  total_cash INT
);

CREATE TABLE playlist(
  room_id INT8 REFERENCES rooms(id),
  song_id INT8 REFERENCES songs(id)
);

CREATE TABLE occupants(
  room_id INT8 REFERENCES rooms(id),
  customer_id INT8 REFERENCES customers(id)
);

INSERT INTO songs(artist,title) VALUES ('Brittney Spears','Toxic');
INSERT INTO songs(artist,title) VALUES ('Unkown Artist','Song1');
INSERT INTO songs(artist,title) VALUES ('Unkown Artist','Song2');
INSERT INTO songs(artist,title) VALUES ('Unkown Artist','Song3');
INSERT INTO songs(artist,title) VALUES ('Unkown Artist','Song4');
INSERT INTO songs(artist,title) VALUES ('Unkown Artist','Song5');
INSERT INTO songs(artist,title) VALUES ('Unkown Artist','Song6');
INSERT INTO customers(name,cash,favorite_song) VALUES ('Jack',100,3);
INSERT INTO customers(name,cash,favorite_song) VALUES ('Tony',11500,5);
INSERT INTO customers(name,cash,favorite_song) VALUES ('Pawel',500,1);
INSERT INTO rooms(name,max_capacity,capacity,entry_fee,total_cash) VALUES (1,10,0,5,0);
INSERT INTO rooms(name,max_capacity,capacity,entry_fee,total_cash) VALUES (2,10,0,5,0);
INSERT INTO rooms(name,max_capacity,capacity,entry_fee,total_cash) VALUES (3,10,0,5,0);

UPDATE customers SET cash = 0 WHERE id = 3;


INSERT INTO occupants(room_id,customer_id) VALUES (2,1);
INSERT INTO occupants(room_id,customer_id) VALUES (2,2);
INSERT INTO occupants(room_id,customer_id) VALUES (1,3);

SELECT * FROM songs ORDER BY id;
SELECT * FROM customers ORDER BY id;
SELECT * FROM rooms ORDER BY id;
SELECT name,cash FROM customers;
SELECT * FROM songs WHERE title = 'Song1';

-- EOF
