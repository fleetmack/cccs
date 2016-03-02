/************************************************************************/
/************************************************************************/
/************************************************************************/
/* Student Course Attribute star */
select ms.multi_source, at.academic_period, crn.course_reference_number, att.attribute, we.banner_pidm, srp.*
from WKE_7481_140915185553  srp,
     wdt_multi_source       ms,
     wdt_academic_time      at,
     wdt_course_reference_number crn,
     wdt_attribute          att,
     wdt_warehouse_entity   we
where srp.multi_source_key = ms.multi_source_key
  and srp.academic_time_key = at.academic_time_key
  and srp.course_reference_number_key = crn.course_reference_number_key
  and srp.person_uid = we.warehouse_entity_uid
  and srp.student_course_attribute_key = att.attribute_key
  --we only care if they are newer than 2009
  and at.academic_period >= '200910';
--These are currently all NJC records; NJC is working on cleaning them up  
/************************************************************************/
/************************************************************************/
/************************************************************************/
/* Retention Multi-Year Star */
select we.user_attribute_01, sl.student_level, we.banner_pidm, srp.*
from WKE_7455_140912173113 srp,
     wdt_warehouse_entity  we,
     wdt_student_level     sl
where srp.person_uid = we.warehouse_entity_uid
  and srp.student_level_key = sl.student_level_key;
  
--is this person in the input table twice?  
--select * from table(edw_student_extr.f_get_retention_multi_year('L',sysdate,null))
--where person_uid = 207262;

select * from wtt_retention_multi_year_input where person_uid = 128896; --1 row
--now running the clean table, then wkeys -- see where it becomes 2 rows
/************************************************************************/
/************************************************************************/
/************************************************************************/

/* Grade Change Star */
select at.academic_period, we.banner_pidm, crn.course_reference_number, we.user_attribute_01
  from WKE_7709_140920173419 srp,
       wdt_academic_time     at,
       wdt_course_reference_number crn,
       wdt_warehouse_entity  we
where srp.academic_time_key = at.academic_time_key
  and srp.person_uid = we.warehouse_entity_uid
  and srp.course_reference_number_key = crn.course_reference_number_key
  and we.user_attribute_01 <> 'CCD';
/************************************************************************/
/************************************************************************/
/************************************************************************/

/* Advisor Star */
select wes.banner_pidm as student_pidm, wea.banner_pidm as advisor_pidm, wea.user_attribute_01, at.academic_period
  from WKE_7693_140920162105 srp,
       wdt_warehouse_entity  wes,
       wdt_warehouse_entity wea,
       wdt_academic_time at
 where srp.person_uid = wes.warehouse_entity_uid
   and srp.advisor_uid = wea.warehouse_entity_uid
   and srp.academic_time_key = at.academic_time_key
   and at.academic_year >= '2009';
   
select * from mst_advisor where person_uid = 563996 and mif_value = 'OJC' and advisor_uid = 24894;

/************************************************************************/
/************************************************************************/
/************************************************************************/

/* Course Section star */
select at.academic_period, crn.course_reference_number, crn.user_attribute_01, cs.course_section
from WKE_7732_140920181336 srp,
     wdt_academic_time     at,
     wdt_course_reference_number crn,
     wdt_course_section    cs
where srp.academic_time_key = at.academic_time_key
  and srp.course_reference_number_key = crn.course_reference_number_key
  and srp.course_section_key = cs.course_section_key;
  
  select distinct at.academic_period
from WKE_7732_140920181336 srp,
     wdt_academic_time     at,
     wdt_course_reference_number crn,
     wdt_course_section    cs
where srp.academic_time_key = at.academic_time_key
  and srp.course_reference_number_key = crn.course_reference_number_key
  and srp.course_section_key = cs.course_section_key;

/************************************************************************/
/************************************************************************/
/************************************************************************/

/* Student Course Attribute Star */
select at.academic_period, we.user_attribute_01, we.banner_pidm, crn.course_reference_number, ca.course_attribute
  from WKE_7786_140921155117 srp,
       wdt_academic_time     at,
       wdt_warehouse_entity  we,
       wdt_course_attribute  ca,
       wdt_course_reference_number crn
 where srp.academic_time_key = at.academic_time_key
   and srp.person_uid = we.warehouse_entity_uid
   and srp.student_course_attribute_key = ca.course_attribute_key
   and srp.course_reference_number_key = crn.course_reference_number_key
   and at.academic_year >= '2009'
order by length(crn.course_reference_number), at.academic_period desc;

select *
  from mst_student_course_attribute
 where academic_period = '201130' and mif_value = 'NJC' and course_reference_number = 30176 and person_uid = 1550102;