create or replace function f_get_edw_key
(p_string varchar2, p_value number)
return varchar2
as
return_field := varchar2(100);
CASE
WHEN upper(p_string) = 'MULTI_SOURCE_KEY' THEN 
  (SELECT multi_source from wdt_multi_source where multi_source_key = p_value)
WHEN upper(p_string) = 'ACADEMIC_TIME_KEY' THEN
  (SELECT academic_period from wdt_academic_time where academic_time_key = p_value)
WHEN upper(p_string) = 'RETENTION_TIME_KEY' THEN
  (SELECT academic_period from wdt_retention_time where retention_time_key = p_value)
WHEN upper(p_string) = 'FINANCIAL_AID_YEAR_KEY' THEN
  (SELECT financial_aid_year from wdt_financial_aid_year where financial_aid_year_key = p_value)
WHEN upper(p_string) = 'PERSON_UID' THEN
  (SELECT banner_pidm from wdt_warehouse_entity where warehouse_entity_uid = person_uid)
WHEN upper(p_string) = 'DEMOGRAPHIC_KEY' THEN
  (SELECT * from wdt_demographic
--RACE_GROUP_KEY
--GEOGRAPHIC_REGION_KEY
--POSTAL_KEY
--STREET_LINE_KEY
--APPLICATION_POSTAL_KEY
--PRE_STUDENT_STATUS_KEY
--FINANCIAL_AID_STATUS_KEY
--STUDENT_KEY
--ENROLLMENT_STATUS_KEY
--STUDENT_PERFORMANCE_KEY
--STUDENT_STATUS_KEY
--RETENTION_LIKE_KEY
--RETENTION_SEQUENTIAL_KEY
--RETENTION_MULTI_YEAR_KEY
--GRADUATION_MULTI_YEAR_KEY
--ACADEMIC_STUDY_KEY
--ACADEMIC_STUDY_START_KEY
--ACADEMIC_OUTCOME_GROUP_KEY
--ACADEMIC_OUTCOME_ROLL_KEY
--ACADEMIC_OUTCOME_ACADSTUDY_KEY
--STUDENT_COURSE_GROUP_KEY
--STUDENT_COHORT_GROUP_KEY
--ADVISOR_GROUP_KEY
--STUDENT_ACTIVITY_GROUP_KEY
--ATHLETIC_GROUP_KEY
--STUDENT_ATTRIBUTE_GROUP_KEY
--BANNER_COMMUNICATION_GROUP_KEY
--CONTACT_GROUP_KEY
--HOLD_GROUP_KEY
--TEST_GROUP_KEY
--SS_INSTITUTION_KEY
--SS_POSTAL_KEY
--SS_GEOGRAPHIC_REGION_KEY
--SS_STREET_LINE_KEY
--SECONDARY_SCHOOL_KEY
--SS_SUBJECT_GROUP_KEY
--POST_SECONDARY_SCHOOL_GRP_KEY
--ACADEMIC_PERIOD_FRSTATTEND_KEY
--ACADEMIC_PERIOD_LASTATTEND_KEY
--ACADEMIC_PERIOD_ADMIT_KEY
--FEEDBACK_GROUP_KEY
--TEST_ACT_COMPOSITE_HIGHEST_KEY
--TEST_ACT_COMPOSITE_HIGH_SCORE
--TEST_SAT_COMBINED_HIGHEST_KEY
--TEST_SAT_COMBINED_HIGH_SCORE
--TEST_WRITING_HIGHEST_KEY
--TEST_WRITING_HIGH_SCORE
--TEST_MATH_HIGHEST_KEY
--TEST_MATH_HIGH_SCORE
--TEST_VERBAL_HIGHEST_KEY
--TEST_VERBAL_HIGH_SCORE
--TEST_LANGUAGE_HIGHEST_KEY
--TEST_LANGUAGE_HIGH_SCORE
--TEST_PLACEMENT1_HIGHEST_KEY
--TEST_PLACEMENT1_HIGH_SCORE
--TEST_PLACEMENT2_HIGHEST_KEY
--TEST_PLACEMENT2_HIGH_SCORE
--TEST_GRADUATE1_HIGHEST_KEY
--TEST_GRADUATE1_HIGH_SCORE
--TEST_GRADUATE2_HIGHEST_KEY
--TEST_GRADUATE2_HIGH_SCORE
--TEST_IELTS_HIGHEST_KEY
--TEST_IELTS_HIGH_SCORE
--TEST_TOEFL_HIGHEST_KEY
--FIRST_BANNER_COMMUNICATION_KEY
--LAST_BANNER_COMMUNICATION_KEY
--FIRST_CONTACT_KEY
--LAST_CONTACT_KEY
--LAST_FEEDBACK_ACAD_TIME_KEY
return return_field;
end;
