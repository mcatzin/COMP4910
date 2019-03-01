use employees;

# Question 2. What are the average, minimum, and maximum salaries of male and female employees?
# How many male and female employees are listed in the database?
 
SELECT gender, AVG(salary) AS theAvg, MIN(salary) AS theMin, MAX(salary) AS theMax,
 COUNT( DISTINCT e.emp_no) AS thecount
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no
GROUP BY gender;

# Question 3. What are the average, minimum, and maximum salaries of male 
# and female employees? How many male and female employees are listed in the database?

SELECT COUNT(DISTINCT emp_no) AS mycount
FROM dept_emp
WHERE dept_no = 'd007' BETWEEN '1987-01-01' AND '1991-03-07';


# Question 4. How many distinct employee numbers do you have in the database? Group the
# employees in terms of employee numbers and obtain the average salary for each group.

SELECT COUNT(DISTINCT emp_no) AS empCount,  AVG(salary) AS avgSalary
FROM salaries
GROUP BY  emp_no, salary
ORDER BY emp_no, salary;

#question 5. How many employees are listed as either senior staff or staff?

SELECT COUNT(emp_no) AS empCount, title
FROM titles
WHERE title BETWEEN 'Senior staff'  AND 'staff'
GROUP BY title;


