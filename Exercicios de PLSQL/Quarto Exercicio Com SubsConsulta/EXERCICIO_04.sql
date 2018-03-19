/*

1. Crie um bloco PL/SQL que liste o nome (ENAME), salário (SAL) e data de contratação
(HIREDATE) do funcionário com o menor salário do departamento (DEPTNO) 10. A data
de contratação deve ser exibida no formato DIA “de” Nome do mês por extenso “de”
ANO (exemplo, 19 de Março de 2018)


*/

SET SERVEROUTPUT ON

DECLARE

V_ENAME EMP.ENAME%TYPE;
V_SAL EMP.SAL%TYPE;
V_HIREDATE EMP.HIREDATE%TYPE;

BEGIN


SELECT ENAME , SAL , HIREDATE INTO V_ENAME , V_SAL , V_HIREDATE
    FROM EMP
    
    WHERE DEPTNO = 10 AND 
      SAL = (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 10);


DBMS_OUTPUT.put_line('NOME '  || V_ENAME);
DBMS_OUTPUT.PUT_LINE('SALARIO ' || V_SAL);
DBMS_OUTPUT.PUT_LINE('DATA ' || TO_CHAR(V_HIREDATE,'fmDD "de" Month "de YYYY'));


END;


/*

2 - Altere o programa anterior para exibir o nome, salário e data de contração do
funcionário com o menor salário do departamento 10 e esses mesmos dados do
gerente (MGR) desse funcionário. A data de contratação deve ser exibida no formato
Dia da sema, Dia “de” nome do mês por extenso “de” Ano (exemplo, Segunda-feira, 19
de Março de 2018)

*/

DECLARE

V_ENAME EMP.ENAME%TYPE;
V_SAL EMP.SAL%TYPE;
V_HIREDATE EMP.HIREDATE%TYPE;
V_MGR EMP.MGR%TYPE;

BEGIN


SELECT ENAME , SAL , HIREDATE , MGR INTO V_ENAME , V_SAL , V_HIREDATE , V_MGR
    FROM EMP
    
    WHERE DEPTNO = 10 AND 
      SAL = (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 10);



DBMS_OUTPUT.put_line('NOME  : '  || V_ENAME);
DBMS_OUTPUT.PUT_LINE('SALARIO : ' || V_SAL);
DBMS_OUTPUT.PUT_LINE('DATA : ' || TO_CHAR(V_HIREDATE,' "DIA" fmDD DAY "de" Month "de 2018'));

--EXIBINDO GERENTE

SELECT ENAME , SAL , HIREDATE INTO V_ENAME , V_SAL , V_HIREDATE
    FROM EMP
    WHERE EMP = V_MGR;


DBMS_OUTPUT.put_line('NOME DO GERENTE  : '  || V_ENAME);
DBMS_OUTPUT.PUT_LINE('SALARIO : ' || V_SAL);
DBMS_OUTPUT.PUT_LINE('DATA DE CONTRATACAO : ' || TO_CHAR(V_HIREDATE,' "DIA" fmDD DAY "de" Month "de 2018'));

END;


/*

Altere o programa anterior para gerar um convite para uma reunião de avaliação entre
o funcionário e o seu gerente na primeira segunda-feira após três meses da
contratação do funcionário com o menor salário do departamento 10. (Exemplo,
Reunião de avaliação do funcionário XXXX pelo seu gerente YYYY agenda para
segunda-feira, 19 de março de 2018)



*/


DECLARE

V_ENAME EMP.ENAME%TYPE;
V_SAL EMP.SAL%TYPE;
V_MGR EMP.MGR%TYPE;
V_ENAME_GERENTE EMP.ENAME%TYPE;
V_HIREDATE EMP.HIREDATE%TYPE;

BEGIN

SELECT ENAME , SAL  , HIREDATE , MGR INTO  V_ENAME , V_SAL , V_HIREDATE , V_MGR
                         FROM EMP WHERE DEPTNO = 10 
                         AND SAL = (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 10);
                         
                         SELECT ENAME INTO V_ENAME_GERENTE FROM EMP WHERE EMPNO = V_MGR;
                         
DBMS_OUTPUT.PUT_LINE('Reunião de avaliação do funcionário ' || V_ENAME || 'pelo seu gerente ' || V_ENAME_GERENTE || ' AGENDADA PARA : ' ||TO_CHAR(V_HIREDATE,' "DIA" fmDD DAY "de" Month "de 2018'));


END;


/*

4. Usando PL/SQL, gere um relatório de apoio para a reunião de avaliação do exercício
anterior. Nesse relatório devem constar o nome do funcionário, seu salário atual, sua
comissão (COMM) atual, uma proposta de aumento de 10% no salário atual e em sua
comissão, o cálculo de quanto o funcionário recebe anualmente com o salário atual,
quanto irá receber anualmente após o aumento e a diferença entre esses valores. Leve
em consideração que os ganhos do funcionário são calculados somando o salário com
a comissão


*/



/*

5. Usando PL/SQL gere um relatório gerencial exibindo o nome (ENAME), data de
contratação (HIREDATE) e salário (SAL) do funcionário mais antigo da empresa, em
seguida, liste os mesmos dados do funcionário contratado mais recentemente pela
empresa. Após ter listado esses dados, exiba a diferença entre seus salário e a
quantidade de meses e dias entre a contratação destes dois funcionários.


*/


SELECT * FROM EMP;