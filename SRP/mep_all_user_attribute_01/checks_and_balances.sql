/* Warehouse Dimension */
select distinct(user_attribute_01) from wdt_warehouse_entity;
select * from wdt_warehouse_entity where useR_attribute_01 = 'No Data';

--Check MEP
/* Institution Star */
select count(*) from wft_institution;
select  user_attribute_01, count(*) from wdt_geographic_region group by user_attribute_01; --no null, 13
select   user_attribute_01, count(*) from wdt_institution group by user_attribute_01; --no null, 13
select  user_attribute_01, count(*) from wdt_multi_source group by user_attribute_01; --no null, 13
select * from wdt_multi_source order by multi_source;
select  user_attribute_01, count(*) from wdt_postal group by user_attribute_01; --no null, 13
select  user_attribute_01, count(*) from wdt_street_address group by user_attribute_01; --the "No Data" records were from old loads, this one didn't truncate. Keep an eye on this
select mif_value_vc, count(*) from wft_institution group by mif_value_vc; --no VC for mif - because no person data?

/* Academic Outcome Honor Star */
select  user_attribute_01, count(*) from wdt_multi_source where system_load_process = 'ACADEMIC_OUTCOME_HONOR' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*) from wdt_person where system_load_process = 'ACADEMIC_OUTCOME_HONOR' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*) from wdt_academic_outcome_honor where system_load_process = 'ACADEMIC_OUTCOME_HONOR' group by user_attribute_01; --no nulls
select  mif_value_vc, count(*) from wft_academic_outcome_honor group by mif_value_vc; --no nulls, 1 dummy row with CCCS

/* Athletic Star */
select  user_attribute_01, count(*)  from wdt_multi_source where system_load_process = 'ATHLETIC' group by user_attribute_01; --no nulls
select user_attribute_01, count(*)   from wdt_academic_time where system_load_process = 'ATHLETIC' group by user_attribute_01; --no nulls, had to fix
select  user_attribute_01, count(*)   from wdt_person where system_load_process = 'ATHLETIC' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*)  from wdt_activity where system_load_process = 'ATHLETIC' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*)  from wdt_demographic where system_load_process = 'ATHLETIC' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*)  from wdt_athletic where system_load_process = 'ATHLETIC' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_athletic group by mif_value_vc; --no nulls

/* Contact Star */
select user_attribute_01, count(*) from wdt_calendar_date where system_load_process = 'CONTACT' group by user_attribute_01; --not mepped, not supposed to be.  This inserted nothing, anyway. Ok.
select user_attribute_01, count(*) from wdt_demographic where system_load_process = 'CONTACT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_multi_source where system_load_process = 'CONTACT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*)  from wdt_person where system_load_process = 'CONTACT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_contact where system_load_process = 'CONTACT' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_contact group by mif_value_vc; --no nulls

/* Race Star */
select user_attribute_01, count(*) from wdt_demographic where system_load_process = 'RACE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_multi_source where system_load_process = 'RACE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_person where system_load_process = 'RACE' group by user_attribute_01;--the "No Data" records were from old loads, this one didn't truncate. Keep an eye on this
select user_attribute_01, count(*) from wdt_race where system_load_process = 'RACE' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_race group by mif_value_vc; --no nulls

/* Interest Star */
select user_attribute_01, count(*) from wdt_demographic where system_load_process = 'INTEREST' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_interest where system_load_process = 'INTEREST' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_interest_extension where system_load_process = 'INTEREST' group by user_attribute_01;
select user_attribute_01, count(*) from wdt_multi_source where system_load_process = 'INTEREST' group by user_attribute_01; --no nulls
select user_attribute_01, count(*)  from wdt_person where system_load_process = 'INTEREST' group by user_attribute_01; --the "No Data" records were from old loads, this one didn't truncate. Keep an eye on this
select user_attribute_01, count(*) from wdt_person where system_load_process = 'INTEREST'  group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_person_extension where system_load_process = 'INTEREST'  group by user_attribute_01;
select mif_value_vc, count(*)  from wft_interest group by mif_value_vc; --no nulls

