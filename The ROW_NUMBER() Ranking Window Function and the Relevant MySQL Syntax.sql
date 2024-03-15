USE employees;

--

SELECT 
	emp_no,
    salary,
    ROW_NUMBER() OVER() AS row_num
FROM 
	salaries;
    
--

SELECT
	emp_no,
    salary,
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM
	salaries;
    
--

SELECT
	emp_no,
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM
	salaries;