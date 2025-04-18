-- Create the database
drop database if exists Company;
CREATE DATABASE Company;

-- Use the database
USE Company;

-- Create the Worker table
CREATE TABLE Worker (
    WORKER_ID INT,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    SALARY INT,
    JOINING_DATE DATE,
    EMAIL VARCHAR(100)
);

-- Insert data into Worker table
INSERT INTO Worker (WORKER_ID,FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, JOINING_DATE, EMAIL)
VALUES 
(1,'Minakshi', 'sharma', 'HR', 80000, '2014-02-15', 'Minakshi.b@company.com'),
(2,'Vipul', 'Kumar', 'IT', 90000, '2014-03-10', 'vipul.k@company.com'),
(3,'Satish', 'Sharma', 'Finance', 85000, '2014-02-28', 'satish.s@company.com'),
(4,'Amit', 'Singh', 'IT', 75000, '2014-02-05', 'amit.s@company.com'),
(5,'Rahul', 'Verma', 'HR', 60000, '2015-01-10', 'rahul.v@company.com'),
(6,'Mohit', 'Khan', 'IT', 120000, '2014-02-25', 'mohit.k@company.com'),
(7,'Rakesh', 'Sethi', 'Finance', 95000, '2016-05-15', 'rakesh.s@company.com'),
(4,'Amit', 'Singh', 'IT', 75000, '2014-02-05', 'amit.s@company.com'),
(5,'Rahul', 'Verma', 'HR', 60000, '2015-01-10', 'rahul.v@company.com'),
(8,'Vipul', 'Verma', 'IT', 50000, '2019-01-10', 'vipul.v@company.com'),
(9,'Mittali', 'Kaushal', 'IT', 95000, '2019-03-05', 'mittali.k@'),
(10,'Ajay', 'Chauhan', 'Finance', 86000, '2017-02-05', 'ajay.c@.com'),
(11,'Vikas', 'Dubey', 'HR', 86000, '2018-01-04', 'vikas.d@yahoo.com');

CREATE TABLE WorkerDetails (
    WORKER_ID INT,
    FIRST_NAME VARCHAR(50),
    CITY VARCHAR(50)
);

INSERT INTO WorkerDetails (WORKER_ID, FIRST_NAME, CITY)
VALUES
(1, 'Minakshi', 'Delhi'),
(2, 'Vipul', 'Mumbai'),
(3, 'Satish', 'Kolkata'),
(5, 'Rahul', 'Chennai'),
(6, 'Mohit', 'Delhi'),
(7, 'Rakesh', 'Bangalore'),
(8, 'Vipul', 'Pune'),
(9, 'Mittali', 'Kolkata');


-- Q-1. Write an SQL query to determine the 5th highest salary without using TOP or limit
-- method.

select distinct salary,first_name
from worker w1
where 4= (
  select count(distinct salary)
  from worker w2
  where w2.salary > w1.salary
  );
  

-- Q-2. Write an SQL query to fetch the list of employees with the same salary.


SELECT Salary, GROUP_CONCAT(First_Name SEPARATOR ', ') AS worker
FROM worker
GROUP BY Salary
HAVING COUNT(*) > 1;

-- Q-3. Write an SQL query to fetch intersecting records of two tables.
SELECT worker.*
FROM worker
INNER JOIN worker1
ON worker.WORKER_ID = worker1.worker_id;

-- Q-4. Write an SQL query to show records from one table that another table does not
-- have.

select worker.worker_id,worker.first_name
from worker
left join workerdetails
on worker.worker_id = workerdetails.worker_id
where workerdetails.worker_id is null;


-- Q-5. Write an SQL query to clone a new table from another table.

Create table Worker1 LIKE worker;
INSERT INTO
worker1
SELECT * FROM worker;


select * from worker1;


-- Q-6. Write an SQL query to fetch duplicate records having matching data in some fields of
-- a table.

select 
first_name,
Last_name,
email,
count(*)
from worker 
group by
    first_name,
    Last_name,
    email
having count(*)>1;


select * from worker;