/* Post Secondary Star - no data here in ODS */
select user_attribute_01, count(*)  from wdt_calendar_date where system_load_process = 'POST_SECONDARY' group by user_attribute_01; --no data
select user_attribute_01, count(*)  from wdt_demographic where system_load_process = 'POST_SECONDARY' group by user_attribute_01; --no data
select user_attribute_01, count(*)  from wdt_institution where system_load_process = 'POST_SECONDARY' group by user_attribute_01; --no data
select user_attribute_01, count(*)  from wdt_multi_source where system_load_process = 'POST_SECONDARY' group by user_attribute_01; --no data
select user_attribute_01, count(*)  from wdt_person where system_load_process = 'POST_SECONDARY' group by user_attribute_01; --no data
select user_attribute_01, count(*)  from wdt_post_secondary_school where system_load_process = 'POST_SECONDARY' group by user_attribute_01; --no data
select mif_value_vc, count(*)  from wft_post_secondary_school; --1 CCCS dummy record

/* Prospective Student Star */
select user_attribute_01, count(*) from wdt_calendar_date where system_load_process = 'PROSPECTIVE_STUDENT' group by user_attribute_01; --not mepped, not supposed to be methinks
select user_attribute_01, count(*) from wdt_demographic where system_load_process = 'PROSPECTIVE_STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_geographic_region  where system_load_process = 'PROSPECTIVE_STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_institution where system_load_process = 'PROSPECTIVE_STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_multi_source  where system_load_process = 'PROSPECTIVE_STUDENT' group by user_attribute_01; --no nulls (no data)
select user_attribute_01, count(*) from wdt_person where  system_load_process = 'PROSPECTIVE_STUDENT' and to_char(system_load_tmstmp,'YYYYMMDD') >= '20140731' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_secondary_school where  system_load_process = 'PROSPECTIVE_STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_street_address where  system_load_process = 'PROSPECTIVE_STUDENT' group by user_attribute_01; --has nulls with old loads (February), everything loaded today is fine
select mif_value_vc, count(*) from wft_prospective_student group by mif_value_vc; --no nulls

/* Student Cohort Star */ /**** NEED TO RE-RUN AND CHECK ACADEMIC TIME !! - scheduled for 6pm tonight ***/
select user_attribute_01, count(*)  from wdt_multi_source where system_load_process = 'STUDENT_COHORT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*)  from wdt_academic_time where system_load_process = 'STUDENT_COHORT' group by user_attribute_01; --all good, had to re-deploy mapping
select * from wdt_academic_time where user_attribute_01 = 'No Data'; --look at this later, wtf? 10/2/2015
select user_attribute_01, count(*)  from wdt_person where system_load_process = 'STUDENT_COHORT' and to_char(system_load_tmstmp,'YYYYMMDD') >= '20140731' group by user_attribute_01; --no nulls
select user_attribute_01, count(*)  from wdt_demographic where system_load_process = 'STUDENT_COHORT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*)  from wdt_cohort where system_load_process = 'STUDENT_COHORT' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_student_cohort group by mif_value_vc; --no nulls, 1 dummy row, which is fine

/* Student Activity Star */
select user_attribute_01, count(*)  from wdt_multi_source where system_load_process = 'STUDENT_ACTIVITY' group by user_attribute_01; --no nulls
select user_attribute_01, count(*)  from wdt_academic_time where system_load_process = 'STUDENT_ACTIVITY' group by user_attribute_01; --the nulls are from a bad first try, this is fine
select user_attribute_01, count(*)  from wdt_person where system_load_process = 'STUDENT_ACTIVITY'  and to_char(system_load_tmstmp,'YYYYMMDD') >= '20140731' group by user_attribute_01; --no nulls
select user_attribute_01, count(*)  from wdt_activity where system_load_process = 'STUDENT_ACTIVITY' group by user_attribute_01; --no nulls
select user_attribute_01, count(*)  from wdt_demographic where system_load_process = 'STUDENT_ACTIVITY' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_student_activity group by mif_value_vc; --1 dummy CCCS, all good

