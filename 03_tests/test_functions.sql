SET SERVEROUTPUT ON

BEGIN
    DBMS_OUTPUT.PUT_LINE('Annual salary emp 1   : ' || fn_annual_salary(1));
    DBMS_OUTPUT.PUT_LINE('Annual salary emp 999 : ' || NVL(TO_CHAR(fn_annual_salary(999)), 'NULL (not found)'));
    DBMS_OUTPUT.PUT_LINE('Years of service emp 1: ' || fn_years_of_service(1));
    DBMS_OUTPUT.PUT_LINE('Tax on 600000         : ' || fn_calculate_tax(600000));
    DBMS_OUTPUT.PUT_LINE('Tax on 1000000        : ' || fn_calculate_tax(1000000));
    DBMS_OUTPUT.PUT_LINE('Tax on 2000000        : ' || fn_calculate_tax(2000000));
    DBMS_OUTPUT.PUT_LINE('Tax on 3000000        : ' || fn_calculate_tax(3000000));
    DBMS_OUTPUT.PUT_LINE('Dept 10               : ' || fn_dept_name(10));
    DBMS_OUTPUT.PUT_LINE('Dept NULL             : ' || fn_dept_name(NULL));
    DBMS_OUTPUT.PUT_LINE('Dept 99               : ' || fn_dept_name(99));
END;
/
