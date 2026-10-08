DECLARE
    v_emp_id  employees.emp_id%TYPE := 2;
    v_salary  employees.monthly_salary%TYPE;
    v_name    employees.first_name%TYPE;
BEGIN
    SELECT first_name, monthly_salary
    INTO   v_name, v_salary
    FROM   employees
    WHERE  emp_id = v_emp_id;

    IF v_salary < 500000 THEN
        GOTO low_salary;
    ELSIF v_salary < 1000000 THEN
        GOTO mid_salary;
    ELSE
        GOTO high_salary;
    END IF;

    <<low_salary>>
    DBMS_OUTPUT.PUT_LINE(v_name || ': LOW salary, eligible for 10% raise');
    GOTO done;

    <<mid_salary>>
    DBMS_OUTPUT.PUT_LINE(v_name || ': MEDIUM salary, eligible for 5% raise');
    GOTO done;

    <<high_salary>>
    DBMS_OUTPUT.PUT_LINE(v_name || ': HIGH salary, no raise this cycle');

    <<done>>
    DBMS_OUTPUT.PUT_LINE('Review complete.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/