/* Hold Star */
select user_attribute_01, count(*) from wdt_calendar_date where system_load_process = 'HOLD' group by user_attribute_01; --not a mepped mapping
select user_attribute_01, count(*) from wdt_demographic  where system_load_process = 'HOLD' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_hold  where system_load_process = 'HOLD' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_multi_source  where system_load_process = 'HOLD' group by user_attribute_01; --no data
select user_attribute_01, count(*) from wdt_person  where system_load_process = 'HOLD'  group by user_attribute_01; --no nulls for new load
select mif_value_vc, count(*) from wft_hold group by mif_value_vc; --no nulls, 1 dummy row - all good

/* Test Star */
select user_attribute_01, count(*) from wdt_calendar_date where system_load_process = 'TEST'  group by user_attribute_01; --not a mepped mapping
select user_attribute_01, count(*) from wdt_demographic  where system_load_process = 'TEST'  group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_multi_source  where system_load_process = 'TEST'  group by user_attribute_01; --no data
select user_attribute_01, count(*) from wdt_person  where system_load_process = 'TEST'  group by user_attribute_01; --no nulls for new load
select user_attribute_01, count(*) from wdt_test  where system_load_process = 'TEST'  group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_test group by mif_value_vc; --no nulls, 1 dummy row, all good

/* Student Attribute Star */
select user_attribute_01, count(*) from wdt_multi_source  where system_load_process = 'STUDENT_ATTRIBUTE'  group by user_attribute_01; --no data
select user_attribute_01, count(*) from wdt_academic_time where system_load_process = 'STUDENT_ATTRIBUTE'  group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_person  where system_load_process = 'STUDENT_ATTRIBUTE'  group by user_attribute_01; --no nulls for new data
select user_attribute_01, count(*) from wdt_demographic  where system_load_process = 'STUDENT_ATTRIBUTE'  group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_attribute  where system_load_process = 'STUDENT_ATTRIBUTE'  group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_student_attribute group by mif_value_vc; --no nulls, 1 dummy row, all good

/* Advisor Star */
select user_attribute_01, count(*) from wdt_multi_source  where system_load_process = 'ADVISOR' group by user_attribute_01; --no data
select  user_attribute_01, count(*) from wdt_academic_time where system_load_process = 'ADVISOR' group by user_attribute_01; --no data - is this ok??
select user_attribute_01, count(*) from wdt_person  where system_load_process = 'ADVISOR' group by user_attribute_01; --no nulls for new data
select user_attribute_01, count(*) from wdt_demographic  where system_load_process = 'ADVISOR' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_advisor where system_load_process = 'ADVISOR' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_advisor group by mif_value_vc; --no nulls, 1 dummy row, all good

/* Finaid Application star */
select user_attribute_01, count(*) from wdt_financial_aid_period  where system_load_process = 'FINAID_APPLICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_year  where system_load_process = 'FINAID_APPLICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_budget_grp  where system_load_process = 'FINAID_APPLICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_calendar_date where system_load_process = 'FINAID_APPLICATION' group by user_attribute_01; --not a mmepped mapping
select user_attribute_01, count(*) from wdt_demographic  where system_load_process = 'FINAID_APPLICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_status  where system_load_process = 'FINAID_APPLICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_multi_source  where system_load_process = 'FINAID_APPLICATION' group by user_attribute_01;  --no data
select user_attribute_01, count(*) from wdt_person  where system_load_process = 'FINAID_APPLICATION' group by user_attribute_01; --no nulls for new data
select user_attribute_01, count(*) from wdt_financial_aid_package_grp where system_load_process = 'FINAID_APPLICATION' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_finaid_application group by mif_value_vc; --no nulls, 1 dummy row, all good

