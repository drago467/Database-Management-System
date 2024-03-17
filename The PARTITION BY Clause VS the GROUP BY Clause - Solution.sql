-- 1

SELECT a.emp_no,
	  salary AS Min_salary FROM (
	SELECT
		emp_no, 
        salary,
        ROW_NUMBER() OVER w AS row_num
	FROM
		salaries
	WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) AS a
WHERE a.row_num = 1;


