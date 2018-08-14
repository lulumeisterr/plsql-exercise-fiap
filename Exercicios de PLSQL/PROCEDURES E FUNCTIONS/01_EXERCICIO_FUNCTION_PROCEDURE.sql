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
    
  exception 
    when others then
  return 0;
  
 END;
 
select fun_qtd_func_deptoque(50) from dual;
 

 
 -------------------------------------------------------------------------------------------------------------------------------
 
 /*
 2) Desenvolva uma função denominada fun_nome_veículo que vai ter um retorno varchar2. Essa função vai receber como
parâmetro a placa do veículo e selecionar as seguintes colunas: Modelo + Cor + e tipo do automóvel. Concatene essas colunas na
variável de retorno da função. Caso a placa do veículo não esteja cadastrada, parar o processamento emitindo a seguinte
mensagem de erro “Placa <nrplaca> do veículo não está cadastrada. Favor informar um código válido !”. 
*/

SELECT * FROM LOC_VEICULO;
SET SERVEROUTPUT ON


create or replace function fun_nome_veiculo (v_placa in varchar2)
return varchar2

IS

save_placa varchar2(100) := '';

BEGIN
FOR INDICE IN (SELECT NR_PLACA ,  MODELO , COR , TIPO_AUTOMOVEL  FROM LOC_VEICULO) LOOP
    IF(INDICE.NR_PLACA = v_placa) THEN
        save_placa := INDICE.MODELO || INDICE.COR || INDICE.TIPO_AUTOMOVEL;
    END IF;  
  END LOOP;
    return save_placa;
END;

select fun_nome_veiculo('CZR9988') from dual;

/*

3) Desenvolva uma função denominada fun_nome_grupo que vai ter um retorno varchar2. Essa função vai receber como
parâmetro o código do grupo de veículo e selecionar o nome do grupo na tabela LOC_GRUPO. Caso o código do grupo não esteja
cadastrado, parar o processamento emitindo a seguinte mensagem de erro “Código do grupo não está cadastrado. Favor informar
um código válido !”. 

*/

SELECT * FROM LOC_GRUPO;

create or replace function fun_nome_veiculo (cod_group in varchar2)
return varchar2
IS
save_group varchar2(100) := '';
save_msg varchar2(100) := 'Código do grupo não está cadastrado. Favor informar um código válido !';

BEGIN

FOR INDICE IN (SELECT CD_GRUPO , DS_GRUPO FROM LOC_GRUPO) LOOP
  IF(INDICE.CD_GRUPO = cod_group) then
    save_group := INDICE.DS_GRUPO;
    ELSE
    RETURN save_msg;
    END IF;
  END LOOP;
  return save_group;
END;

select fun_nome_veiculo('3213210') from dual;


/*

4) Crie uma função chamada fun_val_med_loc_cliente que retorne o valor total médio gasto por determinado cliente. Caso não
exista o cliente cadastrado, ou ocorrer qualquer erro imprevisto, retornar o valor 0 (zero).

*/

-- loc_pedido_locacao

-----------------------------------------------------------------------------------------------------------------------------------

/*
Desenvolva um procedimento chamado prc_gera_estrelas_cli que tem como objetivo atualizar o número de estrelas de cada
cliente(coluna nr_estrelas: tabela LOC_CLIENTE). O número de estrelas que um cliente pode possuir está entre 1 e 5 estrelas.
Para ser possível identificar qual estrela o cliente possui, utilize a função FUN_VAL_MED_LOC_CLI para obter o valor médio
total gasto pelo cliente e utilize a tabela abaixo, que determina em qual faixa o valor médio de locação o cliente se encaixa. No
final do processamento, confirme as transações realizadas e cria uma instrução SQL à parte que verifica se a estrela gerada
para cada cliente está de acordo com as locações hoje cadastradas.
*/







  









 

