USE employees;

SET SESSION sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT *
FROM salaries
GROUP BY emp_no;

SELECT
	emp_no,
    salary,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary) AS row_num
FROM 
	salaries;
    
SELECT a.emp_no,
		MAX(salary) AS max_salary FROM (
	SELECT
		emp_no, 
        salary,
        ROW_NUMBER() OVER w AS row_num
	FROM
		salaries
	WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)) AS a
GROUP BY emp_no;

SELECT
	emp_no,
    MAX(salary) max_salary
FROM salaries
GROUP BY emp_no;

SELECT a.emp_no,
	a.salary AS max_salary FROM (
    SELECT 
		emp_no, salary, ROW_NUMBER() OVER w AS row_num
	FROM 
		salaries
	WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)) a
WHERE a.row_num = 1;