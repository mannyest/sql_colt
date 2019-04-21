#Udemy The Ultimate MySQL Bootcamp Colt Steele 2018.01.28

SELECT COUNT(*) FROM books;

SELECT COUNT(DISTINCT(author_lname)) FROM books;

SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;

SELECT COUNT(title) FROM books WHERE title LIKE '%the%';

SELECT title, author_lname FROM books GROUP BY author_lname;

SELECT concat
(   'In ',
    released_year, ' ',
    COUNT(released_year),
    ' book was released') AS year
FROM books
GROUP BY released_year ORDER BY COUNT(released_year) DESC;


SELECT MIN(released_year) FROM books;
SELECT MAX(released_year) FROM books;
SELECT MAX(pages) FROM books;
SELECT MAX(pages), title FROM books; #non-aggregate, can lead to incorrect items returned

SELECT title, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);
#subquery: perform nested query first and use value returned as condition for primary query

SELECT title, pages FROM books ORDER BY 2 DESC LIMIT 1;
#another alternative but generall faster the subquery

SELECT MIN(released_year), author_lname FROM books GROUP BY author_lname;

SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;

SELECT author_fname, author_lname, MAX(pages) FROM books GROUP BY author_lname, author_fname;

SELECT concat(author_fname, ' ', author_lname) AS name, MAX(pages) AS 'longest book' FROM books GROUP BY author_lname, author_fname;

SELECT SUM(pages) FROM books;
SELECT SUM(pages) FROM books GROUP BY author_lname;
SELECT author_lname, SUM(pages) FROM books GROUP BY 1;
SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;

SELECT AVG(stock_quantity) FROM books;
SELECT title, AVG(released_year) FROM books GROUP BY 1;
SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year;
SELECT concat(author_fname, ' ', author_lname) AS 'author name', AVG(pages) FROM books GROUP BY 1;

SELECT COUNT(stock_quantity) FROM books;

SELECT COUNT(title), released_year FROM books GROUP BY 2 ORDER BY 1 DESC;

SELECT SUM(stock_quantity) FROM books;

SELECT CONCAT(author_lname, ' ', author_fname) as fName, AVG(released_year) FROM books GROUP BY 1;

SELECT CONCAT(author_fname, ' ', author_lname) as full_name, MAX(pages) FROM books GROUP BY 1 ORDER BY 2 DESC LIMIT 1;

SELECT released_year as year, COUNT(book_id) as '# books', AVG(pages) as 'avg pages' FROM books GROUP BY 1;
