SET SERVEROUTPUT ON

-- http://aserlorenzo.com/manSQL/Oracle/dml/funcoes/funcoescaracter.htm#SUBSTR

DECLARE
texto VARCHAR(30) := 'EXEMPLO DE ( erro';
BEGIN

-- Exibindo o tamanho da String
DBMS_OUTPUT.PUT_LINE('Tamanho da string  : ' || length(texto));
DBMS_OUTPUT.PUT_LINE(texto);

-- Trocando a String
DBMS_OUTPUT.PUT_LINE(replace(texto,'EXEMPLO DE ( erro', 'EXEMPLO DE ERRO'));

END;
/


DECLARE

texto VARCHAR(30) := 'EXEMPLO DE ( erro';
pos NUMBER := INSTR(texto,'(');

BEGIN

DBMS_OUTPUT.PUT_LINE(SUBSTR(texto, 1 , pos-1) || SUBSTR(texto,pos+1));

END;


-- Trabalhando com datas 

DECLARE

-- saber q quantidade de dias que existe ate o dia de hj

HOJE DATE := SYSDATE;
NOVENTA DATE := SYSDATE + 90;
JULHO DATE := TO_DATE('12/07/2018', 'DD/MM/YYYY');  -- Conversao implicita

BEGIN

DBMS_OUTPUT.PUT_LINE('Qtd de dias : ' || TO_CHAR(JULHO - HOJE));
DBMS_OUTPUT.PUT_LINE('Qtd de meses : ' || TO_CHAR(MONTHS_BETWEEN(JULHO , HOJE)));
DBMS_OUTPUT.PUT_LINE('24 MESES  : ' || ADD_MONTHS(HOJE , 24));
DBMS_OUTPUT.PUT_LINE('Proxima sexta : ' || NEXT_DAY(JULHO, 'SEGUNDA-FEIRA'));
DBMS_OUTPUT.PUT_LINE('ULTIMO DIA : ' || LAST_DAY(NOVENTA));
DBMS_OUTPUT.PUT_LINE('Arredonda data: ' || ROUND(JULHO , 'MONTH'));

END;