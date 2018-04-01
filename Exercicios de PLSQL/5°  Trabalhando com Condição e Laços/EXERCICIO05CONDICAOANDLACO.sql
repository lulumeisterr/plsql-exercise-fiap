set SERVEROUTPUT ON

DECLARE 

V_MYAGE NUMBER := &idade;

BEGIN

IF v_myage < 11 then
    DBMS_OUTPUT.PUT_LINE(' I AM A CHILD');
    ELSE
    DBMS_OUTPUT.PUT_LINE(' I AM NOT A CHILD');
    END IF;
END;
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UTILIZANDO ESTRUTURA DE CONDIÇÃO IF ELSE END IF

set SERVEROUTPUT ON
DECLARE

V_EMPNO emp.empno%TYPE := &funcionario;
V_SAL emp.sal%TYPE;

BEGIN

    SELECT sal into v_sal
FROM emp
    WHERE empno = v_empno;
        IF v_empno > 2900 THEN
    UPDATE emp 
    SET sal = sal * 1.05
         WHERE empno = v_empno;
 ELSE
         UPDATE emp
        SET sal = sal * 1.10
        WHERE empno = v_empno;
END IF;
    
END;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UTILIZANDO SWITCH CASE 

set SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
V_GRADE CHAR(1) := UPPER('&grade');
v_appraisal VARCHAR(20);
    BEGIN
    
    v_appraisal := CASE v_grade
        WHEN 'A' THEN 'Excellent'
         WHEN 'B' THEN 'VERY GOOD'
          WHEN 'C' THEN 'GOOD'
           WHEN 'D' THEN 'GRADE'
        END;
        
        DBMS_OUTPUT.PUT_LINE('GRADE :' || v_grade || v_grade || ' Appraisal ' || v_appraisal);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
        -- USANDO LAÇO DE REPETIÇÃO
        
        SET SERVEROUTPUT ON
        
        DECLARE
        V_CONT NUMBER := 0;
        BEGIN
            LOOP
                DBMS_OUTPUT.PUT_LINE (V_CONT);
                    V_CONT := V_CONT + 1;
                    
                    EXIT WHEN V_CONT > 9; -- FIM LAÇO
                  END LOOP;
    END;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UTILIZANDO LAÇO FOR


DECLARE

v_tabuada NUMBER := &TABUADA;

BEGIN
DBMS_OUTPUT.PUT_LINE(' TABUADA DO ' || i);
DBMS_OUTPUT.PUT_LINE(' ----------------------------------------------- ');

FOR i IN 1..10 LOOP
DBMS_OUTPUT.PUT_LINE(i || ' * ' || V_TABUADA || ' = ' || i * V_TABUADA);

END LOOP;

END;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------


BEGIN

    FOR i IN 1..10 LOOP
    
        DBMS_OUTPUT.PUT_LINE(' TABUADA DO ' || i);
        DBMS_OUTPUT.PUT_LINE(' ----------------------------------------------- ');
        
    FOR j IN 1..10 LOOP
    
        DBMS_OUTPUT.PUT_LINE(i || ' * ' || j || ' = ' || i * j);
        
    END LOOP;
END LOOP;

END;




select * from emp;