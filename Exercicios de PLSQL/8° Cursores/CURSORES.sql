SET SERVEROUTPUT ON

-- CURSORES PERMITE QUE NOS EXECUTAMOS 1 LINHA POR VEZ MAS PERMITE retornam nenhuma, uma ou diversas linhas
-- ROWTYPE - PEGA A LINHA INTEIRA
-- FOR IMPLICITO ONDE VC PASSA O NOME DO REGISTRO ( IN ) E JOGA DENTRO DE UM CURSOR, ONDE SÃO ELIMINADA O OPEN , FETCH E O EXIT

-- %ISOPEN TESTE PARA VER SE O CURSOR ESTA ABERTO
-- %NOTFOUND - RETORNA TRUE QUANDO NAO ENCONTRA NADA
-- %FOUND SE O DADO FOR ENCONTRADO
-- %ROWCOUNT RETORNA O TOTAL DE LINHAS DE UM REGISTRO

DECLARE
    CURSOR c_teste IS SELECT
        deptno,
        SUM(sal) soma ,
        avg(sal) media
        FROM emp
        
       GROUP BY deptno;

    --v_deptno   emp.deptno%TYPE;
    --v_soma     emp.sal%TYPE;
    
    v_reg  C_TESTE%ROWTYPE;  -- Pegando as duas variaveis 
    
BEGIN
    OPEN c_teste; -- EXECUTA A QUERY E JOGA OS DADOS DENTRO DA MEMORIA 
                  -- Guarda os dados na memoria das variaveis definidas para ser executado
                  
    LOOP
    
        FETCH c_teste INTO v_reg; -- EXTRAI DADOS DO CURSOR E JOGA PARA DENTRO DAS VARIAVEIS E VAI REMOVENDO OS DADOS DA MEMORIA
        EXIT WHEN c_teste%notfound; -- SAIA QUANDO NAO TIVER + INFORMAÇÕES
        
    END LOOP;
    dbms_output.put_line(v_reg.deptno || ' TOTAL '|| v_reg.soma || v_reg.media);
    
    CLOSE C_TESTE; -- ENCERRANDO CURSOR
END;

--------------------------------------------------------------------------------

-- FOR IMPLICITO ONDE VC PASSA O NOME DO REGISTRO ( IN ) E JOGA DENTRO DE UM CURSOR, ONDE SÃO ELIMINADA O OPEN , FETCH E O EXIT

DECLARE
    CURSOR c_teste IS SELECT
        deptno,
        SUM(sal) soma ,
        avg(sal) media
        FROM emp
       GROUP BY deptno;

    v_reg  C_TESTE%ROWTYPE; 

BEGIN          
    FOR v_reg in  c_teste LOOP
        dbms_output.put_line(v_reg.deptno || ' TOTAL '|| v_reg.soma || v_reg.media);
    END LOOP;
END;

--------------------------------------------------------------------------------
-- REDUZINDO A QUERY , REALIZANDO APENAS A CONSULTA DENTRO DO FOR IMPLICITO

DECLARE
   

BEGIN          
    FOR v_reg in (SELECT deptno, SUM(sal) soma , avg(sal) media FROM emp GROUP BY deptno)
    LOOP
       DBMS_OUTPUT.PUT_LINE(v_reg.deptno || ' TOTAL '|| v_reg.soma || v_reg.media);
    END LOOP;
END;


--------------------------------------------------------------------------------