/* Grade Change Star */
select user_attribute_01, count(*) from wdt_multi_source  where system_load_process = 'GRADE_CHANGE' group by user_attribute_01;--no nulls
select user_attribute_01, count(*) from wdt_academic_time where system_load_process = 'GRADE_CHANGE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_sub_academic_period where system_load_process = 'GRADE_CHANGE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_demographic  where system_load_process = 'GRADE_CHANGE' group by user_attribute_01;  --no nulls
select user_attribute_01, count(*) from wdt_person  where system_load_process = 'GRADE_CHANGE' group by user_attribute_01; --no nulls in new load
select user_attribute_01, count(*) from wdt_grade_change  where system_load_process = 'GRADE_CHANGE' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_grade_change group by mif_value_vc; --no nulls, 1 dummy row, all good

/* Meeting Time Star */
select user_attribute_01, count(*)  from wdt_multi_source  where system_load_process = 'MEETING_TIME' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*)  from wdt_academic_time where system_load_process = 'MEETING_TIME' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*)  from wdt_course where system_load_process = 'MEETING_TIME' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*)  from wdt_course_reference_number where system_load_process = 'MEETING_TIME' group by user_attribute_01; --no nulls
select user_attribute_01, count(*)  from wdt_meeting where system_load_process = 'MEETING_TIME' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*)  from wdt_meeting_time where system_load_process = 'MEETING_TIME' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*) from wdt_sub_academic_period where system_load_process = 'MEETING_TIME' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*)  from wdt_meeting_location where system_load_process = 'MEETING_TIME' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_meeting_time group by mif_value_vc; --no nulls, 1 dummy CCCS row, all good

/* Course Instructor Star */
select  user_attribute_01, count(*) from wdt_academic_time where system_load_process = 'COURSE_INSTRUCTOR' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*) from wdt_course_reference_number where system_load_process = 'COURSE_INSTRUCTOR' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*) from wdt_instructor where system_load_process = 'COURSE_INSTRUCTOR' group by user_attribute_01; --no nulls
select user_attribute_01, count(*)  from wdt_multi_source  where system_load_process = 'COURSE_INSTRUCTOR' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*) from wdt_person where system_load_process = 'COURSE_INSTRUCTOR' group by user_attribute_01; --a few nulls, all from old loads
select mif_value_vc, count(*) from wft_course_instructor group by mif_value_vc; --no nulls, 1 dummy CCCS row, all good

/* Course Section Star */
select user_attribute_01, count(*)  from wdt_multi_source  where system_load_process = 'COURSE_SECTION' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*)   from wdt_academic_time where system_load_process = 'COURSE_SECTION' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*)  from wdt_sub_academic_period where system_load_process = 'COURSE_SECTION' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*)   from wdt_course where system_load_process = 'COURSE_SECTION' group by user_attribute_01;  --no nulls
select  user_attribute_01, count(*)   from wdt_course_section where system_load_process = 'COURSE_SECTION' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*)  from wdt_course_reference_number where system_load_process = 'COURSE_SECTION' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_course_section group by mif_value_vc; --no nulls

/* Student Star */
select user_attribute_01, count(*) from wdt_multi_source  where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_academic_time where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls in new mapping
  select distinct system_load_tmstmp from wdt_academic_time where system_load_process = 'STUDENT' and user_attribute_01 = 'No Data';
select user_attribute_01, count(*) from wdt_retention_time where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_year  where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_demographic  where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_geographic_region where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_postal  where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_street_address where system_load_process = 'STUDENT' group by user_attribute_01; --only nulls are old loads
  select distinct system_load_tmstmp from  wdt_street_address where system_load_process = 'STUDENT' and user_attribute_01 = 'No Data'; --all old ones
select user_attribute_01, count(*) from wdt_pre_student_status where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_status where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_student where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_enrollment_status where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_student_performance where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_student_status where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_retention where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_academic_study where system_load_process = 'STUDENT' group by user_attribute_01; --no nulls
select  user_attribute_01, count(*) from wdt_person where system_load_process = 'STUDENT' group by user_attribute_01; --a few nulls, all from old loads
  select distinct system_load_tmstmp from wdt_person where system_load_process = 'STUDENT' and user_attribute_01 = 'No Data'; 
