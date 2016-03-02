/**** NOTE! THIS WILL TRUNCATE FREEZES AS WELL!! ***/
/* Disable all constraints 
1 - run this script
2 - run the output of this script twice
*/
select distinct 'alter table '||table_name||' disable constraint '||constraint_name||' cascade ;'
  from dba_constraints
 where owner = 'EDWMGR'
   and  (upper(table_name) like 'WDT%' 
       or upper(table_name) like 'WFT%' 
       or upper(table_name) like 'WAT%'
       or upper(table_name) like '%WAZ%'
       or upper(table_name) like 'WFZ%');
   
/* Truncate all tables */
select distinct 'truncate table '||table_name||';'
  from dba_tables
 where owner = 'EDWMGR'
   and (upper(table_name) like 'WDT%' 
       or upper(table_name) like 'WFT%' 
       or upper(table_name) like 'WAT%'
       or upper(table_name) like '%WAZ%'
       or upper(table_name) like 'WFZ%');
   
/* Enable Constraints */   
select distinct 'alter table '||table_name||' enable constraint '||constraint_name||';'
  from dba_constraints
 where owner = 'EDWMGR'
   and  (upper(table_name) like 'WDT%' 
       or upper(table_name) like 'WFT%' 
       or upper(table_name) like 'WAT%'
       or upper(table_name) like '%WAZ%'
       or upper(table_name) like 'WFZ%');   
   