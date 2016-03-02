create or replace PROCEDURE        MAINTAIN_EDW_CHANGE_RECORDS(P_CHG_TABLE IN VARCHAR2,  P_TABLE IN VARCHAR2,  P_LINK IN VARCHAR2)    IS
--
  merge_statement   VARCHAR2(1000);
  IsSourcedByRecruiter        VARCHAR2(1) := 'N';
--
  FUNCTION f_prepare_sql(p_edw_table VARCHAR2, p_match_logic VARCHAR2, p_insert_values VARCHAR2) RETURN VARCHAR2 IS
    ret_statement   VARCHAR2(4000);
  BEGIN
    ret_statement := 'INSERT INTO ' || p_edw_table || ' tgt ' ||
                     '(SELECT ' || p_insert_values ||
                     ' FROM ' || p_chg_table || ' src ' ||
                     'WHERE NOT EXISTS (SELECT NULL FROM ' || p_edw_table || ' edw_chg ' ||
                     'WHERE ' || p_match_logic || p_table || ''')';
    RETURN ret_statement;
  END f_prepare_sql;
--
BEGIN
    -- Identify if recruiter is used as a source
    BEGIN
        EXECUTE IMMEDIATE 'SELECT NVL(MUBINST_RECRUITER_INSTALLED, ''N'') FROM ODSSRC.MUBINST' INTO IsSourcedByRecruiter;
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;
--
  CASE
    WHEN p_chg_table = 'GURMCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_BANNER_COMMUNICATION',     'edw_chg.PERSON_UID = src.GURMCHG_PIDM) AND src.GURMCHG_PROCESS_ID = ''', 'src.GURMCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     IF(IsSourcedByRecruiter = 'Y')THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_BANNER_COMMUNICATION_RAP', 'edw_chg.PERSON_UID = TO_CHAR(src.GURMCHG_PIDM)) AND src.GURMCHG_PROCESS_ID = ''', 'src.GURMCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     END IF;
    WHEN p_chg_table = 'BRRCCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_COMMUNICATION',            'edw_chg.COMM_PK = src.BRRCCHG_COMM_PK) AND src.BRRCCHG_PROCESS_ID = ''', 'src.BRRCCHG_COMM_PK, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'BRRECHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_EM_CAMPAIGN',              'edw_chg.EM_CAMP_PK = src.BRRECHG_EM_CAMP_PK) AND src.BRRECHG_PROCESS_ID = ''', 'src.BRRECHG_EM_CAMP_PK, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'BRRFCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FUNNEL_HISTORY',           'edw_chg.PERSON_UID = src.BRRFCHG_PERSON_UID) AND src.BRRFCHG_PROCESS_ID = ''', 'src.BRRFCHG_PERSON_UID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'BRRICHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_INTERACTION',              'edw_chg.PERSON_UID = src.BRRICHG_PERSON_UID) AND src.BRRICHG_PROCESS_ID = ''', 'src.BRRICHG_PERSON_UID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'RBRCCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION',       'edw_chg.PERSON_UID = src.RBRCCHG_PIDM) AND src.RBRCCHG_PROCESS_ID = ''', 'src.RBRCCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     IF(IsSourcedByRecruiter = 'Y')THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION_RAP',   'edw_chg.PERSON_UID = TO_CHAR(src.RBRCCHG_PIDM)) AND src.RBRCCHG_PROCESS_ID = ''', 'src.RBRCCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     END IF;
    WHEN p_chg_table = 'RCRNCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_APPLICATION',   'edw_chg.PERSON_UID = src.RCRNCHG_PIDM) AND src.RCRNCHG_PROCESS_ID = ''', 'src.RCRNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_RECRUITMENT',   'edw_chg.PERSON_UID = src.RCRNCHG_PIDM) AND src.RCRNCHG_PROCESS_ID = ''', 'src.RCRNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION',       'edw_chg.PERSON_UID = src.RCRNCHG_PIDM) AND src.RCRNCHG_PROCESS_ID = ''', 'src.RCRNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_AWARD_ACAD_PERIOD', 'edw_chg.PERSON_UID = src.RCRNCHG_PIDM) AND src.RCRNCHG_PROCESS_ID = ''', 'src.RCRNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_AWARD_AID_YEAR',    'edw_chg.PERSON_UID = src.RCRNCHG_PIDM) AND src.RCRNCHG_PROCESS_ID = ''', 'src.RCRNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.RCRNCHG_PIDM) AND src.RCRNCHG_PROCESS_ID = ''', 'src.RCRNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     IF(IsSourcedByRecruiter = 'Y')THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION_RAP',   'edw_chg.PERSON_UID = TO_CHAR(src.RCRNCHG_PIDM)) AND src.RCRNCHG_PROCESS_ID = ''', 'src.RCRNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     END IF;
    WHEN p_chg_table = 'RORACHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_APPLICATION',   'edw_chg.PERSON_UID = src.RORACHG_PIDM) AND src.RORACHG_PROCESS_ID = ''', 'src.RORACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_RECRUITMENT',   'edw_chg.PERSON_UID = src.RORACHG_PIDM) AND src.RORACHG_PROCESS_ID = ''', 'src.RORACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION',       'edw_chg.PERSON_UID = src.RORACHG_PIDM) AND src.RORACHG_PROCESS_ID = ''', 'src.RORACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_AWARD_ACAD_PERIOD', 'edw_chg.PERSON_UID = src.RORACHG_PIDM) AND src.RORACHG_PROCESS_ID = ''', 'src.RORACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.RORACHG_PIDM) AND src.RORACHG_PROCESS_ID = ''', 'src.RORACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     IF(IsSourcedByRecruiter = 'Y')THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION_RAP',   'edw_chg.PERSON_UID = TO_CHAR(src.RORACHG_PIDM)) AND src.RORACHG_PROCESS_ID = ''', 'src.RORACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     END IF;
    WHEN p_chg_table = 'RORNCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_APPLICATION',   'edw_chg.PERSON_UID = src.RORNCHG_PIDM) AND src.RORNCHG_PROCESS_ID = ''', 'src.RORNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_RECRUITMENT',   'edw_chg.PERSON_UID = src.RORNCHG_PIDM) AND src.RORNCHG_PROCESS_ID = ''', 'src.RORNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION',       'edw_chg.PERSON_UID = src.RORNCHG_PIDM) AND src.RORNCHG_PROCESS_ID = ''', 'src.RORNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_AWARD_ACAD_PERIOD', 'edw_chg.PERSON_UID = src.RORNCHG_PIDM) AND src.RORNCHG_PROCESS_ID = ''', 'src.RORNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_AWARD_AID_YEAR',    'edw_chg.PERSON_UID = src.RORNCHG_PIDM) AND src.RORNCHG_PROCESS_ID = ''', 'src.RORNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.RORNCHG_PIDM) AND src.RORNCHG_PROCESS_ID = ''', 'src.RORNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     IF(IsSourcedByRecruiter = 'Y')THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION_RAP',   'edw_chg.PERSON_UID = TO_CHAR(src.RORNCHG_PIDM)) AND src.RORNCHG_PROCESS_ID = ''', 'src.RORNCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     END IF;
    WHEN p_chg_table = 'RPRPCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION',       'edw_chg.PERSON_UID = src.RPRPCHG_PIDM) AND src.RPRPCHG_PROCESS_ID = ''', 'src.RPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_AWARD_AID_YEAR',    'edw_chg.PERSON_UID = src.RPRPCHG_PIDM) AND src.RPRPCHG_PROCESS_ID = ''', 'src.RPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     IF(IsSourcedByRecruiter = 'Y')THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION_RAP',   'edw_chg.PERSON_UID = TO_CHAR(src.RPRPCHG_PIDM)) AND src.RPRPCHG_PROCESS_ID = ''', 'src.RPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     END IF;
    WHEN p_chg_table = 'SARACHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_APPLICATION',   'edw_chg.PERSON_UID = src.SARACHG_PIDM) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_ATTRIBUTE',    'edw_chg.PERSON_UID = src.SARACHG_PIDM) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_COHORT',       'edw_chg.PERSON_UID = src.SARACHG_PIDM) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_DECISION',     'edw_chg.PERSON_UID = src.SARACHG_PIDM) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_RATING',       'edw_chg.PERSON_UID = src.SARACHG_PIDM) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_REQUIREMENT',  'edw_chg.PERSON_UID = src.SARACHG_PIDM) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_COMBINED_ADMISSIONS_SOURCE','edw_chg.PERSON_UID = src.SARACHG_PIDM) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --BLM CCCS Customization
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT',      'edw_chg.PERSON_UID = TO_CHAR(src.SARACHG_PIDM)) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT',      'edw_chg.PERSON_UID = src.SARACHG_PIDM) AND src.SARACHG_TABLE_NAME = ''ADMISSIONS APPLICATION'' AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.SARACHG_PIDM) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     IF(IsSourcedByRecruiter = 'Y')THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT_RAP',      'edw_chg.PERSON_UID = TO_CHAR(src.SARACHG_PIDM)) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPL_REQUIREMENT_RAP',         'edw_chg.PERSON_UID = TO_CHAR(src.SARACHG_PIDM)) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_DECISION_RAP',     'edw_chg.PERSON_UID = TO_CHAR(src.SARACHG_PIDM)) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_COHORT_RAP',       'edw_chg.PERSON_UID = TO_CHAR(src.SARACHG_PIDM)) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_ATTRIBUTE_RAP',    'edw_chg.PERSON_UID = TO_CHAR(src.SARACHG_PIDM)) AND src.SARACHG_PROCESS_ID = ''', 'src.SARACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     END IF;
    WHEN p_chg_table = 'SFBKCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FEEDBACK',                 'edw_chg.PERSON_GRADE_COMMENT_KEY = src.SFBKCHG_SURROGATE_ID) AND src.SFBKCHG_PROCESS_ID = ''', 'src.SFBKCHG_SURROGATE_ID, NULL,'''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'SFBDCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FEEDBACK',                 'edw_chg.MST_FEEDBACK_KEY = src.SFBDCHG_SURROGATE_ID) AND src.SFBDCHG_PROCESS_ID = ''', 'NULL, src.SFBDCHG_SURROGATE_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'SGRACHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.SGRACHG_PIDM) AND src.SGRACHG_PROCESS_ID = ''', 'src.SGRACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'SGRCCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_APPLICATION',   'edw_chg.PERSON_UID = src.SGRCCHG_PIDM) AND src.SGRCCHG_PROCESS_ID = ''', 'src.SGRCCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_RECRUITMENT',   'edw_chg.PERSON_UID = src.SGRCCHG_PIDM) AND src.SGRCCHG_PROCESS_ID = ''', 'src.SGRCCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.SGRCCHG_PIDM) AND src.SGRCCHG_PROCESS_ID = ''', 'src.SGRCCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'SGRSCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_APPLICATION',   'edw_chg.PERSON_UID = src.SGRSCHG_PIDM) AND src.SGRSCHG_PROCESS_ID = ''', 'src.SGRSCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_RECRUITMENT',   'edw_chg.PERSON_UID = src.SGRSCHG_PIDM) AND src.SGRSCHG_PROCESS_ID = ''', 'src.SGRSCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ATHLETIC',                 'edw_chg.PERSON_UID = src.SGRSCHG_PIDM) AND src.SGRSCHG_PROCESS_ID = ''', 'src.SGRSCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --BLM 1/26/15 Removing next 3 lines, submitted IDEA-35689 to Ellucian to implement this to baseline. These stars do not need this change table and it results in 200K nightly extra change records    
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION',       'edw_chg.PERSON_UID = src.SGRSCHG_PIDM) AND src.SGRSCHG_PROCESS_ID = ''', 'src.SGRSCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_AWARD_ACAD_PERIOD', 'edw_chg.PERSON_UID = src.SGRSCHG_PIDM) AND src.SGRSCHG_PROCESS_ID = ''', 'src.SGRSCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_AWARD_AID_YEAR',    'edw_chg.PERSON_UID = src.SGRSCHG_PIDM) AND src.SGRSCHG_PROCESS_ID = ''', 'src.SGRSCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.SGRSCHG_PIDM) AND src.SGRSCHG_PROCESS_ID = ''', 'src.SGRSCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     IF(IsSourcedByRecruiter = 'Y')THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION_RAP',   'edw_chg.PERSON_UID = TO_CHAR(src.SGRSCHG_PIDM)) AND src.SGRSCHG_PROCESS_ID = ''', 'src.SGRSCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     END IF;
    WHEN p_chg_table = 'SGRPCHG' THEN
      --10/2/14 BLM - hard coding in reference to ADVISOR within change table to pull only correct rows 
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADVISOR',                  'edw_chg.PERSON_UID = src.SGRPCHG_PIDM) AND src.SGRPCHG_PROCESS_ID = ''', 'src.SGRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADVISOR',                  'edw_chg.PERSON_UID = src.SGRPCHG_PIDM) AND src.SGRPCHG_TABLE_NAME IN (''ADVISOR'') AND src.SGRPCHG_PROCESS_ID = ''', 'src.SGRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --10/2/14 BLM - hard coding in reference to STUDENT_ATTRIBUTE within change table to pull only correct rows 
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_ATTRIBUTE',        'edw_chg.PERSON_UID = src.SGRPCHG_PIDM) AND src.SGRPCHG_PROCESS_ID = ''', 'src.SGRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_ATTRIBUTE',        'edw_chg.PERSON_UID = src.SGRPCHG_PIDM)  AND src.SGRPCHG_TABLE_NAME IN (''STUDENT_ATTRIBUTE'',''ACADEMIC_STANDING'') AND src.SGRPCHG_PROCESS_ID = ''', 'src.SGRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --10/3/14 BLM hard coding to include only proper change records
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COHORT',           'edw_chg.PERSON_UID = src.SGRPCHG_PIDM) and src.sgrpchg_table_name IN (''STUDENT_COHORT'',''GENERAL_STUDENT'') AND src.SGRPCHG_PROCESS_ID = ''', 'src.SGRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.SGRPCHG_PIDM) AND src.SGRPCHG_PROCESS_ID = ''', 'src.SGRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'SHRACHG' THEN
      --10/2/14 BLM hard coding in trigger table_name values for the source tables of this star
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_GRADE_CHANGE',             'edw_chg.PERSON_UID = src.SHRACHG_PIDM) AND src.SHRACHG_PROCESS_ID = ''', 'src.SHRACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_GRADE_CHANGE',             'edw_chg.PERSON_UID = src.SHRACHG_PIDM) and src.shrachg_table_name in (''HISTORY_COURSE'',''Z_HISTORY_COURSE'',''STUDENT_COURSE_GRADE_CAHNGE'') AND src.SHRACHG_PROCESS_ID = ''', 'src.SHRACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.SHRACHG_PIDM) AND src.SHRACHG_PROCESS_ID = ''', 'src.SHRACHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --BLM modifying 1/13 to add academic_period to this change table      
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE',           'edw_chg.PERSON_UID = src.SHRACHG_PIDM) AND src.SHRACHG_PROCESS_ID = ''', 'src.SHRACHG_PIDM, NULL, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE',           'edw_chg.PERSON_UID = src.SHRACHG_PIDM and edw_chg.academic_period = src.shrachg_term_code) AND src.SHRACHG_PROCESS_ID = ''', 'src.SHRACHG_PIDM, NULL, '''|| p_chg_table || ''', SYSDATE, src.shrachg_term_code'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE_ATTR',      'edw_chg.PERSON_UID = src.SHRACHG_PIDM) AND src.SHRACHG_PROCESS_ID = ''', 'src.SHRACHG_PIDM, NULL, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'SHRCCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.SHRCCHG_PIDM) AND src.SHRCCHG_PROCESS_ID = ''', 'src.SHRCCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --BLM modifying 1/13 to add academic_period to this change table
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE',           'edw_chg.PERSON_UID = src.SHRCCHG_PIDM) AND src.SHRCCHG_PROCESS_ID = ''', 'src.SHRCCHG_PIDM, NULL, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE',           'edw_chg.PERSON_UID = src.SHRCCHG_PIDM and edw_chg.academic_period = src.shrcchg_term_code) AND src.SHRCCHG_PROCESS_ID = ''', 'src.SHRCCHG_PIDM, NULL, '''|| p_chg_table || ''', SYSDATE, src.shrcchg_term_code'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE_ATTR',      'edw_chg.PERSON_UID = src.SHRCCHG_PIDM) AND src.SHRCCHG_PROCESS_ID = ''', 'src.SHRCCHG_PIDM, NULL, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'SHRDCHG' THEN
       --BLM 10/6/14 hard coding in change table names
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_ACADEMIC_OUTCOME_HNR',     'edw_chg.PERSON_UID = src.SHRDCHG_PIDM) AND src.SHRDCHG_PROCESS_ID = ''', 'src.SHRDCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ACADEMIC_OUTCOME_HNR',     'edw_chg.PERSON_UID = src.SHRDCHG_PIDM) and src.shrdchg_table_name IN (''OUTCOME_HONOR_INST'',''OUTCOME_HONOR_DEPT'') AND src.SHRDCHG_PROCESS_ID = ''', 'src.SHRDCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     EXECUTE IMMEDIATE(f_prepare_sql('CHG_ACADEMIC_OUTCOME',         'edw_chg.PERSON_UID = src.SHRDCHG_PIDM) AND src.SHRDCHG_PROCESS_ID = ''', 'src.SHRDCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --BLM modifying 1/13 to add NULL academic_period to this change table  
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE',           'edw_chg.PERSON_UID = src.SHRDCHG_PIDM) AND src.SHRDCHG_PROCESS_ID = ''', 'src.SHRDCHG_PIDM, NULL, '''|| p_chg_table || ''', SYSDATE, NULL'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE_ATTR',      'edw_chg.PERSON_UID = src.SHRDCHG_PIDM) AND src.SHRDCHG_PROCESS_ID = ''', 'src.SHRDCHG_PIDM, NULL, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.SHRDCHG_PIDM) AND src.SHRDCHG_PROCESS_ID = ''', 'src.SHRDCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'SHRGCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.SHRGCHG_PIDM) AND src.SHRGCHG_PROCESS_ID = ''', 'src.SHRGCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'SORICHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_INSTITUTION',              'edw_chg.INSTITUTION = src.SORICHG_SBGI_CODE) AND src.SORICHG_PROCESS_ID = ''', 'src.SORICHG_SBGI_CODE, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'SPRPCHG' THEN
      --BLM 10/3/14 hard coding in change table names
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_ACADEMIC_OUTCOME',         'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ACADEMIC_OUTCOME',         'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) and src.sprpchg_table_name IN (''ACADEMIC_OUTCOME'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --BLM 10/6/14 hard coding in change tables
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_ACADEMIC_OUTCOME_HNR',     'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ACADEMIC_OUTCOME_HNR',     'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) and src.sprpchg_table_name IN (''ACADEMIC_OUTCOME'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'')    AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMINISTRATOR',            'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_APPLICATION',   'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_RECRUITMENT',   'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     --10/2/14 BLM - hard coding in reference to HOLD within change table to pull only correct rows
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADVISOR',                  'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADVISOR',                  'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_TABLE_NAME IN  (''ADVISOR'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'')AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_ATTRIBUTE',    'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_COHORT',       'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_DECISION',     'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_RATING',       'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_REQUIREMENT',  'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --BLM 10/6/14 hard coding in change table names
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_ATHLETIC',                 'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ATHLETIC',                 'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) and SRC.sprpchg_table_name in (''SPORT'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --BLM 10/3/14 hard coding in change table names
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_CONTACT',                  'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_CONTACT',                  'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) and src.sprpchg_process_id in (''CONTACT'',''PRE_STUDENT'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --BLM 10/3/14 hard coding in change table names
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION',       'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION',       'edw_chg.PERSON_UID = src.SPRPCHG_PIDM)  and src.sprpchg_table_name in (''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --BLM 10/3/14 hard coding in change table names
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_AWARD_ACAD_PERIOD', 'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_AWARD_ACAD_PERIOD', 'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) and src.sprpchg_table_name in (''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --BLM 10/3/14 hard coding in change table names
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_AWARD_AID_YEAR',    'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_AWARD_AID_YEAR',    'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) and src.sprpchg_table_name in (''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'')  AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     --10/2/14 BLM hard coding in change table names
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_GRADE_CHANGE',             'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_GRADE_CHANGE',             'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) and src.sprpchg_table_name IN (''ACADEMIC_OUTCOME'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --10/2/14 BLM - hard coding in reference to HOLD within change table to pull only correct rows     
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_HOLD',                     'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_HOLD',                     'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_TABLE_NAME IN  (''HOLD'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --10/3/14 BLM - hard coding in change table names
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_INTEREST',                 'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_INTEREST',                 'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) and src.sprpchg_table_name IN (''INTEREST'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_PERSON',                   'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --10/3/14 BLM - hard coding in change table names
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_POST_SECONDARY_SCHOOL',    'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_POST_SECONDARY_SCHOOL',    'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) and src.sprpchg_table_name IN (''PREVIOUS_EDUCATION_PCOL'',''PREVIOUS_DEGREE'',''PREVIOUS_EDUCATION_HSCH'',''PRE_STUDENT'',''ACADEMIC_OUTCOME'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'')   AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --10/2/14 BLM - hard coding in reference to pre student within change table to pull only correct rows, this one needs address
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT',      'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT',      'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_TABLE_NAME IN (''PRE STUDENT'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'',''ADDRESS'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --10/2/14 BLM - hard coding in reference to MST_RACE within change table to pull only correct rows
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_RACE',                     'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_RACE',                     'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_TABLE_NAME in (''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_RECRUITMENT_ATTRIBUTE',    'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_RECRUITMENT_COHORT',       'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_SECONDARY_SCHOOL_SUBJECT', 'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --10/3/14 BLM - hard coding in change table names
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_ACTIVITY',         'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_ACTIVITY',         'edw_chg.PERSON_UID = src.SPRPCHG_PIDM)  AND src.SPRPCHG_TABLE_NAME in (''STUDENT_ACTIVITY'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --10/2/14 BLM - hard coding in reference to general_student within change table to pull only correct rows      
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_ATTRIBUTE',        'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_ATTRIBUTE',        'edw_chg.PERSON_UID = src.SPRPCHG_PIDM)  AND src.SPRPCHG_TABLE_NAME IN (''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --10/3/14 BLM hard coding to reference only proper change table records
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COHORT',           'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COHORT',           'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) and src.sprpchg_table_name IN (''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --10/3/14 BLM - hard coding in change table names
      --1/13/14 BLM - putting in NULL for custom academic_period field
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE',           'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, NULL, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE',           'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) and src.sprpchg_table_name IN (''ACADEMIC_OUTCOME'',''PREVIOUS_EDUCATION_PCOL'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, NULL, '''|| p_chg_table || ''', SYSDATE, NULL'));
      --10/3/14 BLM - hard coding in change table names
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_STiUDENT_COURSE_ATTR',      'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, NULL, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE_ATTR',      'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) and src.sprpchg_table_name in (''PREVIOUS_EDUCATION_PCOL'',''ACADEMIC_OUTCOME'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'')  AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, NULL, '''|| p_chg_table || ''', SYSDATE'));
      --10/2/14 BLM - hard coding in reference to TEST within change table to pull only correct rows
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_TEST',                     'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_TEST',                     'edw_chg.PERSON_UID = src.SPRPCHG_PIDM) AND src.SPRPCHG_TABLE_NAME IN (''TEST'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'') AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
       IF(IsSourcedByRecruiter = 'Y')THEN
        EXECUTE IMMEDIATE(f_prepare_sql('CHG_TEST_RAP',                     'edw_chg.PERSON_UID = TO_CHAR(src.SPRPCHG_PIDM)) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
        EXECUTE IMMEDIATE(f_prepare_sql('CHG_POST_SECONDARY_SCHOOL_RAP',    'edw_chg.PERSON_UID = TO_CHAR(src.SPRPCHG_PIDM)) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
        EXECUTE IMMEDIATE(f_prepare_sql('CHG_INTEREST_RAP',                 'edw_chg.PERSON_UID = TO_CHAR(src.SPRPCHG_PIDM)) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
        EXECUTE IMMEDIATE(f_prepare_sql('CHG_RACE_RAP',                     'edw_chg.PERSON_UID = TO_CHAR(src.SPRPCHG_PIDM)) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
        EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT_RAP',      'edw_chg.PERSON_UID = TO_CHAR(src.SPRPCHG_PIDM)) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
        EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPL_REQUIREMENT_RAP',         'edw_chg.PERSON_UID = TO_CHAR(src.SPRPCHG_PIDM)) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
        EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_DECISION_RAP',     'edw_chg.PERSON_UID = TO_CHAR(src.SPRPCHG_PIDM)) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
        EXECUTE IMMEDIATE(f_prepare_sql('CHG_FINAID_APPLICATION_RAP',       'edw_chg.PERSON_UID = TO_CHAR(src.SPRPCHG_PIDM)) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
        EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_COHORT_RAP',       'edw_chg.PERSON_UID = TO_CHAR(src.SPRPCHG_PIDM)) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
        EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_ATTRIBUTE_RAP',    'edw_chg.PERSON_UID = TO_CHAR(src.SPRPCHG_PIDM)) AND src.SPRPCHG_PROCESS_ID = ''', 'src.SPRPCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      END IF;
    WHEN p_chg_table = 'SRRICHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_RECRUITMENT',   'edw_chg.PERSON_UID = src.SRRICHG_PIDM) AND src.SRRICHG_PROCESS_ID = ''', 'src.SRRICHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_COMBINED_ADMISSIONS_SOURCE','edw_chg.PERSON_UID = src.SRRICHG_PIDM) AND src.SRRICHG_PROCESS_ID = ''', 'src.SRRICHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      --10/2/14 BLM - hard coding in reference to recruitment information within change table to pull only correct rows      
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT',      'edw_chg.PERSON_UID = src.SRRICHG_PIDM) AND src.SRRICHG_PROCESS_ID = ''', 'src.SRRICHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT',      'edw_chg.PERSON_UID = src.SRRICHG_PIDM)  AND src.SRRICHG_TABLE_NAME = ''RECRUITMENT_INFORMATION'' AND src.SRRICHG_PROCESS_ID = ''', 'src.SRRICHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_RECRUITMENT_ATTRIBUTE',    'edw_chg.PERSON_UID = src.SRRICHG_PIDM) AND src.SRRICHG_PROCESS_ID = ''', 'src.SRRICHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_RECRUITMENT_COHORT',       'edw_chg.PERSON_UID = src.SRRICHG_PIDM) AND src.SRRICHG_PROCESS_ID = ''', 'src.SRRICHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     IF(IsSourcedByRecruiter = 'Y')THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT_RAP',  'edw_chg.PERSON_UID = TO_CHAR(src.SRRICHG_PIDM)) AND src.SRRICHG_PROCESS_ID = ''', 'src.SRRICHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
     END IF;
    WHEN p_chg_table = 'SSROCHG' THEN
     --10/3/14 BLM modifying to include only proper change records
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_MEETING_TIME',             'edw_chg.COURSE_REFERENCE_NUMBER = src.SSROCHG_CRN) AND src.SSROCHG_PROCESS_ID = ''', 'src.SSROCHG_CRN, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_MEETING_TIME',             'edw_chg.COURSE_REFERENCE_NUMBER = src.SSROCHG_CRN) and src.ssrochg_table_name in (''MEETING_TIME'') AND src.SSROCHG_PROCESS_ID = ''', 'src.SSROCHG_CRN, '''|| p_chg_table || ''', SYSDATE'));
      --10/3/14 BLM modifying to include only proper change records
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_COURSE_SECTION',           'edw_chg.COURSE_REFERENCE_NUMBER = src.SSROCHG_CRN) AND src.SSROCHG_PROCESS_ID = ''', 'src.SSROCHG_CRN, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_COURSE_SECTION',           'edw_chg.COURSE_REFERENCE_NUMBER = src.SSROCHG_CRN) and src.ssrochg_table_name in (''COURSE_OFFERING'') AND src.SSROCHG_PROCESS_ID = ''', 'src.SSROCHG_CRN, '''|| p_chg_table || ''', SYSDATE'));
      --BLM modifying 1/13 to add academic_period to this change table      
      --EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE',           'edw_chg.COURSE_REFERENCE_NUMBER = src.SSROCHG_CRN) AND src.SSROCHG_PROCESS_ID = ''', 'NULL, src.SSROCHG_CRN, '''|| p_chg_table || ''', SYSDATE'));  
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE',           'edw_chg.COURSE_REFERENCE_NUMBER = src.SSROCHG_CRN and edw_chg.academic_period = src.ssrochg_term_code) AND src.SSROCHG_PROCESS_ID = ''', 'NULL, src.SSROCHG_CRN, '''|| p_chg_table || ''', SYSDATE, src.ssrochg_term_code'));  
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT_COURSE_ATTR',      'edw_chg.COURSE_REFERENCE_NUMBER = src.SSROCHG_CRN) AND src.SSROCHG_PROCESS_ID = ''', 'NULL, src.SSROCHG_CRN, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'SIRFCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_COURSE_INSTRUCTOR',        'edw_chg.PERSON_UID = src.SIRFCHG_PIDM) AND src.SIRFCHG_PROCESS_ID = ''', 'src.SIRFCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'TBRDCHG' THEN
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_APPLICATION',   'edw_chg.PERSON_UID = src.TBRDCHG_PIDM) AND src.TBRDCHG_PROCESS_ID = ''', 'src.TBRDCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_ADMISSIONS_RECRUITMENT',   'edw_chg.PERSON_UID = src.TBRDCHG_PIDM) AND src.TBRDCHG_PROCESS_ID = ''', 'src.TBRDCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
      EXECUTE IMMEDIATE(f_prepare_sql('CHG_STUDENT',                  'edw_chg.PERSON_UID = src.TBRDCHG_PIDM) AND src.TBRDCHG_PROCESS_ID = ''', 'src.TBRDCHG_PIDM, '''|| p_chg_table || ''', SYSDATE'));
-- CRM change tables
    WHEN p_chg_table = 'CRRAACHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT',     'edw_chg.PERSON_UID = src.CRRAACHG_PROSPECT_ID) AND src.CRRAACHG_PROSPECT_ID IS NOT NULL AND src.CRRAACHG_PROCESS_ID = ''', 'DISTINCT src.CRRAACHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT_RAP', 'edw_chg.PERSON_UID = src.CRRAACHG_PROSPECT_ID) AND src.CRRAACHG_PROSPECT_ID IS NOT NULL AND src.CRRAACHG_PROCESS_ID = ''', 'DISTINCT src.CRRAACHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_DETAIL',      'edw_chg.APPLICATION_ID = src.CRRAACHG_APPLICATION_ID) AND src.CRRAACHG_PROCESS_ID = ''', 'src.CRRAACHG_APPLICATION_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_FUNNEL_PROGRESS',         'edw_chg.PERSON_UID = src.CRRAACHG_PROSPECT_ID) AND src.CRRAACHG_PROSPECT_ID IS NOT NULL AND src.CRRAACHG_PROCESS_ID = ''', 'DISTINCT src.CRRAACHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRAFCHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPL_FOLDER_REVIEW',      'edw_chg.APPLICATION_FOLDER_ID = src.CRRAFCHG_APP_FOLDER_ID) AND src.CRRAFCHG_PROCESS_ID = ''', 'src.CRRAFCHG_APP_FOLDER_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPLICATION_DETAIL',      'edw_chg.APPLICATION_ID = src.CRRAFCHG_APPLICATION_ID) AND src.CRRAFCHG_APPLICATION_ID IS NOT NULL AND src.CRRAFCHG_PROCESS_ID = ''', 'src.CRRAFCHG_APPLICATION_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRARCHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPL_SUPPLEMENTAL',       'edw_chg.SUPPLEMENTAL_ITEM_ID = src.CRRARCHG_APPLICATION_REQ_ID) AND src.CRRARCHG_PROCESS_ID = ''', 'src.CRRARCHG_APPLICATION_REQ_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRAVCHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_APPL_FOLDER_REVIEW',      'edw_chg.APPLICATION_FOLDER_ID = src.CRRAVCHG_APP_FOLDER_ID) AND src.CRRAVCHG_APP_FOLDER_ID IS NOT NULL AND src.CRRAVCHG_PROCESS_ID = ''', 'DISTINCT src.CRRAVCHG_APP_FOLDER_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRCACHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_RECRUITING_PERIOD',       'edw_chg.RECRUITING_PERIOD = src.CRRCACHG_RECRUITING_PERIOD_ID) AND src.CRRCACHG_RECRUITING_PERIOD_ID IS NOT NULL AND src.CRRCACHG_PROCESS_ID = ''', 'DISTINCT src.CRRCACHG_RECRUITING_PERIOD_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_RECRUITING_PERIOD_RAP',   'edw_chg.RECRUITING_PERIOD = src.CRRCACHG_RECRUITING_PERIOD_ID) AND src.CRRCACHG_RECRUITING_PERIOD_ID IS NOT NULL AND src.CRRCACHG_PROCESS_ID = ''', 'DISTINCT src.CRRCACHG_RECRUITING_PERIOD_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRCPCHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_RECRUITING_PERIOD',       'edw_chg.RECRUITING_PERIOD = src.CRRCPCHG_RECRUITING_PERIOD_ID) AND src.CRRCPCHG_PROCESS_ID = ''', 'src.CRRCPCHG_RECRUITING_PERIOD_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRCTCHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_RECR_TEAM',               'edw_chg.RECRUITING_TEAM = src.CRRCTCHG_RECRUITING_TEAM_CODE) AND src.CRRCTCHG_PROCESS_ID = ''', 'DISTINCT src.CRRCTCHG_RECRUITING_TEAM_CODE, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_RECR_TEAM_RAP',           'edw_chg.RECRUITING_TEAM = src.CRRCTCHG_RECRUITING_TEAM_CODE) AND src.CRRCTCHG_PROCESS_ID = ''', 'DISTINCT src.CRRCTCHG_RECRUITING_TEAM_CODE, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRREGCHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_REC_TEAM_TERR_GOAL',      'edw_chg.GOAL_ID = src.CRREGCHG_GOAL_ID) AND src.CRREGCHG_PROCESS_ID = ''', 'src.CRREGCHG_GOAL_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRPACHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT',     'edw_chg.PERSON_UID = src.CRRPACHG_PARENT_ID) AND src.CRRPACHG_PROCESS_ID = ''', 'src.CRRPACHG_PARENT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT_RAP', 'edw_chg.PERSON_UID = src.CRRPACHG_PARENT_ID) AND src.CRRPACHG_PROCESS_ID = ''', 'src.CRRPACHG_PARENT_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRRNCHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_INTEREST',                'edw_chg.PERSON_UID = src.CRRRNCHG_PARENT_ID) and src.CRRRNCHG_PARENT_ID IS NOT NULL AND src.CRRRNCHG_PROCESS_ID = ''', 'DISTINCT src.CRRRNCHG_PARENT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_INTEREST_RAP',            'edw_chg.PERSON_UID = src.CRRRNCHG_PARENT_ID) and src.CRRRNCHG_PARENT_ID IS NOT NULL AND src.CRRRNCHG_PROCESS_ID = ''', 'DISTINCT src.CRRRNCHG_PARENT_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRRPCHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT',     'edw_chg.PERSON_UID = src.CRRRPCHG_PROSPECT_ID) AND src.CRRRPCHG_PROCESS_ID = ''', 'src.CRRRPCHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT_RAP', 'edw_chg.PERSON_UID = src.CRRRPCHG_PROSPECT_ID) AND src.CRRRPCHG_PROCESS_ID = ''', 'src.CRRRPCHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_RECRUITER_PROB_DES',      'edw_chg.PERSON_UID = src.CRRRPCHG_PROSPECT_ID) AND src.CRRRPCHG_PROCESS_ID = ''', 'src.CRRRPCHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_RECRUITER_PROB_DES_RAP',  'edw_chg.PERSON_UID = src.CRRRPCHG_PROSPECT_ID) AND src.CRRRPCHG_PROCESS_ID = ''', 'src.CRRRPCHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_FUNNEL_PROGRESS',         'edw_chg.PERSON_UID = src.CRRRPCHG_PROSPECT_ID) AND src.CRRRPCHG_PROCESS_ID = ''', 'src.CRRRPCHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRRSCHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT',     'edw_chg.PERSON_UID = src.CRRRSCHG_SUSPECT_ID) AND src.CRRRSCHG_PROCESS_ID = ''', 'src.CRRRSCHG_SUSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT_RAP', 'edw_chg.PERSON_UID = src.CRRRSCHG_SUSPECT_ID) AND src.CRRRSCHG_PROCESS_ID = ''', 'src.CRRRSCHG_SUSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_FUNNEL_PROGRESS',         'edw_chg.PERSON_UID = src.CRRRSCHG_SUSPECT_ID) AND src.CRRRSCHG_PROCESS_ID = ''', 'src.CRRRSCHG_SUSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRSPCHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_POST_SECONDARY_SCHOOL',       'edw_chg.PERSON_UID = src.CRRSPCHG_PROSPECT_ID) AND src.CRRSPCHG_PROSPECT_ID IS NOT NULL AND src.CRRSPCHG_PROCESS_ID = ''', 'DISTINCT src.CRRSPCHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_POST_SECONDARY_SCHOOL_RAP',   'edw_chg.PERSON_UID = src.CRRSPCHG_PROSPECT_ID) AND src.CRRSPCHG_PROSPECT_ID IS NOT NULL AND src.CRRSPCHG_PROCESS_ID = ''', 'DISTINCT src.CRRSPCHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRSSCHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT',     'edw_chg.PERSON_UID = src.CRRSSCHG_PROSPECT_ID) AND src.CRRSSCHG_PROSPECT_ID IS NOT NULL AND src.CRRSSCHG_PROCESS_ID = ''', 'DISTINCT src.CRRSSCHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_PROSPECTIVE_STUDENT_RAP', 'edw_chg.PERSON_UID = src.CRRSSCHG_PROSPECT_ID) AND src.CRRSSCHG_PROSPECT_ID IS NOT NULL AND src.CRRSSCHG_PROCESS_ID = ''', 'DISTINCT src.CRRSSCHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRTOCHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_TEST',                    'edw_chg.PERSON_UID = src.CRRTOCHG_PROSPECT_ID) AND src.CRRTOCHG_PROSPECT_ID IS NOT NULL AND src.CRRTOCHG_PROCESS_ID = ''', 'DISTINCT src.CRRTOCHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_TEST_RAP',                'edw_chg.PERSON_UID = src.CRRTOCHG_PROSPECT_ID) AND src.CRRTOCHG_PROSPECT_ID IS NOT NULL AND src.CRRTOCHG_PROCESS_ID = ''', 'DISTINCT src.CRRTOCHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
    WHEN p_chg_table = 'CRRTPCHG' THEN
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_TEST',                    'edw_chg.PERSON_UID = src.CRRTPCHG_PROSPECT_ID) AND src.CRRTPCHG_PROSPECT_ID IS NOT NULL AND src.CRRTPCHG_PROCESS_ID = ''', 'DISTINCT src.CRRTPCHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
       EXECUTE IMMEDIATE(f_prepare_sql('CHG_TEST_RAP',                'edw_chg.PERSON_UID = src.CRRTPCHG_PROSPECT_ID) AND src.CRRTPCHG_PROSPECT_ID IS NOT NULL AND src.CRRTPCHG_PROCESS_ID = ''', 'DISTINCT src.CRRTPCHG_PROSPECT_ID, '''|| p_chg_table || ''', SYSDATE'));
    ELSE
       NULL;
  END CASE;
END MAINTAIN_EDW_CHANGE_RECORDS;