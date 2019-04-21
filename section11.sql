#Udemy The Ultimate MySQL Bootcamp Colt Steele 2018.02.06

SELECT title FROM books WHERE released_year != 2017;

SELECT title FROM books WHERE title LIKE 'W%';

SELECT title FROM books WHERE title NOT LIKE 'W%';

SELECT * FROM books WHERE released_year > 2000;

SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;

SELECT 99 > 1;
#returns 1 if true, 0 if false (boolean)

SELECT 'a' > 'b'; #returns 0
SELECT 'a' < 'b'; #returns 1
SELECT 'A' > 'a'; #returns 0
SELECT 'A' = 'a'; #returns 1
#in mysql 'b' is greater than 'a' and strings are not case sensitive ('B' = 'b')

SELECT title, released_year FROM books WHERE released_year <= 2000;

SELECT * FROM books WHERE author_lname='Eggers' AND released_year > 2010;
SELECT * FROM books WHERE author_lname='Eggers' && released_year > 2010;
SELECT * FROM books WHERE author_lname='Eggers' && released_year > 2010 AND title LIKE '%novel%';

SELECT * FROM books WHERE author_lname='Eggers' OR released_year > 2010;
SELECT * FROM books WHERE author_lname='Eggers' || released_year > 2010;
SELECT * FROM books WHERE author_lname='Eggers' OR released_year > 2010 || stock_quantity > 100;

SELECT * FROM books WHERE released_year >= 2004 AND  released_year <= 2015;
SELECT * FROM books WHERE released_year BETWEEN 2004 AND 2015;
#between function is inclusive eg. between 1 and 4 includes both 1 and 4
SELECT * FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;

SELECT CAST('2015-10-05' AS DATETIME);

SELECT name, bdt FROM bday WHERE bdt BETWEEN '1980-01-01' AND '2001-01-01';
SELECT name, bdt FROM bday WHERE bdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2001-01-01' AS DATETIME);
#although the first would work, when comparing a date, time or datetime object to 'strings' or differnt type, you should use cast function to avoid comparing unlike types

SELECT title, author_lname FROM  books WHERE
    author_lname = 'Carver' OR
    author_lname = 'Lahiri' OR
    author_lname = 'Smith';

SELECT title, author_lname FROM books WHERE
    author_lname IN ('Carver', 'Lahiri', 'Smith');
#IN operator allows you to shorten multiple comparisons

SELECT title, author_lname, released_year FROM books WHERE
    released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016)
    ORDER BY 3;

SELECT title, author_lname, released_year FROM books WHERE released_year >= 2000 AND
    released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016)
    ORDER BY 3;

SELECT title, author_lname, released_year FROM books WHERE released_year >= 2000 AND
    released_year % 2 != 0 ORDER BY 3;
#MODULO (%) operator refers to the remainder of the x / n, for even numbers x % 2 will always be 0, for odd numbers x % 2 will always be 1

SELECT title, released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit' ELSE '20th Century Lit'
    END AS 'ERA'
FROM books;
#CASE AND END FUNCTION

SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS 'Le Stock'
FROM books;

SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS 'Le Stock'
FROM books;

#0 1 1

SELECT * FROM books WHERE released_year < 1980;
SELECT * FROM books WHERE author_lname in ('Eggers', 'Chabon');
SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;
SELECT * FROM books WHERE author_lname LIKE 'c%' OR author_lname LIKE 's%';
SELECT * FROM books WHERE SUBSTR(author_lname, 1, 1) IN ('C', 'S');

SELECT title, author_lname,
    CASE
        WHEN title LIKE '%stories' THEN 'Short Stories'
        WHEN title IN ('Just Kids', 'A Heartbreaking Work of Staggering Genius') THEN 'Memoir'
        ELSE 'Novel'
    END AS 'type'
FROM books;

SELECT author_lname,
    CASE
        WHEN count(concat(author_lname, ' ', author_fname)) = 3 THEN '3 Books'
        WHEN count(concat(author_lname, ' ', author_fname)) = 2 THEN '2 Books'
        ELSE '1 book'
    END AS 'Count'
FROM books
GROUP BY 1;

SELECT author_lname, author_fname,
    CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS Count
FROM books
GROUP BY author_lname, author_fname;
#instructors way, much better
