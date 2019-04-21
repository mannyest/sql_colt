#Udemy The Ultimate MySQL Bootcamp Colt Steele 2018.01.24

DROP TABLE cats;

CREATE TABLE cats
(
    cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    breed VARCHAR(255),
    age INT
    );

INSERT INTO cats(name, breed, age)
VALUES  ('Ringo', 'Tabby', 4),
        ('Cindy', 'Maine Coon', 10),
        ('Dumbledore', 'Maine Coon', 11),
        ('Egg', 'Persian', 4),
        ('Misty', 'Tabby', 13),
        ('George Michael', 'Ragdoll', 9),
        ('Jackson', 'Sphynx', 7);

SELECT * FROM cats;
SELECT name FROM cats;
SELECT * FROM cats WHERE age=4;
SELECT * FROM cats WHERE name='EgG'
; # _ case in-sensitive

SELECT cat_id FROM cats;
SELECT name, breed FROM cats;
SELECT name, age FROM cats WHERE breed='Tabby';
SELECT cat_id, age FROM cats WHERE cat_id=age;


SELECT cat_id AS id, name FROM cats;


UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
UPDATE cats SET age=14 WHERE name='Misty';
UPDATE cats SET name='Jack' WHERE name='Jackson';
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
UPDATE cats SET age=12 WHERE breed='Maine Coon';

DELETE FROM cats WHERE name='EGG';
DELETE FROM cats WHERE age=4;
DELETE FROM cats WHERE age=cat_id;
DELETE FROM cats;


CREATE DATABASE shirts_db;



CREATE TABLE shirts (
    shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(40) NOT NULL,
    color VARCHAR(25) NOT NULL DEFAULT 'plain',
    shirt_size VARCHAR(3) NOT NULL,
    last_worn INT
    );

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt', 'purple', 'M', 50);

SELECT article, color FROM shirts;
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size = 'M';

UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';
UPDATE shirts SET last_worn=0 WHERE last_worn=15;
UPDATE shirts SET shirt_size='xs', color='off white' WHERE color='white';

DELETE FROM shirts WHERE last_worn=200;
DELETE FROM shirts WHERE article='tank top';
DELETE FROM shirts;
DROP TABLE shirts;

