
create or replace package PKG_EXERC1 IS

   FUNCTION DIVNUMBERS(n1 number , n2 number) return number;
   FUNCTION CONTAGEM_CARACTER(xpto varchar2) return varchar2;
   -- SO POSSUI O ESQUELETO
   PROCEDURE INSERE_LOC(L_CD_DDD IN LOC_DDD.CD_DDD%TYPE , S_SEQ_DDD IN LOC_DDD.SEQ_DDD%TYPE , C_CIDADE_DDD IN LOC_DDD.CIDADE_DDD);

    
END;  

    CREATE OR REPLACE PACKAGE BODY PKG_EXERC1 IS
        
        -- 1) uma function que receberá dois números e retornará o resto da divisão entre eles.
        
        FUNCTION DIVNUMBERS(n1 number,n2 number) return number
            IS
                v_calculo number; 
                BEGIN
                    v_calculo := MOD(n1,n2);
                        return v_calculo;
                exception
                        when others then
                null;   
            END;
            
            
        -- 2) uma function que retornará a contagem de caracteres de uma determinada string.
        
        FUNCTION CONTAGEM_CARACTER(xpto varchar2) return varchar2   
        IS
            v_contagem varchar2(255);
            BEGIN
                v_contagem := length(xpto);
                return v_contagem;
        exception
            when others then
                return 'FAIL';
        END;
        
        -- 3) uma procedure que realizará a inserção na tabela LOC_DDD.
        
        procedure INSERE_LOC(L_CD_DDD IN LOC_DDD.CD_DDD%TYPE , S_SEQ_DDD IN LOC_DDD.SEQ_DDD%TYPE , C_CIDADE_DDD IN LOC_DDD.CIDADE_DDD)
        IS
            BEGIN
                INSERT INTO LOC_DDD (CD_DDD,SEQ_DDD,ESTADO_DDD,CIDADE_DDD) VALUES (L_CD_DDD,LOC_DDD.CD_DDD,C_CIDADE_DDD,LOC_DDD.CIDADE_DDD);
                COMMIT;
        exception
            when dup_val_on_index then
              raise_application_error(-20000, 'Chave existente. Tente novamente.');
            when  others then
              raise_application_error(-20001, 'Erro genérico.'||sqlerrm);
        END;

--fimbody            
END;

SELECT PKG_EXERC1.CONTAGEM_CARACTER('LUCAS') FROM DUAL;
SELECT PKG_EXERC1.DIVNUMBERS(10,5) FROM DUAL;

-- Execução da procedure
begin
PKG_EXERC1.INSERE_LOC();
end;

SELECT * FROM LOC_DDD;
