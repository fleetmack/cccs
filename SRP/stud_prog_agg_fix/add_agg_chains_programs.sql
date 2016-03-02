BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_STUD_ENG_AGG"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(8,JOB,''LOAD_EDW_STUD_ENG_AGG_INSERT'',NULL, ''PROCESS_IND_IN = L'');
END;',

      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Student Engagement Aggregate',
      enabled               => TRUE);
END;
/

BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_STUD_PROG_AGG"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(8,JOB,''LOAD_EDW_STUD_PROG_AGG_INSERT'',NULL, ''PROCESS_IND_IN = L'');
END;',

      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Student Progress Aggregate',
      enabled               => TRUE);
END;
/


INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD_EDW_STUD_ENG_AGG_INSERT',
                  'CCCS_LOAD_EDW_STUD_ENG_AGG',
                  16);
                  
INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD_EDW_STUD_PROG_AGG_INSERT',
                  'CCCS_LOAD_EDW_STUD_PROG_AGG',
                  16);                  
