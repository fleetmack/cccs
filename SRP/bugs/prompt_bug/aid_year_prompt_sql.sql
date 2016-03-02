SELECT 'ALL' || ' - ' || 'All Aid Years' sel_year_code FROM dual
UNION
select distinct year_code||' - '||
                substr(year_code_desc,instr(year_code_desc,'2'),2)||substr(year_code,1,2)||'-'||'20'||substr(year_code,3,2) sel_year_code
  from mgt_year_type_definition
  where year_type = 'AIDY'
ORDER BY sel_year_code DESC 



/* OLD CODE
select 'ALL' || ' - ' ||  'All Aid Years' sel_year_code  from dual UNION select distinct year_code  || ' - ' ||  year_code_desc sel_year_code from mgt_year_type_definition where year_type = 'AIDY' order by sel_year_code desc
*/
