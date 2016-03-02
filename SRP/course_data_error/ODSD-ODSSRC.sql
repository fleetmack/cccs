/* Real Time */
with stuff as
(select person_uid, academic_period, sub_academic_period, course_reference_number, mif_value
  from as_student_course_in_progress
 where academic_year >= '2009'
 union all  
  select  person_uid, academic_period, sub_academic_period, course_reference_number, mif_value
    from as_student_course_history
where academic_year >= '2009'    
union all    
select  person_uid, academic_period, sub_academic_period, course_reference_number, mif_value
  from as_student_course_transfer
  where academic_year >= '2009')
select   person_uid, academic_period, sub_academic_period, course_reference_number, mif_value
from stuff
group by person_uid, academic_period, sub_academic_period, course_reference_number, mif_value
having count(*) > 1;