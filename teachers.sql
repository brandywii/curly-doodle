--Create a database named 'analysis'
CREATE DATABASE analysis;

--Create a table called 'teachers' with 6 columns/attributes
CREATE TABLE teachers(
    id bigserial,
    first_name varchar(50),
    last_name varchar(50),
    school varchar(50),
    hire_date date,
    salary numeric
);

--Inserting rows into our table called 'teachers'
INSERT INTO teachers(first_name, last_name, school, hire_date, salary)
VALUES ('Janet','Smith','F.D. Roosevelt HS','2011-10-30',36200)
       ('lee','Reynolds','F.D. Roosevelt HS','1993-05-22',65000)
       ('Samuel','Cole','Myers Middle School','2005-08-01',43500)
       ('Samantha','Bush','Myers Middle School','2011-10-30',36200)
       ('Betty','Diaz','Myers Middle School','2005-08-30',43500)
       ('Kathleen','Rousch','F.D. Roosevelt HS','2010-10-22',38500)

--Query all rows and columns from the 'teachers' table
SELECT * FROM teachers;

-- OR
TABLE teachers;

--Querying a subset of columns
SELECT last_name, first_name, salary
FROM teachers;

--Sorting the salary column with the ORDER BY clause in descending order (highest to lowest)
SELECT first_name, last_name, salary
FROM teachers
ORDER BY salary DESC;

--Querying distinct (non-repeated) values in the school column 
SELECT DISTINCT school
FROM teachers
ORDER BY school;

--Querying distinct pairs of values in the 'school' and 'salary' columns
SELECT DISTINCT school, salary
FROM teachers
ORDER BY school, salary;

--Filtering rows using the WHERE clause
SELECT last_name, school, hire_date
FROM teachers
WHERE school = 'Myers Middle School';

/*The following examples will show the comparison operators in action 
Use the = operator to find teachers whose first name is 'Janet' */
SELECT first_name, last_name, school
FROM teachers
WHERE first_name = 'Janet';

/* List all school names in the table and exclude F.D. Roosevelt HS
using the not--equal operator */
SELECT school
FROM teachers
WHERE school <> 'F.D. Roosevelt HS';

/* Use the less-than operator to list teachers hired before January 1, 2000 
(using the date format YYYY-MM-DD) */
SELECT first_name, last_name, hire_date
FROM teachers
WHERE hire_date < '2000-01-01':

--Find teachers who earn $43,500 or more using the >= operator
SELECT first_name, last_name, salary
FROM teachers
WHERE salary >= 43500;

--Find teachers who earn between $40,000 and $65,000
SELECT first_name, last_name, salary
FROM teachers
WHERE salary >= 40000 AND salary <= 65000;



--Combining operators using using AND and OR
SELECT *
FROM teachers
WHERE school = 'Myers Middle School'
AND salary < 40000;


SELECT *
FROM teachers
WHERE last_name = 'Cole'
OR last_name = 'Bush';

SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS'
AND (salary < 38000 OR salary > 40000);




/*The school district superintendant asks for a lsit of teachers in each school.
Write a query that lists the schools in alphabetical order along with teachers
ordered bby last name A-Z*/
SELECT first_name, last_name, school
FROM teachers
ORDER BY school ASC,last_name ASC;

/*Write a query that finds the one teacher whose first name startswith the letter
S and who earns more than $40,000*/
SELECT first_name, last_name, salary
FROM teachers
WHERE first_name LIKE 'S%'
AND salary > 40000;


--Rank teachers hired since January 1, 2010 ordered by highest paid to lowest.
SELECT first_name, last_name, hire_date, school, salary
FROM teachers
WHERE hire_date > '2010-01-01'
ORDER BY salary DESC;

