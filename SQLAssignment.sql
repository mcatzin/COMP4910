USE employees;
 #problem 01 Retrieving Records: you have table and want to see all of the data.
select *
FROM salaries
LIMIT 5;

#Problem 02: View only selective columns of the table 
SELECT birth_date
FROM employees
LIMIT 5;

SELECT year(curdate()) - year(birth_date) as age, gender AS sex,  salary 
FROM employees, salaries
LIMIT 5;

# Problems 03: View only selective rows that satisfy certain conditions. For example, show the same, age, and salary of employees
# whose age is greater than 35 years.

SELECT year(curdate()) - year(birth_date) as age, gender, salary
FROM employees, salaries
WHERE  year(curdate()) - year(birth_date)  > 35
LIMIT 5;

# Problems 04: Display rows that satisfy multiple conditions. Following the WHERE clause use the OR and AND statements. 
# Show the employees who earn less than $2000 and are over 40 years of age or who are females.

SELECT e.emp_no, first_name, last_name, gender AS sex, year(curdate()) - year(birth_date) AS age, salary
FROM employees e, salaries s
WHERE (salary < 2000 AND year(curdate()) - year(birth_date) > 40) or gender = 'F'
LIMIT 5;

# Problem 05: Rename the columns and then view the table with the newly named column. 
#Here, sal and dept are the original column names in the table.

SELECT s.salary AS Salary, d. dept_name AS Department
FROM salaries s, departments d
LIMIT 5;

# Problem 06:   Concatenating column values to combine multiple columns into one.
SELECT e.emp_no,  concat(first_name, last_name) AS full_name, salary
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no AND salary > 2000
GROUP BY e.emp_no, s.salary
LIMIT 5;

# Problems 07: Implement IF-ELSE statement: for example: if the customer pays less than $100, more than $100, and equal to $100, 
# mark him as underpaid, overpaid, and paid, respectively.

SELECT concat(first_name, last_name) AS full_name, s.salary,
		CASE WHEN salary <= 100 THEN 'UNDERPAID'
				 WHEN  salary >= 4000 THEN 'OVERAID'
                 ELSE 'PAID'
		END AS paymentStatus
        FROM employees e, salaries s
        WHERE e.emp_no = s.emp_no
        LIMIT 5;
        
#problem 08:  Limit the number of rows - show only top n rows of the table.
SELECT *
FROM employees
LIMIT 5;
select *
from salaries;

#Problem 09: Search rows with specific patterns in a particular column. 
SELECT emp_no, from_date
FROM dept_manager
WHERE dept_no in ('d003','d007')
LIMIT 5;

#Problem 10: Use if wildcard operator % to search rows that specific substring 
SELECT emp_no, first_name, last_name
FROM employees
WHERE year(curdate()) - year(birth_date) in (61, 63) AND (first_name LIKE '%en%'OR last_name LIKE '%as')
LIMIT 5;

############################
#Part II
# Problem 01: Sort the rows based on ascending order of the salary (from lowest to hightest)
SELECT first_name, last_name, salary, year(curdate()) - year(birth_date) AS age
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no
ORDER BY salary ASC
LIMIT 5;

#Problem 02: Sort the rows based on multiple fields or columns. For example, sort the table first based on ascending 
#order of the age and then descending order of the salary.
SELECT first_name, last_name, salary
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no
ORDER BY year(curdate()) - year(birth_date) ASC, salary DESC
LIMIT 5;

#Problem 03: Find the age in years at the time of hire use the date of hire and the birth date of male employees only.
SELECT first_name, last_name, datediff(hire_date, birth_date)/365  AS age_hire
FROM employees
WHERE gender = 'M'
LIMIT 5;

# Problem 04: you cannot use field aliases in the WHERE clause as below
SELECT *
FROM (SELECT first_name, DATEDIFF(hire_date, birth_date)/365 AS daysdiff
			FROM employees
            ) AS INNERTABLE
            WHERE daysdiff > 28
            LIMIT 5;
############################
# PART III
# Problem 01: Stack one table on the top of other. Merge department name and employee 
#name into one column named name_and_dept and stack two tables together.
 
SELECT concat(first_name, last_name ) AS name_and_dept, dept_no 
FROM employees , departments 
WHERE dept_no = 10
UNION
SELECT dept_name, dept_no
FROM departments
LIMIT 5;
 #Problem 02: You want to return rows from multiple tables by joining on a known common columns or 
 #joining on columns that share common values.
SELECT e.first_name, e.last_name, d.dept_no
FROM employees e, dept_emp d
WHERE e.emp_no = d.emp_no
LIMIT 5;
 
 # Problem 03: Find the student t-numbers that are in the CS_dept table but not in the Sci_dept table.
SELECT emp_no
FROM employees
WHERE emp_no NOT IN (SELECT emp_no FROM dept_manager)
LIMIT 5;
 
 # Problem 04: Obtain the sum or aggregate values from the numeric columns. Create a column displaying the sum of salaries or count of all female employees. 
 # From the salary table calculate the total number of employees, total salaries, and average salaries.
 SELECT count(emp_no) as total_emp, sum(salary) as total_salary, avg(salary) as avg_salary
 FROM salaries
 WHERE (SELECT COUNT(gender) AS female 
				FROM employees
                WHERE gender = 'F'
				GROUP BY gender);
                
                
##### PART IV
# use INSERT statement with VALUES clause to insert one row at a time
INSERT INTO salaries (emp_no, salary, from_date, to_date)
VALUES (10145, 75353, '1993-11-14', '2017-12-11'),
			(10146, 60752, '2013-11-10', '2016-05-10');
         
 describe employees;
#Steps: Perform query in one table, take the query result to insert into another table
CREATE TABLE employees2(
emp_no INT(11) PRIMARY KEY NOT NULL,
birth_date date,
first_name VARCHAR(14) NOT NULL,
last_name VARCHAR(16) NOT NULL,
gender ENUM('M','F') NOT NULL,
hire_date date);

INSERT INTO employees2(emp_no, birth_date, first_name, last_name, gender, hire_date)
SELECT emp_no, birth_date, first_name, last_name, gender, hire_date
FROM employees
WHERE gender IN ('F');

SELECT *
FROM employees2
LIMIT 5;

#Say, you want to increase the salary of all employees who served more than 10 years by 10%. 
UPDATE salaries
SET salary = salary * 1.10
WHERE datediff(to_date, from_date)/365 >10;

# Deleting specific records. Example, delete all the rows that have dept_no.
DELETE FROM departments 
WHERE dept_no = 'd004';


