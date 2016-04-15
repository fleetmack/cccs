create table ODSSRC.delete_soon

(owner varchar(30), VIEW_NAME VARCHAR(30), TEXT_LENGTH NUMBER, TEXT CLOB)

 

INSERT INTO ODSSRC.DELETE_SOON ( SELECT OWNER, VIEW_NAME, TEXT_LENGTH, TO_LOB(TEXT) FROM DBA_VIEWS)

 

select * from odssrc.delete_soon

where owner not in ('SYS','SYSTEM','DBSNMP')

AND TEXT LIKE '%F_GET_SUPERVISOR%'
