select 'with records as 
(select banner_pidm, warehouse_entity_uid as person_uid from wdt_warehouse_entity where user_attribute_01 is null)
select '''||object_name||''', count(*)
 from '|| object_name|| ' f,
              records r
where r.person_uid = f.person_uid;'
from dba_objects
where object_type = 'TABLE'
and owner = 'EDWMGR'
and (object_name like 'WFT%' or object_name like 'WAT%')
and object_name in
  (select table_name from all_tab_columns where column_name = 'PERSON_UID');
  
  
select mif_value_vc, count(*) from wft_hold group by mif_value_vc order by mif_value_vc;  --85588 CCCS, all others equal 1,927,171
with records as 
(select banner_pidm, warehouse_entity_uid as person_uid from wdt_warehouse_entity where user_attribute_01 is null)
select count(*)
  from wft_hold  h, records r
 where h.person_uid = r.person_uid
   and mif_value_vc = 'CCCS'; --85588, checks out
   
   
select mif_value_vc, count(*) from wft_race group by mif_value_vc order by mif_value_vc;  --52855 CCCS, all others equal 1,535,022
with records as 
(select banner_pidm, warehouse_entity_uid as person_uid from wdt_warehouse_entity where user_attribute_01 is null)
select count(*)
  from wft_race  h, records r
 where h.person_uid = r.person_uid
   and mif_value_vc = 'CCCS'; --52855, checks out


select mif_value_vc, count(*) from wft_test group by mif_value_vc order by mif_value_vc;  --115,524 CCCS, all others equal 3,526,300
with records as 
(select banner_pidm, warehouse_entity_uid as person_uid from wdt_warehouse_entity where user_attribute_01 is null)
select count(*)
  from wft_test  h, records r
 where h.person_uid = r.person_uid
   and mif_value_vc = 'CCCS'; --