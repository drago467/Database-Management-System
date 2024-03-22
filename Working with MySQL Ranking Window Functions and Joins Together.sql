USE employees;

SELECT 
	d.dept_no,
    d.dept_name,
    dm.emp_no,
    RANK() OVER w AS department_salary_ranking,
    s.salary,
    s.from_date AS salary_from_date,
    s.to_date AS salary_to_date,
    dm.from_date AS dept_manager_from_date,
    dm.to_date AS dept_manager_to_date
FROM 
	dept_manager dm
		JOIN
	salaries s ON s.emp_no = dm.emp_no
		AND s.from_date BETWEEN dm.from_date AND dm.to_date
        AND s.to_date BETWEEN dm.from_date AND dm.to_date
		JOIN
	departments d ON d.dept_no = dm.dept_no
WINDOW w AS (PARTITION BY dm.dept_no ORDER BY s.salary DESC)