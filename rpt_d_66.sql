set pages 0
set echo off
set verify off
set embedded off
set feed off
set head off
set term off
set lines 250
set wrap off
set linesize 220 
set feedback off
set numformat 999,999,999,999.99
set serveroutput on size 1000000

spool rpt_d_66.lst

DECLARE
        date1 c_abbs.TRAN_DATE%type :='&&1';
        date2 c_abbs.TRAN_DATE%type :='&&2';  	
	id aph.bacid%type;
        actid gam.foracid%type;
	actid1 gam.foracid%type;
        acid1 gam.acid%type;
        obal	gam.clr_bal_amt%type :=0;
   	bal	gam.clr_bal_amt%type :=0;
	na bct.br_name%type;

CURSOR cur1 is
select  distinct NON_FIN_HOME_SOL,sol_id,sol_desc
from c_abbs,sol where
TRAN_DATE between '&&1' and '&&2'
and sol_id not in ('9999')
and c_abbs.DEL_FLG = 'N';


rec1 cur1%rowtype;

BEGIN
        FOR rec1 IN cur1
                LOOP
                        BEGIN

if(rec1.NON_FIN_HOME_SOL = '001' ) then
id := 'PUMIMPACCSP';
na :='DARBAR MARG';
end if;

if(rec1.NON_FIN_HOME_SOL = '002' ) then
id := 'PUMIMPACCHO';
na := 'SEEPADOLE BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '003' ) then
id := 'PUMIMPACCBG';
na := 'BIRGUNJ BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '004' ) then
  id := 'PUMIMPACCPT';
na := 'PULCHOWK BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '005' ) then
  id := 'PUMIMPACCBP';
na := 'BANEPA BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '006' ) then
  id := 'PUMIMPACCJP';
na := 'JEETPUR BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '007' ) then
  id := 'PUMIMPACCNR';
  na := 'NEWROAD BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '008' ) then
  id := 'PUMIMPACCBN';
  na := 'BIRATNAGAR BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '009' ) then
  id := 'PUMIMPACCBW';
  na := 'BUTWAL BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '010' ) then
  id := 'PUMIMPACCBH';
  na := 'BHAIRAHAWA BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '011' ) then
  id := 'PUMIMPACCPK';
  na := 'POKHARA BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '012' ) then
  id := 'PUMIMPACCPS';
  na := 'PUTALISADAK BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '013' ) then
  id := 'PUMIMPACCNG';
 na := 'NARAYANGARH BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '014' ) then
  id := 'PUMIMPACCJN';
  na := 'JANAKPUR BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '015' ) then
  id := 'PUMIMPACCNP';
  na := 'NEPALGUNJ BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '016' ) then
  id := 'PUMIMPACCTM';
  na := 'THAMEL BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '017' ) then
  id := 'PUMIMPACCKM';
  na := 'KALIMATI BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '018' ) then
  id := 'PUMIMPACCBM';
  na := 'BIRTAMOD BRANCH';
end if;

if(rec1.NON_FIN_HOME_SOL = '019' ) then
  id := 'PUMIMPACCBT';
  na := 'BATTISPUTALI BRANCH';
end if;


begin
select distinct foracid,acid,clr_bal_amt,tbaadm.commonpackage.eabbal(acid,(date2-1)) into actid,acid1,bal,obal from gam where bacid= id and acct_crncy_code = 'NPR' and sol_id = rec1.SOL_ID;
exception when no_data_found then
actid := null;
actid1 := null;
bal := 0;
obal := 0;
end;


dbms_output.put_line(date1||'|'||date2||'|'||rec1.NON_FIN_HOME_SOL||'|'||
rec1.SOL_ID||'|'||actid||'|'||bal||'|'||obal||'|'||rec1.sol_desc||'|'||na);
actid:=null;
bal := 0;
obal := 0;
na := null;


         END;
 END LOOP;



END;
/

spool off
