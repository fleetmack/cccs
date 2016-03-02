create or replace PROCEDURE        MAINTAIN_EDW_ERROR_RECORDS(p_chg_table IN VARCHAR2,  p_error_table IN VARCHAR2, p_process_ind IN VARCHAR2 DEFAULT 'R', p_time IN VARCHAR2 default 'ALL', p_time_field IN VARCHAR2 default 'ACADEMIC_YEAR') IS
--
  merge_statement   VARCHAR2(1000);
--
  FUNCTION f_prepare_insert_sql(p_column VARCHAR2, p_column2 VARCHAR2 DEFAULT NULL) RETURN VARCHAR2 IS
    ret_statement   VARCHAR2(10000);
    dtype           dba_tab_columns.data_type%TYPE;
  BEGIN
    CASE
    WHEN (p_column = 'PERSON_UID' AND p_column2 IS NULL) THEN
       --
       SELECT data_type
         INTO dtype
         FROM dba_tab_columns
        WHERE table_name = UPPER(p_chg_table)
          AND column_name = UPPER(p_column);
       --
       IF dtype = 'NUMBER' THEN
          ret_statement := 'INSERT INTO '|| P_CHG_TABLE ||' tgt ' ||
                           '(SELECT X.BANNER_PIDM, '''|| P_ERROR_TABLE ||''', sysdate '||
                              'FROM (SELECT DISTINCT '|| P_COLUMN ||' FROM ' || P_ERROR_TABLE || ') E, '||
                                    'WDT_WAREHOUSE_ENTITY X '||
                             'WHERE X.WAREHOUSE_ENTITY_UID = E.' || P_COLUMN ||')';
       ELSE
          ret_statement := 'INSERT INTO '|| p_chg_table ||' tgt ' ||
                           '(SELECT DISTINCT x.source_id, '''|| p_error_table ||''', sysdate '||
                              'FROM TABLE(edw_general_extr.f_get_warehouse_entities('''|| p_error_table ||''', '''|| p_column ||''', ''Y'')) x '||
                             'WHERE NOT (x.source_id = ''0'' AND x.source_name = '''|| mgkelib.banner_source_name ||'''))';
       END IF;
    /*** 1/14/2015 BLM added to support chg_student_course additional field we added - academic_period */
    WHEN (p_column = 'PERSON_UID' AND p_column2 IS NOT NULL and p_chg_table = 'CHG_STUDENT_COURSE') THEN
       ret_statement := 'INSERT INTO '|| P_CHG_TABLE ||' tgt ' ||
                        '(SELECT X.BANNER_PIDM, '||P_COLUMN2||', '''|| P_ERROR_TABLE ||''', sysdate, E.academic_period '||
                           'FROM (SELECT DISTINCT '|| P_COLUMN ||','||P_COLUMN2||', academic_period  FROM  ' || P_ERROR_TABLE || ') E, '||
                                 'WDT_WAREHOUSE_ENTITY X '||
                          'WHERE X.WAREHOUSE_ENTITY_UID = E.' || P_COLUMN ||')';
    /*** End of CCCS Customization ***/   
   --NOTE, added in "p_change_table <> 'CHG_STUDENT_COURSE'", but I do not think it is necessary
    WHEN (p_column = 'PERSON_UID' AND p_column2 IS NOT NULL  and p_chg_table <> 'CHG_STUDENT_COURSE') THEN
       ret_statement := 'INSERT INTO '|| P_CHG_TABLE ||' tgt ' ||
                        '(SELECT X.BANNER_PIDM, '||P_COLUMN2||', '''|| P_ERROR_TABLE ||''', sysdate '||
                           'FROM (SELECT DISTINCT '|| P_COLUMN ||','||P_COLUMN2||' FROM  ' || P_ERROR_TABLE || ') E, '||
                                 'WDT_WAREHOUSE_ENTITY X '||
                          'WHERE X.WAREHOUSE_ENTITY_UID = E.' || P_COLUMN ||')';
    WHEN (p_column = 'PERSON_GRADE_COMMENT_KEY' AND p_column2='FEEDBACK_KEY') THEN
                ret_statement := 'INSERT INTO CHG_FEEDBACK TGT
                   (SELECT PERSON_GRADE_COMMENT_KEY, FEEDBACK_KEY, '''|| P_ERROR_TABLE ||''', SYSDATE
                      FROM
                           (SELECT DISTINCT PERSON_UID FROM WTT_FEEDBACK_ERROR) E,
                           WDT_WAREHOUSE_ENTITY X,
                           (SELECT DISTINCT PERSON_GRADE_COMMENT_KEY, FEEDBACK_KEY,MF.PERSON_UID
                              FROM MST_FACULTY_FEEDBACK MF, MST_FACULTY_FEEDBACK_DETAIL MFD
                             WHERE MF.ACADEMIC_PERIOD = MFD.ACADEMIC_PERIOD
                                   AND MF.COURSE_REFERENCE_NUMBER =
                                          MFD.COURSE_REFERENCE_NUMBER
                                   AND MF.FEEDBACK_SESSION_KEY = MFD.FEEDBACK_SESSION_KEY
                                   AND MF.PERSON_UID = MFD.PERSON_UID) TB_MST
                     WHERE X.WAREHOUSE_ENTITY_UID = E.PERSON_UID AND TB_MST.PERSON_UID=X.BANNER_PIDM)';
    ELSE
       ret_statement := 'INSERT INTO ' || p_chg_table || ' tgt ' ||
                        '(SELECT DISTINCT ' || p_column ||','''||p_error_table||''', sysdate'||
                        '   FROM ' || p_error_table || ' )';
    END CASE;
    RETURN ret_statement;
  END f_prepare_insert_sql;
--
BEGIN
IF p_process_ind = 'R' THEN
  CASE
    WHEN p_chg_table = 'CHG_INSTITUTION' THEN
      EXECUTE IMMEDIATE(f_prepare_insert_sql('INSTITUTION'));
    WHEN p_chg_table = 'CHG_COMMUNICATION' THEN
      EXECUTE IMMEDIATE(f_prepare_insert_sql('COMMUNICATION_ITEM_ID'));
    WHEN p_chg_table = 'CHG_EM_CAMPAIGN' THEN
      EXECUTE IMMEDIATE(f_prepare_insert_sql('PERSON_EM_CAMPAIGN_KEY'));
    WHEN p_chg_table = 'CHG_COURSE_SECTION' THEN
      EXECUTE IMMEDIATE(f_prepare_insert_sql('COURSE_REFERENCE_NUMBER'));
    WHEN p_chg_table = 'CHG_MEETING_TIME' THEN
      EXECUTE IMMEDIATE(f_prepare_insert_sql('COURSE_REFERENCE_NUMBER'));
    WHEN p_chg_table IN ('CHG_STUDENT_COURSE', 'CHG_STUDENT_COURSE_ATTR') THEN
      EXECUTE IMMEDIATE(f_prepare_insert_sql('PERSON_UID', 'COURSE_REFERENCE_NUMBER'));
    WHEN p_chg_table IN ('CHG_FEEDBACK') THEN
      EXECUTE IMMEDIATE(f_prepare_insert_sql('PERSON_GRADE_COMMENT_KEY','FEEDBACK_KEY'));
    WHEN p_chg_table = 'CHG_APPL_SUPPLEMENTAL' THEN
      EXECUTE IMMEDIATE(f_prepare_insert_sql('SUPPLEMENTAL_ITEM_ID'));
    WHEN p_chg_table = 'CHG_APPL_FOLDER_REVIEW' THEN
      EXECUTE IMMEDIATE(f_prepare_insert_sql('APPLICATION_FOLDER_ID'));
    WHEN p_chg_table = 'CHG_APPLICATION_DETAIL' THEN
      EXECUTE IMMEDIATE(f_prepare_insert_sql('APPLICATION_ID'));
    WHEN p_chg_table = 'CHG_RECRUITING_PERIOD' THEN
      EXECUTE IMMEDIATE(f_prepare_insert_sql('RECRUITING_PERIOD'));
    WHEN p_chg_table = 'CHG_RECR_TEAM' THEN
      EXECUTE IMMEDIATE(f_prepare_insert_sql('RECRUITING_TEAM'));
    WHEN p_chg_table = 'CHG_REC_TEAM_TERR_GOAL' THEN
      EXECUTE IMMEDIATE(f_prepare_insert_sql('GOAL_ID'));
    ELSE
      EXECUTE IMMEDIATE(f_prepare_insert_sql('PERSON_UID'));
  END CASE;
END IF;

CASE
  WHEN (p_process_ind = 'L' AND p_time <> 'ALL') THEN
    EXECUTE IMMEDIATE('DELETE FROM '||p_error_table||' WHERE ' || p_time_field ||' = '''||p_time||'''');
  ELSE
    EXECUTE IMMEDIATE('TRUNCATE TABLE ' || p_error_table);
END CASE;

END MAINTAIN_EDW_ERROR_RECORDS;