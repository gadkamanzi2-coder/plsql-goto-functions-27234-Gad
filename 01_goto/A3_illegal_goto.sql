BEGIN
    GOTO inside_block;

    IF 1 = 1 THEN
        <<inside_block>>
        DBMS_OUTPUT.PUT_LINE('Jumped into an IF block');
    END IF;
END;
/
