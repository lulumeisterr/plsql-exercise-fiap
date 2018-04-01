/*
EXERCICIO 02 

1. Avalie o bloco PL/SQL da página anterior e determine o tipo de dados e o
valor de cada uma das seguintes variáveis de acordo com as regras de
escopo.

a . O valor de v_weight na posição 1 e 2 é: 

R:  Na Posição  1 é : 601
R : Na posição 2 é  : 2 

b . O valor de v_new_locn na posição 1 e 2 é:

R: 1 - Na Posição 1 : Erro pois a variavel não foi declarada no declare inicial
R: 2 - Na Posição 2 : Wastern  Europe

c . O valor de v_message na posição 2 é :

R: Product 10112 is isnt sotck

*/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*

3. Examine o código abaixo e faça as alterações necessárias para que ele
funcione como um bloco PL/SQL anônimo:


SELECT first_name, salary
 INTO fname, emp_sal
 FROM hr.employees
WHERE employee_id=110;
*/

SET SERVEROUTPUT ON
DECLARE
V_SALARY EMPLOYEES.SALARY%TYPE;
V_NAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
SELECT FIRST_NAME , SALARY INTO V_NAME , V_SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;
DBMS_OUTPUT.PUT_LINE(V_NAME || V_SALARY);
END;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
4. Altere o programa para exibir o nome e salário do funcionário 110 no
    formato “John recebe o salario de 8200”.

*/

DECLARE

V_SALARY EMPLOYEES.SALARY%TYPE;
V_NAME EMPLOYEES.FIRST_NAME%TYPE;

BEGIN

    SELECT FIRST_NAME , SALARY INTO V_NAME , V_SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;

    UPDATE EMPLOYEES SET SALARY = 8200 WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' recebe o salario de : ' || V_SALARY);
 
END;



----------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
5 - Calcule a contribuição do funcionário para o fundo de previdência (PF). PF
é 12% do salário básico e o salário básico é 45% do salário. Use as
variáveis locais para o cálculo. Tente usar apenas uma expressão para
calcular PF. Imprima o salário do funcionário e sua contribuição para o PF,
usando o modelo a seguir:

*/

SET SERVEROUTPUT ON

DECLARE

V_NAME_F EMPLOYEES.FIRST_NAME%TYPE;
V_SALARY EMPLOYEES.SALARY%TYPE;
V_PORCENTUAL NUMBER(8,3);

BEGIN

SELECT SALARY , FIRST_NAME INTO V_SALARY , V_NAME_F FROM EMPLOYEES WHERE EMPLOYEE_ID = 145;

--0,12
--0,48

V_SALARY := V_SALARY * 0.48;
V_PORCENTUAL := V_SALARY / 12 ;

DBMS_OUTPUT.PUT_LINE('HELLOW ' || V_NAME_F || ' YOUR SALARY IS : ' || V_SALARY || ' AND YOUR CONTRIBUTION IS : ' ||  V_PORCENTUAL);
END;
