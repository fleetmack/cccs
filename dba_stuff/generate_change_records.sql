  SELECT    'UPDATE '
         || owner
         || '.'
         || table_name
         || ' SET '
         || table_name
         || '_ACTIVITY_DATE = '
         || table_name
         || '_ACTIVITY_DATE WHERE ROWNUM < '
         || ROUND (NUM_ROWS / 20)
         || ';'
    FROM DBA_TABLES
   WHERE     OWNER IN ('ALUMNI',
                       'FAISMGR',
                       'FIMSMGR',
                       'GENERAL',
                       'PAYROLL',
                       'FIMSCCCS',
                       'POSNCTL',
                       'SATURN',
                       'TAISMGR')
         AND NUM_ROWS > 20
         AND TABLE_NAME IN (SELECT MGBSTGE_TABLE_NAME
                              FROM MGBSTGE)
ORDER BY owner;
