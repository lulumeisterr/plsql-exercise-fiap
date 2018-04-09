/*

Tipo de dados composto - trabalhar com diversos tipos no banco

Registro PL/SQL - Armazenar valores de varios tipos de dados mas apenas uma 
ocorrencia por vez.
Ou seja eu crio uma unica variavel e dentro dela tenho varias variaveis 
definidas.

ROWTYPE PEGA TODAS AS COLUNAS DE TIPO DE DADO UMA TABELA

*/

DECLARE
    TYPE teste IS RECORD ( v_ename   emp.ename%TYPE,
    v_sal     emp.sal%TYPE );
    v_teste   teste;
BEGIN
            -- Referenciando atributo e objeto
            
        -- ATRIBUTO   OBJETO
    v_teste.v_ename := 'Teste';
    v_teste.v_sal := 1000;
END;
/

DECLARE
    emp_rec dept%rowtype;
BEGIN
    SELECT
        *
    INTO
        emp_rec
    FROM
        dept
    WHERE
        deptno = 10;

    dbms_output.put_line(emp_rec.deptno);
    dbms_output.put_line(emp_rec.dname);
    dbms_output.put_line(emp_rec.loc);
END;

--------------------------------------------------------------------------------

SET VERIFY OFF

DROP TABLE retired_emps;

CREATE TABLE retired_emps (
    empno       NUMBER(4),
    ename       VARCHAR2(10),
    job         VARCHAR2(9),
    mgr         NUMBER(4),
    hiredate    DATE,
    leavedate   DATE,
    sal         NUMBER(7,2),
    comm        NUMBER(7,2),
    deptno      NUMBER(2)
)
/
--------------------------------------------------------------------------------

DECLARE
    v_employee_number   NUMBER := 124;
    v_emp_rec           retired_emps%rowtype;
BEGIN
    DECLARE
        v_employee_number   NUMBER := 124;
        v_emp_rec           employees%rowtype;
    BEGIN
        SELECT
            *
        INTO
            v_emp_rec
        FROM
            employees
        WHERE
            employee_id = v_employee_number;

        INSERT INTO retired_emps (
            empno,
            ename,
            job,
            mgr,
            hiredate,
            leavedate,
            sal,
            comm,
            deptno
        ) VALUES (
            v_emp_rec.employee_id,
            v_emp_rec.last_name,
            v_emp_rec.job_id,
            v_emp_rec.manager_id,
            v_emp_rec.hire_date,
            SYSDATE,
            v_emp_rec.salary,
            v_emp_rec.commission_pct,
            v_emp_rec.department_id
        );

    END;
END;
/

--------------------------------------------------------------------------------
-- VETOR NO PL/SQL O INCREMENTO SE INICIA NO 1

drop table empl;
create table empl( ename  VARCHAR2(25 BYTE),
hiredt date);


-- Criando uma tabela que esta baseado em employes

DECLARE
TYPE ename_table_type IS TABLE OF
  employees.last_name%TYPE INDEX BY PLS_INTEGER;
  
TYPE hiredate_table_type IS 

TABLE OF DATE INDEX BY PLS_INTEGER;

 -- Criando um objeto para receber o tipo de dado do atributo

  ename_table ename_table_type;
  hiredate_table hiredate_table_type;
  
BEGIN
  ename_table(1)    := 'CAMERON';
  hiredate_table(8) := SYSDATE + 7;
  
  IF ename_table.EXISTS(1) THEN
    insert into empl VALUES (ename_table(1), hiredate_table(8));
  END IF;
  
END;
/
select * from empl;
select * from employees;
/
 



