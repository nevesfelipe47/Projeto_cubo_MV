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

