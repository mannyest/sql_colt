#Udemy The Ultimate MySQL Bootcamp Colt Steele 2018.01.26

SELECT concat(author_fname, ' ', author_lname) AS Full_name FROM books;

SELECT author_fname AS "First Name", author_lname AS "Last Name", CONCAT(author_fname, ' ', author_lname) AS "Full Name" FROM books;

SELECT  CONCAT(author_fname, ' ', author_lname, ' ',  title) FROM books;
SELECT  CONCAT_WS(' ', author_fname, author_lname, title) FROM books;
#CONCAT with separator

SELECT SUBSTRING(title, 1,10) FROM books;
#return from character 1 through 10
SELECT SUBSTRING(title, 8) FROM books;
#8th letter onward
SELECT SUBSTRING(title, -8) FROM books;
#8th letter from end, onward

SELECT SUBSTR(title, 1,10) FROM books;
#SUBSTR is the shorthand of SUBSTRING function, can be used interchangably
SELECT CONCAT(SUBSTR(title, 1,10), '...') FROM books;

SELECT REPLACE(title, 'e', '3') FROM books;

SELECT SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) FROM books;

SELECT REVERSE(title) FROM books;

SELECT title, CHAR_LENGTH(title) AS Length FROM books;

SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long')
FROM books;

SELECT UPPER(title), LOWER(title) FROM books;

SELECT CONCAT('MY FAVORITE BOOK IS ' , UPPER(title), '!') FROM BOOKS;

SELECT REVERSE(UPPER(title))
FROM books;

SELECT REPLACE(title, ' ', '->') AS title
FROM books;

SELECT author_lname as forwards, REVERSE(author_lname) AS backwards
FROM books;

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS "full name in caps"
FROM books;

SELECT CONCAT(title, ' was released in ', released_year) AS blurb
FROM books;

SELECT title, CHAR_LENGTH(title) AS "character count"
FROM books;

SELECT Concat(Substring(title, 1, 10), '...')  AS 'short title',
       Concat(author_lname, ',', author_fname) AS author,
       Concat(stock_quantity, ' in stock')     AS quantity
FROM   books;
