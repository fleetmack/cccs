REM============================================================================
REM
REM	F_CVT_GET_VALUE
REM
REM	Feed in a column you would like to retrieve, along with a table
REM	you are retrieving from, and it will return the value from that table.
REM	Optionally, you can specify up to four where constraints (entering each
REM	where column with a where value), to ensure that only one row is returned.
REM
REM	Example call, which retrieves the first name from SPRIDEN where the last name
REM	is 'Smith' and the ID is '12340'
REM
REM	DECLARE
REM	   my_value VARCHAR2(2000);
REM	BEGIN
REM	   dbms_output.enable;
REM	   my_value := f_cvt_get_value('spriden_first_name',
REM	      'spriden','spriden_last_name','Smith','spriden_id','12340');
REM	   DBMS_OUTPUT.PUT_LINE(my_value);
REM	END;
REM
PROMPT
PROMPT *******************
PROMPT * F_CVT_GET_VALUE
PROMPT *******************
PROMPT
CREATE OR REPLACE function f_cvt_get_value
 (select_column VARCHAR2,
table_name VARCHAR2,
where_column1 VARCHAR2,where_value1 VARCHAR2 DEFAULT NULL,
where_column2 VARCHAR2 DEFAULT NULL, where_value2 VARCHAR2 DEFAULT NULL,
where_column3 VARCHAR2 DEFAULT NULL, where_value3 VARCHAR2 DEFAULT NULL,
where_column4 VARCHAR2 DEFAULT NULL, where_value4 VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2 IS

/*
	Feed in a column you would like to retrieve, along with a table
	you are retrieving from, and it will return the value from that table.
	Optionally, you can specify up to four where constraints (entering each
	where column with a where value), to ensure that only one row is returned.

	Example call, which retrieves the first name from SPRIDEN where the last name
	is 'Smith' and the ID is '12340'

	DECLARE
	   my_value VARCHAR2(2000);
	BEGIN
	   dbms_output.enable;
	   my_value := f_cvt_get_value('spriden_first_name',
           'spriden','spriden_last_name','Smith','spriden_id','12340');
	   DBMS_OUTPUT.PUT_LINE(my_value);
	END;
*/

   my_statement VARCHAR2(800);
   ws_cursor INTEGER;
   ws_return INTEGER;
   out_value VARCHAR2(2000);
   where_clause VARCHAR2(2000);
BEGIN
   ws_cursor := dbms_sql.open_cursor;
   IF where_column1 IS NOT NULL THEN
      where_clause := ' WHERE '||where_column1 ||' = '||''''||where_value1||'''';
	  IF where_column2 IS NOT NULL THEN
	     where_clause := where_clause || ' AND '||where_column2||
		    ' = '||''''||where_value2||'''';
			IF where_column3 IS NOT NULL THEN
               where_clause := where_clause || ' AND '||where_column3||
		          ' = '||''''||where_value3||'''';
			   IF where_column4 IS NOT NULL THEN
                  where_clause := where_clause || ' AND '||where_column4||
		             ' = '||''''||where_value4||'''';
			   END IF;
			END IF;
	   END IF;
   END IF;
   my_statement := 'BEGIN SELECT '||select_column||
	' INTO :ws_value FROM '||table_name||where_clause||'; END;';
   dbms_sql.parse(ws_cursor,my_statement,dbms_sql.v7);
   dbms_sql.bind_variable(ws_cursor, ':ws_value', out_value,2000);
   ws_return := dbms_sql.execute(ws_cursor);
   dbms_sql.variable_value(ws_cursor, 'ws_value', out_value);
   DBMS_SQL.CLOSE_CURSOR(ws_cursor);
  RETURN out_value;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_SQL.CLOSE_CURSOR(ws_cursor);
      RETURN 'ERR- No data found.';
   WHEN OTHERS THEN
   DECLARE
      err_msg VARCHAR2(207) := 'ERR- '||substr(SQLERRM,1,200);
   BEGIN
      DBMS_SQL.CLOSE_CURSOR(ws_cursor);
      RETURN err_msg;
   END;
END f_cvt_get_value;
/
SHOW ERRORS
