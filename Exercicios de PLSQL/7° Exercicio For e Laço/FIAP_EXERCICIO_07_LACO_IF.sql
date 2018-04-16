/*

2. Execute os comandos abaixo para criar e popular a tabela MESSAGES.
CREATE TABLE messages (results VARCHAR2 (60));

*/

CREATE TABLE messages (results VARCHAR2 (60));
DROP TABLE messages;

--------------------------------------------------------------------------------
/*

3. Faça um bloco PL/SQL para inserir os números de 1 a 10 na tabela MESSAGES, 
excluindo os números 6 e 8. 
Faça a inclusão dos números usando um laço FOR. Ao final do laço 
faça um COMMIT.

*/

DECLARE
BEGIN
FOR i IN 1..10 LOOP 
    IF i = 6 or i = 8 then
    null;
    ELSE
        INSERT INTO messages values(i);
        END IF;
END LOOP;
END;

SELECT * FROM messages;

--------------------------------------------------------------------------------
/*

4. Execute os comandos abaixo para inserir um funcionário com o salário NULO.
insert into emp
values (8000, 'DOE', 'CLERK', 7698, SYSDATE, NULL, NULL, 10)

*/

insert into emp values (8000, 'DOE', 'CLERK', 7698, SYSDATE, NULL, NULL, 10

--------------------------------------------------------------------------------

/*

5. Crie um bloco PL/SQL que compute o valor da comissão (COMM) de um determinado funcionário com base no salário (SAL) do funcionário.
a. Aceite o número do funcionário (EMPNO) como entrada do usuário com uma variável de substituição do SQL*Plus.
b. Se o salário do funcionário for inferior a US$ 1.000, defina o valor da comissão do funcionário para 10% do salário.
c. Se o salário do funcionário estiver entre US$ 1.000 e US$ 1.500, defina o valor da comissão do funcionário para 15% do salário.
d. Se o salário do funcionário exceder US$ 1.500, defina o valor da comissão do funcionário para 20% do salário.
e. Se o salário do funcionário for NULL, defina o valor da comissão do funcionário para 0.
f. Efetue um commit.
g. Teste o bloco PL/SQL para cada caso usando os casos de teste a seguir e verifique cada comissão atualizada.

*/

DECLARE

V_EMPNO emp.empno%TYPE := &funcionario;
V_SAL emp.sal%TYPE;
V_COM emp.comm%type;

BEGIN

SELECT EMPNO , SAL , COMM INTO V_EMPNO , V_SAL , V_COM FROM EMP WHERE EMPNO = V_EMPNO;

IF V_SAL < 1000 THEN
    V_COM := V_SAL * 0.10;
    ELSE
        IF V_SAL BETWEEN 1000 AND 1500 THEN
        V_COM := V_SAL * 0.15;  
        ELSE
            IF V_SAL > 1500 THEN
            V_COM := V_SAL * 0.20;
            ELSE
                IF V_SAL = NULL THEN
                V_COM  := NULL;
             END IF;
         END IF;
    END IF;
END IF;

UPDATE emp SET comm = V_COM WHERE EMPNO = V_EMPNO;

COMMIT;

END;

SELECT * FROM EMP;
--------------------------------------------------------------------------------
/*

6. Adicione uma nova coluna chamada STARS, de tipo de dado 
VARCHAR2 e comprimento 50, à tabela EMP para armazenar asteriscos (*).
ALTER TABLE emp ADD stars VARCHAR2(50);

*/

ALTER TABLE emp ADD stars VARCHAR2(50);

--------------------------------------------------------------------------------

/*

7. Crie um bloco PL/SQL que premie um funcionário, anexando um asterisco 
à coluna STARS para 
cada US$ 100 do salário do funcionário.
a. Aceite o ID do funcionário como entrada do usuário com uma variável 
de substituição do SQL*Plus.
b. Inicialize uma variável que conterá uma string de asteriscos.

*/

--------------------------------------------------------------------------------
DECLARE

V_EMPNO emp.empno%TYPE := &funcionario;
V_STARS emp.stars%type;
V_ASTE emp.stars%TYPE := '*';
v_sal emp.sal%TYPE;
BEGIN

SELECT NVL(ROUND(sal/100), 0)
      INTO v_sal
     FROM emp
    WHERE empno = v_empno;

for i in 1..v_sal loop
v_aste := v_aste;
END LOOP;

UPDATE emp SET STARS = V_ASTE 
WHERE EMPNO = V_EMPNO;

END;

SELECT * FROM EMP;

/*
8. Anexe um asterisco à string para cada US$ 100 do salário. Por exemplo, se o funcionário 
recebe um salário de US$ 800, a string de asteriscos deverá conter oito asteriscos. 
Se o funcionário recebe um salário de US$ 1.250, a string de asteriscos deve conter 13 asteriscos.

*/


/*
9. Atualize a coluna STARS do funcionário com a string de asteriscos.
*/
            

/*
10. Efetue um commit.
*/

COMMIT;

/*
11. Teste o bloco dos funcionários que não têm salário e de um funcionário que tem um salário como, por exemplo, 7934 e 8000
EMPNO SAL STARS ----- ----- ---------------- 8000 7934 1300 *************
*/
