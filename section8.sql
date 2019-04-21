#Udemy The Ultimate MySQL Bootcamp Colt Steele 2018.01.27

SELECT DISTINCT author_lname FROM books;
#returns only unique values, no duplicates

SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) FROM books;
#one way to return unique full names, Concatenate and then Distinct

SELECT DISTINCT author_fname, author_lname FROM books;
#Distinct itself can take multiple columns to return unique rows

SELECT DISTINCT author_fname, author_lname FROM books ORDER BY author_lname;

SELECT DISTINCT author_fname, author_lname FROM books ORDER BY author_lname DESC;

SELECT title, pages FROM books ORDER BY released_year;
SELECT title, pages, released_year FROM books ORDER BY released_year;
SELECT title, pages, released_year FROM books ORDER BY 3;

SELECT author_fname, author_lname FROM books ORDER BY 2;

SELECT author_fname, author_lname FROM books ORDER BY 2, 1;
#ORDER BY two different columns, first by one and then by the other(s)

SELECT title, released_year FROM books ORDER BY 2 DESC LIMIT 4;
#LIMITS the amount of returned items

SELECT title, released_year FROM books ORDER BY 2 DESC LIMIT 2, 8;
#LIMITS from x to y

SELECT title, released_year FROM books ORDER BY 2 DESC LIMIT 7, 1;
#sometimes used in order to get the 'nth' item on list, eg. 8th from the top

SELECT title, author_lname, author_fname FROM books WHERE author_fname LIKE '%da%';
#LIKE returns WHERE 'da' exist somwhere in author_lname, % represents any characters

SELECT title, author_lname, author_fname FROM books WHERE author_fname LIKE '%da';
#..where _ ends in 'da'

SELECT title, author_lname, author_fname FROM books WHERE author_fname LIKE '___';
#LIKE underscores returns items exactly that length of characters

SELECT title, author_fname FROM books WHERE title LIKE '%\%%';
# \ (backslash) is an escape key, allowing you to return items that contain a '%' symbol itself

SELECT title, author_fname FROM books WHERE title LIKE '%\_%';
# return items that contain an underscore '_' symbold itself

SELECT * FROM books WHERE title LIKE '%stories%';

SELECT title, pages FROM books ORDER BY 2 DESC LIMIT 1;

SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

SELECT title, released_year, stock_quantity FROM books ORDER BY 3 LIMIT 3;

SELECT title, author_lname FROM books ORDER BY 2, 1;

SELECT UPPER
    (
    CONCAT("my favorite author is ", author_fname, ' ', author_lname, '!')
    ) AS yell
FROM books ORDER BY author_lname, author_fname;
