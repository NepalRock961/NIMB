DROP TABLE CUSTOM.OLD_CUST_MAP CASCADE CONSTRAINTS;

CREATE TABLE CUSTOM.OLD_CUST_MAP
(
  SOL_ID       VARCHAR2(8 BYTE),
  OLD_CUST_NO  VARCHAR2(15 BYTE),
  NEW_CUST_NO  VARCHAR2(9 BYTE),
  BANK_NAME    VARCHAR2(5 BYTE)
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


DROP SYNONYM CUSTOM.C_OCM;

CREATE OR REPLACE SYNONYM CUSTOM.C_OCM FOR CUSTOM.OLD_CUST_MAP;


DROP PUBLIC SYNONYM C_OCM;

CREATE OR REPLACE PUBLIC SYNONYM C_OCM FOR CUSTOM.OLD_CUST_MAP;
