/* Monitor Table Spaces for Input, Clean, and WKEYS tables 
select segment_name, sum(bytes/1024/1024/1024) gb
  from dba_segments
 where owner = 'EDWSTG'
   and segment_type = 'TABLE'
   and (segment_name like '%CLEAN'
        or segment_name like '%INPUT'
        or segment_name like '%WKEYS')
group by segment_name
order by sum(bytes/1024/1024/1024) desc;
*/

/* ALWAYS TURN OFF THE WAREHOUSE ENTITY DIMENSION */
UPDATE mtvparm
set mtvparm_external_code = 'N'
where  MTVPARM_INTERNAL_CODE_GROUP = 'ETL CONTROL GROUP'
 AND MTVPARM_INTERNAL_CODE_2 = 'LOAD_EDW_DIM_WAREHOUSE_ENTITY';
 commit;
 
/* THOSE WHICH WE RUN FOR EVERY YEAR */
UPDATE MTVPARM
  --TO TURN TO LOAD
  /*
  set mtvparm_external_code =
      (CASE 
       WHEN MTVPARM_INTERNAL_CODE_2 LIKE '%2' THEN 'Y-PARALLEL'
       ELSE 'Y'
       END)
       */
  --TO TURN TO NOT LOAD
  set mtvparm_external_code = 'N'
 WHERE MTVPARM_INTERNAL_CODE_GROUP = 'ETL CONTROL GROUP'
   AND (
        (MTVPARM_INTERNAL_CODE = 'LOAD_EDW-P-W-2-1'
          AND MTVPARM_INTERNAL_CODE_2 IN
           ('LOAD_EDW_ACAD_OTCOM_HNR-1',
           'LOAD_EDW_ATHLETIC-1',
           'LOAD_EDW_CONTACT-1',
           'LOAD_EDW_RACE-1',
           'LOAD_EDW_POST_SECONDARY-1',
           'LOAD_EDW_INTEREST-1',
           'LOAD_EDW_TEST-1',
            'LOAD_EDW_HOLD-1',
           'LOAD_EDW_PROSPECTIVE_STUDENT-1',
           'LOAD_EDW_STUDENT_ACTIVITY-1',
            'LOAD_EDW_SEC_SCHL_SUBJECT-1',
            'LOAD_EDW_INSTITUTION-1',
            'LOAD_EDW_BANNER_COMMUNICATION-1'))
        or (MTVPARM_INTERNAL_CODE = 'LOAD_EDW-P-W-2-2'
            AND MTVPARM_INTERNAL_CODE_2 IN 
            ('LOAD_EDW_ACAD_OTCOM_HNR-2',
             'LOAD_EDW_ATHLETIC-2',
             'LOAD_EDW_CONTACT-2',
             'LOAD_EDW_RACE-2',
             'LOAD_EDW_POST_SECONDARY-2',
             'LOAD_EDW_INTEREST-2',
             'LOAD_EDW_TEST-2',
             'LOAD_EDW_HOLD-2',
             'LOAD_EDW_PROSPECTIVE_STUDENT-2',
             'LOAD_EDW_STUDENT_ACTIVITY-2',
             'LOAD_EDW_SEC_SCHL_SUBJECT-2',
             'LOAD_EDW_INSTITUTION-2',
             'LOAD_EDW_BANNER_COMMUNICATION-2'))
          or (MTVPARM_INTERNAL_CODE = 'LOAD_EDW-P-W-2-3'
            AND MTVPARM_INTERNAL_CODE_2 IN 
            ('LOAD_EDW_ACAD_OTCOM_HNR-3',
             'LOAD_EDW_ATHLETIC-3',
             'LOAD_EDW_CONTACT-3',
             'LOAD_EDW_RACE-3',
             'LOAD_EDW_POST_SECONDARY-3',
             'LOAD_EDW_INTEREST-3',
             'LOAD_EDW_TEST-3',
             'LOAD_EDW_HOLD-3',
             'LOAD_EDW_PROSPECTIVE_STUDENT-3',
             'LOAD_EDW_STUDENT_ACTIVITY-3',
             'LOAD_EDW_SEC_SCHL_SUBJECT-3',
             'LOAD_EDW_INSTITUTION-3',
             'LOAD_EDW_BANNER_COMMUNICATION-3'))
             );
             
             
