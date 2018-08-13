/*
Crie uma função chamada fun_qtd_func_deptoque
retorne a quantidade total de funcionário de um 
determinado departamento. Caso não exista funcionário
cadastrado para o departamento informado, ou ocorrer 
qualquer erro imprevisto, retornar o valor 0 (zero).
*/

SELECT * FROM LOC_FUNCIONARIO;
SET SERVEROUTPUT ON

create or replace function fun_qtd_func_deptoque(cd_departamento in number)
return number
is
     contaFunc number := 0;  
BEGIN
    FOR INDICE IN (SELECT CD_DEPTO FROM LOC_FUNCIONARIO) LOOP
           if(INDICE.CD_DEPTO = cd_departamento) then
                contaFunc := contaFunc + 1;
           end if;    
    END LOOP;  
    return contafunc;
 END;

 
 -------------------------------------------------------------------------------------------------------------------------------
 
 /*
 2) Desenvolva uma função denominada fun_nome_veículo que vai ter um retorno varchar2. Essa função vai receber como
parâmetro a placa do veículo e selecionar as seguintes colunas: Modelo + Cor + e tipo do automóvel. Concatene essas colunas na
variável de retorno da função. Caso a placa do veículo não esteja cadastrada, parar o processamento emitindo a seguinte
mensagem de erro “Placa <nrplaca> do veículo não está cadastrada. Favor informar um código válido !”. 
*/

SELECT * FROM LOC_VEICULO;
SET SERVEROUTPUT ON


create or replace function fun_nome_veículo(v_placa in varchar2)
return varchar2

IS

BEGIN

FOR INDICE IN (SELECT NR_PLACA , MODELO , COR , TIPO_AUTOMOVEL FROM LOC_VEICULO) LOOP
    IF(INDICE.NR_PLACA = v_placa) THEN
        DBMS_OUTPUT.PUT_LINE('MODELO : ' || INDICE.MODELO);
    END IF;
    END LOOP;
    
END;



 

