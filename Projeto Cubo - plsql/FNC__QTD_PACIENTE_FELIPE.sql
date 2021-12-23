PROMPT CREATE OR REPLACE FUNCTION fnc__qtd_paciente_felipe
CREATE OR REPLACE FUNCTION fnc__qtd_paciente_felipe
(p_cd_paciente NUMBER) -- paramentro de entrada

      RETURN VARCHAR2   IS

      CURSOR c_cidade IS SELECT
                      paciente.nm_paciente
                      FROM   paciente  ,cidade
                      WHERE  paciente.cd_paciente = p_cd_paciente
                      AND    cidade.cd_cidade = paciente.cd_cidade
                      GROUP BY cidade.nm_cidade
                      ORDER BY cidade.nm_cidade ;

      ---variaveis
      v_cidade VARCHAR2(40) ;

      BEGIN

        OPEN c_cidade;
        FETCH c_cidade  INTO v_cidade ;   -- pegando o resusltdo do select do cursor  e colocando na variavel
        CLOSE c_cidade; --- fechando a variavel

        RETURN v_cidade;
    -- retorna a informacao
   END;
/

