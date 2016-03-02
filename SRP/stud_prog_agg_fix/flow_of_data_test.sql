/* Note - this only works in PROD, need to find key values if run in other databases */

/* ODS Counts */
select final_grade, count(*)
  from mst_student_course
 where mif_value = 'ACC' and academic_period = '201520' and course_identification = 'ENG121'
group by final_grade
order by final_grade;

/* EDW Fact Counts - Should Match */
select final_grade, count(*)
  from wft_student_course
 where academic_time_key = '208' and multi_source_key = '2' and course_key in
  (select course_key from wdt_course where course_identification = 'ENG121')
group by final_grade
order by final_grade;

/* Aggregate Counts - run once per grade - should match */
select sc.final_grade, count(sp.person_uid)
from wat_student_progress  sp,
     wft_student_course    sc
where sp.multi_source_key = sc.multi_source_key
  and sp.academic_time_key = sc.academic_time_key
  and sp.student_course_group_key = sc.student_course_group_key
  and sp.multi_source_key = '2'
  and sp.academic_time_key = '208'
  --and substr(sc.final_grade,2,1) <> '*'
  and sc.course_key in
    (select d.course_key from wdt_course d where user_attribute_01 = 'ACC' and course_identification = 'ENG121')
group by sc.final_grade
order by sc.final_grade;


/* Who is someone missing from A* ?*/

select person_uid
from mst_student_course
where mif_value = 'ACC' and course_identification = 'ENG121' and academic_period = '201520'
and final_grade = 'A*';


select banner_pidm
  from wat_student_progress sp, wdt_warehouse_entity we, wft_student_course sc, wdt_course c
 where sc.course_key = c.course_key
   and c.course_identification = 'ENG121'
   and sp.multi_source_key = sc.multi_source_key
   and sp.academic_time_key = sc.academic_time_key 
   and sp.person_uid = we.warehouse_entity_uid
   and sc.student_course_group_key = sp.student_course_group_key
   and sp.mif_value_vc = 'ACC'
   and sp.academic_time_key = '208'
   and sc.final_grade = 'A*';
/* Compared the last 2 queries in "differences_after_fixing_agg.xlsx -- an example pidm in the fact but not the agg is 109605*/
--edw id
select * from wdt_warehouse_entity where user_attribute_01 = 'ACC' and banner_pidm = 109605; --32610
--proof they are in the fact - where did they go?
select * from wft_student_course where person_uid = 32610 and academic_time_key = '208'
  and course_key in (select course_key from wdt_course where course_identification = 'ENG121');
  
  
  select * from MST_BASE_STUDENT where person_uid = 109605 and mif_value= 'ACC';
  select * from mst_student_course where  person_uid = 109605 and mif_value= 'ACC';
  select * from wft_student_course where person_uid = 32610 and academic_time_key =  '208'
  
  