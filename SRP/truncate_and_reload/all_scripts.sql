/* Disable all constraints 
1 - run this script
2 - run the output of this script twice
*/
select distinct 'alter table '||table_name||' disable constraint '||constraint_name||';'
  from dba_constraints
 where owner = 'EDWMGR'
   and (upper(table_name) like 'WDT%' or upper(table_name) like 'WFT%'  or upper(table_name) like 'WAT%')
   order by 1 asc;
   
/* Truncate all tables */
select distinct 'truncate table '||table_name||';'
  from dba_tables
 where owner = 'EDWMGR'
   and (upper(table_name) like 'WDT%' or upper(table_name) like 'WFT%' or upper(table_name) like 'WAT%');
   
/* Enable all constraints */
select distinct 'alter table '||table_name||' enable constraint '||constraint_name||';'
  from dba_constraints
 where owner = 'EDWMGR'
   and (upper(table_name) like 'WDT%' or upper(table_name) like 'WFT%'  or upper(table_name) like 'WAT%');
   
   
/*** REMEMBER TO ADD THE 0 ROWS BACK TO THE DIMENSIONS!!! USE THIS:
edw/edw80403i/install/init_edwmgr_tables.sql
****/