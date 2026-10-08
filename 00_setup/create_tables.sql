BEGIN EXECUTE IMMEDIATE 'DROP TABLE employees PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE departments PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE departments (
    dept_id    NUMBER(4)     PRIMARY KEY,
    dept_name  VARCHAR2(50)  NOT NULL
);

CREATE TABLE employees (
    emp_id          NUMBER(6)     PRIMARY KEY,
    first_name      VARCHAR2(30)  NOT NULL,
    last_name       VARCHAR2(30)  NOT NULL,
    dept_id         NUMBER(4)     REFERENCES departments(dept_id),
    hire_date       DATE          NOT NULL,
    monthly_salary  NUMBER(10,2)  NOT NULL,
    bonus           NUMBER(10,2)  DEFAULT 0
);

INSERT INTO departments VALUES (10, 'Finance');
INSERT INTO departments VALUES (20, 'IT');
INSERT INTO departments VALUES (30, 'Human Resources');

INSERT INTO employees VALUES (1, 'Alice',  'Mukamana', 10, DATE '2015-03-01', 900000, 50000);
INSERT INTO employees VALUES (2, 'Bosco',  'Habimana', 20, DATE '2019-07-15', 650000, 0);
INSERT INTO employees VALUES (3, 'Claire', 'Uwase',    20, DATE '2022-01-10', 450000, 20000);
INSERT INTO employees VALUES (4, 'David',  'Nkusi',    30, DATE '2010-11-20', 1200000, 100000);
INSERT INTO employees VALUES (5, 'Esther', 'Ingabire', NULL, DATE '2024-05-05', 300000, 0);

COMMIT;

SELECT * FROM departments;
SELECT * FROM employees;
