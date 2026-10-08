SELECT emp_id,
       first_name,
       fn_validate_payroll(emp_id) AS payroll_status
FROM   employees
UNION ALL
SELECT 99, 'Nobody', fn_validate_payroll(99) FROM dual
ORDER  BY emp_id;
