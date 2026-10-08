# Reflection

## What I learned
- GOTO jumps to a label in the same block or out of a block. It can never jump into an IF, LOOP, or nested block (error PLS-00375).
- Every GOTO program can be rewritten with IF/ELSIF/ELSE, which is shorter and easier to read.
- A function must RETURN a value and can be used inside SELECT statements.
- Exception handling (NO_DATA_FOUND) lets a function return a safe value instead of crashing.
- Functions can call other functions, as fn_validate_payroll does with fn_annual_salary and fn_calculate_tax.

## Challenges
- Getting the output to show in SQL Developer. I had to run scripts with F5 and use SET SERVEROUTPUT ON.
- Understanding why the illegal GOTO failed. The label was inside an IF block, and PL/SQL does not allow jumping into a block.

## GOTO vs structured code
GOTO makes code harder to follow because the flow jumps around. In real projects I would use IF/ELSIF or loops, and only consider GOTO for rare cases like exiting deeply nested logic.

## Notes on AI use
I used an AI assistant (Claude) to help me learn more code  and explain more concepts which i don't know. I ran every program myself, took the screenshots, and studied the code so I can explain it.
