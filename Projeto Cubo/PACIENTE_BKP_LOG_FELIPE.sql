PROMPT CREATE TABLE paciente_bkp_log_felipe
CREATE TABLE paciente_bkp_log_felipe (
  cd_paciente            NUMBER(8,0)  NOT NULL,
  tp_situacao            VARCHAR2(1)  NOT NULL,
  tp_sexo                VARCHAR2(1)  NOT NULL,
  dt_cadastro            DATE         NOT NULL,
  cd_multi_empresa       NUMBER(4,0)  NOT NULL,
  sn_alt_dados_ora_app   VARCHAR2(1)  NOT NULL,
  sn_recebe_contato      VARCHAR2(1)  NOT NULL,
  sn_vip                 VARCHAR2(1)  NOT NULL,
  sn_notificacao_sms     VARCHAR2(1)  NOT NULL,
  dt_cadastro_manual     DATE         NOT NULL,
  sn_endereco_sem_numero VARCHAR2(1)  NOT NULL,
  sn_rut_ficticio        VARCHAR2(1)  NOT NULL,
  sn_oncologico          VARCHAR2(1)  NOT NULL,
  tp_dml                 VARCHAR2(10) NULL,
  usuario                VARCHAR2(50) NULL,
  data_registro          DATE         NULL
)
  STORAGE (
    NEXT       1024 K
  )
/


