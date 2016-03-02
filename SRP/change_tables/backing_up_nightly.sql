select 'create or replace view odsmgr.'||object_name||'_v
        as
        select * from edwstg.'||object_name||'; commit;'
from dba_objects 
where object_name like 'CHG%'
and object_type = 'TABLE'
and owner = 'EDWSTG';

--  CREATE OR REPLACE PUBLIC SYNONYM "AWARD_BY_FUND" FOR "ODSMGR"."AWARD_BY_FUND";
select 'create or replace public synonym '||chr(34)||object_name||CHR(34)||
' for '||chr(34)||'ODSMGR'||chr(34)||'.'||chr(34)||object_name||chr(34)||';'
from dba_objects 
where object_name like 'CHG%V';

/*
BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_ADVISOR_16"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_ADVISOR-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2016'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Advisor for 2016',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD ADVISOR-2016',
                  'CCCS_LOAD_EDW_ADVISOR_16',
                  16);
/
*/

create or replace view odsmgr.CHG_ACADEMIC_OUTCOME_v
        as
        select * from edwstg.CHG_ACADEMIC_OUTCOME; commit;