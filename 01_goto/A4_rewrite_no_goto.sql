DECLARE
    v_num NUMBER := 15;
BEGIN
    IF v_num > 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_num || ' is POSITIVE');
    ELSIF v_num < 0 THEN
        DBMS_OUTPUT.PUT_LINE(v_num || ' is NEGATIVE');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num || ' is ZERO');
    END IF;
END;
/
