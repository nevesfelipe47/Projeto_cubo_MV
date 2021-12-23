PROMPT CREATE OR REPLACE TRIGGER trg_paciente_bkp2_felipe
CREATE OR REPLACE TRIGGER trg_paciente_bkp2_felipe

  BEFORE                      --- PODE SER BEFORE( ANTES DO EVENTO )  OU AFTER (DEPOIS DO EVENTO)
  UPDATE OR DELETE OR INSERT      --- QUAIS TIPOS DE DML VAI DISPARAR A TRIGGER

  ON paciente_bkp_felipe      --- TABELA QUE A TRIGGER VAI ATUAR

  REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW


DECLARE


        BEGIN
          IF DELETING THEN
          RAISE_APPLICATION_ERROR(-20002, 'NãO É PERMITIDO EXCLUIR PACIENTE!!!');
----            INSERT INTO PACIENTE_BKP_LOG_FELIPE
----                 ( CD_PACIENTE
----                  ,TP_SITUACAO
----                  ,TP_SEXO
----                  ,DT_CADASTRO
----                  ,CD_MULTI_EMPRESA
----                  ,SN_ALT_DADOS_ORA_APP
----                  ,SN_RECEBE_CONTATO
----                  ,SN_VIP
----                  ,SN_NOTIFICACAO_SMS
----                  ,DT_CADASTRO_MANUAL
----                  ,SN_ENDERECO_SEM_NUMERO
----                  ,SN_RUT_FICTICIO
----                  ,SN_ONCOLOGICO
----                  ,TP_DML
----                  ,USUARIO
----                  ,DATA_REGISTRO )
----                  VALUES
----                  (:OLD.CD_PACIENTE
----                  ,:OLD.TP_SITUACAO
----                  ,:OLD.TP_SEXO
----                  ,:OLD.DT_CADASTRO
----                  ,:OLD.CD_MULTI_EMPRESA
----                  ,:OLD.SN_ALT_DADOS_ORA_APP
----                  ,:OLD.SN_RECEBE_CONTATO
----                  ,:OLD.SN_VIP
----                  ,:OLD.SN_NOTIFICACAO_SMS
----                  ,:OLD.DT_CADASTRO_MANUAL
----                  ,:OLD.SN_ENDERECO_SEM_NUMERO
----                  ,:OLD.SN_RUT_FICTICIO
----                  ,:OLD.SN_ONCOLOGICO
----                  ,'DELETE'
----                  ,USER
----                  ,SYSDATE );

   ELSIF INSERTING THEN
        INSERT INTO PACIENTE_BKP_LOG_FELIPE
                 ( CD_PACIENTE
                  ,TP_SITUACAO
                  ,TP_SEXO
                  ,DT_CADASTRO
                  ,CD_MULTI_EMPRESA
                  ,SN_ALT_DADOS_ORA_APP
                  ,SN_RECEBE_CONTATO
                  ,SN_VIP
                  ,SN_NOTIFICACAO_SMS
                  ,DT_CADASTRO_MANUAL
                  ,SN_ENDERECO_SEM_NUMERO
                  ,SN_RUT_FICTICIO
                  ,SN_ONCOLOGICO
                  ,TP_DML
                  ,USUARIO
                  ,DATA_REGISTRO )
                  VALUES
                  (:NEW.CD_PACIENTE
                  ,:NEW.TP_SITUACAO
                  ,:NEW.TP_SEXO
                  ,:NEW.DT_CADASTRO
                  ,:NEW.CD_MULTI_EMPRESA
                  ,:NEW.SN_ALT_DADOS_ORA_APP
                  ,:NEW.SN_RECEBE_CONTATO
                  ,:NEW.SN_VIP
                  ,:NEW.SN_NOTIFICACAO_SMS
                  ,:NEW.DT_CADASTRO_MANUAL
                  ,:NEW.SN_ENDERECO_SEM_NUMERO
                  ,:NEW.SN_RUT_FICTICIO
                  ,:NEW.SN_ONCOLOGICO
                  ,'INSERT'
                  ,USER
                  ,SYSDATE );

  ELSIF UPDATING THEN
        INSERT INTO PACIENTE_BKP_LOG_FELIPE
                 ( CD_PACIENTE
                  ,TP_SITUACAO
                  ,TP_SEXO
                  ,DT_CADASTRO
                  ,CD_MULTI_EMPRESA
                  ,SN_ALT_DADOS_ORA_APP
                  ,SN_RECEBE_CONTATO
                  ,SN_VIP
                  ,SN_NOTIFICACAO_SMS
                  ,DT_CADASTRO_MANUAL
                  ,SN_ENDERECO_SEM_NUMERO
                  ,SN_RUT_FICTICIO
                  ,SN_ONCOLOGICO
                  ,TP_DML
                  ,USUARIO
                  ,DATA_REGISTRO )
                  VALUES
                  (NVL(:NEW.CD_PACIENTE            ,:OLD.CD_PACIENTE            )
                  ,NVL(:NEW.TP_SITUACAO            ,:OLD.TP_SITUACAO            )
                  ,NVL(:NEW.TP_SEXO                ,:OLD.TP_SEXO                )
                  ,NVL(:NEW.DT_CADASTRO            ,:OLD.DT_CADASTRO            )
                  ,NVL(:NEW.CD_MULTI_EMPRESA       ,:OLD.CD_MULTI_EMPRESA       )
                  ,NVL(:NEW.SN_ALT_DADOS_ORA_APP   ,:OLD.SN_ALT_DADOS_ORA_APP   )
                  ,NVL(:NEW.SN_RECEBE_CONTATO      ,:OLD.SN_RECEBE_CONTATO      )
                  ,NVL(:NEW.SN_VIP                 ,:OLD.SN_VIP                 )
                  ,NVL(:NEW.SN_NOTIFICACAO_SMS     ,:OLD.SN_NOTIFICACAO_SMS     )
                  ,NVL(:NEW.DT_CADASTRO_MANUAL     ,:OLD.DT_CADASTRO_MANUAL     )
                  ,NVL(:NEW.SN_ENDERECO_SEM_NUMERO ,:OLD.SN_ENDERECO_SEM_NUMERO )
                  ,NVL(:NEW.SN_RUT_FICTICIO        ,:OLD.SN_RUT_FICTICIO        )
                  ,NVL(:NEW.SN_ONCOLOGICO          ,:OLD.SN_ONCOLOGICO          )
                  ,'UPDATE'
                  ,USER
                  ,SYSDATE );
     END IF;
END;
/

