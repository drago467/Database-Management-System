USE employees;

SELECT DISTINCT
	emp_no, salary, DENSE_RANK() OVER w AS rank_num
FROM 
	salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

SELECT 
	emp_no, (COUNT(salary) - COUNT(DISTINCT salary)) AS diff
FROM 
	salaries
GROUP BY emp_no
HAVING diff > 0
ORDER BY emp_no;