select user_attribute_01, count(*) from wdt_calendar_date where system_load_process = 'STUDENT' group by user_attribute_01; --non mepped mapping
select mif_value_vc, count(*) from wft_student group by mif_value_vc; --no nulls

/* Banner Communication Star */
select user_attribute_01, count(*) from wdt_academic_time where system_load_process = 'BANNER_COMMUNICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_calendar_date where system_load_process = 'BANNER_COMMUNICATION' group by user_attribute_01; --this mapping is not mepped
select user_attribute_01, count(*) from wdt_demographic  where system_load_process = 'BANNER_COMMUNICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_multi_source  where system_load_process = 'BANNER_COMMUNICATION' group by user_attribute_01; --no data
select user_attribute_01, count(*) from wdt_person where system_load_process = 'BANNER_COMMUNICATION' group by user_attribute_01; --a few nulls, all from old loads
select user_attribute_01, count(*) from wdt_banner_communication where system_load_process = 'BANNER_COMMUNICATION' group by user_attribute_01;  --no nulls
select mif_value_vc, count(*) from wft_banner_communication group by mif_value_vc; --no nulls, 1 dummy row, all good

/* Retention Multi Year Star */
select user_attribute_01, count(*) from wdt_student_level where system_load_process = 'RETENTION_MULTI_YEAR' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_retention_multi_year where system_load_process = 'RETENTION_MULTI_YEAR' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_graduation_multi_year where system_load_process = 'RETENTION_MULTI_YEAR' group by user_attribute_01; --no null
select mif_value_vc, count(*) from wft_retention_multi_year group by mif_value_vc; --no nulls

/* Student Course Attribute Star */
select user_attribute_01, count(*) from wdt_academic_time where system_load_process = 'STUDENT_COURSE_ATTRIBUTE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_course where system_load_process = 'STUDENT_COURSE_ATTRIBUTE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_course_reference_number where system_load_process = 'STUDENT_COURSE_ATTRIBUTE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_multi_source where system_load_process = 'STUDENT_COURSE_ATTRIBUTE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_course_attribute where system_load_process = 'STUDENT_COURSE_ATTRIBUTE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_person where system_load_process = 'STUDENT_COURSE_ATTRIBUTE' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_student_course_attribute group by mif_value_vc;--no nulls





/* Admissions Application Star */
select user_attribute_01, count(*) from wdt_academic_study where system_load_process ='ADMISSIONS_APPLICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_academic_time where system_load_process = 'ADMISSIONS_APPLICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_calendar_date where system_load_process = 'ADMISSIONS_APPLICATION' group by user_attribute_01; --not mepped
select user_attribute_01, count(*) from wdt_demographic  where system_load_process = 'ADMISSIONS_APPLICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_status  where system_load_process = 'ADMISSIONS_APPLICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_year where system_load_process = 'ADMISSIONS_APPLICATION' group by user_attribute_01;  --no nulls
select user_attribute_01, count(*) from wdt_multi_source  where system_load_process = 'ADMISSIONS_APPLICATION' group by user_attribute_01; --no data
select user_attribute_01, count(*) from wdt_person where system_load_process = 'ADMISSIONS_APPLICATION' group by user_attribute_01; --a few nulls, all from old loads
select user_attribute_01, count(*) from wdt_postal  where system_load_process = 'ADMISSIONS_APPLICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_pre_student_status  where system_load_process = 'ADMISSIONS_APPLICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_sequence where system_load_process = 'ADMISSIONS_APPLICATION' group by user_attribute_01; --not mepped, n/a
select user_attribute_01, count(*) from wdt_student  where system_load_process = 'ADMISSIONS_APPLICATION' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_application_supl_data  where system_load_process = 'ADMISSIONS_APPLICATION' group by user_attribute_01;  --no nulls
select user_attribute_01, count(*) from wdt_application_supl_ind  where system_load_process = 'ADMISSIONS_APPLICATION' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_admissions_application group by mif_value_vc; --no nulls, all good

