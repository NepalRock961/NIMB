set pages 0
set echo off
set verify off
set embedded off
set feed off
set head off
set term off
set wrap off
set linesize 250
set feedback off
set numformat 999,999,999,999.99
set serveroutput on size 1000000

spool  rpt_d_65.lst

DECLARE
flg	varchar2(1):= '&&1';
ac gam.foracid%type := '&&2';
date1 gam.acct_opn_date%type := '&&3';
currency1 gam.acct_name%type := '&&4';

cursor cur_1 is 
select schm_desc,
       acct_crncy_code,
       foracid,
       acct_name,
       acct_opn_date,
       tbaadm.commonpackage.eabBal_inAccCrncy(acid,date1) amt,
       tbaadm.commonpackage.getconvrate3(currency1,date1) rate
from gam a, gsp b
where
a.schm_code = b.schm_code and a.foracid = ac;

rec_1 cur_1%rowtype;

begin
           for rec_1 in cur_1
           loop
           begin
             if (rec_1.rate= 0 ) then
                rec_1.rate:=1;
             end if;
           /*dbms_output.put_line(flg	||'|'||
				rec_1.schm_desc||'|'||
				rec_1.acct_crncy_code||'|'||
				rec_1.foracid||'|'||
				rec_1.acct_name||'|'||
				rec_1.acct_opn_date||'|'||
				round(rec_1.amt,2)||'|'||round(rec_1.rate,2)||'|'||TRIM(UPPER(currency1))||'|'||
				round((round(rec_1.amt,2)/round(rec_1.rate,2)),2)||'|'||date1);*/
			dbms_output.put_line(flg    ||'|'||
                rec_1.schm_desc||'|'||
                rec_1.acct_crncy_code||'|'||
                rec_1.foracid||'|'||
                rec_1.acct_name||'|'||
                rec_1.acct_opn_date||'|'||
                TRIM(TO_CHAR(round(rec_1.amt,2),'99999999999999990.99'))||'|'||
                round(rec_1.rate,2)||'|'||
                TRIM(UPPER(currency1))||'|'||
                TRIM(TO_CHAR(round((round(rec_1.amt,2)/round(rec_1.rate,2)),2),'99999999999999990.99'))
                ||'|'||date1);
           end;
           end loop;
          
        
END;
/

spool off
exit

