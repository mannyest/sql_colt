#Udemy The Ultimate MySQL Bootcamp Colt Steele 2018.01.31

CREATE TABLE prices (
    book_id CHAR(2) PRIMARY KEY,
    book_price DECIMAL(5,2) NOT NULL
    );

CREATE TABLE bday (
    name VARCHAR(100),
    bdate DATE,
    btime TIME,
    bdt DATETIME
    );

INSERT INTO bday (name, bdate, btime, bdt) VALUES ('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
INSERT INTO bday (name, bdate, btime, bdt) VALUES ('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');

INSERT INTO bday (name, bdate, btime, bdt) VALUES
    ('Toaster', CURDATE(), CURTIME(), NOW());
#CURDATE()= function returns current Date
#CURTIME()= function returns current TIME
#NOW()= function returns current DateTime

SELECT bdate, DAY(bdate) FROM bday;
SELECT bdate, DAYNAME(bdate) FROM bday;
SELECT bdate, DAYOFWEEK(bdate) FROM bday;
SELECT bdate, DAYOFYEAR(bdate) FROM bday;
SELECT bdt, CONCAT(DAYNAME(bdt), ' ', DAY(bdt)) AS 'Day'
FROM BDAY;
#DAY(), DAYNAME(), DAYOFWEEK(), DAYOFYEAR() functions, can be used on DATE AND DATETIME type columns

SELECT DATE_FORMAT('2015-10-05 15:18:00', '%M-%D-%Y');
SELECT DATE_FORMAT('2015-10-05 15:18:00', '%m/%d/%y');
#DATE_FORMAT() function takes 2 args, a date/datetime and a format

SELECT bdt, DATE_FORMAT(bdt, 'Month is %M, Day is %D and Year is %Y') FROM bday;

SELECT bdt, DATE_FORMAT(bdt, '%m/%d/%y %H:%i:%s') FROM bday;

SELECT DATEDIFF(NOW(), '2015-10-05') FROM bday;
#DATEDIFF() takes 2 arguments and returns # of days

SELECT DATEDIFF(bdt, NOW()) FROM bday;
#DATEDIFF() takes 2 arguments and returns difference in # of days

SELECT bdt, DATE_ADD(bdt, INTERVAL 1 MONTH) FROM bday;
SELECT bdt, DATE_ADD(bdt, INTERVAL 3 DAY) FROM bday;
SELECT bdt, DATE_ADD(bdt, INTERVAL 5 QUARTER) FROM bday;
#DATE_ADD() takes date and 'INTERVAL' to add days to a date
SELECT bdt, DATE_SUB(bdt, INTERVAL 2 Year) FROM bday;
#DATE_SUB() takes date and 'INTERVAL' to subtract days to a date

SELECT bdt, BDT + INTERVAL 1 MONTH AS '1 Month' FROM bday;
#shorthand for date_add()
SELECT bdt, bdt + INTERVAL 1 MONTH + INTERVAL 3 DAY FROM bday;
#you may chain intervals together aswell

SELECT bdt, bdt - INTERVAL 2 DAY AS 'before yesterday' FROM bday;
SELECT bdt, bdt - INTERVAL 1 MONTH + INTERVAL 7 DAY AS '-1m + 7d' FROM bday;

CREATE TABLE comments (
    content varchar(100),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO comments (content) VALUES
    ('last article i sware');

ALTER TABLE comments ADD
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP;
#when creating column the ON UPDATE CURRENT_TIMESTAMP allows you to update column with current timestamp anytime the row is updated

INSERT INTO comments (content) VALUES
    ('i lied, one more');

UPDATE comments SET content = 'i edited this to now()' WHERE content = 'lol that was funny article';

-- Q:When would you use CHAR
-- A:when needing to force values to be a certain number of characters like State abbreviations.

CREATE TABLE inventory (
    item_name VARCHAR(100) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    quantity INT
    );

-- Q: What is the difference between DateTime and TIMESTAMP
-- A: DATETIME used for values with a date and time and range '1000-01-01 00:00:00' to '9999-12-31 23:59:59' TIMESTAMP used for values with a date and time and range '1970-01-01 00:00:01' UTC to '2038-01-19 03:14:07' UTC.Therefore TIMESTAMP takes up less space in memory (about half the bites)


SELECT TIME(NOW()); SELECT CURTIME();
SELECT DATE(NOW()); SELECT CURDATE();
SELECT DAY(NOW());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%W'); SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');
SELECT DATE_FORMAT(NOW(), '%M %D at %H:%i');

CREATE TABLE tweets(
    tweet_content VARCHAR(140) NOT NULL,
    username VARCHAR(20) NOT NULL,
    created_on TIMESTAMP DEFAULT NOW() NOT NULL
    );