/***** THOSE WHICH WE RUN ONCE FOR EVERY YEAR *****/
UPDATE MTVPARM
  --TO TURN TO LOAD
  
  set mtvparm_external_code =
      (CASE 
       WHEN MTVPARM_INTERNAL_CODE = 'LOAD_EDW-P-W-2-2' THEN 'Y-PARALLEL'
       ELSE 'Y'
       END)
       
  --TO TURN TO NOT LOAD
    --set mtvparm_external_code = 'N'

 WHERE MTVPARM_INTERNAL_CODE_GROUP = 'ETL CONTROL GROUP'
   AND (
        (MTVPARM_INTERNAL_CODE = 'LOAD_EDW-P-W-2-1'
          AND MTVPARM_INTERNAL_CODE_2 IN
           ('LOAD_EDW_STUDENT_COHORT-1',
           'LOAD_EDW_STUDENT_ATTRIBUTE-1',
           'LOAD_EDW_ADVISOR-1',
           'LOAD_EDW_FINAID_APPLICATION-1',
           'LOAD_EDW_GRADE_CHANGE-1',
           'LOAD_EDW_MEETING_TIME-1',
           'LOAD_EDW_CRS_INST-1',
           'LOAD_EDW_ADMISSIONS_APPLICATION-1',
           'LOAD_EDW_FINAID_AWD_ACADPD-1',
           'LOAD_EDW_FINAID_AWD_AIDYR-1',
            'LOAD_EDW_STUDENT_COURSE_ATTRIBUTE-1'))   
        OR
        (MTVPARM_INTERNAL_CODE = 'LOAD_EDW-P-W-2-2'
          AND MTVPARM_INTERNAL_CODE_2 IN
           ('LOAD_EDW_STUDENT_COHORT-2',
           'LOAD_EDW_STUDENT_ATTRIBUTE-2',
           'LOAD_EDW_ADVISOR-2',
           'LOAD_EDW_FINAID_APPLICATION-2',
           'LOAD_EDW_GRADE_CHANGE-2',
           'LOAD_EDW_MEETING_TIME-2',
           'LOAD_EDW_CRS_INST-2',
           'LOAD_EDW_ADMISSIONS_APPLICATION-2',
           'LOAD_EDW_FINAID_AWD_ACADPD-2',
           'LOAD_EDW_FINAID_AWD_AIDYR-2',
            'LOAD_EDW_STUDENT_COURSE_ATTRIBUTE-2')) 
        OR
        (MTVPARM_INTERNAL_CODE = 'LOAD_EDW-P-W-2-3'
          AND MTVPARM_INTERNAL_CODE_2 IN
           ('LOAD_EDW_STUDENT_COHORT-3',
           'LOAD_EDW_STUDENT_ATTRIBUTE-3',
           'LOAD_EDW_ADVISOR-3',
           'LOAD_EDW_FINAID_APPLICATION-3',
           'LOAD_EDW_GRADE_CHANGE-3',
           'LOAD_EDW_MEETING_TIME-3',
           'LOAD_EDW_CRS_INST-3',
           'LOAD_EDW_ADMISSIONS_APPLICATION-3',
           'LOAD_EDW_FINAID_AWD_ACADPD-3',
           'LOAD_EDW_FINAID_AWD_AIDYR-3',
            'LOAD_EDW_STUDENT_COURSE_ATTRIBUTE-3'))   
            
            
               OR
        (MTVPARM_INTERNAL_CODE = 'LOAD_EDW-P-W-3')    
        OR  (MTVPARM_INTERNAL_CODE = 'LOAD_EDW-P-W-4')   
         OR  (MTVPARM_INTERNAL_CODE = 'LOAD_EDW-P-W-5') 
         );