create or replace PACKAGE edw_general_extr IS
--
PROCEDURE p_delete_feedback_fact_records;
--
PROCEDURE p_insert_student_crse_chg_rec;
--
PROCEDURE p_insert_retention_my_chg_rec(change_table_in VARCHAR2);
--
PROCEDURE p_delete_fact_records(change_table_in VARCHAR2, fact_table_in VARCHAR2, column_in VARCHAR2, dimension_table_in VARCHAR2 DEFAULT NULL, column2_in VARCHAR2 DEFAULT NULL);
--
PROCEDURE p_delete_fact_table(fact_table_in VARCHAR2, year_in VARCHAR2 DEFAULT 'ALL', year_type_in VARCHAR2 DEFAULT 'ACADEMIC_YEAR');
--
  TYPE event_rec IS RECORD
      (EVENT_CATEGORY       VARCHAR2(255),
       EVENT_TYPE           VARCHAR2(255),
       EVENT                VARCHAR2(255),
       EVENT_DESCRIPTION    VARCHAR2(255),
       EVENT_PROCESS        VARCHAR2(255));
--
  TYPE event_tab IS TABLE OF event_rec;
--
  TYPE calendar_tab IS TABLE OF WTT_DIM_CALENDAR_DATE_CLEAN%ROWTYPE;
--
  TYPE tab_institution_extr IS TABLE OF WTT_INSTITUTION_INPUT%ROWTYPE;
--
  TYPE tab_hold_extr IS TABLE OF WTT_HOLD_INPUT%ROWTYPE;
--
  TYPE ban_comm_extr IS TABLE OF WTT_BANNER_COMMUNICATION_INPUT%ROWTYPE;
--
  TYPE tab_race_extr IS TABLE OF WTT_RACE_INPUT%ROWTYPE;
--
  FUNCTION f_get_events(process_in VARCHAR2) RETURN event_tab PIPELINED;
--
  FUNCTION f_get_calendar_records(start_year_in NUMBER DEFAULT 1980, end_year_in NUMBER DEFAULT 2049) RETURN calendar_tab PIPELINED;
