PROMPT CREATE TABLE val_pro_cuboi2_felipe_neves
CREATE TABLE val_pro_cuboi2_felipe_neves (
  cd_tab_fat       NUMBER(4,0)  NOT NULL,
  cd_pro_fat       VARCHAR2(8)  NOT NULL,
  dt_vigencia      DATE         NOT NULL,
  vl_honorario     NUMBER(16,4) NULL,
  vl_operacional   NUMBER(14,4) NULL,
  vl_total         NUMBER(14,4) NULL,
  cd_import        NUMBER(6,0)  NULL,
  vl_sh            NUMBER(14,4) NULL,
  vl_sd            NUMBER(14,4) NULL,
  qt_pontos        NUMBER(12,0) NULL,
  qt_pontos_anest  NUMBER(12,0) NULL,
  sn_ativo         VARCHAR2(1)  NULL,
  nm_usuario       VARCHAR2(30) NULL,
  dt_ativacao      DATE         NULL,
  cd_seq_integra   NUMBER(20,0) NULL,
  dt_integra       DATE         NULL,
  cd_contrato      NUMBER(8,0)  NULL,
  cd_import_simpro NUMBER(14,0) NULL
)
  STORAGE (
    NEXT       1024 K
  )
/

PROMPT CREATE OR REPLACE TRIGGER trg_cuboi2_a3_felipe_neves
CREATE OR REPLACE TRIGGER trg_cuboi2_a3_felipe_neves

AFTER  ---- PODE SER BEFORE (ANTES DO EVENTO) OU AFTER (DEPOIS DO EVENTO)
UPDATE OR DELETE OR INSERT     --- QUAIS TIPOS DML VAI DISPARAR A TRIGGER

ON val_pro_cuboi2_felipe_neves  --- TABELA QUE A TRIGGER VAI ATUAR

REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW

DECLARE

BEGIN

IF DELETING THEN


      INSERT INTO LOG_TRG_CUBOI2_A3_FELIPE_NEVES
                     (    CD_TAB_FAT       ,
                          CD_PRO_FAT       ,
                          DT_VIGENCIA      ,
                          TP_DML           ,
                          DATA_ALTERACAO   ,
                          USUARIO
                        )
                    VALUES
                     ( :OLD.CD_TAB_FAT
                    ,  :OLD.CD_PRO_FAT
                    ,  :OLD.DT_VIGENCIA
                    , 'DELETE'
                    , TO_DATE(SYSDATE, 'DD/MM/YYYY')
                    , USER );

ELSIF INSERTING THEN
                 INSERT INTO LOG_TRG_CUBOI2_A3_FELIPE_NEVES

                     (    CD_TAB_FAT       ,
                          CD_PRO_FAT       ,
                          DT_VIGENCIA      ,
                          TP_DML,
                          DATA_ALTERACAO,
                          USUARIO
                        )
                    VALUES
                     ( :NEW.CD_TAB_FAT
                    ,  :NEW.CD_PRO_FAT
                    ,  :NEW.DT_VIGENCIA
                    , 'INSERT'
                    , TO_DATE(SYSDATE, 'DD/MM/YYYY')
                    , USER );

  ELSIF UPDATING THEN
     IF NVL(:OLD.CD_TAB_FAT,:NEW.CD_TAB_FAT) IN (5, 25,30)
     THEN    RAISE_APPLICATION_ERROR(-20002,'TAB FAT NÃO PERMITE ALTERACAO 5,25,30');

     ELSE

     INSERT INTO LOG_TRG_CUBOI2_A3_FELIPE_NEVES

                     (    CD_TAB_FAT       ,
                          CD_PRO_FAT       ,
                          DT_VIGENCIA      ,
                          TP_DML,
                          DATA_ALTERACAO,
                          USUARIO
                        )

                    VALUES
                   (   NVL(:NEW.CD_TAB_FAT                 ,:OLD.CD_TAB_FAT            )
                    ,  NVL(:NEW.CD_PRO_FAT                 ,:OLD.CD_PRO_FAT            )
                    ,  NVL(:NEW.DT_VIGENCIA                ,:OLD.DT_VIGENCIA            )
                    , 'UPDATE'
                    , TO_DATE(SYSDATE, 'DD/MM/YYYY')
                    , USER );
     END IF;
  END IF;




  END;
/


