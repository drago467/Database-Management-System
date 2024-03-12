USE employees;

DROP procedure IF EXISTS emp_avg_salary_out;

DELIMITER $$

USE employees $$

CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INTEGER,
								OUT p_avg_salary DECIMAL(10, 2))
BEGIN
SELECT 
	AVG(s.salary)
INTO p_avg_salary 
FROM employees e JOIN salaries s 
ON e.emp_no = s.emp_no
WHERE 
	e.emp_no = p_emp_no
GROUP BY e.emp_no;
END $$

DELIMITER ;