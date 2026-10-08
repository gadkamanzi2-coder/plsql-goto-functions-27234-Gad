CREATE OR REPLACE FUNCTION fn_validate_payroll(p_emp_id IN NUMBER)
RETURN VARCHAR2
IS
    v_emp     employees%ROWTYPE;
    v_annual  NUMBER;
    v_tax     NUMBER;
BEGIN
    SELECT *
    INTO   v_emp
    FROM   employees
    WHERE  emp_id = p_emp_id;

    IF v_emp.monthly_salary <= 0 THEN
        RETURN 'INVALID: Salary must be greater than zero';
    END IF;

    IF v_emp.dept_id IS NULL THEN
        RETURN 'INVALID: No department assigned';
    END IF;

    IF v_emp.hire_date > SYSDATE THEN
        RETURN 'INVALID: Hire date is in the future';
    END IF;

    IF NVL(v_emp.bonus, 0) > v_emp.monthly_salary * 12 * 0.5 THEN
        RETURN 'INVALID: Bonus exceeds 50% of annual salary';
    END IF;

    v_annual := fn_annual_salary(p_emp_id);
    v_tax    := fn_calculate_tax(v_annual);
    IF v_tax > v_annual THEN
        RETURN 'INVALID: Tax exceeds annual salary';
    END IF;

    RETURN 'VALID';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: Employee not found';
    WHEN OTHERS THEN
        RETURN 'ERROR: ' || SQLERRM;
END fn_validate_payroll;
/
