USE employees;

SELECT 
	emp_no,
    salary,
    -- ROW_NUMBER() OVER() AS row_num1, -- Bạn cần chỉ định cột trong phần ORDER BY
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary) AS row_num2,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num3
    -- ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num4 -- Bạn cần chỉ định phân vùng nếu sử dụng PARTITION BY
FROM salaries;