--
  FUNCTION f_get_institution(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_institution_extr PIPELINED;
--
  FUNCTION f_get_hold(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_hold_extr PIPELINED;
--
  FUNCTION f_get_bann_comm(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN ban_comm_extr PIPELINED;
--
  FUNCTION f_get_race(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_race_extr PIPELINED;
--
  FUNCTION f_safe_to_number(value_in VARCHAR2) return number;
--
  CURSOR get_default_values IS
    SELECT *
      FROM WCV_DEFAULT_VALUES;
--
  CURSOR get_mtvparm(int_code_group VARCHAR2, int_code VARCHAR2, int_code2 VARCHAR2) IS
    SELECT *
      FROM MTVPARM
     WHERE MTVPARM_INTERNAL_CODE_GROUP = int_code_group
       AND MTVPARM_INTERNAL_CODE = int_code
       AND (MTVPARM_INTERNAL_CODE_2 = int_code2 or int_code2 = 'ALL');
--
    CURSOR get_person_demo(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_uid_in NUMBER) IS
      SELECT MIF_VALUE                          multi_source,
             PERSON_UID,
             ID_NUMBER                          id,
             FULL_NAME_LFMI                     full_name_lfmi,
             BIRTH_DATE,
             DECEASED_DATE,
             EMAIL_PREFERRED_ADDRESS            email_address,
             CONFIDENTIALITY_IND,
             GENDER,
             PRIMARY_ETHNCITY_CATEGORY          ethnicity_category,
             HISPANIC_LATINO_ETHNICITY_IND,
             PRIMARY_ETHNICITY                  ethnicity,
             DECEASED_STATUS                    deceased_ind,
             CITIZENSHIP_IND,
             CITIZENSHIP_TYPE,
             NATION_OF_CITIZENSHIP,
             NATION_OF_BIRTH,
             PRIM_DISABILITY                    primary_disability,
             LEGACY,
             MARITAL_STATUS,
             RELIGION,
             VETERAN_CATEGORY,
             RACE_ETHNICITY_CONFIRM_IND,
             RACE_ETHNICITY_CONFIRM_DATE
        FROM MST_PERSON P
       WHERE PERSON_UID = person_uid_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
    CURSOR get_address(def_multi_source_in VARCHAR2, process_date_in DATE, multi_src_in VARCHAR2, person_in NUMBER) IS
      SELECT *
        FROM MST_ADDRESS
       WHERE ENTITY_UID = person_in
         AND process_date_in BETWEEN NVL(ADDRESS_START_DATE, SYSDATE) AND NVL(ADDRESS_END_DATE, SYSDATE)
         AND (ADDRESS_STATUS_IND = 'A' OR ADDRESS_STATUS_IND IS NULL)
         AND PREFERRED_ADDRESS_IND = 'Y'
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
       ORDER BY ADDRESS_SEQ_NO DESC;
--
    CURSOR get_georegion(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER, atyp_in VARCHAR2, aseq_in NUMBER, division_in VARCHAR2) IS
      SELECT *
        FROM MGT_GEOGRAPHIC_REGION
       WHERE ENTITY_UID = person_in
         AND ADDRESS_TYPE = atyp_in
         AND ADDRESS_SEQ_NO = aseq_in
         AND GEOGRAPHIC_DIVISION = division_in
         AND GEOGRAPHIC_REGION_STATUS_IND IS NULL
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
    CURSOR get_telephone(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER) IS
      SELECT *
        FROM MST_TELEPHONE
       WHERE ENTITY_UID = person_in
         AND PHONE_PRIMARY_IND = 'Y'
         AND (PHONE_STATUS_IND <> 'I' OR PHONE_STATUS_IND IS NULL)
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
       ORDER BY PHONE_SEQ_NUMBER DESC;
--
    CURSOR get_race(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER) IS
      SELECT DECODE(SIGN(SUM(DECODE(RACE_CATEGORY,'1',1,0))),1,'Y','N')  native_american_or_alaskan_ind,
             DECODE(SIGN(SUM(DECODE(RACE_CATEGORY,'2',1,0))),1,'Y','N')  asian_ind,
             DECODE(SIGN(SUM(DECODE(RACE_CATEGORY,'3',1,0))),1,'Y','N')  black_or_african_ind,
             DECODE(SIGN(SUM(DECODE(RACE_CATEGORY,'4',1,0))),1,'Y','N')  pacific_islander_ind,
             DECODE(SIGN(SUM(DECODE(RACE_CATEGORY,'5',1,0))),1,'Y','N')  white_ind,
             DECODE(SUM(DECODE(RACE_CATEGORY,'1',1,'2',1,'3',1,'4',1,'5',1,0)),NULL,'N',0,'N',1,'N','Y')          two_or_more_ind,
             NVL(SUM(DECODE(RACE_CATEGORY,'1',1,'2',1,'3',1,'4',1,'5',1,0)),0) number_of_races,
             SIGN(SUM(NVL((SELECT 0 FROM MTVPARM WHERE MTVPARM_INTERNAL_CODE_GROUP = 'EDW EXTRACT PARAMETERS'
                                    AND MTVPARM_INTERNAL_CODE = 'MINORITY_IND'
                                    AND MTVPARM_INTERNAL_CODE_2 = 'NON_MINORITY_RACE_CATEGORY'
                                    AND MTVPARM_EXTERNAL_CODE = RACE_CATEGORY),1))) minority_ind
        FROM MST_RACE
       WHERE PERSON_UID = person_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
    CURSOR get_visa(def_multi_source_in VARCHAR2, process_date_in DATE, multi_src_in VARCHAR2, person_in NUMBER) IS
      SELECT *
        FROM MST_VISA
       WHERE PERSON_UID = person_in
         AND TRUNC(process_date_in) BETWEEN VISA_START_DATE AND VISA_EXPIRE_DATE
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
       ORDER BY VISA_START_DATE DESC, VISA_NUMBER;
--
    CURSOR get_ra_visa(def_multi_source_in VARCHAR2, process_date_in DATE, multi_src_in VARCHAR2, person_in NUMBER) IS
      SELECT COUNT(*) resident_alien_visa_count
        FROM MST_VISA A, STVVTYP B
       WHERE A.VISA_TYPE = B.STVVTYP_CODE
         AND B.STVVTYP_NON_RES_IND= 'Y'
         AND PERSON_UID = person_in
         AND TRUNC(process_date_in) BETWEEN VISA_START_DATE AND VISA_EXPIRE_DATE
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
    CURSOR get_vettype(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER) IS
      SELECT VETERAN_TYPE, MAX(ACADEMIC_PERIOD) max_acad_per
        FROM MST_ENROLLMENT
       WHERE PERSON_UID = person_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
       GROUP BY VETERAN_TYPE
       ORDER BY max_acad_per DESC;
--
     CURSOR get_institution(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, institution_in VARCHAR2 DEFAULT NULL) IS
      SELECT *
        FROM MST_INSTITUTION
       WHERE INSTITUTION = institution_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
    CURSOR get_georegion_inst(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, institution_in VARCHAR2, division_in VARCHAR2) IS
      SELECT *
        FROM MGT_GEOGRAPHIC_REGION_INST
       WHERE INSTITUTION = institution_in
         AND GEOGRAPHIC_DIVISION = division_in
         AND GEOGRAPHIC_REGION_STATUS = 'A'
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
    CURSOR get_inst_demo(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, institution_in VARCHAR2) IS
      SELECT *
        FROM MST_INSTITUTION_DEMOGRAPHIC
       WHERE INSTITUTION = institution_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
       ORDER BY CALENDAR_YEAR DESC;
--
    CURSOR get_year_type(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, acad_period_in VARCHAR2, year_type_in VARCHAR2) IS
      SELECT *
        FROM MGT_YEAR_TYPE_DEFINITION
       WHERE YEAR_TYPE = year_type_in
         AND ACADEMIC_PERIOD = acad_period_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
    CURSOR get_student_year_type(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, acad_period_in VARCHAR2, person_uid_in NUMBER) IS
      SELECT *
        FROM MGT_STUDENT_PERIOD_DEFINITION
       WHERE PERSON_UID = person_uid_in
         AND ACADEMIC_PERIOD = acad_period_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
    two_year_rec                MTVPARM%ROWTYPE;
    four_year_rec               MTVPARM%ROWTYPE;
    private_rec                 MTVPARM%ROWTYPE;
    public_rec                  MTVPARM%ROWTYPE;
    homeschool_rec              MTVPARM%ROWTYPE;
--
    CURSOR get_inst_char(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, institution_in VARCHAR2) IS
      SELECT CALENDAR_YEAR,
             SIGN(SUM(DECODE(INST_CHARACTERISTIC, two_year_rec.mtvparm_external_code, 1, 0))) two_year_ind,
             SIGN(SUM(DECODE(INST_CHARACTERISTIC, four_year_rec.mtvparm_external_code, 1, 0))) four_year_ind,
             SIGN(SUM(DECODE(INST_CHARACTERISTIC, private_rec.mtvparm_external_code, 1, 0))) private_ind,
             SIGN(SUM(DECODE(INST_CHARACTERISTIC, public_rec.mtvparm_external_code, 1, 0))) public_ind,
             SIGN(SUM(DECODE(INST_CHARACTERISTIC, homeschool_rec.mtvparm_external_code, 1, 0))) homeschool_ind
        FROM MST_INSTITUTION_CHARACTERISTIC
       WHERE INSTITUTION = institution_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
       GROUP BY CALENDAR_YEAR
       ORDER BY CALENDAR_YEAR DESC;
--
END edw_general_extr;
/
create or replace PACKAGE BODY edw_general_extr IS
/******************************************************************************/
    lastChangeTableIn           VARCHAR2(500) := ' ';

FUNCTION f_safe_to_number(value_in VARCHAR2) return number is
      BEGIN
              return to_number(value_in);
              exception when value_error then
              return null;
      END f_safe_to_number;
/******************************************************************************/
PROCEDURE p_delete_feedback_fact_records IS
  delete_text       VARCHAR2(5000) := NULL;
  ws_cursor         INTEGER;
  ws_return         INTEGER;
  ws_quote          VARCHAR2(1) := CHR(39);
  pragma            autonomous_transaction;
  BEGIN
      ws_cursor := dbms_sql.open_cursor;
      delete_text := 'BEGIN
                            DELETE FROM wft_feedback f
                              WHERE EXISTS
                               (SELECT 1
                                  FROM chg_feedback chg,
                                       (SELECT DISTINCT PERSON_GRADE_COMMENT_KEY, person_uid
                                          FROM mst_faculty_feedback) mf,
                                       (SELECT DISTINCT feedback_key, person_uid
                                          FROM mst_faculty_feedback_detail) mfd,
                                       wdt_warehouse_entity mf_person,
                                       wdt_warehouse_entity mfd_person
                                 WHERE (chg.person_grade_comment_key =
                                           mf.person_grade_comment_key(+)
                                        AND chg.mst_feedback_key = mfd.feedback_key(+))
                                       AND ( (mf_person.banner_pidm(+) = mf.person_uid)
                                            AND (mfd.person_uid = mfd_person.banner_pidm))
                                       AND (f.person_uid = mf_person.warehouse_entity_uid
                                            OR f.person_uid = mfd_person.warehouse_entity_uid));
                             END;';
      DBMS_SQL.PARSE(ws_cursor,delete_text,1);
      ws_return := DBMS_SQL.EXECUTE(ws_cursor);
      DBMS_SQL.CLOSE_CURSOR(ws_cursor);
      COMMIT;
  END p_delete_feedback_fact_records;
    /******************************************************************************/
PROCEDURE p_insert_student_crse_chg_rec IS
  delete_text       VARCHAR2(5000) := NULL;
  ws_cursor         INTEGER;
  ws_return         INTEGER;
  ws_quote          VARCHAR2(1) := CHR(39);
  pragma            autonomous_transaction;
  BEGIN
      ws_cursor := dbms_sql.open_cursor;
      delete_text := 'BEGIN
                                                             INSERT INTO chg_student_course
                                select * from (
                                   SELECT distinct person_uid,NULL course_reference_number,NULL,SYSDATE
                                     FROM (SELECT fb.person_grade_comment_key,fbd.feedback_key,fb.person_uid,fb.course_reference_number
                                             FROM mst_faculty_feedback fb, mst_faculty_feedback_detail fbd
                                            WHERE fb.academic_period = fbd.academic_period(+)
                                                  AND fb.course_reference_number =fbd.course_reference_number(+) AND fb.feedback_session_key = fbd.feedback_session_key(+) AND fb.person_uid = fbd.person_uid (+)) otr
                                    WHERE EXISTS
                                             (SELECT 1 FROM chg_feedback cfb WHERE ( (cfb.person_grade_comment_key = otr.person_grade_comment_key) OR (cfb.mst_feedback_key = otr.feedback_key)))
                                UNION
                                   SELECT distinct NULL person_uid,course_reference_number,NULL,SYSDATE
                                     FROM (SELECT fb.person_grade_comment_key,fbd.feedback_key,fb.person_uid,fb.course_reference_number
                                             FROM mst_faculty_feedback fb, mst_faculty_feedback_detail fbd
                                            WHERE fb.academic_period = fbd.academic_period(+)
                                                  AND fb.course_reference_number =fbd.course_reference_number(+) AND fb.feedback_session_key = fbd.feedback_session_key(+) AND fb.person_uid = fbd.person_uid (+)) otr
                                    WHERE EXISTS
                                             (SELECT 1 FROM chg_feedback cfb WHERE ( (cfb.person_grade_comment_key = otr.person_grade_comment_key) OR (cfb.mst_feedback_key = otr.feedback_key)))
                                 );
                           END;';
      DBMS_SQL.PARSE(ws_cursor,delete_text,1);
      ws_return := DBMS_SQL.EXECUTE(ws_cursor);
      DBMS_SQL.CLOSE_CURSOR(ws_cursor);
      COMMIT;
  END p_insert_student_crse_chg_rec;
    /******************************************************************************/
PROCEDURE p_insert_retention_my_chg_rec(change_table_in VARCHAR2) IS
    insert_stmt     VARCHAR2(1000);
    PRAGMA          AUTONOMOUS_TRANSACTION;
BEGIN
    insert_stmt :=
        'INSERT /*+ APPEND PARALLEL */ '||
          'INTO chg_retention_multi_year (person_uid, change_process_id, change_activity_date) '||
                '(SELECT chg.person_uid, '''|| UPPER(change_table_in) ||''', SYSDATE '||
                   'FROM '|| change_table_in ||' chg '||
                  'WHERE NOT EXISTS '||
                        '(SELECT NULL '||
                           'FROM chg_retention_multi_year x '||
                          'WHERE x.person_uid = chg.person_uid))';

    EXECUTE IMMEDIATE insert_stmt;
    COMMIT;
END p_insert_retention_my_chg_rec;
/******************************************************************************/

PROCEDURE p_delete_fact_records(change_table_in VARCHAR2, fact_table_in VARCHAR2, column_in VARCHAR2, dimension_table_in VARCHAR2 DEFAULT NULL, column2_in VARCHAR2 DEFAULT NULL) IS
  delete_text       VARCHAR2(5000) := NULL;
  ws_cursor         INTEGER;
  ws_return         INTEGER;
  ws_quote          VARCHAR2(1) := CHR(39);
  l_lock_handle     VARCHAR2(128);
  l_lock_request    INTEGER;
  pragma            autonomous_transaction;
  verbose           BOOLEAN := FALSE;
  nChgRows          NUMBER;
  count_query       VARCHAR2(5000) := NULL;
  BEGIN
      IF verbose THEN
         mgkolib.P_WriteMdrlogdMsg('In DELETE_FACT FOR: ' || change_Table_in || ' - FACT: ' || fact_table_in || ' -DIM: ' || dimension_table_in);
      END IF;

      -- Drop the BMIs now to make the DELETE run faster.  Exclude BMI on column used to identify fact records to delete.
      mgkutil.P_DropBitmapIndexes('EDWMGR',fact_table_in, column_in);

      -- Deal w/ multiple calls to this proc from a single mapping (cache the last CHG table this was called for
      IF change_Table_in ^= lastChangeTableIn THEN
          count_query := 'SELECT COUNT(*) FROM ' || change_Table_in;
          EXECUTE IMMEDIATE count_query INTO nChgRows;
          DBMS_STATS.GATHER_TABLE_STATS('EDWSTG',change_table_in);
          mgkolib.P_WriteMdrlogdMsg('Processing EDW Change Table ' || change_Table_in || ' -- rows: ' || nChgRows );
          lastChangeTableIn := change_Table_in;
      END IF;
      ws_cursor := dbms_sql.open_cursor;
      IF dimension_table_in IS NULL THEN
         IF column_in = 'PERSON_UID' THEN
            delete_text := 'BEGIN ' ||
                           'DELETE FROM '|| fact_table_in ||' d'  ||
                           ' WHERE EXISTS (SELECT chg.'||NVL(column2_in, column_in) ||
                           '                 FROM '|| change_table_in ||' chg, wdt_warehouse_entity we'  ||
                           '                WHERE we.banner_pidm = chg.'|| NVL(column2_in, column_in) ||
                           '                  AND d.'|| column_in ||' = we.warehouse_entity_uid);'||
                           'END;';
         ELSE
            delete_text := 'BEGIN ' ||
                           'DELETE FROM '|| fact_table_in ||' d'  ||
                           ' WHERE EXISTS (SELECT chg.'||NVL(column2_in, column_in) ||
                           '                 FROM '||change_table_in ||' chg'  ||
                           '                WHERE chg.'||NVL(column2_in, column_in)|| ' = d.' ||column_in||');'||
                           'END;';
         END IF;
      ELSE
         delete_text := 'BEGIN ' ||
                        'DELETE FROM '|| fact_table_in ||' d'  ||
                        ' WHERE EXISTS (SELECT chg.'||column_in ||
                        '                 FROM '||dimension_table_in||' dim, '||change_table_in ||' chg '  ||
                        '                WHERE dim.'||column_in||'_KEY = d.'||column_in||'_KEY '||
                        '                  AND chg.'||column_in||' = dim.'||column_in||');'||
                        'END;';
      END IF;
--    Lock required to avoid object contention when running EDW ETL in parallel
      DBMS_LOCK.ALLOCATE_UNIQUE(lockname=> 'ELLUCIAN_CHG_DELETE_LOCK', lockhandle => l_lock_handle);
      l_lock_request := DBMS_LOCK.REQUEST(lockhandle=> l_lock_handle,timeout => 300);

--    Procedure used to populate the EDW Aggregate or Group change tables.
      EDW_ETL_UTIL.P_POP_AGG_GROUP_CHG_TAB(fact_table_in);


      IF verbose THEN
         mgkolib.P_WriteMdrlogdMsg( 'Got back lock REQUEST value: ' || l_lock_request || ' at: ' || mgkolib.F_GetDateAndTime);
      END IF;

      -- If deleting WFT_STUDENT records, insert change rows for Retention Multi-Year refresh
      CASE UPPER(fact_table_in)
         WHEN 'WFT_STUDENT' THEN p_insert_retention_my_chg_rec(change_table_in);
         ELSE NULL;
      END CASE;

--    Procedure used to populate the EDW Aggregate or Group change tables.
      EDW_ETL_UTIL.P_POP_AGG_GROUP_CHG_TAB(fact_table_in);


      DBMS_SQL.PARSE(ws_cursor,delete_text,1);
      ws_return := DBMS_SQL.EXECUTE(ws_cursor);
      DBMS_SQL.CLOSE_CURSOR(ws_cursor);

      l_lock_request := DBMS_LOCK.RELEASE(LOCKHANDLE=>l_lock_handle);
      COMMIT;

      -- Drop any remaining BMIs before loading records.
      mgkutil.P_DropBitmapIndexes('EDWMGR',fact_table_in);

      IF verbose THEN
         mgkolib.P_WriteMdrlogdMsg( 'Completed DELETE_FACT FOR: ' || change_Table_in || ' at: ' || mgkolib.F_GetDateAndTime);
      END IF;

  END p_delete_fact_records;
    /******************************************************************************/
PROCEDURE p_delete_fact_table(fact_table_in VARCHAR2, year_in VARCHAR2 DEFAULT 'ALL', year_type_in VARCHAR2 DEFAULT 'ACADEMIC_YEAR') IS
  delete_text       VARCHAR2(5000) := NULL;
  ws_cursor         INTEGER;
  ws_return         INTEGER;
  ws_quote          VARCHAR2(1) := CHR(39);
  pragma            autonomous_transaction;
  BEGIN
      ws_cursor := dbms_sql.open_cursor;
      IF year_in = 'ALL' THEN
        p_truncate_table(fact_table_in);
      ELSE
        IF year_type_in = 'ACADEMIC_YEAR' THEN
        delete_text := 'BEGIN ' ||
                       'DELETE FROM '|| fact_table_in ||' FT ' ||
                       '      WHERE EXISTS (SELECT DIM.ACADEMIC_TIME_KEY ' ||
                       '                      FROM WDT_ACADEMIC_TIME DIM ' ||
                       '                     WHERE DIM.ACADEMIC_TIME_KEY = FT.ACADEMIC_TIME_KEY ' ||
                       '                       AND DIM.ACADEMIC_YEAR = '''||year_in ||''');'||
                       'END;';
        ELSIF year_type_in = 'AID_YEAR' THEN
        delete_text := 'BEGIN ' ||
                       'DELETE FROM '|| fact_table_in ||' FT ' ||
                       '      WHERE EXISTS (SELECT DIM.FINANCIAL_AID_YEAR_KEY ' ||
                       '                      FROM WDT_FINANCIAL_AID_YEAR DIM ' ||
                       '                     WHERE DIM.FINANCIAL_AID_YEAR_KEY = FT.FINANCIAL_AID_YEAR_KEY ' ||
                       '                       AND DIM.FINANCIAL_AID_YEAR = '''||year_in ||''');'||
                       'END;';
        END IF;
--
        DBMS_SQL.PARSE(ws_cursor,delete_text,1);
        ws_return := DBMS_SQL.EXECUTE(ws_cursor);
        DBMS_SQL.CLOSE_CURSOR(ws_cursor);
        COMMIT;
      END IF;

  END p_delete_fact_table;
/******************************************************************************/
  FUNCTION f_get_events(process_in VARCHAR2) RETURN event_tab PIPELINED IS
--
    CURSOR get_events IS
      SELECT MTVPARM_INTERNAL_CODE      event_category,
             MTVPARM_INTERNAL_CODE_2    event_type,
             MTVPARM_EXTERNAL_CODE      event,
             MTVPARM_DESC               event_desc,
             process_in                 event_process
        FROM MTVPARM
       WHERE MTVPARM_INTERNAL_CODE_GROUP = 'EVENT-EDW'
       ORDER BY MTVPARM_INTERNAL_CODE, MTVPARM_INTERNAL_CODE_2, MTVPARM_INTERNAL_CODE_SEQNO;
--
    ret_row                   get_events%ROWTYPE;
--
  BEGIN
    FOR sel_event_rec IN get_events LOOP
--
      ret_row.event_category := sel_event_rec.event_category;
      ret_row.event_type     := sel_event_rec.event_type;
      ret_row.event          := sel_event_rec.event;
      ret_row.event_desc     := sel_event_rec.event_desc;
      ret_row.event_process  := sel_event_rec.event_process;
--
      PIPE ROW(ret_row);
--
    END LOOP;
--
    RETURN;
--
  END f_get_events;
/******************************************************************************/
  FUNCTION f_get_calendar_records(start_year_in NUMBER DEFAULT 1980, end_year_in NUMBER DEFAULT 2049) RETURN calendar_tab PIPELINED IS
--
    temp_date       DATE := TO_DATE('01-01-' || start_year_in, 'MM-DD-YYYY');
    temp_year       NUMBER := start_year_in;
    ret_row         WTT_DIM_CALENDAR_DATE_CLEAN%ROWTYPE;
    ret_row_init    WTT_DIM_CALENDAR_DATE_CLEAN%ROWTYPE;
--
    default_rec     WCV_DEFAULT_VALUES%ROWTYPE;
--
  BEGIN
    OPEN get_default_values;
    FETCH get_default_values INTO default_rec;
    CLOSE get_default_values;
--
    WHILE temp_year <= end_year_in
      LOOP
        ret_row.multi_source := default_rec.multi_source_cleanse_value;
        ret_row.calendar_date := temp_date;
        ret_row.calendar_year := TO_CHAR(temp_date, 'YYYY');
        ret_row.calendar_quarter := TO_CHAR(temp_date, 'Q');
        ret_row.calendar_month :=  TO_CHAR(temp_date, 'MM');
        ret_row.calendar_month_sd :=  TO_CHAR(temp_date, 'Mon');
        ret_row.calendar_month_ld :=  TO_CHAR(temp_date, 'Month');
        ret_row.calendar_month_date := TO_DATE('01-' || TO_CHAR(temp_date,'MON') || '-1900', 'DD-MON-YYYY');
        ret_row.calendar_week_of_year := TO_CHAR(temp_date, 'WW');
        ret_row.calendar_day := TO_CHAR(temp_date, 'DDD');
        ret_row.calendar_day_of_week := TO_CHAR(temp_date, 'Day');
        ret_row.system_load_process := 'PRELOAD';
        --BLM mepped 6/2/14 for security reasons
        --ret_row.user_attribute_01 := NULL;
        ret_row.user_attribute_01 := ret_row.multi_source;
        ret_row.user_attribute_02 := NULL;
        ret_row.user_attribute_03 := NULL;
        ret_row.user_attribute_04 := NULL;
        ret_row.user_attribute_05 := NULL;
--
        PIPE ROW(ret_row);
        temp_date := temp_date + 1;
        temp_year := TO_NUMBER(TO_CHAR(temp_date, 'YYYY'));
--
      END LOOP;
    RETURN;
--
  END f_get_calendar_records;
/******************************************************************************/
  FUNCTION f_get_institution(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_institution_extr PIPELINED IS
--
    ret_row                     WTT_INSTITUTION_INPUT%ROWTYPE;
    ret_row_init                WTT_INSTITUTION_INPUT%ROWTYPE;
    georegion_inst_rec          MGT_GEOGRAPHIC_REGION_INST%ROWTYPE;
    georegion_inst_rec_init     MGT_GEOGRAPHIC_REGION_INST%ROWTYPE;
    inst_demo_rec               MST_INSTITUTION_DEMOGRAPHIC%ROWTYPE;
    inst_demo_rec_init          MST_INSTITUTION_DEMOGRAPHIC%ROWTYPE;
--
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    parm_rec                    MTVPARM%ROWTYPE;
    null_nation_rec             MTVPARM%ROWTYPE;
--
    inst_char_rec               get_inst_char%ROWTYPE;
    inst_char_rec_init          get_inst_char%ROWTYPE;
--
--
        TYPE institution_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          ZONE_VALUE                              VARCHAR2(255),
          DOMAIN_VALUE                            VARCHAR2(255),
          INSTITUTION                             VARCHAR2(63),
          NAME                                    VARCHAR2(63),
          FICE_CODE                               VARCHAR2(63),
          INSTITUTION_TYPE                        VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY                                  VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63)
    );
    TYPE refCurType     IS REF CURSOR;
    institution_info_cur       refCurType;
    institution_rec        institution_info_rec_type;
    TYPE tab_institution_info_rec_type   IS TABLE OF institution_info_rec_type INDEX BY PLS_INTEGER;
    institution_info_recs        tab_institution_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT
          --BLM modified next line 5/6/14 - need to MEP the wdt_institution dimension for prospective student
          --NVL(MIF_VALUE, def_multi_source_in)  multi_source,
          NVL(gtvvpdi_code, def_multi_source_in)  multi_source,
                 ZONE_VALUE,
                 DOMAIN_VALUE,
                 INSTITUTION,
                 NAME,
                 FICE_CODE,
                 INSTITUTION_TYPE,
                 STREET_LINE1,
                 STREET_LINE2,
                 STREET_LINE3,
                 STREET_LINE4,
                 POSTAL_CODE,
                 CITY,
                 COUNTY,
                 STATE_PROVINCE,
                 NATION
            FROM MST_INSTITUTION A
            --BLM 5/6/14 - adding multi_source to this since mst_institution is not mepped
            ,
            GTVVPDI
    WHERE gtvvpdi_code IN ('ACC', 'CCA', 'CCD','CNCC', 'FRCC', 'LCC', 'MCC', 'NJC', 'OJC', 'PCC', 'PPCC', 'RRCC', 'TSJC')
           and
             (debug_var_in IS NULL OR A.INSTITUTION LIKE debug_var_in);
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT
          --BLM modified next line 5/6/14 - need to MEP the wdt_institution dimension for prospective student
          DISTINCT NVL(gtvvpdi_code, def_multi_source_in)  multi_source,
          --DISTINCT NVL(MIF_VALUE, def_multi_source_in)  multi_source,
                 ZONE_VALUE,
                 DOMAIN_VALUE,
                 A.INSTITUTION,
                 NAME,
                 FICE_CODE,
                 INSTITUTION_TYPE,
                 STREET_LINE1,
                 STREET_LINE2,
                 STREET_LINE3,
                 STREET_LINE4,
                 POSTAL_CODE,
                 CITY,
                 COUNTY,
                 STATE_PROVINCE,
                 NATION
            FROM MST_INSTITUTION A,
            CHG_INSTITUTION CHG
            --BLM 5/6/14 - adding multi_source to this since mst_institution is not mepped
            ,
            GTVVPDI
    WHERE gtvvpdi_code IN ('ACC', 'CCA', 'CCD','CNCC', 'FRCC', 'LCC', 'MCC', 'NJC', 'OJC', 'PCC', 'PPCC', 'RRCC', 'TSJC')
           and
       CHG.INSTITUTION = A.INSTITUTION
             AND (debug_var_in IS NULL OR A.INSTITUTION LIKE debug_var_in);
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
      IF process_ind_in = 'L' THEN
         p_delete_fact_table('WFT_INSTITUTION');
      ELSE
         p_delete_fact_records('CHG_INSTITUTION', 'WFT_INSTITUTION', 'INSTITUTION', 'WDT_INSTITUTION');
      END IF;
    END IF;
--
    OPEN get_default_values;
    FETCH get_default_values INTO default_rec;
    CLOSE get_default_values;
--
    OPEN get_mtvparm('EDW EXTRACT PARAMETERS','INST_GEOGRAPHIC_DIVISION','INSTITUTION');
    FETCH get_mtvparm INTO parm_rec;
    CLOSE get_mtvparm;
--
    OPEN get_mtvparm('EDW EXTRACT PARAMETERS','INSTITUTION_CHARACTERISTIC','TWO_YEAR_INSTITUTION');
    FETCH get_mtvparm INTO two_year_rec;
    CLOSE get_mtvparm;
--
    OPEN get_mtvparm('EDW EXTRACT PARAMETERS','INSTITUTION_CHARACTERISTIC','FOUR_YEAR_INSTITUTION');
    FETCH get_mtvparm INTO four_year_rec;
    CLOSE get_mtvparm;
--
    OPEN get_mtvparm('EDW EXTRACT PARAMETERS','INSTITUTION_CHARACTERISTIC','PRIVATE_INSTITUTION');
    FETCH get_mtvparm INTO private_rec;
    CLOSE get_mtvparm;
--
    OPEN get_mtvparm('EDW EXTRACT PARAMETERS','INSTITUTION_CHARACTERISTIC','PUBLIC_INSTITUTION');
    FETCH get_mtvparm INTO public_rec;
    CLOSE get_mtvparm;
--
    OPEN get_mtvparm('EDW EXTRACT PARAMETERS','INSTITUTION_CHARACTERISTIC','HOMESCHOOL');
    FETCH get_mtvparm INTO homeschool_rec;
    CLOSE get_mtvparm;
--
    OPEN get_mtvparm('EDW EXTRACT PARAMETERS','NULL_NATION','NULL_NATION_VALUE');
    FETCH get_mtvparm INTO null_nation_rec;
    CLOSE get_mtvparm;
--
    IF process_ind_in = 'L' THEN
        institution_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        institution_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
        FETCH institution_info_cur INTO institution_rec;
        EXIT WHEN institution_info_cur%NOTFOUND;
--
      OPEN get_georegion_inst(default_rec.multi_source_cleanse_value, institution_rec.multi_source, institution_rec.institution, parm_rec.mtvparm_external_code);
      FETCH get_georegion_inst INTO georegion_inst_rec;
      CLOSE get_georegion_inst;
--
      OPEN get_inst_demo(default_rec.multi_source_cleanse_value, institution_rec.multi_source, institution_rec.institution);
      FETCH get_inst_demo INTO inst_demo_rec;
      CLOSE get_inst_demo;
--
      OPEN get_inst_char(default_rec.multi_source_cleanse_value, institution_rec.multi_source, institution_rec.institution);
      FETCH get_inst_char INTO inst_char_rec;
      CLOSE get_inst_char;
--
      ret_row.multi_source := institution_rec.multi_source;
      ret_row.process_group := institution_rec.zone_value;
      ret_row.administrative_group := institution_rec.domain_value;
      --BLM mepped 6/2/14 for secuirty reasons
      --ret_row.ms_user_attribute_01 := NULL;
      ret_row.ms_user_attribute_01 := ret_row.multi_source;
      ret_row.ms_user_attribute_02 := NULL;
      ret_row.ms_user_attribute_03 := NULL;
      ret_row.ms_user_attribute_04 := NULL;
      ret_row.ms_user_attribute_05 := NULL;
--
      ret_row.institution := institution_rec.institution;
      ret_row.fice_code := institution_rec.fice_code;
      ret_row.institution_type := institution_rec.institution_type;
      ret_row.two_year_institution_ind := TO_CHAR(NVL(inst_char_rec.two_year_ind,0));
      ret_row.four_year_institution_ind := TO_CHAR(NVL(inst_char_rec.four_year_ind,0));
      ret_row.private_institution_ind := TO_CHAR(NVL(inst_char_rec.private_ind,0));
      ret_row.public_institution_ind := TO_CHAR(NVL(inst_char_rec.public_ind,0));
      ret_row.homeschool_ind := TO_CHAR(NVL(inst_char_rec.homeschool_ind,0));
      ret_row.accreditation_type := inst_demo_rec.accreditation_type;
      ret_row.approved_ind := TO_CHAR(NVL(inst_demo_rec.approved_ind,0));
      ret_row.demographic_calendar_year := TO_CHAR(inst_demo_rec.calendar_year);
      --BLM 5/6/14 adding mif to user attribute 01
      ret_row.i_user_attribute_01 := institution_rec.multi_source;
      --ret_row.i_user_attribute_01 := NULL;
      ret_row.i_user_attribute_02 := NULL;
      ret_row.i_user_attribute_03 := NULL;
      ret_row.i_user_attribute_04 := NULL;
      ret_row.i_user_attribute_05 := NULL;
--
      ret_row.street_line1 := nvl(institution_rec.street_line1, default_rec.null_cleanse_value);
      ret_row.street_line2 := nvl(institution_rec.street_line2, default_rec.null_cleanse_value);
      ret_row.street_line3 := nvl(institution_rec.street_line3, default_rec.null_cleanse_value);
      ret_row.street_line4 := nvl(institution_rec.street_line4, default_rec.null_cleanse_value);
      --BLM mepped 6/2/14 for security reasons
      --ret_row.st_user_attribute_01 := NULL;
      ret_row.st_user_attribute_01 := ret_row.multi_source;
      ret_row.st_user_attribute_02 := NULL;
      ret_row.st_user_attribute_03 := NULL;
      ret_row.st_user_attribute_04 := NULL;
      ret_row.st_user_attribute_05 := NULL;
--
      ret_row.postal_code := NVL(institution_rec.postal_code,default_rec.null_cleanse_value);
      ret_row.city := NVL(institution_rec.city, default_rec.null_cleanse_value);
      ret_row.county := institution_rec.county;
      ret_row.state_province := institution_rec.state_province;
      IF institution_rec.state_province IS NOT NULL THEN
        ret_row.nation := NVL(institution_rec.nation, null_nation_rec.mtvparm_external_code);
      ELSE
        ret_row.nation := institution_rec.nation;
      END IF;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.p_user_attribute_01 := NULL;
      ret_row.p_user_attribute_01 := ret_row.multi_source;
      ret_row.p_user_attribute_02 := NULL;
      ret_row.p_user_attribute_03 := NULL;
      ret_row.p_user_attribute_04 := NULL;
      ret_row.p_user_attribute_05 := NULL;
--
      ret_row.geographic_region := georegion_inst_rec.geographic_region;
      ret_row.geographic_division := georegion_inst_rec.geographic_division;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.gr_user_attribute_01 := NULL;
      ret_row.gr_user_attribute_01 := ret_row.multi_source;
      ret_row.gr_user_attribute_02 := NULL;
      ret_row.gr_user_attribute_03 := NULL;
      ret_row.gr_user_attribute_04 := NULL;
      ret_row.gr_user_attribute_05 := NULL;
--
      ret_row.enrollment := inst_demo_rec.enrollment;
      ret_row.number_of_seniors := inst_demo_rec.number_of_seniors;
      ret_row.percent_college_bound := inst_demo_rec.percent_college_bound;
      ret_row.mean_family_income := inst_demo_rec.mean_family_income;
      ret_row.user_measure_01 := NULL;
      ret_row.user_measure_02 := NULL;
      ret_row.user_measure_03 := NULL;
      ret_row.user_measure_04 := NULL;
      ret_row.user_measure_05 := NULL;
      ret_row.system_load_process := 'INSTITUTION';
--
      PIPE ROW(ret_row);
--
      ret_row := ret_row_init;
      georegion_inst_rec := georegion_inst_rec_init;
      inst_demo_rec := inst_demo_rec_init;
      inst_char_rec := inst_char_rec_init;
--
    END LOOP; -- institution_rec
--
    RETURN;
--
  END f_get_institution;
/******************************************************************************/
  FUNCTION f_get_hold(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_hold_extr PIPELINED IS
--
    ret_row                     WTT_HOLD_INPUT%ROWTYPE;
    ret_row_init                WTT_HOLD_INPUT%ROWTYPE;
--
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    parm_rec                    MTVPARM%ROWTYPE;
--
--
        TYPE hold_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          HOLD                                    VARCHAR2(63),
          HOLD_ORIGINATING_OFFICE                 VARCHAR2(63),
          APPLICATION_HOLD_IND                    VARCHAR2(1),
          AR_HOLD_IND                             VARCHAR2(1),
          COMPLIANCE_HOLD_IND                     VARCHAR2(1),
          ENRL_VERIFICATION_HOLD_IND              VARCHAR2(1),
          GRADE_REPORT_HOLD_IND                   VARCHAR2(1),
          GRADUATION_HOLD_IND                     VARCHAR2(1),
          REGISTRATION_HOLD_IND                   VARCHAR2(1),
          TRANSCRIPT_HOLD_IND                     VARCHAR2(1),
          HOLD_FROM_DATE                          DATE,
          HOLD_TO_DATE                            DATE,
          HOLD_AMOUNT                             NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    hold_cur       refCurType;
    hold_rec        hold_rec_type;
    TYPE tab_hold_rec_type   IS TABLE OF hold_rec_type INDEX BY PLS_INTEGER;
    hold_recs        tab_hold_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT 
          --BLM changing from A alias to WE alias on MIF as mst_hold is not mepped
          --NVL(A.MIF_VALUE, def_multi_source_in)    multi_source,
                NVL(we.user_attribute_01, def_multi_source_in)    multi_source,
                 A.ZONE_VALUE                             process_group,
                 A.DOMAIN_VALUE                           administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)           warehouse_entity_uid,
                 A.HOLD,
                 A.HOLD_ORIGINATING_OFFICE,
                 NVL(A.APPLICATION_HOLD_IND, 'N')         application_hold_ind,
                 NVL(A.AR_HOLD_IND, 'N')                  ar_hold_ind,
                 NVL(A.COMPLIANCE_HOLD_IND, 'N')          compliance_hold_ind,
                 NVL(A.ENRL_VERIFICATION_HOLD_IND, 'N')   enrl_verification_hold_ind,
                 NVL(A.GRADE_REPORT_HOLD_IND, 'N')        grade_report_hold_ind,
                 NVL(A.GRADUATION_HOLD_IND, 'N')          graduation_hold_ind,
                 NVL(A.REGISTRATION_HOLD_IND, 'N')        registration_hold_ind,
                 NVL(A.TRANSCRIPT_HOLD_IND, 'N')          transcript_hold_ind,
                 TRUNC(A.HOLD_FROM_DATE)                  hold_from_date,
                 TRUNC(A.HOLD_TO_DATE)                    hold_to_date,
                 A.HOLD_AMOUNT,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MST_HOLD A
           WHERE
             (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             AND PD.PERSON_ID = A.PERSON_UID
             AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT 
          --BLM changing next line to use WE instead of A mif, mst_hold not mepped
          --DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)    multi_source,
          DISTINCT NVL(we.user_attribute_01, def_multi_source_in)    multi_source,
                 A.ZONE_VALUE                             process_group,
                 A.DOMAIN_VALUE                           administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)           warehouse_entity_uid,
                 A.HOLD,
                 A.HOLD_ORIGINATING_OFFICE,
                 NVL(A.APPLICATION_HOLD_IND, 'N')         application_hold_ind,
                 NVL(A.AR_HOLD_IND, 'N')                  ar_hold_ind,
                 NVL(A.COMPLIANCE_HOLD_IND, 'N')          compliance_hold_ind,
                 NVL(A.ENRL_VERIFICATION_HOLD_IND, 'N')   enrl_verification_hold_ind,
                 NVL(A.GRADE_REPORT_HOLD_IND, 'N')        grade_report_hold_ind,
                 NVL(A.GRADUATION_HOLD_IND, 'N')          graduation_hold_ind,
                 NVL(A.REGISTRATION_HOLD_IND, 'N')        registration_hold_ind,
                 NVL(A.TRANSCRIPT_HOLD_IND, 'N')          transcript_hold_ind,
                 TRUNC(A.HOLD_FROM_DATE)                  hold_from_date,
                 TRUNC(A.HOLD_TO_DATE)                    hold_to_date,
                 A.HOLD_AMOUNT,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MST_HOLD A,
                 CHG_HOLD CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             AND PD.PERSON_ID = A.PERSON_UID
             AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          p_delete_fact_table    ('WFT_HOLD');
       ELSE
          p_delete_fact_records('CHG_HOLD', 'WFT_HOLD', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    IF process_ind_in = 'L' THEN
        hold_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        hold_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
        FETCH hold_cur INTO hold_rec;
        EXIT WHEN hold_cur%NOTFOUND;
--
      ret_row.multi_source := hold_rec.multi_source;
      ret_row.process_group := hold_rec.process_group;
      ret_row.administrative_group := hold_rec.administrative_group;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.msrc_user_attribute_01 := NULL;
      ret_row.msrc_user_attribute_01 := ret_row.multi_source;
      ret_row.msrc_user_attribute_02 := NULL;
      ret_row.msrc_user_attribute_03 := NULL;
      ret_row.msrc_user_attribute_04 := NULL;
      ret_row.msrc_user_attribute_05 := NULL;
      ret_row.person_uid := hold_rec.warehouse_entity_uid;
      ret_row.id := hold_rec.id;
      ret_row.full_name_lfmi := hold_rec.full_name_lfmi;
      ret_row.birth_date := hold_rec.birth_date;
      ret_row.deceased_date := hold_rec.deceased_date;
      ret_row.email_address := hold_rec.email_address;
      ret_row.phone_number_combined := hold_rec.phone_number_combined;
      ret_row.confidentiality_ind := hold_rec.confidentiality_ind;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.pers_user_attribute_01 := NULL;
      ret_row.pers_user_attribute_01 := ret_row.multi_source;
      ret_row.pers_user_attribute_02 := NULL;
      ret_row.pers_user_attribute_03 := NULL;
      ret_row.pers_user_attribute_04 := NULL;
      ret_row.pers_user_attribute_05 := NULL;
      ret_row.gender := hold_rec.gender;
      ret_row.ethnicity_category := hold_rec.ethnicity_category;
      ret_row.hispanic_latino_ethn_ind := hold_rec.hispanic_latino_ethnicity_ind;
      ret_row.asian_ind := hold_rec.asian_ind;
      ret_row.native_amer_or_alaskan_ind := hold_rec.native_american_or_alaskan_ind;
      ret_row.black_or_african_ind := hold_rec.black_or_african_ind;
      ret_row.pacific_islander_ind := hold_rec.pacific_islander_ind;
      ret_row.white_ind := hold_rec.white_ind;
      IF hold_rec.number_of_races = 0 and hold_rec.resident_alien_visa_count > 0 THEN
         ret_row.non_resident_ind := 'Y';
      ELSE
         ret_row.non_resident_ind := 'N';
      END IF;
      IF NVL(hold_rec.hispanic_latino_ethnicity_ind,'N') = 'N' AND
         hold_rec.number_of_races = 0 AND
         hold_rec.resident_alien_visa_count = 0 THEN
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
      ELSE
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
      END IF;
      ret_row.two_or_more_ind := hold_rec.two_or_more_ind;
      ret_row.race_ethnicity_confirm_ind := hold_rec.race_ethnicity_confirm_ind;
      ret_row.minority_ind := hold_rec.minority_ind;
      ret_row.ethnicity := hold_rec.ethnicity;
      ret_row.deceased_ind := hold_rec.deceased_ind;
      ret_row.citizenship_ind := hold_rec.citizenship_ind;
      ret_row.citizenship_type := hold_rec.citizenship_type;
      ret_row.visa_type := hold_rec.visa_type;
      ret_row.nation_of_citizenship := hold_rec.nation_of_citizenship;
      ret_row.nation_of_birth := hold_rec.nation_of_birth;
      ret_row.primary_disability := hold_rec.primary_disability;
      ret_row.legacy := hold_rec.legacy;
      ret_row.marital_status := hold_rec.marital_status;
      ret_row.religion := hold_rec.religion;
      ret_row.veteran_type := hold_rec.veteran_type;
      ret_row.veteran_category := hold_rec.veteran_category;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.demo_user_attribute_01 := NULL;
      ret_row.demo_user_attribute_01 := ret_row.multi_source;
      ret_row.demo_user_attribute_02 := NULL;
      ret_row.demo_user_attribute_03 := NULL;
      ret_row.demo_user_attribute_04 := NULL;
      ret_row.demo_user_attribute_05 := NULL;
-- hold
      ret_row.hold := hold_rec.hold;
      ret_row.hold_originating_office := hold_rec.hold_originating_office;
      ret_row.application_hold_ind := hold_rec.application_hold_ind;
      ret_row.ar_hold_ind := hold_rec.ar_hold_ind;
      ret_row.compliance_hold_ind := hold_rec.compliance_hold_ind;
      ret_row.enrl_verification_hold_ind := hold_rec.enrl_verification_hold_ind;
      ret_row.grade_report_hold_ind := hold_rec.grade_report_hold_ind;
      ret_row.graduation_hold_ind := hold_rec.graduation_hold_ind;
      ret_row.registration_hold_ind := hold_rec.registration_hold_ind;
      ret_row.transcript_hold_ind := hold_rec.transcript_hold_ind;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.hold_user_attribute_01 := NULL;
      ret_row.hold_user_attribute_01 := ret_row.multi_source;
      ret_row.hold_user_attribute_02 := NULL;
      ret_row.hold_user_attribute_03 := NULL;
      ret_row.hold_user_attribute_04 := NULL;
      ret_row.hold_user_attribute_05 := NULL;
      ret_row.hold_from_date := TRUNC(NVL(hold_rec.hold_from_date, '31-DEC-2099'));
      ret_row.hold_to_date := TRUNC(NVL(hold_rec.hold_to_date, '31-DEC-2099'));
-- measures
      ret_row.hold_amount := hold_rec.hold_amount;
      ret_row.user_measure_01 := NULL;
      ret_row.user_measure_02 := NULL;
      ret_row.user_measure_03 := NULL;
      ret_row.user_measure_04 := NULL;
      ret_row.user_measure_05 := NULL;
      ret_row.system_load_process := 'HOLD';
--
      PIPE ROW(ret_row);
--
      ret_row := ret_row_init;
--
    END LOOP; -- hold_rec
--
    RETURN;

  END f_get_hold;
/******************************************************************************/
  FUNCTION f_get_bann_comm(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN ban_comm_extr PIPELINED IS
--
    ret_row                     WTT_BANNER_COMMUNICATION_INPUT%ROWTYPE;
    ret_row_init                WTT_BANNER_COMMUNICATION_INPUT%ROWTYPE;
--
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    parm_rec                    MTVPARM%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE bann_comm_data_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          ACADEMIC_PERIOD                         VARCHAR2(63),
          ACADEMIC_YEAR                           VARCHAR2(63),
          AID_YEAR                                VARCHAR2(63),
          COMMUNICATION                           VARCHAR2(63),
          COMMUNICATION_TYPE                      VARCHAR2(63),
          MATERIAL                                VARCHAR2(63),
          COMMUNICATION_PLAN                      VARCHAR2(63),
          COMMUNICATION_SOURCE                    VARCHAR2(63),
          SYSTEM                                  VARCHAR2(63),
          PENDING_IND                             NUMBER,
          FIRST_IND                               NUMBER,
          LAST_IND                                NUMBER,
          COMMUNICATION_INIT_DATE                 DATE,
          COMMUNICATION_PRINT_DATE                DATE,
          COMMUNICATION_SENT_DATE                 DATE,
          COMMUNICATION_COUNT_DATE                DATE,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          START_DATE                              DATE,
          END_DATE                                DATE
    );
    TYPE refCurType     IS REF CURSOR;
    bann_comm_data_cur       refCurType;
    bann_comm_data_rec        bann_comm_data_rec_type;
    TYPE tab_bann_comm_data_rec_type   IS TABLE OF bann_comm_data_rec_type INDEX BY PLS_INTEGER;
    bann_comm_data_recs        tab_bann_comm_data_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)    multi_source,
                 A.ZONE_VALUE                             process_group,
                 A.DOMAIN_VALUE                           administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)           warehouse_entity_uid,
                 A.ACADEMIC_PERIOD,
                 A.ACADEMIC_YEAR,
                 A.AID_YEAR,
                 A.COMMUNICATION,
                 A.COMMUNICATION_TYPE,
                 A.MATERIAL,
                 A.COMMUNICATION_PLAN,
                 A.COMMUNICATION_SOURCE,
                 A.SYSTEM,
                 DECODE(A.PENDING_LETTER_IND, 'Y', 1,0)   pending_ind,
                 DECODE(ROW_NUMBER() OVER (PARTITION BY A.PERSON_UID ORDER BY A.DATE_INITIATED ASC),1,1,0) first_ind,
                 DECODE(ROW_NUMBER() OVER (PARTITION BY A.PERSON_UID ORDER BY A.DATE_INITIATED DESC),1,1,0) last_ind,
                 TRUNC(NVL(A.DATE_INITIATED, '31-DEC-2099'))  communication_init_date,
                 TRUNC(NVL(A.DATE_PRINTED, '31-DEC-2099'))    communication_print_date,
                 TRUNC(NVL(A.DATE_SENT, '31-DEC-2099'))       communication_sent_date,
                 COALESCE(A.DATE_INITIATED, A.DATE_PRINTED,TO_DATE('31-DEC-2099','DD-MON-YYYY'))  communication_count_date,
                 PD.*,
                 AC.start_date,
                 AC.end_date
           FROM  WDT_WAREHOUSE_ENTITY WE,
                 MGT_COMMUNICATION A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC
          WHERE
            (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
            AND WE.BANNER_PIDM = A.PERSON_UID
            --BLM mepping 7/29/14 for wdt_warehouse_entity mep effort
            and we.user_attribute_01 = a.mif_value
            AND PD.PERSON_ID = A.PERSON_UID
            AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC
            AND AC.YEAR_TYPE(+) = 'ACYR'
            AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
            AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in);
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)    multi_source,
                 A.ZONE_VALUE                             process_group,
                 A.DOMAIN_VALUE                           administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)           warehouse_entity_uid,
                 A.ACADEMIC_PERIOD,
                 A.ACADEMIC_YEAR,
                 A.AID_YEAR,
                 A.COMMUNICATION,
                 A.COMMUNICATION_TYPE,
                 A.MATERIAL,
                 A.COMMUNICATION_PLAN,
                 A.COMMUNICATION_SOURCE,
                 A.SYSTEM,
                 DECODE(A.PENDING_LETTER_IND, 'Y', 1,0)   pending_ind,
                 DECODE(ROW_NUMBER() OVER (PARTITION BY A.PERSON_UID ORDER BY A.DATE_INITIATED ASC),1,1,0) first_ind,
                 DECODE(ROW_NUMBER() OVER (PARTITION BY A.PERSON_UID ORDER BY A.DATE_INITIATED DESC),1,1,0) last_ind,
                 TRUNC(NVL(A.DATE_INITIATED, '31-DEC-2099'))  communication_init_date,
                 TRUNC(NVL(A.DATE_PRINTED, '31-DEC-2099'))    communication_print_date,
                 TRUNC(NVL(A.DATE_SENT, '31-DEC-2099'))       communication_sent_date,
                 COALESCE(A.DATE_INITIATED, A.DATE_PRINTED,TO_DATE('31-DEC-2099','DD-MON-YYYY'))  communication_count_date,
                 PD.*,
                 AC.start_date,
                 AC.end_date
           FROM  WDT_WAREHOUSE_ENTITY WE,
                 MGT_COMMUNICATION A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 CHG_BANNER_COMMUNICATION CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
            AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
            AND WE.BANNER_PIDM = A.PERSON_UID
            --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
            and we.user_attribute_01 = a.mif_value
            AND PD.PERSON_ID = A.PERSON_UID
            AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC
            AND AC.YEAR_TYPE(+) = 'ACYR'
            AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
            AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in);
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
         p_delete_fact_table('WFT_BANNER_COMMUNICATION');
       ELSE
         p_delete_fact_records('CHG_BANNER_COMMUNICATION', 'WFT_BANNER_COMMUNICATION', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','GENERAL_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        bann_comm_data_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        bann_comm_data_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH bann_comm_data_cur BULK COLLECT INTO bann_comm_data_recs LIMIT bulk_size;
       EXIT WHEN  bann_comm_data_recs.COUNT = 0;
--
       FOR i IN bann_comm_data_recs.FIRST..bann_comm_data_recs.LAST
       LOOP
--
         ret_row.multi_source := bann_comm_data_recs(i).multi_source;
         ret_row.process_group := bann_comm_data_recs(i).process_group;
         ret_row.administrative_group := bann_comm_data_recs(i).administrative_group;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.msrc_user_attribute_01 := NULL;
         ret_row.msrc_user_attribute_01 := ret_row.multi_source;
         ret_row.msrc_user_attribute_02 := NULL;
         ret_row.msrc_user_attribute_03 := NULL;
         ret_row.msrc_user_attribute_04 := NULL;
         ret_row.msrc_user_attribute_05 := NULL;
--
         ret_row.academic_period := bann_comm_data_recs(i).academic_period;
         ret_row.academic_period_begin_date := bann_comm_data_recs(i).start_date;
         ret_row.academic_period_end_date := bann_comm_data_recs(i).end_date;
         ret_row.academic_year := bann_comm_data_recs(i).academic_year;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.atim_user_attribute_01 := NULL;
         ret_row.atim_user_attribute_01 := ret_row.multi_source;
         ret_row.atim_user_attribute_02 := NULL;
         ret_row.atim_user_attribute_03 := NULL;
         ret_row.atim_user_attribute_04 := NULL;
         ret_row.atim_user_attribute_05 := NULL;
--
         ret_row.financial_aid_year := bann_comm_data_recs(i).aid_year;
         -- JOS 10/10/2012; mod for MEP
	 -- Set user attribute 01 to MEP code value for aid year
		ret_row.fayr_user_attribute_01 := ret_row.multi_source;
         --ret_row.fayr_user_attribute_01 := NULL;
         ret_row.fayr_user_attribute_02 := NULL;
         ret_row.fayr_user_attribute_03 := NULL;
         ret_row.fayr_user_attribute_04 := NULL;
         ret_row.fayr_user_attribute_05 := NULL;
--
         ret_row.person_uid := bann_comm_data_recs(i).warehouse_entity_uid;
         ret_row.id := bann_comm_data_recs(i).id;
         ret_row.full_name_lfmi := bann_comm_data_recs(i).full_name_lfmi;
         ret_row.birth_date := bann_comm_data_recs(i).birth_date;
         ret_row.deceased_date := bann_comm_data_recs(i).deceased_date;
         ret_row.email_address := bann_comm_data_recs(i).email_address;
         ret_row.phone_number_combined := bann_comm_data_recs(i).phone_number_combined;
         ret_row.confidentiality_ind := bann_comm_data_recs(i).confidentiality_ind;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.pers_user_attribute_01 := NULL;
         ret_row.pers_user_attribute_01 := ret_row.multi_source;
         ret_row.pers_user_attribute_02 := NULL;
         ret_row.pers_user_attribute_03 := NULL;
         ret_row.pers_user_attribute_04 := NULL;
         ret_row.pers_user_attribute_05 := NULL;
--
         ret_row.gender := bann_comm_data_recs(i).gender;
         ret_row.ethnicity_category := bann_comm_data_recs(i).ethnicity_category;
         ret_row.hispanic_latino_ethn_ind := bann_comm_data_recs(i).hispanic_latino_ethnicity_ind;
         ret_row.asian_ind := bann_comm_data_recs(i).asian_ind;
         ret_row.native_amer_or_alaskan_ind := bann_comm_data_recs(i).native_american_or_alaskan_ind;
         ret_row.black_or_african_ind := bann_comm_data_recs(i).black_or_african_ind;
         ret_row.pacific_islander_ind := bann_comm_data_recs(i).pacific_islander_ind;
         ret_row.white_ind := bann_comm_data_recs(i).white_ind;
         IF bann_comm_data_recs(i).number_of_races = 0 and bann_comm_data_recs(i).resident_alien_visa_count > 0 THEN
            ret_row.non_resident_ind := 'Y';
         ELSE
            ret_row.non_resident_ind := 'N';
         END IF;
         IF NVL(bann_comm_data_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND
            bann_comm_data_recs(i).number_of_races = 0 AND
            bann_comm_data_recs(i).resident_alien_visa_count = 0 THEN
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
         ELSE
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
         END IF;
         ret_row.two_or_more_ind := bann_comm_data_recs(i).two_or_more_ind;
         ret_row.race_ethnicity_confirm_ind := bann_comm_data_recs(i).race_ethnicity_confirm_ind;
         ret_row.minority_ind := bann_comm_data_recs(i).minority_ind;
         ret_row.ethnicity := bann_comm_data_recs(i).ethnicity;
         ret_row.deceased_ind := bann_comm_data_recs(i).deceased_ind;
         ret_row.citizenship_ind := bann_comm_data_recs(i).citizenship_ind;
         ret_row.citizenship_type := bann_comm_data_recs(i).citizenship_type;
         ret_row.visa_type := bann_comm_data_recs(i).visa_type;
         ret_row.nation_of_citizenship := bann_comm_data_recs(i).nation_of_citizenship;
         ret_row.nation_of_birth := bann_comm_data_recs(i).nation_of_birth;
         ret_row.primary_disability := bann_comm_data_recs(i).primary_disability;
         ret_row.legacy := bann_comm_data_recs(i).legacy;
         ret_row.marital_status := bann_comm_data_recs(i).marital_status;
         ret_row.religion := bann_comm_data_recs(i).religion;
         ret_row.veteran_type := bann_comm_data_recs(i).veteran_type;
         ret_row.veteran_category := bann_comm_data_recs(i).veteran_category;
         --BLM mepped 6/2/14 for secuirty reasons
         --ret_row.demo_user_attribute_01 := NULL;
         ret_row.demo_user_attribute_01 := ret_row.multi_source;
         ret_row.demo_user_attribute_02 := NULL;
         ret_row.demo_user_attribute_03 := NULL;
         ret_row.demo_user_attribute_04 := NULL;
         ret_row.demo_user_attribute_05 := NULL;
--    banner_communication
         ret_row.communication := bann_comm_data_recs(i).communication;
         ret_row.communication_type := bann_comm_data_recs(i).communication_type;
         ret_row.material := bann_comm_data_recs(i).material;
         ret_row.communication_plan := bann_comm_data_recs(i).communication_plan;
         ret_row.communication_source := bann_comm_data_recs(i).system || bann_comm_data_recs(i).communication_source;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.comm_user_attribute_01 := NULL;
         ret_row.comm_user_attribute_01 := ret_row.multi_source;
         ret_row.comm_user_attribute_02 := NULL;
         ret_row.comm_user_attribute_03 := NULL;
         ret_row.comm_user_attribute_04 := NULL;
         ret_row.comm_user_attribute_05 := NULL;
--    measures
         ret_row.pending_letter_ind          := bann_comm_data_recs(i).pending_ind;
         ret_row.first_communication_ind     := bann_comm_data_recs(i).first_ind;
         ret_row.latest_communication_ind    := bann_comm_data_recs(i).last_ind;
         ret_row.communication_init_date     := bann_comm_data_recs(i).communication_init_date;
         ret_row.communication_print_date    := bann_comm_data_recs(i).communication_print_date;
         ret_row.communication_sent_date     := bann_comm_data_recs(i).communication_sent_date;
         ret_row.communication_count_date     := bann_comm_data_recs(i).communication_count_date;
         ret_row.user_measure_01 := NULL;
         ret_row.user_measure_02 := NULL;
         ret_row.user_measure_03 := NULL;
         ret_row.user_measure_04 := NULL;
         ret_row.user_measure_05 := NULL;
         ret_row.system_load_process := 'BANNER_COMMUNICATION';
         ret_row.system_load_tmstmp:= SYSDATE;
--
         PIPE ROW(ret_row);
--
         ret_row := ret_row_init;
--
       END LOOP; -- bann_comm_rec
--
    END LOOP;
--
    CLOSE  bann_comm_data_cur;
--
    RETURN;
--
  END f_get_bann_comm;
/******************************************************************************/
  FUNCTION f_get_race(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_race_extr PIPELINED IS
--
    ret_row                     WTT_RACE_INPUT%ROWTYPE;
    ret_row_init                WTT_RACE_INPUT%ROWTYPE;
--
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    parm_rec                    MTVPARM%ROWTYPE;
--
--
        TYPE all_race_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          RACE_CATEGORY                           VARCHAR2(63),
          RACE_CATEGORY_DESC                      VARCHAR2(255),
          RACE                                    VARCHAR2(63),
          RACE_DESC                               VARCHAR2(255),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    all_race_cur       refCurType;
    all_race_rec        all_race_rec_type;
    TYPE tab_all_race_rec_type   IS TABLE OF all_race_rec_type INDEX BY PLS_INTEGER;
    all_race_recs        tab_all_race_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT 
          --BLM switching alias from A to WE as mst_race not mepped
          --NVL(A.MIF_VALUE, def_multi_source_in)    multi_source,
          NVL(we.user_attribute_01, def_multi_source_in)    multi_source,
                 A.ZONE_VALUE                             process_group,
                 A.DOMAIN_VALUE                           administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)           warehouse_entity_uid,
                 A.RACE_CATEGORY,
                 A.RACE_CATEGORY_DESC,
                 A.RACE,
                 A.RACE_DESC,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MST_RACE A
           WHERE
             (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             AND PD.PERSON_ID = A.PERSON_UID
             AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT 
          --BLM mepped 7/29/14, switched alias to WE from A since mst_race not mepped
          --DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)    multi_source,
          DISTINCT NVL(we.user_attribute_01, def_multi_source_in)    multi_source,
                 A.ZONE_VALUE                             process_group,
                 A.DOMAIN_VALUE                           administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)           warehouse_entity_uid,
                 A.RACE_CATEGORY,
                 A.RACE_CATEGORY_DESC,
                 A.RACE,
                 A.RACE_DESC,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MST_RACE A,
                 CHG_RACE CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             AND PD.PERSON_ID = A.PERSON_UID
             AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          p_delete_fact_table('WFT_RACE');
       ELSE
          p_delete_fact_records('CHG_RACE', 'WFT_RACE', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    IF process_ind_in = 'L' THEN
        all_race_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        all_race_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
        FETCH all_race_cur INTO all_race_rec;
        EXIT WHEN all_race_cur%NOTFOUND;
--
      ret_row.multi_source := all_race_rec.multi_source;
      ret_row.process_group := all_race_rec.process_group;
      ret_row.administrative_group := all_race_rec.administrative_group;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.msrc_user_attribute_01 := NULL;
      ret_row.msrc_user_attribute_01 := ret_row.multi_source;
      ret_row.msrc_user_attribute_02 := NULL;
      ret_row.msrc_user_attribute_03 := NULL;
      ret_row.msrc_user_attribute_04 := NULL;
      ret_row.msrc_user_attribute_05 := NULL;
      ret_row.person_uid := all_race_rec.warehouse_entity_uid;
      ret_row.id := all_race_rec.id;
      ret_row.full_name_lfmi := all_race_rec.full_name_lfmi;
      ret_row.birth_date := all_race_rec.birth_date;
      ret_row.deceased_date := all_race_rec.deceased_date;
      ret_row.email_address := all_race_rec.email_address;
      ret_row.phone_number_combined := all_race_rec.phone_number_combined;
      ret_row.confidentiality_ind := all_race_rec.confidentiality_ind;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.pers_user_attribute_01 := NULL;
      ret_row.pers_user_attribute_01 := ret_row.multi_source;
      ret_row.pers_user_attribute_02 := NULL;
      ret_row.pers_user_attribute_03 := NULL;
      ret_row.pers_user_attribute_04 := NULL;
      ret_row.pers_user_attribute_05 := NULL;
      ret_row.gender := all_race_rec.gender;
      ret_row.ethnicity_category := all_race_rec.ethnicity_category;
      ret_row.hispanic_latino_ethn_ind := all_race_rec.hispanic_latino_ethnicity_ind;
      ret_row.asian_ind := all_race_rec.asian_ind;
      ret_row.native_amer_or_alaskan_ind := all_race_rec.native_american_or_alaskan_ind;
      ret_row.black_or_african_ind := all_race_rec.black_or_african_ind;
      ret_row.pacific_islander_ind := all_race_rec.pacific_islander_ind;
      ret_row.white_ind := all_race_rec.white_ind;
      IF all_race_rec.number_of_races = 0 and all_race_rec.resident_alien_visa_count > 0 THEN
         ret_row.non_resident_ind := 'Y';
      ELSE
         ret_row.non_resident_ind := 'N';
      END IF;
      IF NVL(all_race_rec.hispanic_latino_ethnicity_ind,'N') = 'N' AND
         all_race_rec.number_of_races = 0 AND
         all_race_rec.resident_alien_visa_count = 0 THEN
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
      ELSE
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
      END IF;
      ret_row.two_or_more_ind := all_race_rec.two_or_more_ind;
      ret_row.race_ethnicity_confirm_ind := all_race_rec.race_ethnicity_confirm_ind;
      ret_row.minority_ind := all_race_rec.minority_ind;
      ret_row.ethnicity := all_race_rec.ethnicity;
      ret_row.deceased_ind := all_race_rec.deceased_ind;
      ret_row.citizenship_ind := all_race_rec.citizenship_ind;
      ret_row.citizenship_type := all_race_rec.citizenship_type;
      ret_row.visa_type := all_race_rec.visa_type;
      ret_row.nation_of_citizenship := all_race_rec.nation_of_citizenship;
      ret_row.nation_of_birth := all_race_rec.nation_of_birth;
      ret_row.primary_disability := all_race_rec.primary_disability;
      ret_row.legacy := all_race_rec.legacy;
      ret_row.marital_status := all_race_rec.marital_status;
      ret_row.religion := all_race_rec.religion;
      ret_row.veteran_type := all_race_rec.veteran_type;
      ret_row.veteran_category := all_race_rec.veteran_category;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.demo_user_attribute_01 := NULL;
      ret_row.demo_user_attribute_01 := ret_row.multi_source;
      ret_row.demo_user_attribute_02 := NULL;
      ret_row.demo_user_attribute_03 := NULL;
      ret_row.demo_user_attribute_04 := NULL;
      ret_row.demo_user_attribute_05 := NULL;
-- race
      ret_row.race := all_race_rec.race;
      ret_row.race_category := all_race_rec.race_category;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.race_user_attribute_01 := NULL;
      ret_row.race_user_attribute_01 := ret_row.multi_source;
      ret_row.race_user_attribute_02 := NULL;
      ret_row.race_user_attribute_03 := NULL;
      ret_row.race_user_attribute_04 := NULL;
      ret_row.race_user_attribute_05 := NULL;
-- measures
      ret_row.race_ethnicity_confirm_date := TRUNC(NVL(all_race_rec.race_ethnicity_confirm_date,'31-DEC-2099'));
      ret_row.user_measure_01 := NULL;
      ret_row.user_measure_02 := NULL;
      ret_row.user_measure_03 := NULL;
      ret_row.user_measure_04 := NULL;
      ret_row.user_measure_05 := NULL;
      ret_row.system_load_process := 'RACE';
--
      PIPE ROW(ret_row);
--
      ret_row := ret_row_init;
--
    END LOOP; -- all_race_rec
--
    RETURN;

  END f_get_race;
/******************************************************************************/
END edw_general_extr;
/