/* Financial Aid Award Period Star */
select user_attribute_01, count(*) from wdt_academic_time where system_load_process = 'FINAID_AWARD_ACADPD' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_year  where system_load_process = 'FINAID_AWARD_ACADPD' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_demographic  where system_load_process = 'FINAID_AWARD_ACADPD' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_fund  where system_load_process = 'FINAID_AWARD_ACADPD' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_fund_status  where system_load_process = 'FINAID_AWARD_ACADPD' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_status  where system_load_process = 'FINAID_AWARD_ACADPD' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_multi_source  where system_load_process = 'FINAID_AWARD_ACADPD' group by user_attribute_01; --no data
select user_attribute_01, count(*) from wdt_person where system_load_process = 'FINAID_AWARD_ACADPD' group by user_attribute_01; --a few nulls, all from old loads
select mif_value_vc, count(*) from wft_finaid_award_acad_period group by mif_value_vc; --no nulls, all good

/* Financial Aid Award Aid Year Star */
select user_attribute_01, count(*) from wdt_financial_aid_year where system_load_process = 'FINAID_AWARD_AIDYEAR' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_demographic  where system_load_process = 'FINAID_AWARD_AIDYEAR' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_fund  where system_load_process = 'FINAID_AWARD_AIDYEAR' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_fund_status  where system_load_process = 'FINAID_AWARD_AIDYEAR' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_financial_aid_status  where system_load_process = 'FINAID_AWARD_AIDYEAR' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_multi_source  where system_load_process = 'FINAID_AWARD_AIDYEAR' group by user_attribute_01; --no data
select user_attribute_01, count(*) from wdt_person where system_load_process = 'FINAID_AWARD_AIDYEAR' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_finaid_award_aid_year group by mif_value_vc; --all good

/* Academic Outcome Star */
select user_attribute_01, count(*) from wdt_academic_outcome where system_load_process = 'ACADEMIC_OUTCOME' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_academic_study where system_load_process = 'ACADEMIC_OUTCOME' group by user_attribute_01; --no nulls 
select user_attribute_01, count(*) from wdt_academic_time where system_load_process = 'ACADEMIC_OUTCOME' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_demographic where system_load_process = 'ACADEMIC_OUTCOME' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_multi_source where system_load_process = 'ACADEMIC_OUTCOME' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_person where system_load_process = 'ACADEMIC_OUTCOME' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_calendar_date where system_load_process = 'ACADEMIC_OUTCOME' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_academic_outcome group by mif_value_vc;

/* Student Course Star */
select user_attribute_01, count(*) from wdt_course where system_load_process = 'STUDENT_COURSE' group by user_attribute_01; --NO NULLS
select user_attribute_01, count(*) from wdt_course_reference_number where system_load_process = 'STUDENT_COURSE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_course_section where system_load_process = 'STUDENT_COURSE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_demographic where system_load_process = 'STUDENT_COURSE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_grade_change where system_load_process = 'STUDENT_COURSE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_instructor where system_load_process = 'STUDENT_COURSE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_multi_source where system_load_process = 'STUDENT_COURSE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_person where system_load_process = 'STUDENT_COURSE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_registration where system_load_process = 'STUDENT_COURSE' group by user_attribute_01; --no nulls
select user_attribute_01, count(*) from wdt_sub_academic_period where system_load_process = 'STUDENT_COURSE' group by user_attribute_01; --no nulls
select mif_value_vc, count(*) from wft_student_course group by mif_value_vc; --no nulls

/* Financeial Aid Aggregate Star -- needs work */
select count(*) from wat_admissions_finaid_record;

/* Student Progress Aggregate Insert */
select mif_value_vc, count(*) from wat_student_progress group by mif_value_vc; --no nulls

/* Student Engagement Aggregate Insert */
select mif_value_vc, count(*) from wat_student_engagement group by mif_value_vc; --no nulls