SELECT *
FROM employees
WHERE hire_date > '2000-01-01';

CREATE INDEX i_hire_date ON employees(hire_date);

SELECT * 
FROM employees 
WHERE first_name = 'Georgi' AND last_name = 'Facello';

CREATE INDEX i_composite ON employees(first_name, last_name);

SELECT *
FROM employees 
WHERE first_name = 'Georgi' AND last_name = 'Facello';

SHOW INDEX FROM employees FROM employees;
