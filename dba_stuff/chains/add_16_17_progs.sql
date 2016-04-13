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
COMMIT;                  
/
BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_ADVISOR_17"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_ADVISOR-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2017'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Advisor for 2017',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD ADVISOR-2017',
                  'CCCS_LOAD_EDW_ADVISOR_17',
                  16);
/
COMMIT;  
/

BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_MEETING_TIME_16"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_MEETING_TIME-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2016'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Meeting Time for 2016',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD MEETING_TIME-2016',
                  'CCCS_LOAD_EDW_MEETING_TIME_16',
                  16);
/
COMMIT;  
/


BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_MEETING_TIME_17"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_MEETING_TIME-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2017'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Meeting Time for 2017',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD MEETING_TIME-2017',
                  'CCCS_LOAD_EDW_MEETING_TIME_17',
                  16);
/
COMMIT;  
/

BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_GRADE_CHANGE_16"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_GRADE_CHANGE-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2016'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Grade Change for 2016',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD GRADE_CHANGE-2016',
                  'CCCS_LOAD_EDW_GRADE_CHANGE_16',
                  16);
/
COMMIT;  
/


BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_GRADE_CHANGE_17"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_GRADE_CHANGE-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2017'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Grade Change for 2017',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD GRADE_CHANGE-2017',
                  'CCCS_LOAD_EDW_GRADE_CHANGE_17',
                  16);
/
COMMIT;  
/

BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_STUD_CRSE_ATR_16"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_STUDENT_COURSE_ATTRIBUTE-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2016'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Student Course Attribute for 2016',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD STUD CRSE ATTR-2016',
                  'CCCS_LOAD_EDW_STUD_CRSE_ATR_16',
                  16);
/
COMMIT;  
/


BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_STUD_CRSE_ATR_17"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_STUDENT_COURSE_ATTRIBUTE-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2017'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Student Course Attribute for 2017',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD STUD CRSE ATTR-2017',
                  'CCCS_LOAD_EDW_STUD_CRSE_ATR_17',
                  16);
/
COMMIT;  
/


BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_ACAD_OUTCOME_16"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_ACADEMIC_OUTCOME-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2016'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Academic Outcome for 2016',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD ACADEMIC OUTCOME-2016',
                  'CCCS_LOAD_EDW_ACAD_OUTCOME_16',
                  16);
/
COMMIT;  
/


BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_ACAD_OUTCOME_17"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_ACADEMIC_OUTCOME-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2017'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Academic Outcome for 2017',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD ACADEMIC OUTCOME-2017',
                  'CCCS_LOAD_EDW_ACAD_OUTCOME_17',
                  16);
/
COMMIT;  
/

BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_STUD_ATTR_16"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_STUDENT_ATTRIBUTE-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2016'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Student Attribute for 2016',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD STUDENT ATTRIBUTE-2016',
                  'CCCS_LOAD_EDW_STUD_ATTR_16',
                  16);
/
COMMIT;  
/


BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_STUD_ATTR_17"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_STUDENT_ATTRIBUTE-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2017'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Student Attribute for 2017',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD STUDENT ATTRIBUTE-2017',
                  'CCCS_LOAD_EDW_STUD_ATTR_17',
                  16);
/
COMMIT;  
/

BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_STUD_COHORT_16"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_STUDENT_COHORT-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2016'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Student Cohort for 2016',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD STUDENT COHORT-2016',
                  'CCCS_LOAD_EDW_STUD_COHORT_16',
                  16);
/
COMMIT;  
/


BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_STUD_COHORT_17"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_STUDENT_COHORT-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2017'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Student Cohort for 2017',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD STUDENT COHORT-2017',
                  'CCCS_LOAD_EDW_STUD_COHORT_17',
                  16);
/
COMMIT;  
/

BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_CRS_INST_16"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_CRS_INST-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2016'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Course Instructor for 2016',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD CRS_INST-2016',
                  'CCCS_LOAD_EDW_CRS_INST_16',
                  16);
/
COMMIT;  
/


BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_CRS_INST_17"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_CRS_INST-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2017'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Course Instructor for 2017',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD CRS_INST-2017',
                  'CCCS_LOAD_EDW_CRS_INST_17',
                  16);
/
COMMIT;  
/

BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_COURSE_SECT_16"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_COURSE_SECTION-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2016'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Course Section for 2016',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD COURSE_SECT-2016',
                  'CCCS_LOAD_EDW_COURSE_SECT_16',
                  16);
/
COMMIT;  
/


BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_COURSE_SECT_17"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_COURSE_SECTION-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2017'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Course Section for 2017',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD COURSE_SECT-2017',
                  'CCCS_LOAD_EDW_COURSE_SECT_17',
                  16);
/
COMMIT;  
/

BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_STUD_COURSE_16"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_STUDENT_COURSE-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2016'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Student Course for 2016',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD STUDENT COURSE-2016',
                  'CCCS_LOAD_EDW_STUD_COURSE_16',
                  16);
/
COMMIT;  
/


BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_STUD_COURSE_17"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_STUDENT_COURSE-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2017'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Student Course for 2017',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD STUDENT COURSE-2017',
                  'CCCS_LOAD_EDW_STUD_COURSE_17',
                  16);
/
COMMIT;  
/

BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_STUDENT_16"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_STUDENT_STAR-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2016'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Student for 2016',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD STUDENT-2016',
                  'CCCS_LOAD_EDW_STUDENT_16',
                  16);
/
COMMIT;  
/


BEGIN
   DBMS_SCHEDULER.CREATE_PROGRAM (
      program_name          => '"IA_ADMIN"."CCCS_LOAD_EDW_STUDENT_17"',
      program_action        => 'DECLARE
   JOB_NUM   NUMBER;
BEGIN
   SELECT sys.jobseq.nextval INTO JOB_NUM from dual;
mgkmap.P_RunETLMapSlotsByGroup(99,JOB_NUM,''LOAD_EDW_STUDENT_STAR-P'',NULL, ''PROCESS_IND_IN = L| ACADEMIC_YEAR_IN = 2017'');
END;',
      program_type          => 'PLSQL_BLOCK',
      number_of_arguments   => 0,
      comments              => 'This LOADs Student for 2017',
      enabled               => TRUE);
END;
/

INSERT INTO IA_ADMIN.CCCS_CHAIN_PROG_XWALK
        VALUES (
                  'EDW-OP-LOAD STUDENT-2017',
                  'CCCS_LOAD_EDW_STUDENT_17',
                  16);
/
COMMIT;  
/