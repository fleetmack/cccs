truncate table edwstg.wtt_student_course_attr_clean;

select * from v$tempseg_usage;

select * from dba_temp_files;


alter tablespace 
   TEMPXIO
add tempfile 
   '/dw04_xio/oradata/ODSP/TEMPXIO_ODSP_16.dbf' 
size 
   200m 
reuse 
autoextend on 
next 
   100m 
maxsize 
   32768m;



/dw04_xio/oradata/ODSP/TEMPXIO_ODSP_15.dbf