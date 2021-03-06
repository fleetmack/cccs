select 'ALTER TABLE EDWSTG.'||TABLE_NAME||' NOLOGGING;'
  from dba_tables
 where owner = 'EDWSTG'
 and (table_name like '%INPUT' OR TABLE_NAME LIKE '%CLEAN' OR TABLE_NAME LIKE '%WKEYS')
 
UNION ALL

select 'ALTER TABLE EDWMGR.'||TABLE_NAME||' NOLOGGING;'
  from dba_tables
 where owner = 'EDWMGR'
 and (table_name like 'WFT%');
 


ALTER TABLE EDWSTG.WTT_INTERACTION_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_INTERACTION_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_INTERACTION_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_EM_CAMPAIGN_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_EM_CAMPAIGN_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_EM_CAMPAIGN_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_COMMUNICATION_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_COMMUNICATION_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_COMMUNICATION_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_COURSE_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_COURSE_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_COURSE_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_SEC_SCHL_SUBJECT_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_SEC_SCHL_SUBJECT_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_SEC_SCHL_SUBJECT_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECRUITMENT_COHORT_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECRUITMENT_COHORT_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECRUITMENT_COHORT_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECRUITING_ADMISSION_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECRUITING_ADMISSION_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECRUITING_ADMISSION_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECRUIT_ATTRIBUTE_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECRUIT_ATTRIBUTE_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECRUIT_ATTRIBUTE_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECEIVABLE_REVENUE_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECEIVABLE_REVENUE_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECEIVABLE_REVENUE_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECEIVABLE_CUSTOMER_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECEIVABLE_CUSTOMER_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_RECEIVABLE_CUSTOMER_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_POST_SECONDARY_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_POST_SECONDARY_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_POST_SECONDARY_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_OPERATING_LEDGER_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_OPERATING_LEDGER_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_OPERATING_LEDGER_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_GRANT_AND_PROJECT_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_GRANT_AND_PROJECT_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_GRANT_AND_PROJECT_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_GRADUATION_COMPLETE_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_GRADUATION_COMPLETE_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_GRADUATION_COMPLETE_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_GENERAL_LEDGER_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_GENERAL_LEDGER_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_GENERAL_LEDGER_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_STUDENT_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_STUDENT_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_STUDENT_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_PRE_STUDENT_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_PRE_STUDENT_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_PRE_STUDENT_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_FEEDBACK_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_FEEDBACK_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_FEEDBACK_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_ENROLLMENT_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_ENROLLMENT_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_ENROLLMENT_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_EMPLOYMENT_APPL_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_EMPLOYMENT_APPL_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_EMPLOYMENT_APPL_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_EMPLOYEE_POSITION_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_EMPLOYEE_POSITION_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_EMPLOYEE_POSITION_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_EMPLOYEE_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_EMPLOYEE_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_EMPLOYEE_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_EMPLOYEE_DEGREE_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_EMPLOYEE_DEGREE_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_EMPLOYEE_DEGREE_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_DIM_INDICATOR_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_DIM_INDICATOR_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_DIM_CALENDAR_DATE_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_DIM_CALENDAR_DATE_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_COURSE_REGISTRATION_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_COURSE_REGISTRATION_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_COURSE_REGISTRATION_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_CMB_ADMS_SOURCE_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_CMB_ADMS_SOURCE_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_CMB_ADMS_SOURCE_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPLICATION_RATING_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPLICATION_RATING_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPLICATION_RATING_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPLICATION_DECISION_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPLICATION_DECISION_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPLICATION_DECISION_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPLICATION_COHORT_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPLICATION_COHORT_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPLICATION_COHORT_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPL_REQUIREMENT_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPL_REQUIREMENT_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPL_REQUIREMENT_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADVANCEMENT_GIFT_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADVANCEMENT_GIFT_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADVANCEMENT_GIFT_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADMISSIONS_RECR_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADMISSIONS_RECR_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADMISSIONS_RECR_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADMINISTRATOR_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADMINISTRATOR_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADMINISTRATOR_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_ACADEMIC_OUTCOME_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_ACADEMIC_OUTCOME_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_ACADEMIC_OUTCOME_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_ACAD_PROG_COURSE_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_ACAD_PROG_COURSE_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_ACAD_PROG_COURSE_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_AWARD_ACADPD_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_ATTRIBUTE_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADVISOR_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_COURSE_ATTR_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_AWARD_AIDYEAR_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADVISOR_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_ATHLETIC_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_COURSE_INSTRUCTOR_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_RETENTION_MULTI_YEAR_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_ATTRIBUTE_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_APPLICATION_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_BANNER_COMMUNICATION_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_BANNER_COMMUNICATION_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_GRADE_CHANGE_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_INSTITUTION_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_COHORT_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_ATTRIBUTE_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_AWARD_AIDYEAR_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_TEST_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_COURSE_INSTRUCTOR_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_MEETING_TIME_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_RACE_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_COHORT_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_HOLD_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_ACTIVITY_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPL_ATTRIBUTE_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_CONTACT_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_CONTACT_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_INSTITUTION_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_COURSE_SECTION_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_AWARD_ACADPD_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_PROSP_STUDENT_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_COURSE_ATTR_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_COURSE_SECTION_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_ACADEMIC_OUTCOME_HNR_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_RETENTION_MULTI_YEAR_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_ATHLETIC_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPL_ATTRIBUTE_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADVISOR_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADMISSIONS_APPL_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_COURSE_SECTION_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_GRADE_CHANGE_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADMISSIONS_APPL_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_HOLD_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_MEETING_TIME_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_PROSP_STUDENT_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_MEETING_TIME_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_RETENTION_MULTI_YEAR_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_INTEREST_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_GRADE_CHANGE_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_AWARD_AIDYEAR_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_ACTIVITY_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_ACTIVITY_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_ATHLETIC_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_PROSP_STUDENT_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_RACE_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_APPL_ATTRIBUTE_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_COURSE_INSTRUCTOR_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_COURSE_ATTR_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_TEST_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_INTEREST_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_STUDENT_COHORT_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_AWARD_ACADPD_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_BANNER_COMMUNICATION_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_HOLD_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_RACE_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_INSTITUTION_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_APPLICATION_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_INTEREST_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_ACADEMIC_OUTCOME_HNR_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_TEST_CLEAN NOLOGGING;
ALTER TABLE EDWSTG.WTT_ADMISSIONS_APPL_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_CONTACT_WKEYS NOLOGGING;
ALTER TABLE EDWSTG.WTT_FINAID_APPLICATION_INPUT NOLOGGING;
ALTER TABLE EDWSTG.WTT_ACADEMIC_OUTCOME_HNR_WKEYS NOLOGGING;
ALTER TABLE EDWMGR.WFT_ACADEMIC_OUTCOME NOLOGGING;
ALTER TABLE EDWMGR.WFT_ACADEMIC_OUTCOME_HONOR NOLOGGING;
ALTER TABLE EDWMGR.WFT_ACADEMIC_PROGRAM_COURSE NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADDRESS NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADMINISTRATOR NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADMISSIONS_APPLICATION NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADMISSIONS_RECRUITMENT NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADVANCEMENT_ACTIVITY NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADVANCEMENT_DEGREE NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADVANCEMENT_DEG_CONC NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADVANCEMENT_DEG_DEPT NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADVANCEMENT_DEG_HONR NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADVANCEMENT_DEG_MAJR NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADVANCEMENT_DEG_MINR NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADVANCEMENT_GIFT NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADVISOR NOLOGGING;
ALTER TABLE EDWMGR.WFT_ADV_STUDENT_ACTIVITY NOLOGGING;
ALTER TABLE EDWMGR.WFT_AFFILIATION NOLOGGING;
ALTER TABLE EDWMGR.WFT_APPLICATION_ATTRIBUTE NOLOGGING;
ALTER TABLE EDWMGR.WFT_APPLICATION_COHORT NOLOGGING;
ALTER TABLE EDWMGR.WFT_APPLICATION_DECISION NOLOGGING;
ALTER TABLE EDWMGR.WFT_APPLICATION_RATING NOLOGGING;
ALTER TABLE EDWMGR.WFT_APPLICATION_REQUIREMENT NOLOGGING;
ALTER TABLE EDWMGR.WFT_ASSIGNMENT NOLOGGING;
ALTER TABLE EDWMGR.WFT_ATHLETIC NOLOGGING;
ALTER TABLE EDWMGR.WFT_AWARD_HONOR NOLOGGING;
ALTER TABLE EDWMGR.WFT_COMBINED_ADMISSIONS_RECORD NOLOGGING;
ALTER TABLE EDWMGR.WFT_COMBINED_ADMISSIONS_SOURCE NOLOGGING;
ALTER TABLE EDWMGR.WFT_COMBINED_ATTRIBUTE NOLOGGING;
ALTER TABLE EDWMGR.WFT_COMBINED_COHORT NOLOGGING;
ALTER TABLE EDWMGR.WFT_COMMITTEE NOLOGGING;
ALTER TABLE EDWMGR.WFT_COMMUNICATION NOLOGGING;
ALTER TABLE EDWMGR.WFT_CONSTITUENT_EMPLOYMENT NOLOGGING;
ALTER TABLE EDWMGR.WFT_CONSTITUENT_ENTITY NOLOGGING;
ALTER TABLE EDWMGR.WFT_CONSTITUENT_ENTITY_TYPE NOLOGGING;
ALTER TABLE EDWMGR.WFT_CONSTITUENT_EVALUATION NOLOGGING;
ALTER TABLE EDWMGR.WFT_CONSTITUENT_INTEREST NOLOGGING;
ALTER TABLE EDWMGR.WFT_CONSTITUENT_PROFILE NOLOGGING;
ALTER TABLE EDWMGR.WFT_CONTACT NOLOGGING;
ALTER TABLE EDWMGR.WFT_CONTACT_REPORT NOLOGGING;
ALTER TABLE EDWMGR.WFT_CONTACT_REPORT_CREDIT NOLOGGING;
ALTER TABLE EDWMGR.WFT_COURSE_INSTRUCTOR NOLOGGING;
ALTER TABLE EDWMGR.WFT_COURSE_REGISTRATION NOLOGGING;
ALTER TABLE EDWMGR.WFT_COURSE_SECTION NOLOGGING;
ALTER TABLE EDWMGR.WFT_DESIGNATION_ATTRIBUTE NOLOGGING;
ALTER TABLE EDWMGR.WFT_EMAIL NOLOGGING;
ALTER TABLE EDWMGR.WFT_EMPLOYEE NOLOGGING;
ALTER TABLE EDWMGR.WFT_EMPLOYEE_DEGREE NOLOGGING;
ALTER TABLE EDWMGR.WFT_EMPLOYEE_POSITION NOLOGGING;
ALTER TABLE EDWMGR.WFT_EMPLOYMENT_APPLICATION NOLOGGING;
ALTER TABLE EDWMGR.WFT_EM_CAMPAIGN NOLOGGING;
ALTER TABLE EDWMGR.WFT_ENROLLMENT NOLOGGING;
ALTER TABLE EDWMGR.WFT_EXCLUSION NOLOGGING;
ALTER TABLE EDWMGR.WFT_FEEDBACK NOLOGGING;
ALTER TABLE EDWMGR.WFT_FINAID_APPLICATION NOLOGGING;
ALTER TABLE EDWMGR.WFT_FINAID_AWARD_ACAD_PERIOD NOLOGGING;
ALTER TABLE EDWMGR.WFT_FINAID_AWARD_AID_YEAR NOLOGGING;
ALTER TABLE EDWMGR.WFT_FINANCIAL_AID_PRE_STUDENT NOLOGGING;
ALTER TABLE EDWMGR.WFT_FINANCIAL_AID_STUDENT NOLOGGING;
ALTER TABLE EDWMGR.WFT_GENERAL_LEDGER NOLOGGING;
ALTER TABLE EDWMGR.WFT_GEOGRAPHIC_REGION NOLOGGING;
ALTER TABLE EDWMGR.WFT_GIFT NOLOGGING;
ALTER TABLE EDWMGR.WFT_GIFT_SOCIETY NOLOGGING;
ALTER TABLE EDWMGR.WFT_GIFT_SOCIETY_PREMIUM NOLOGGING;
ALTER TABLE EDWMGR.WFT_GIVING_CODE NOLOGGING;
ALTER TABLE EDWMGR.WFT_GRADE_CHANGE NOLOGGING;
ALTER TABLE EDWMGR.WFT_GRADUATION_COMPLETION NOLOGGING;
ALTER TABLE EDWMGR.WFT_GRANT_AND_PROJECT NOLOGGING;
ALTER TABLE EDWMGR.WFT_HOLD NOLOGGING;
ALTER TABLE EDWMGR.WFT_INSTITUTION NOLOGGING;
ALTER TABLE EDWMGR.WFT_INTERACTION NOLOGGING;
ALTER TABLE EDWMGR.WFT_MAILING_HISTORY NOLOGGING;
ALTER TABLE EDWMGR.WFT_MAILING_LIST NOLOGGING;
ALTER TABLE EDWMGR.WFT_MAIL_TRACKING NOLOGGING;
ALTER TABLE EDWMGR.WFT_MATCHING_CLAIM NOLOGGING;
ALTER TABLE EDWMGR.WFT_MEETING_TIME NOLOGGING;
ALTER TABLE EDWMGR.WFT_MEMBERSHIP NOLOGGING;
ALTER TABLE EDWMGR.WFT_MEMBERSHIP_CLUB NOLOGGING;
ALTER TABLE EDWMGR.WFT_MEMBERSHIP_INTEREST NOLOGGING;
ALTER TABLE EDWMGR.WFT_OPERATING_LEDGER NOLOGGING;
ALTER TABLE EDWMGR.WFT_PHONE NOLOGGING;
ALTER TABLE EDWMGR.WFT_PLEDGE NOLOGGING;
ALTER TABLE EDWMGR.WFT_POST_SECONDARY_SCHOOL NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROGRAM_PROSPECT NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROGRAM_PROSPECT_STAGE NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROPOSAL NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROPOSAL_PROJECT_RESULT NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROPOSAL_PURPOSE NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROPOSAL_PURPOSE_RESULT NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROPOSAL_PURPOSE_STAGE NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROPOSAL_STAGE NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROSPECT NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROSPECTIVE_STUDENT NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROSPECT_CATEGORY NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROSPECT_ENTITY NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROSPECT_INTEREST NOLOGGING;
ALTER TABLE EDWMGR.WFT_PROSPECT_STAGE NOLOGGING;
ALTER TABLE EDWMGR.WFT_RECEIVABLE_CUSTOMER NOLOGGING;
ALTER TABLE EDWMGR.WFT_RECEIVABLE_REVENUE NOLOGGING;
ALTER TABLE EDWMGR.WFT_RECRUITING_AND_ADMISSION NOLOGGING;
ALTER TABLE EDWMGR.WFT_RECRUITMENT_ATTRIBUTE NOLOGGING;
ALTER TABLE EDWMGR.WFT_RECRUITMENT_COHORT NOLOGGING;
ALTER TABLE EDWMGR.WFT_RELATIONSHIP NOLOGGING;
ALTER TABLE EDWMGR.WFT_SECONDARY_SCHOOL_SUBJECT NOLOGGING;
ALTER TABLE EDWMGR.WFT_SPECIAL_PURPOSE NOLOGGING;
ALTER TABLE EDWMGR.WFT_SPORT NOLOGGING;
ALTER TABLE EDWMGR.WFT_STAFF NOLOGGING;
ALTER TABLE EDWMGR.WFT_STUDENT_ATTRIBUTE NOLOGGING;
ALTER TABLE EDWMGR.WFT_STUDENT_COURSE NOLOGGING;
ALTER TABLE EDWMGR.WFT_TEST NOLOGGING;
ALTER TABLE EDWMGR.WFT_VARIABLE_PURPOSE NOLOGGING;
ALTER TABLE EDWMGR.WFT_BANNER_COMMUNICATION NOLOGGING;
ALTER TABLE EDWMGR.WFT_INTEREST NOLOGGING;
ALTER TABLE EDWMGR.WFT_RACE NOLOGGING;
ALTER TABLE EDWMGR.WFT_RETENTION_MULTI_YEAR NOLOGGING;
ALTER TABLE EDWMGR.WFT_STUDENT NOLOGGING;
ALTER TABLE EDWMGR.WFT_STUDENT_ACTIVITY NOLOGGING;
ALTER TABLE EDWMGR.WFT_STUDENT_COHORT NOLOGGING;
ALTER TABLE EDWMGR.WFT_STUDENT_COURSE_ATTRIBUTE NOLOGGING;