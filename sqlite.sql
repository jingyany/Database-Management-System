Jingyan Yang

CSEP 514 Homework 1: SQLITE

-- SQLite Setup

.header on
.nullvalue NULL
.mode column



-- Problem 1 First, create a simple table using the following steps:

-- a. Create a table Edges(Source,Destination) where both Source and Destination are integers.

CREATE TABLE Edges (
    Source INTEGER,
    Destination INTEGER,
    PRIMARY KEY (Source,Destination)
    );

-- b. Insert the tuples (10,5), (6,25), (1,3), (4, 4)

INSERT INTO Edges
    VALUES(10,5);
INSERT INTO Edges
    VALUES(6,25);
INSERT INTO Edges
    VALUES(1,3);
INSERT INTO Edges
    VALUES(4,4);

-- c. Write a SQL statement that returns all tuples

SELECT * FROM Edges;

-- d. Write a SQL statement that returns only column Source for all tuples

SELECT Source
   FROM Edges;

-- e. Write a SQL statement that returns all tuples where Source > Destination

SELECT * FROM Edges
   WHERE Source > Destination;

/* 
f. Tricky question (check the documentation here: http://www.sqlite.org/datatype3.html):
Now insert the tuple ('-1','2000'). Do you get an error? Why?

The data type of both columns, Source and Destination, should be INTERGER. However, the data type of '-1' and '2000' is string, which doesn't match the the data type we assigned when createing the table.
*/


/* 
Problem 2: Create a table called MyRestaurants with the following attributes

Name of the restaurant: a varchar field
Type of food they make: a varchar field
Distance (in minutes) from your house: an integer
Date of your last visit: a varchar field, interpreted as date
Whether you like it or not: an integer, interpreted as a Boolean
*/

CREATE TABLE MyRestaurants(
    Name VARCHAR(10),
    Type_of_food VARCHAR(10),
    Distance INTEGER,
    Date_of_your_last_visit VARCHAR(10),
    Whether_you_like_it_or_not INTEGER,
    PRIMARY KEY (Name)
    );


/*
Problem 3: Insert at least five tuples using the SQL INSERT command five (or more) times. You should
insert at least one restaurant you liked, at least one restaurant you did not like, and at least one
restaurant where you leave the iLike field NULL.
*/

INSERT INTO MyRestaurants
    VALUES('Xian','Chinese',5,'2016-12-10',1);
INSERT INTO MyRestaurants
    VALUES('Pinkaew','Thai',12,'2016-12-31',1);
INSERT INTO MyRestaurants
    VALUES('Araya','Thai',7,'2016-11-06',0);
INSERT INTO MyRestaurants
    VALUES('Pho Than','Pho',23,'2016-12-23',0);
INSERT INTO MyRestaurants
    VALUES('An Nam','Pho',21,'2016-11-16',1);
INSERT INTO MyRestaurants
    VALUES('Noi Thai','Thai',50,'2017-01-01',1);
INSERT INTO MyRestaurants
    VALUES('Japonessa','Japenes',45,'2016-10-05',NULL);
SELECT * FROM MyRestaurants;


-- Problem 4:Write a SQL query that returns all restaurants in your table. Experiment with a few of SQLite's output formats:

-- a. print the results in comma-separated form

.separator ","
.mode list
SELECT * FROM MyRestaurants;

-- b. print the results in list form, delimited by " | "

.separator "|"
.mode list
SELECT * FROM MyRestaurants;

-- c. print the results in column form, and make each column have width 15

.mode column
.width 15 15 15 15 15
SELECT * FROM MyRestaurants;

-- d. for each of the formats above, try printing/not printing the column headers with the results

-- Printing the column headers with the results

.headers on

.separator ","
.mode list
SELECT * FROM MyRestaurants;

.separator "|"
.mode list
SELECT * FROM MyRestaurants;

.mode column
.width 15 15 15 15 15
SELECT * FROM MyRestaurants;

-- Not printing the column headers with the results

.headers off

.separator ","
.mode list
SELECT * FROM MyRestaurants;

.separator "|"
.mode list
SELECT * FROM MyRestaurants;

.mode column
.width 15 15 15 15 15
SELECT * FROM MyRestaurants;

/*
Problem 5: Write a SQL query that returns only the name and distance of all restaurants within and
including 20 minutes of your house. The query should list the restaurants in alphabetical order of
names.
*/

SELECT Name,Distance
FROM MyRestaurants
WHERE Distance<=20
ORDER BY Name ASC;

-- Problem 6: Write a SQL query that returns all restaurants that you like, but have not visited since more than 3 months ago.

SELECT * FROM MyRestaurants
WHERE Whether_you_like_it_or_not =1
AND date(Date_of_your_last_visit) < date('now', '-3 month');