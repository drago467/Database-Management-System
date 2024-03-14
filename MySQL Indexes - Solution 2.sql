USE employees;

SELECT * 
FROM salaries 
WHERE salary > 89000;

CREATE INDEX i_salaries ON salaries(salary);