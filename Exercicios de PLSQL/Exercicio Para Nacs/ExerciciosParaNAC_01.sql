-- 1-) Crie um PL/SQL que escreva na tela o seu nome. 

SET SERVEROUTPUT ON

DECLARE
V_NOME VARCHAR(255);
BEGIN
V_NOME := 'LUCAS RODRIGUES DO NASCIMENTO';
DBMS_OUTPUT.PUT_LINE(V_NOME);
END;

--------------------------------------------------------------------------------

-- 2 -) Crie um PL/SQl que imprima na tela o quadrado abaixo, formado por 8 * por 10 * utilizando for e while. ********** 

DECLARE

BEGIN

    FOR J IN 1..8 LOOP  
    DBMS_OUTPUT.PUT_LINE('********');
    END LOOP;

END;

--------------------------------------------------------------------------------

-- 3 -) Escreva um PL/SQL que crie uma variável do tipo date, atribua a data corrente e mostre na tela:A data atual e o último dia deste mês

DECLARE
V_DATETWO DATE := SYSDATE -0;
BEGIN
DBMS_OUTPUT.PUT_LINE('DIA DO ULTIMO DO MES : ' || V_DATETWO);
END;

/*

--------------------------------------------------------------------------------

4 -) Faça um procedimento em PL/SQL que receba por parâmetro a tabuada, feito isso, imprima na tela a tabuada completa como no
exemplo abaixo:
Exemplo: parâmetro: 5 saída na tela: 1x5=5 2x5=10 3x5=15 . . . . 

*/

DECLARE
V_NUMBER NUMBER := &DIGITE;
BEGIN
    FOR I IN 1 .. 10 LOOP
    DBMS_OUTPUT.PUT_LINE(V_NUMBER || ' X ' || I || ' = ' || I * V_NUMBER);
    END LOOP;
END;

--------------------------------------------------------------------------------

-- 5 -) Reescreva os seguintes comandos IF, para não utilizar o IF. Qual a diferença entre eles


DECLARE
V_NOME VARCHAR(100) := 'LANE';
BEGIN
IF V_NOME = 'LANE' THEN
   DBMS_OUTPUT.PUT_LINE('KISS ME');
    ELSE
    DBMS_OUTPUT.PUT_LINE('DON''T WANT MORE''');
END IF;
END;

--------------------------------------------------------------------------------

-- 6) Escreva uma função em PL/SQL chamada TamanhoString, que receba um texto como parâmetro e retorne seu tamanho. 

DECLARE
V_NOME VARCHAR(100) := 'LUCAS RODRIGUES DO NASCIMENTO';
BEGIN
DBMS_OUTPUT.PUT_LINE('O TAMANHO DESTA STRING É DE : ' || length(V_NOME));
END;

--------------------------------------------------------------------------------

/*

7 ) Crie um bloco PL/SQL anônimo para exibir o nome do funcionário (ENAME), 
salário (SAL), média salarial da empresa (Função AVG)
do funcionário com o maior 
(Função MAX) salário do departamento (DEPTNO) onde trabalha o 
funcionário com o menor (Função MIN) salário da empresa. 

*/

SET SERVEROUTPUT ON

DECLARE

V_NOME EMP.ENAME%TYPE;
V_SAL EMP.SAL%TYPE;
V_DEPTNO EMP.DEPTNO%TYPE;

BEGIN 

SELECT AVG(SAL) INTO V_SAL FROM EMP;
DBMS_OUTPUT.PUT_LINE('MEDIA SALARIAL DA EMPRESA : ' || V_SAL);

select ename , sal ,deptno into 
       V_NOME , 
       V_SAL , 
       V_DEPTNO FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP);

    DBMS_OUTPUT.PUT_LINE('NOME :'||V_NOME|| 
                        ' MAIOR SALARIO : '|| V_SAL || 
                        ' DO ' || 'DEPARTAMENTO : ' || V_DEPTNO);

SELECT ENAME , SAL , DEPTNO INTO 
                     V_NOME , 
                     V_SAL , 
                     V_DEPTNO FROM EMP WHERE SAL = (SELECT MIN(SAL) FROM EMP);

DBMS_OUTPUT.PUT_LINE('FUNCIONARIO COM MENOR SALARIO : ' || V_NOME || ' DO ' || ' DEPARTAMENTO : ' || V_DEPTNO);

END;

--------------------------------------------------------------------------------

/*
8 -) Escreva uma função que receba como parâmetro a velocidade de uma rede (10, 100 ou 1000) e retorne o padrão desta rede. Se
for informado um parâmetro incorreto, retornar “Padrão inexistente”
Lembrando que:
*/

SET VERIFY OFF

DECLARE

V_SPEED varchar(255) := '10';
V_VARIAVEL VARCHAR(20);

BEGIN

V_VARIAVEL := CASE V_SPEED

  WHEN '10' THEN 'Ethernet'
  WHEN '100' THEN 'Fast Ethernet'
  WHEN '1000' THEN 'Giga Ethernet'
 
END;
DBMS_OUTPUT.PUT_LINE('THE ETHERNET CHOOSED WAS : ' || V_VARIAVEL);
END;
 
--------------------------------------------------------------------------------

/*

9 -) Crie uma função em PL/SQL receba como parâmetro o dia, mês e ano e retorne a data por extenso.
Exemplo: 12/03/2008 – 12 de março de 2008 

*/

SET SERVEROUTPUT ON

DECLARE
V_DATA DATE := TO_DATE('12/03/2008','DD/MM/YYYY');
BEGIN
DBMS_OUTPUT.PUT_LINE('DATA : ' || V_DATA);
END;

--------------------------------------------------------------------------------
-- EXIBINDO DADOS DE UM VETOR
 
DECLARE

TYPE tVETOR IS VARRAY(5) OF VARCHAR2(255);
V tVETOR;
AUX VARCHAR2(255);

BEGIN
V := tVETOR('Lucas' , 'Maria' , 'Julia' , 'Amanda' , 'JOSE');

FOR I IN 1..5 LOOP
    FOR J IN 1..4 LOOP
    
    IF(V(J)) = (V(J+1)) THEN
    
        AUX := V(J+1);
        V(J) := V(J+1);
        V(J+1) := AUX;
        
        END IF;
    END LOOP;
END LOOP;

for i in 1..5 loop
    DBMS_OUTPUT.PUT_LINE(V(I));
    END LOOP;
    
END;

--------------------------------------------------------------------------------

SELECT * FROM EMP;