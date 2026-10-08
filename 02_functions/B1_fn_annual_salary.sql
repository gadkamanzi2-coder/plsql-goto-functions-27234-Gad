CREATE OR REPLACE FUNCTION fn_annual_salary(p_emp_id IN NUMBER)
RETURN NUMBER
IS
    v_monthly  employees.monthly_salary%TYPE;
    v_bonus    employees.bonus%TYPE;
BEGIN
    SELECT monthly_salary, NVL(bonus, 0)
    INTO   v_monthly, v_bonus
    FROM   employees
    WHERE  emp_id = p_emp_id;

    RETURN (v_monthly * 12) + v_bonus;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;   -- employee does not exist
END fn_annual_salary;
/
