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
  nFactRows_cccs_pre    NUMBER;
  nFactRows_cccs_post    NUMBER;
  count_query       VARCHAR2(5000) := NULL;
  count_query_cccs  VARCHAR2(5000) := NULL;
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
      --if 1
      --CCCS entire double-if statement is custom to accommmodate adding academic-period to the chg_student_course table
      IF dimension_table_in IS NULL THEN
         --CCCS Custom line
         --IF column_in = 'PERSON_UID'  THEN
         IF column_in = 'PERSON_UID' and upper(change_Table_in) <> 'CHG_STUDENT_COURSE' THEN
            delete_text := 'BEGIN ' ||
                           'DELETE FROM '|| fact_table_in ||' d'  ||
                           ' WHERE EXISTS (SELECT chg.'||NVL(column2_in, column_in) ||
                           '                 FROM '|| change_table_in ||' chg, wdt_warehouse_entity we'  ||
                           '                WHERE we.banner_pidm = chg.'|| NVL(column2_in, column_in) ||
                           '                  AND d.'|| column_in ||' = we.warehouse_entity_uid);'||
                           'END;';
         --CCCS Start Custom ELSIF 1
         ELSIF column_in = 'PERSON_UID' and upper(change_Table_in) = 'CHG_STUDENT_COURSE' THEN
                 delete_text := 'BEGIN '||
                         'DELETE FROM '||fact_table_in ||' d' ||
                         ' WHERE EXISTS (SELECT we.warehouse_entity_uid '||
                         '                 FROM '||change_table_in ||' chg, wdt_academic_time wdt, wdt_warehouse_entity we '||
                         '                WHERE chg.'||column_in||' = we.banner_pidm '||
                         '                  AND we.warehouse_entity_uid = d.person_uid '||
                         '                  AND coalesce(chg.academic_period,wdt.academic_period) = wdt.academic_period '||
                         '                  AND wdt.academic_time_key = d.academic_time_key);'||
                         'END;';
         --CCCS End Custom ELSIF 1                
         ELSE
            delete_text := 'BEGIN ' ||
                           'DELETE FROM '|| fact_table_in ||' d'  ||
                           ' WHERE EXISTS (SELECT chg.'||NVL(column2_in, column_in) ||
                           '                 FROM '||change_table_in ||' chg'  ||
                           '                WHERE chg.'||NVL(column2_in, column_in)|| ' = d.' ||column_in||');'||
                           'END;';
         END IF;
      --CCCS Custom ELSIF num. 2  FINISH THIS MONDAY
      ELSIF dimension_table_in IS NOT NULL and upper(change_Table_in) = 'CHG_STUDENT_COURSE' THEN
      delete_text := 'BEGIN ' ||
                      'DELETE FROM '||fact_table_in ||' d' ||
                      ' WHERE EXISTS (SELECT we.warehouse_entity_uid '||
                      '                 FROM '||change_table_in ||' chg, wdt_academic_time wdt, wdt_warehouse_entity we , '||dimension_table_in||' dim'||
                      '                WHERE chg.'||column_in||' = we.banner_pidm '||
                      '                  AND we.warehouse_entity_uid = d.person_uid '||
                      '                  AND dim.course_reference_number = chg.course_reference_number '||
                      '                  AND dim.course_reference_number_key = d.course_reference_number_key '||
                      '                  AND coalesce(chg.academic_period,wdt.academic_period) = wdt.academic_period '||
                      '                  AND wdt.academic_time_key = d.academic_time_key);'||
                        'END;';
      --End Custom ELSIF num. 2  FINISH THIS MONDAY
      ELSE delete_text := 'BEGIN ' ||
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

      count_query_cccs := 'SELECT COUNT(*) FROM ' || fact_table_in;
      EXECUTE IMMEDIATE count_query_cccs INTO nFactRows_cccs_pre;
      mgkolib.P_WriteMdrlogdMsg( '<b>CCCS Mod - Pre-delete count for: ' || fact_table_in || ':</b> ' || nFactRows_cccs_pre);
      DBMS_SQL.PARSE(ws_cursor,delete_text,1);
      ws_return := DBMS_SQL.EXECUTE(ws_cursor);
      DBMS_SQL.CLOSE_CURSOR(ws_cursor);
      l_lock_request := DBMS_LOCK.RELEASE(LOCKHANDLE=>l_lock_handle);
      COMMIT;
      EXECUTE IMMEDIATE count_query_cccs INTO nFactRows_cccs_post;
      mgkolib.P_WriteMdrlogdMsg( '<b>CCCS Mod - Post-delete count for: ' || fact_table_in || ':</b> ' || nFactRows_cccs_post);

      -- Drop any remaining BMIs before loading records.
      mgkutil.P_DropBitmapIndexes('EDWMGR',fact_table_in);

      IF verbose THEN
         mgkolib.P_WriteMdrlogdMsg( 'Completed DELETE_FACT FOR: ' || change_Table_in || ' at: ' || mgkolib.F_GetDateAndTime);
      END IF;

  END p_delete_fact_records;