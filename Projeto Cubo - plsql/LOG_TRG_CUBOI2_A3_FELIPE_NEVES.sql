PROMPT CREATE TABLE log_trg_cuboi2_a3_felipe_neves
CREATE TABLE log_trg_cuboi2_a3_felipe_neves (
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
  cd_import_simpro NUMBER(14,0) NULL,
  tp_dml           VARCHAR2(50) NULL,
  data_alteracao   DATE         NULL,
  usuario          VARCHAR2(50) NULL
)
  STORAGE (
    NEXT       1024 K
  )
/


