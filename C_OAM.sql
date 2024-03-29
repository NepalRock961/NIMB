DROP TABLE CUSTOM.OLD_ACCT_MAP CASCADE CONSTRAINTS;

CREATE TABLE CUSTOM.OLD_ACCT_MAP
(
  SOL_ID       VARCHAR2(8 BYTE),
  OLD_ACCT_NO  VARCHAR2(20 BYTE),
  NEW_ACCT_NO  VARCHAR2(16 BYTE),
  RCRE_TIME    DATE                             DEFAULT SYSDATE
)
TABLESPACE CUSTOM
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


DROP SYNONYM CUSTOM.C_OAM;

CREATE OR REPLACE SYNONYM CUSTOM.C_OAM FOR CUSTOM.OLD_ACCT_MAP;


DROP PUBLIC SYNONYM C_OAM;

CREATE OR REPLACE PUBLIC SYNONYM C_OAM FOR CUSTOM.OLD_ACCT_MAP;


DROP PUBLIC SYNONYM OAM;

CREATE OR REPLACE PUBLIC SYNONYM OAM FOR CUSTOM.OLD_ACCT_MAP;
