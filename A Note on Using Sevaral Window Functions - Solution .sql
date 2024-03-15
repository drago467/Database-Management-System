-- 1

SELECT 
	dm.emp_no,
    salary,
    ROW_NUMBER() OVER() AS row_num1,
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_2
FROM dept_manager dm
JOIN salaries s ON dm.emp_no  = s.emp_no
ORDER BY row_num1, emp_no, salary ASC;

-- 2

SELECT 
	dm.emp_no,
    salary,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary ASC) AS row_num1,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num2
FROM dept_manager dm JOIN salaries s
ON dm.emp_no = s.emp_no;

