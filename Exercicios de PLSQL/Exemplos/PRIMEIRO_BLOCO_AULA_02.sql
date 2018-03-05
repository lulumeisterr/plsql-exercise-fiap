SET SERVEROUTPUT ON;

DECLARE

v_hoje date := sysdate;
v_ontem date := sysdate -1;
v_amanha date := sysdate +1;
--v_mes date := sysdate + 10;

BEGIN

DBMS_OUTPUT.PUT_LINE('DATA DE HOJE ' || v_hoje || chr(13) || 
                     'Data de ontem : ' || v_ontem || chr(13) || 
                     'Data de amanha : '  || v_amanha || chr(13) || 'Mes que vem ' || ADD_MONTHS(v_hoje ,1) || chr(13) || 
                     'Proxima sexta feira ' || NEXT_DAY(v_hoje,'sexta feira') || chr(13) || 
                     'De outro jeito , Proxima sexta ' || NEXT_DAY(ADD_MONTHS(v_hoje,1), 'Sexta-feira'));

END;

/

DECLARE

V_COL2 VARCHAR(20);
V_COL1 NUMBER(5);
V_COL3 date;


BEGIN

SELECT COL1 , COL2 , COL3 INTO V_COL1 , V_COL2 , V_COL3 
              from A1 
              WHERE COL1 = 1;

INSERT INTO A1 VALUES(V_COL1 + 1 , V_COL2 || '1' , V_COL3 + 1);

END;


/

DECLARE

V_COL2 VARCHAR(30);
V_COL3 DATA;
V_MAX NUMBER;
BEGIN

-- ESTA FUNÇÃO PEGA O ULTIMO NUMERO EX: 1 , 2 , 3 , 4 , 5 <- ELA PEGARÁ O 5

SELECT MAX(COL1) INTO V_MAX 
  FROM A1
  WHERE COL1 = V_MAX;


INSERT INTO A1 VALUES (V_MAX+1 , V_COL2 || V_MAX , V_COL3 + V_MAX);

END;



/*

1. Avalie cada uma das declarações a seguir. Determine quais delas não são
legais e explique por quê.

a. DECLARE v_id NUMBER(4);
b. DECLARE v_x, v_y, v_z VARCHAR2(10);
c. DECLARE v_birthdate DATE NOT NULL;
d. DECLARE v_in_stock BOOLEAN := 1;

*\

-- A , a instancia desta variavel certa
-- B , Não pode ter mais que uma variavel em uma instancia
-- C , 
-- D , Não da para realizar esta instancia pois o tipo boolean não se atribui com numero



