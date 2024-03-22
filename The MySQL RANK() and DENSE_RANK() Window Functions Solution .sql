SELECT 
	emp_no,
    salary,
    ROW_NUMBER() OVER w AS row_num
    FROM
		salaries 
	WHERE 
		emp_no = 10560
	WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);
    
SELECT
	dm.emp_no, (COUNT(salary)) AS no_of_salary_contracts
    FROM 
		dept_manager dm JOIN salaries s
	ON dm.emp_no = s.emp_no
    GROUP BY emp_no
    ORDER BY emp_no;
    
SELECT
	emp_no,
    salary,
    RANK() OVER w AS rank_num
    FROM 
		salaries
	WHERE emp_no = 10560
    WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);
    
SELECT 
	emp_no,
    salary,
    DENSE_RANK() OVER w AS rank_num
    FROM 
		salaries
	WHERE emp_no = 10560
    WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);