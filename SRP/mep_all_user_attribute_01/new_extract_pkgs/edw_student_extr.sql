create or replace PACKAGE edw_student_extr IS
--
  TYPE tab_prosp_student_extr IS TABLE OF WTT_PROSP_STUDENT_INPUT%ROWTYPE;
--
  TYPE tab_admissions_source_extr IS TABLE OF WTT_CMB_ADMS_SOURCE_INPUT%ROWTYPE;
--
  TYPE tab_feedback_extr IS TABLE OF WTT_FEEDBACK_INPUT%ROWTYPE;
--
  TYPE tab_course_instructor_extr IS TABLE OF WTT_COURSE_INSTRUCTOR_INPUT%ROWTYPE;
--
  TYPE tab_admissions_appl_extr IS TABLE OF WTT_ADMISSIONS_APPL_INPUT%ROWTYPE;
--
  TYPE tab_test_extr IS TABLE OF WTT_TEST_INPUT%ROWTYPE;
--
  TYPE tab_interest_extr IS TABLE OF WTT_INTEREST_INPUT%ROWTYPE;
--
  TYPE tab_post_secondary_extr IS TABLE OF WTT_POST_SECONDARY_INPUT%ROWTYPE;
--
  TYPE tab_adms_appl_dec_extr IS TABLE OF WTT_APPLICATION_DECISION_INPUT%ROWTYPE;
--
  TYPE tab_adms_appl_rating_extr IS TABLE OF WTT_APPLICATION_RATING_INPUT%ROWTYPE;
--
  TYPE tab_adms_appl_cohort_extr IS TABLE OF WTT_APPLICATION_COHORT_INPUT%ROWTYPE;
--
  TYPE tab_adms_appl_attr_extr IS TABLE OF WTT_APPL_ATTRIBUTE_INPUT%ROWTYPE;
--
  TYPE tab_adms_appl_reqr_extr IS TABLE OF WTT_APPL_REQUIREMENT_INPUT%ROWTYPE;
--
  TYPE tab_admissions_recr_extr IS TABLE OF WTT_ADMISSIONS_RECR_INPUT%ROWTYPE;
--
  TYPE tab_recruit_cohort_extr IS TABLE OF WTT_RECRUITMENT_COHORT_INPUT%ROWTYPE;
--
  TYPE tab_recruit_attr_extr IS TABLE OF WTT_RECRUIT_ATTRIBUTE_INPUT%ROWTYPE;
--
  TYPE tab_contact_extr IS TABLE OF WTT_CONTACT_INPUT%ROWTYPE;
--
  TYPE tab_sec_schl_subj_extr IS TABLE OF WTT_SEC_SCHL_SUBJECT_INPUT%ROWTYPE;
--
  TYPE tab_administrator_extr IS TABLE OF WTT_ADMINISTRATOR_INPUT%ROWTYPE;
--
  TYPE tab_athletic_extr IS TABLE OF WTT_ATHLETIC_INPUT%ROWTYPE;
--
  TYPE tab_student_activity_extr IS TABLE OF WTT_STUDENT_ACTIVITY_INPUT%ROWTYPE;
--
  TYPE tab_student_attribute_extr IS TABLE OF WTT_STUDENT_ATTRIBUTE_INPUT%ROWTYPE;
--
  TYPE tab_advisor_extr IS TABLE OF WTT_ADVISOR_INPUT%ROWTYPE;
--
  TYPE tab_student_cohort_extr IS TABLE OF WTT_STUDENT_COHORT_INPUT%ROWTYPE;
--
  TYPE tab_meeting_time_extr IS TABLE OF WTT_MEETING_TIME_INPUT%ROWTYPE;
--
  TYPE tab_grade_change_extr IS TABLE OF WTT_GRADE_CHANGE_INPUT%ROWTYPE;
--
  TYPE tab_academic_outcome_hnr_extr IS TABLE OF WTT_ACADEMIC_OUTCOME_HNR_INPUT%ROWTYPE;
--
  TYPE tab_course_section_extr IS TABLE OF WTT_COURSE_SECTION_INPUT%ROWTYPE;
--
  TYPE tab_student_course_extr IS TABLE OF WTT_STUDENT_COURSE_INPUT%ROWTYPE;
--
  TYPE tab_student_extr IS TABLE OF WTT_STUDENT_INPUT%ROWTYPE;
--
  TYPE tab_student_course_attrib_extr IS TABLE OF WTT_STUDENT_COURSE_ATTR_INPUT%ROWTYPE;
--
  TYPE tab_acad_outcome_extr IS TABLE OF WTT_ACADEMIC_OUTCOME_INPUT%ROWTYPE;
--
  TYPE tab_retention_multi_year_extr IS TABLE OF WTT_RETENTION_MULTI_YEAR_INPUT%ROWTYPE;
--
  TYPE rec_ret_ind IS RECORD (excluded_ind PLS_INTEGER, overall_ret_ind PLS_INTEGER, overall_not_ret_ind PLS_INTEGER,overall_ret_status VARCHAR2(10),std_lvl_ret_ind PLS_INTEGER,std_lvl_not_ret_ind PLS_INTEGER,std_lvl_ret_status VARCHAR2(10),college_ret_ind PLS_INTEGER,college_not_ret_ind PLS_INTEGER,college_ret_status VARCHAR2(10),program_ret_ind PLS_INTEGER,program_not_ret_ind PLS_INTEGER,program_ret_status VARCHAR2(10));
--
  FUNCTION f_get_prosp_students(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_prosp_student_extr PIPELINED;
--
  FUNCTION f_get_admissions_application(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_admissions_appl_extr PIPELINED;
--
  FUNCTION f_get_feedback( process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_feedback_extr PIPELINED;
--
  FUNCTION f_get_admissions_source( process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_admissions_source_extr PIPELINED;
--
  FUNCTION f_get_course_instructor(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_course_instructor_extr PIPELINED;
--
  FUNCTION f_get_test(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_test_extr PIPELINED;
--
  FUNCTION f_get_interest(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_interest_extr PIPELINED;
--
  FUNCTION f_get_post_secondary(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_post_secondary_extr PIPELINED;
--
  FUNCTION f_get_adms_appl_decision(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_adms_appl_dec_extr PIPELINED;
--
  FUNCTION f_get_adms_appl_rating(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_adms_appl_rating_extr PIPELINED;
--
  FUNCTION f_get_adms_appl_cohort(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_adms_appl_cohort_extr PIPELINED;
--
  FUNCTION f_get_adms_appl_attr(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_adms_appl_attr_extr PIPELINED;
--
  FUNCTION f_get_adms_appl_reqr(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_adms_appl_reqr_extr PIPELINED;
--
  FUNCTION f_get_admissions_recruitment(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_admissions_recr_extr PIPELINED;
--
  FUNCTION f_get_recruit_cohort(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_recruit_cohort_extr PIPELINED;
--
  FUNCTION f_get_recruit_attr(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_recruit_attr_extr PIPELINED;
--
  FUNCTION f_get_contact(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_contact_extr PIPELINED;
--
  FUNCTION f_get_sec_schl_subj(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_sec_schl_subj_extr PIPELINED;
--
  FUNCTION f_get_administrator(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_administrator_extr PIPELINED;
--
  FUNCTION f_get_student_activity(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_student_activity_extr PIPELINED;
--
  FUNCTION f_get_athletic(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_athletic_extr PIPELINED;
--
  FUNCTION f_get_student_attribute(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_student_attribute_extr PIPELINED;
--
  FUNCTION f_get_advisor(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_advisor_extr PIPELINED;
--
  FUNCTION f_get_student_cohort(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_student_cohort_extr PIPELINED;
--
  FUNCTION f_get_meeting_time(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_meeting_time_extr PIPELINED;
--
  FUNCTION f_get_grade_change(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_grade_change_extr PIPELINED;
--
  FUNCTION f_get_academic_outcome_hnr(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_academic_outcome_hnr_extr PIPELINED;
--
  FUNCTION f_get_course_section(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_course_section_extr PIPELINED;
--
 FUNCTION f_get_student_course(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_student_course_extr PIPELINED;
--
 FUNCTION f_get_student_course_attrib(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_student_course_attrib_extr PIPELINED;
----
 PROCEDURE p_get_student(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL, start_id NUMBER, end_id NUMBER,
                                        jobNumber  IN BINARY_INTEGER DEFAULT NULL, jobUser VARCHAR2  DEFAULT NULL);
--
 FUNCTION f_get_acad_outcome(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_acad_outcome_extr PIPELINED ;
--
 FUNCTION f_get_retention_multi_year(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_retention_multi_year_extr PIPELINED;
--
  FUNCTION f_get_ret_ind (person_in NUMBER,acad_period_in VARCHAR2,student_level_in  VARCHAR2, college_in  VARCHAR2,program_in VARCHAR2,multi_source_in varchar2,def_multi_source_in varchar2,acad_year_in varchar2,deceased_date_in date,acad_end_date_in date) RETURN rec_ret_ind;
--
    CURSOR get_sec_school(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER) IS
      SELECT *
        FROM MST_PREVIOUS_EDUCATION
       WHERE PERSON_UID = person_in
         AND SOURCE_FLAG = 'H'
        --BLM and EB CHANGED next line to an OR statement as mst_prev_ed is partially mepped
         AND (NVL(MIF_VALUE, def_multi_source_in) = multi_src_in or mif_value IS NULL)
       ORDER BY ATTEND_TO_DATE DESC, TRANSCRIPT_RECEIVED_DATE DESC;
--
    CURSOR get_stud_classification(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER, academic_period_in VARCHAR2, stud_level_in VARCHAR2) IS
      SELECT MAX(ACADEMIC_PERIOD) max_acad_per, STUDENT_CLASSIFICATION, STUDENT_CLASSIFICATION_DESC
        FROM MST_STUDENT_CLASSIFICATION
       WHERE PERSON_UID = person_in
         AND STUDENT_LEVEL = stud_level_in
         AND ACADEMIC_PERIOD <= academic_period_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
       GROUP BY STUDENT_CLASSIFICATION, STUDENT_CLASSIFICATION_DESC
       ORDER BY MAX_ACAD_PER DESC;
--
    CURSOR get_enrollment(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER, academic_period_in VARCHAR2) IS
      SELECT *
        FROM MST_ENROLLMENT
       WHERE PERSON_UID = person_in
         AND ACADEMIC_PERIOD = academic_period_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
    CURSOR get_tuition_deposited(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER, academic_period_in VARCHAR2) IS
      SELECT 'Y' tuition_deposited_ind
        FROM MTT_AR_DEPOSIT
       WHERE ACCOUNT_UID = person_in
         AND ACADEMIC_PERIOD = academic_period_in
--         AND DEPOSIT_TYPE = 'TUI'
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
    CURSOR get_course_offering(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, course_ref_num_in VARCHAR2, academic_period_in VARCHAR2) IS
      SELECT *
        FROM MST_COURSE_OFFERING
       WHERE ACADEMIC_PERIOD = academic_period_in
         AND COURSE_REFERENCE_NUMBER = course_ref_num_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
--mepped below per 8.3 mep mods
--
CURSOR get_course_catalog(def_multi_source_in VARCHAR2,multi_src_in VARCHAR2, subject_in VARCHAR2, course_number_in VARCHAR2,academic_period_in VARCHAR2) IS
      SELECT *
        FROM MST_COURSE_CATALOG
       WHERE SUBJECT = subject_in
         AND COURSE_NUMBER = course_number_in
         AND academic_period_in BETWEEN ACADEMIC_PERIOD_START AND ACADEMIC_PERIOD_END
         --AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
         AND NVL(MIF_VALUE, def_multi_source_in) = def_multi_source_in;

--
CURSOR get_course_suppl(def_multi_source_in VARCHAR2,multi_src_in VARCHAR2, subject_in VARCHAR2, course_number_in VARCHAR2,academic_period_in VARCHAR2) IS
      SELECT *
        FROM MST_COURSE_SUPPLEMENTAL
       WHERE SUBJECT = subject_in
         AND COURSE_NUMBER = course_number_in
         AND academic_period_in BETWEEN ACADEMIC_PERIOD_START AND ACADEMIC_PERIOD_END
         --mep per 8.3 mep mods
         --AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
         AND NVL(MIF_VALUE, def_multi_source_in) = def_multi_source_in;

--
CURSOR get_instructor(def_multi_source_in VARCHAR2,multi_src_in VARCHAR2, course_reference_number_in VARCHAR2,academic_period_in VARCHAR2, prim_ind_in VARCHAR2) IS
      SELECT X.person_uid instructor_uid,
      NVL(we.warehouse_entity_uid,0)     warehouse_entity_uid,
       DECODE(X.instructor_first_name,
                    NULL, X.instructor_last_name,
                    X.instructor_last_name|| ', ' || X.instructor_first_name) instructor_name
        FROM MST_INSTRUCTIONAL_ASSIGNMENT X, WDT_WAREHOUSE_ENTITY WE
       WHERE
           X.COURSE_REFERENCE_NUMBER = course_reference_number_in
         AND X.ACADEMIC_PERIOD = academic_period_in
         AND X.PRIMARY_IND = prim_ind_in
         --added by BLM 7/29/14 for MEP
         and nvl(we.user_attribute_01, def_multi_source_in) = multi_src_in
         AND NVL(X.MIF_VALUE, def_multi_source_in) = multi_src_in
         AND WE.BANNER_PIDM = X.PERSON_UID;
--
CURSOR get_fact_dept_college(def_multi_source_in VARCHAR2,multi_src_in VARCHAR2, instructor_id_in NUMBER, academic_period_in VARCHAR2) IS
      SELECT *
        FROM MST_FACULTY_DEPT_COLLEGE
       WHERE PERSON_UID = instructor_id_in
         AND academic_period_in BETWEEN ACADEMIC_PERIOD_START AND ACADEMIC_PERIOD_END
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
       ORDER BY
         HOME_ADMIN_COLL_DEPT_IND DESC NULLS LAST,
         TO_CHAR(NVL(HOME_PERCENTAGE_RESPONSIBILITY,0),'099') DESC,
         HOME_COLLEGE ASC,
         HOME_DEPARTMENT ASC;
--
CURSOR get_grade_change_cnt(def_multi_source_in VARCHAR2,multi_src_in VARCHAR2, person_in NUMBER, academic_period_in VARCHAR2, COURSE_REFERENCE_NUMBER_in VARCHAR2) IS
      SELECT count(*) count_no
        FROM MST_STUDENT_COURSE_GRADE_CHG
       WHERE PERSON_UID = person_in
         AND ACADEMIC_PERIOD = academic_period_in
         AND COURSE_REFERENCE_NUMBER = COURSE_REFERENCE_NUMBER_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
CURSOR get_grade_change(def_multi_source_in VARCHAR2,multi_src_in VARCHAR2, person_in NUMBER, academic_period_in VARCHAR2, COURSE_REFERENCE_NUMBER_in VARCHAR2) IS
      SELECT *
        FROM MST_STUDENT_COURSE_GRADE_CHG
       WHERE PERSON_UID = person_in
         AND ACADEMIC_PERIOD = academic_period_in
         AND COURSE_REFERENCE_NUMBER = COURSE_REFERENCE_NUMBER_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
       order by FINAL_GRADE_SEQUENCE_NUMBER desc;
--
 CURSOR get_student_course(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER, academic_period_in VARCHAR2, course_ref_num_in VARCHAR2) IS
      SELECT *
        FROM MST_STUDENT_COURSE
       WHERE PERSON_UID = person_in
         AND ACADEMIC_PERIOD = academic_period_in
         AND COURSE_REFERENCE_NUMBER = course_ref_num_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
CURSOR get_meeting_time(def_multi_source_in VARCHAR2,multi_src_in VARCHAR2, course_ref_num_in VARCHAR2, academic_period_in VARCHAR2) IS
       SELECT max(MONDAY_IND) MONDAY_IND,max(TUESDAY_IND) TUESDAY_IND,max(WEDNESDAY_IND) WEDNESDAY_IND,max(THURSDAY_IND) THURSDAY_IND,
        max(FRIDAY_IND) FRIDAY_IND,max(SATURDAY_IND) SATURDAY_IND,max(SUNDAY_IND) SUNDAY_IND
        FROM MST_MEETING_TIME
       WHERE ACADEMIC_PERIOD = academic_period_in
         AND COURSE_REFERENCE_NUMBER = course_ref_num_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
CURSOR get_admins_appl_info(def_multi_source_in VARCHAR2,multi_src_in VARCHAR2,person_in NUMBER,academic_period_in VARCHAR2) IS
      SELECT *
        FROM MST_ADMISSIONS_APPLICATION
       WHERE PERSON_UID = person_in
         AND ACADEMIC_PERIOD = academic_period_in
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
--BLM and EB submitted bug to ellucian, the below gpa cursor was not mepped, should be
CURSOR get_gpa_by_term(def_multi_source_in VARCHAR2,multi_src_in VARCHAR2,person_in NUMBER,academic_period_in VARCHAR2,academic_study_value_in VARCHAR2) IS
      SELECT GPA
        FROM MST_GPA
       WHERE PERSON_UID = person_in
         AND ACADEMIC_STUDY_VALUE = academic_study_value_in
         AND ACADEMIC_PERIOD = academic_period_in
         AND GPA_TYPE = 'I'
         AND GPA_TIME_IND = 'P'
         AND ACADEMIC_STUDY_AREA = 'LEVEL'
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
CURSOR get_ret_seq(academic_period_in VARCHAR2) IS
     SELECT CASE WHEN (MTVPARM_EXTERNAL_CODE > MTVPARM_INTERNAL_CODE_2) THEN
               (SUBSTR(academic_period_in, 1,
                  LENGTH(academic_period_in)-LENGTH(MTVPARM_EXTERNAL_CODE)) ||
                  MTVPARM_EXTERNAL_CODE)
            ELSE
               ((SUBSTR(academic_period_in, 1,
                  LENGTH(academic_period_in)-LENGTH(MTVPARM_EXTERNAL_CODE))+1) ||
                  MTVPARM_EXTERNAL_CODE)
            END                             ret_sequential
       FROM MTVPARM
      WHERE MTVPARM_INTERNAL_CODE_GROUP = 'EDW EXTRACT PARAMETERS'
        AND MTVPARM_INTERNAL_CODE = 'ACADEMIC_PERIOD_SEQUENTIAL'
        AND MTVPARM_INTERNAL_CODE_2 =
               SUBSTR(academic_period_in,
                      (LENGTH(academic_period_in)-LENGTH(MTVPARM_EXTERNAL_CODE)+1),
                      LENGTH(MTVPARM_EXTERNAL_CODE));
--
/* BLM and EB - this version is wrong, no mep
CURSOR get_acd_per_first_last(person_in NUMBER,student_level_in VARCHAR2) IS
     SELECT min(academic_period) acad_per_first,max(academic_period) acad_per_last
        FROM ACADEMIC_STUDY AST
       WHERE AST.PERSON_UID = person_in
        AND AST.STUDENT_LEVEL = student_level_in
        AND AST.PRIMARY_PROGRAM_IND = 'Y'
        AND AST.REGISTERED_IND = 'Y'
        AND AST.REGISTERED_IND = 'Y'
        AND NVL(AST.MULTI_SOURCE, def_multi_source_in) = multi_src_in;*/
  --using this version
  CURSOR get_acd_per_first_last(def_multi_source_in VARCHAR2,multi_src_in VARCHAR,person_in NUMBER,student_level_in VARCHAR2) IS
	SELECT min(academic_period) acad_per_first,max(academic_period) acad_per_last
	FROM ACADEMIC_STUDY AST
	WHERE AST.PERSON_UID = person_in
	AND AST.STUDENT_LEVEL = student_level_in
	AND AST.PRIMARY_PROGRAM_IND = 'Y'
	AND AST.REGISTERED_IND = 'Y'
AND NVL(AST.MULTI_SOURCE, def_multi_source_in) = multi_src_in;

--
/* Not MEPPED, BLM and EB replacing this version
CURSOR get_acad_period_count(person_in NUMBER,academic_period_in VARCHAR2, student_level_in VARCHAR2) IS
    SELECT COUNT(ACADEMIC_PERIOD) period_count
      FROM ACADEMIC_STUDY
     WHERE PERSON_UID=person_in
       AND STUDENT_LEVEL = student_level_in
       AND ACADEMIC_PERIOD <= nvl(academic_period_in,ACADEMIC_PERIOD)
       AND PRIMARY_PROGRAM_IND = 'Y'
       AND REGISTERED_IND = 'Y';*/
--
-- ACADEMIC_STUDY has multi-source information; pass in multi-source and default multi-source
--CURSOR get_acad_period_count(person_in NUMBER,academic_period_in VARCHAR2, student_level_in VARCHAR2) IS
CURSOR get_acad_period_count(def_multi_source_in VARCHAR2,multi_src_in VARCHAR,person_in NUMBER,academic_period_in VARCHAR2, student_level_in VARCHAR2) IS
SELECT COUNT(ACADEMIC_PERIOD) period_count
FROM ACADEMIC_STUDY
WHERE PERSON_UID=person_in
AND STUDENT_LEVEL = student_level_in
AND ACADEMIC_PERIOD <= nvl(academic_period_in,ACADEMIC_PERIOD)
AND PRIMARY_PROGRAM_IND = 'Y'
AND REGISTERED_IND = 'Y'
AND NVL(MULTI_SOURCE, def_multi_source_in) = multi_src_in;
--


--BLM and EB mepped
CURSOR get_major_counts(def_multi_source_in VARCHAR2,multi_src_in VARCHAR,person_in NUMBER,student_level_in VARCHAR2) IS
    SELECT COUNT(CASE WHEN MTVPARM_EXTERNAL_CODE IS NOT NULL THEN ACADEMIC_PERIOD ELSE NULL END) OVER () undeclared_major_count,
           (COUNT(DISTINCT b.MAJOR) OVER () - 1) changed_major_count,
           b.PERSON_UID, MTVPARM_EXTERNAL_CODE, b.MAJOR, b.ACADEMIC_PERIOD
      FROM MTVPARM, MST_GENERAL_STUDENT B
     WHERE b.PERSON_UID = person_in
       AND b.PROGRAM_LEVEL = student_level_in
       AND b.PRIMARY_PROGRAM_IND = 'Y'
       AND MTVPARM_INTERNAL_CODE_GROUP(+) = 'EDW EXTRACT PARAMETERS'
       AND MTVPARM_INTERNAL_CODE(+) = 'MAJOR_CODE'
       AND MTVPARM_INTERNAL_CODE_2(+) = 'UNDECLARED'
       --BLM 2/13/14 - per Tom we may need to modify the next line for UNK/UND - we need 2 codes for undeclared
       --So if we choose to do that we'll need to decode the b.MAJOR part
       and MTVPARM_EXTERNAL_CODE(+) = b.MAJOR
       AND NVL(B.MIF_VALUE, def_multi_source_in) = multi_src_in;
--
--BLM and EB
-- Modify get_retention_seq_like_ind to accept multi_source
-- ACADEMIC_STUDY is meped; add multi_source to each join
--CURSOR get_retention_seq_like_ind(person_in NUMBER,academic_period_in VARCHAR2,p_student_level VARCHAR2,p_college VARCHAR2,p_program VARCHAR2) IS
CURSOR get_retention_seq_like_ind(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER,academic_period_in VARCHAR2,p_student_level VARCHAR2,p_college VARCHAR2,p_program VARCHAR2) IS
    SELECT NVL((SELECT DECODE (REGISTERED_IND, 'Y', 1, 0)
                  FROM ACADEMIC_STUDY E
                 WHERE E.PERSON_UID = person_in
                 AND NVL(E.MULTI_SOURCE, def_multi_source_in) = multi_src_in
                   AND E.ACADEMIC_PERIOD = academic_period_in
                   AND E.PRIMARY_PROGRAM_IND = 'Y'
                   AND E.REGISTERED_IND = 'Y'),0)                 retained_overall_ind,
           NVL((SELECT DECODE (REGISTERED_IND, 'Y', 1, 0)
                  FROM ACADEMIC_STUDY E
                 WHERE E.PERSON_UID = person_in
                 AND NVL(E.MULTI_SOURCE, def_multi_source_in) = multi_src_in
                   AND E.ACADEMIC_PERIOD = academic_period_in
                   AND E.PRIMARY_PROGRAM_IND = 'Y'
                   AND E.REGISTERED_IND = 'Y'
                   AND NVL(E.STUDENT_LEVEL, 'NULL') =
                       NVL(p_student_level, 'NULL')),0)           retained_stdlevl_ind,
           NVL((SELECT DECODE (REGISTERED_IND, 'Y', 1, 0)
                  FROM ACADEMIC_STUDY E
                 WHERE E.PERSON_UID = person_in
                 AND NVL(E.MULTI_SOURCE, def_multi_source_in) = multi_src_in
                   AND E.ACADEMIC_PERIOD = academic_period_in
                   AND E.PRIMARY_PROGRAM_IND = 'Y'
                   AND E.REGISTERED_IND = 'Y'
                   AND NVL(E.COLLEGE, 'NULL') =
                       NVL(p_college, 'NULL')),0)                 retained_college_ind,
           NVL((SELECT DECODE (REGISTERED_IND, 'Y', 1, 0)
                  FROM ACADEMIC_STUDY E
                 WHERE E.PERSON_UID = person_in
                 AND NVL(E.MULTI_SOURCE, def_multi_source_in) = multi_src_in
                   AND E.ACADEMIC_PERIOD = academic_period_in
                   AND E.PRIMARY_PROGRAM_IND = 'Y'
                   AND E.REGISTERED_IND = 'Y'
                   AND NVL(E.PROGRAM, 'NULL') =
                       NVL(p_program, 'NULL')),0)                 retained_program_ind
      FROM DUAL;
--
CURSOR get_registered_ind(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER, acad_period_in VARCHAR2) IS
   SELECT 1
     FROM MST_ENROLLMENT
    WHERE PERSON_UID = PERSON_IN
      AND ACADEMIC_PERIOD = ACAD_PERIOD_IN
      AND REGISTERED_IND = 'Y'
      AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
CURSOR get_graduated_ind(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER, acad_year_in VARCHAR2, level_in VARCHAR2) IS
   SELECT 1
     FROM MST_ACADEMIC_OUTCOME
    WHERE PERSON_UID = PERSON_IN
      AND ACADEMIC_YEAR_GRADUATION <= ACAD_YEAR_IN
      AND STUDENT_LEVEL = LEVEL_IN
      AND GRADUATED_IND = 'Y'
      AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
CURSOR get_exclude_student_status_ind(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER, acad_period_in VARCHAR2) IS
   SELECT 1
     FROM MST_GENERAL_STUDENT GS
    WHERE PERSON_UID = PERSON_IN
      AND ACADEMIC_PERIOD = ACAD_PERIOD_IN
      AND PRIMARY_PROGRAM_IND = 'Y'
      AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
      AND EXISTS
          (SELECT NULL
             FROM MTVPARM M
            WHERE M.MTVPARM_INTERNAL_CODE_GROUP = 'EDW EXTRACT PARAMETERS'
              AND M.MTVPARM_INTERNAL_CODE = 'EXCLUSION_STATUS_CODE'
              AND M.MTVPARM_INTERNAL_CODE_2 = 'STVSTST'
              AND M.MTVPARM_EXTERNAL_CODE = GS.STUDENT_STATUS);
--
CURSOR get_exclude_enroll_status_ind(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER, acad_period_in VARCHAR2) IS
   SELECT 1
     FROM MST_ENROLLMENT E
    WHERE PERSON_UID = PERSON_IN
      AND ACADEMIC_PERIOD = ACAD_PERIOD_IN
      AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
      AND EXISTS
          (SELECT NULL
             FROM MTVPARM M
            WHERE M.MTVPARM_INTERNAL_CODE_GROUP = 'EDW EXTRACT PARAMETERS'
              AND M.MTVPARM_INTERNAL_CODE = 'EXCLUSION_STATUS_CODE'
              AND M.MTVPARM_INTERNAL_CODE_2 = 'STVESTS'
              AND M.MTVPARM_EXTERNAL_CODE = E.ENROLLMENT_STATUS);
--
CURSOR get_devl_course_attr_ind (def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER, acad_period_in VARCHAR2, crn_in VARCHAR2) is
   SELECT 1
     FROM MST_STUDENT_COURSE_ATTRIBUTE CA
    WHERE CA.PERSON_UID = person_in
      AND CA.ACADEMIC_PERIOD = acad_period_in
      AND CA.COURSE_REFERENCE_NUMBER = crn_in
      AND NVL(CA.MIF_VALUE, def_multi_source_in) = multi_src_in
      AND EXISTS
          (SELECT NULL
             FROM MTVPARM M
            WHERE M.MTVPARM_INTERNAL_CODE_GROUP = 'EDW EXTRACT PARAMETERS'
              AND M.MTVPARM_INTERNAL_CODE = 'DEV_COURSE_ATTRIBUTE'
              AND M.MTVPARM_INTERNAL_CODE_2 = 'DEV_COURSE_ATTRIBUTE'
              AND M.MTVPARM_EXTERNAL_CODE = CA.COURSE_ATTRIBUTE);
--
CURSOR get_stud_crse_info(multi_source_in VARCHAR, academic_period_in VARCHAR, person_in NUMBER) IS
    SELECT MAX(CASE WHEN d.academic_period = d_in.academic_period THEN student_course_group_key ELSE NULL END) stud_course_grp_key,
      COUNT(DISTINCT(CASE WHEN (d.academic_period = d_in.academic_period AND f.in_progress_course_ind = 1) THEN f.student_course_count_key ELSE NULL END)) course_in_progress_count,
      SUM(CASE WHEN d.academic_period = d_in.academic_period THEN (CASE WHEN f.transfer_course_ind = 0 THEN course_credits ELSE 0 END) ELSE 0 END) total_credits,
      SUM(CASE WHEN d.academic_period = d_in.academic_period THEN (CASE WHEN f.transfer_course_ind = 0 THEN course_credits_earned ELSE 0 END) ELSE 0 END) total_credits_earn,
      SUM(CASE WHEN d.academic_period = d_in.academic_period THEN (CASE WHEN f.transfer_course_ind = 0 THEN course_credits_passed ELSE 0 END) ELSE 0 END) total_credits_pass,
      SUM(CASE WHEN d.academic_period = d_in.academic_period THEN (CASE WHEN f.transfer_course_ind = 0 THEN course_credits_attempted ELSE 0 END) ELSE 0 END) total_credits_attm,
      SUM(CASE WHEN d.academic_period = d_in.academic_period THEN (CASE WHEN f.transfer_course_ind = 0 THEN final_grade_quality_points ELSE 0 END) ELSE 0 END) final_grd_qlty_pnts,
      SUM(CASE WHEN d.academic_period = d_in.academic_period THEN (CASE WHEN f.transfer_course_ind = 0 THEN course_credits_for_gpa ELSE 0 END) ELSE 0 END) tot_cred_gpa,
      SUM(CASE WHEN d.academic_year = d_in.academic_year THEN final_grade_quality_points ELSE 0 END) yr_final_grd_qlty_pnts,
      SUM(CASE WHEN d.academic_year = d_in.academic_year THEN course_credits_for_gpa ELSE 0 END) yr_tot_cred_gpa,
      SUM(CASE WHEN d.academic_period <= d_in.academic_period THEN f.course_credits_earned ELSE 0 END)   cumulative_credits_earned,
      SUM(CASE WHEN d.academic_period <= d_in.academic_period THEN f.course_credits_passed ELSE 0 END)   cumulative_credits_passed,
      SUM(CASE WHEN d.academic_period <= d_in.academic_period THEN f.course_credits_attempted ELSE 0 END) cumulative_credits_attempted,
      SUM(CASE WHEN d.academic_period <= d_in.academic_period THEN f.final_grade_quality_points ELSE 0 END)  cumulative_quality_points,
      SUM(CASE WHEN d.academic_period <= d_in.academic_period THEN f.course_credits_for_gpa ELSE 0 END)  cumulative_credits_for_gpa,
      MAX(CASE WHEN d.academic_period = d_in.academic_period THEN developmental_course_ind ELSE 0 END) developmental_course_ind,
      COUNT(DISTINCT(CASE WHEN d.academic_period = d_in.academic_period THEN course_attempted_headcount ELSE NULL END)) course_attempted_headcount,
      COUNT(DISTINCT(CASE WHEN d.academic_period = d_in.academic_period THEN course_passed_headcount ELSE NULL END)) course_passed_headcount,
      COUNT(DISTINCT(CASE WHEN d.academic_period = d_in.academic_period THEN course_failed_headcount ELSE NULL END)) course_failed_headcount,
      COUNT(DISTINCT(CASE WHEN d.academic_period = d_in.academic_period THEN course_dropped_headcount ELSE NULL END)) course_dropped_headcount,
      COUNT(DISTINCT(CASE WHEN d.academic_period = d_in.academic_period THEN course_withdrawn_headcount ELSE NULL END)) course_withdrawn_headcount
    FROM wft_student_course f, wdt_academic_time d, wdt_academic_time d_in, wdt_multi_source m
     WHERE f.multi_source_key = m.multi_source_key
       AND f.academic_time_key = d.academic_time_key
       AND f.person_uid = person_in
       AND d.academic_year <= d_in.academic_year
       AND m.multi_source = multi_source_in
       AND d_in.academic_period = academic_period_in
       AND d_in.academic_time_key =
           (SELECT max(x.academic_time_key)
              FROM wdt_academic_time x
             WHERE x.academic_period = d_in.academic_period);
--
--BLM and EB Mepped as Ellucian didnt
CURSOR get_prev_acad_period_gpa(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER,academic_period_in VARCHAR2,academic_study_value_in VARCHAR2) IS
      SELECT GPA
        FROM MST_GPA
       WHERE PERSON_UID = person_in
         AND ACADEMIC_STUDY_VALUE = academic_study_value_in
         AND ACADEMIC_PERIOD < academic_period_in
         AND GPA_TYPE = 'I'
         AND GPA_TIME_IND = 'P'
         AND ACADEMIC_STUDY_AREA = 'LEVEL'
         AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
       ORDER BY ACADEMIC_PERIOD DESC;
--
 CURSOR get_acad_outcome(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER, curr_priority_in VARCHAR2,outcome_number_in number) IS
   SELECT *
     FROM MST_ACADEMIC_OUTCOME
    WHERE PERSON_UID = person_in
      AND CURRICULUM_PRIORITY =curr_priority_in
      AND OUTCOME_NUMBER =outcome_number_in
      AND NVL(MIF_VALUE, def_multi_source_in) = multi_src_in;
--
PROCEDURE p_load_inputTable(process_ind_in VARCHAR2, academic_year_in VARCHAR2, process_date DATE DEFAULT SYSDATE,  p_process_name IN VARCHAR2 DEFAULT 'EDW_STUDENT_INPUT', debug_var_in VARCHAR2 DEFAULT NULL,jobNumber IN binary_integer DEFAULT NULL);
--
END edw_student_extr;
/


create or replace PACKAGE BODY edw_student_extr IS
/******************************************************************************/
  FUNCTION f_get_prosp_students(process_ind_in VARCHAR2,
                                process_date DATE,
                                debug_var_in VARCHAR2 DEFAULT NULL)
                                RETURN tab_prosp_student_extr PIPELINED IS
--
    ret_row                     WTT_PROSP_STUDENT_INPUT%ROWTYPE;
    ret_row_init                WTT_PROSP_STUDENT_INPUT%ROWTYPE;
    georegion_rec               MGT_GEOGRAPHIC_REGION%ROWTYPE;
    georegion_rec_init          MGT_GEOGRAPHIC_REGION%ROWTYPE;
    sec_school_rec              MST_PREVIOUS_EDUCATION%ROWTYPE;
    sec_school_rec_init         MST_PREVIOUS_EDUCATION%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    parm_rec                    MTVPARM%ROWTYPE;
    null_nation_rec             MTVPARM%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
    fetch_inst_details          BOOLEAN := TRUE;
--
--

--
TYPE tab_institution_detail   IS TABLE OF   WCV_EXTR_INSTITUTION_DETAILS%ROWTYPE INDEX BY VARCHAR2(4000);
institution_detail_recs  tab_institution_detail;
--
inst_indx VARCHAR2(4000);
--
        TYPE prosp_student_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(1000),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    prosp_student_cur       refCurType;
    prosp_student_rec        prosp_student_rec_type;
    TYPE tab_prosp_student_rec_type   IS TABLE OF prosp_student_rec_type INDEX BY PLS_INTEGER;
    prosp_student_recs        tab_prosp_student_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DRIVER.MULTI_SOURCE,
                 DRIVER.PROCESS_GROUP,
                 DRIVER.ADMINISTRATIVE_GROUP,
                 DRIVER.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)    WAREHOUSE_ENTITY_UID,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 (SELECT NVL(AA.MIF_VALUE, def_multi_source_in)    multi_source,
                         AA.ZONE_VALUE                             process_group,
                         AA.DOMAIN_VALUE                           administrative_group,
                         AA.PERSON_UID                             person_uid
                    FROM MST_ADMISSIONS_APPLICATION AA
                  UNION
                  SELECT NVL(RI.MIF_VALUE, def_multi_source_in)    multi_source,
                         RI.ZONE_VALUE                             process_group,
                         RI.DOMAIN_VALUE                           administrative_group,
                         RI.PERSON_UID                             person_uid
                    FROM MST_RECRUITMENT_INFORMATION RI
                  ) DRIVER,
                  WCV_EXTR_PERSON_DETAILS PD
           WHERE
             (debug_var_in IS NULL OR DRIVER.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = DRIVER.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_Entity MEP
             and we.user_attribute_01 = driver.multi_source
             AND DRIVER.PERSON_UID =  PD.PERSON_ID;
             -- JOS update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND DRIVER.multi_source =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT DRIVER.MULTI_SOURCE,
                 DRIVER.PROCESS_GROUP,
                 DRIVER.ADMINISTRATIVE_GROUP,
                 DRIVER.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)    WAREHOUSE_ENTITY_UID,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 (SELECT NVL(AA.MIF_VALUE, def_multi_source_in)    multi_source,
                         AA.ZONE_VALUE                             process_group,
                         AA.DOMAIN_VALUE                           administrative_group,
                         AA.PERSON_UID                             person_uid
                    FROM MST_ADMISSIONS_APPLICATION AA
                  UNION
                  SELECT NVL(RI.MIF_VALUE, def_multi_source_in)    multi_source,
                         RI.ZONE_VALUE                             process_group,
                         RI.DOMAIN_VALUE                           administrative_group,
                         RI.PERSON_UID                             person_uid
                    FROM MST_RECRUITMENT_INFORMATION RI
                  ) DRIVER,
                  WCV_EXTR_PERSON_DETAILS PD,
                  CHG_PROSPECTIVE_STUDENT CHG
            WHERE CHG.PERSON_UID = DRIVER.PERSON_UID
             AND (debug_var_in IS NULL OR DRIVER.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = DRIVER.PERSON_UID
             --BLM 7/29/14 added MEP for wdt_warehouse_entity
             and we.user_attribute_01 = driver.multi_source
             AND DRIVER.PERSON_UID =  PD.PERSON_ID;
             -- JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND DRIVER.multi_source =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_PROSPECTIVE_STUDENT');
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_PROSPECTIVE_STUDENT', 'WFT_PROSPECTIVE_STUDENT', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','PERSON_GEOGRAPHIC_DIVISION','PROSPECTIVE_STUDENT');
    FETCH edw_general_extr.get_mtvparm INTO parm_rec;
    CLOSE edw_general_extr.get_mtvparm;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','NULL_NATION','NULL_NATION_VALUE');
    FETCH edw_general_extr.get_mtvparm INTO null_nation_rec;
    CLOSE edw_general_extr.get_mtvparm;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        prosp_student_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        prosp_student_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH prosp_student_cur BULK COLLECT INTO prosp_student_recs LIMIT bulk_size;
       EXIT WHEN prosp_student_recs.COUNT =  0;
--
       IF prosp_student_recs.COUNT > 0AND fetch_inst_details THEN
--
         fetch_inst_details := FALSE;
--
         FOR institution_detail in (SELECT * FROM WCV_EXTR_INSTITUTION_DETAILS) LOOP
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION ).MULTI_SRC := institution_detail.MULTI_SRC;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).INSTITUTION := institution_detail.INSTITUTION;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).fice_code := institution_detail.fice_code;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).institution_type := institution_detail.institution_type;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).accreditation_type := institution_detail.accreditation_type;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).approved_ind := institution_detail.approved_ind;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).calendar_year := institution_detail.calendar_year;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).two_year_ind := institution_detail.two_year_ind;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).four_year_ind := institution_detail.four_year_ind;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).private_ind := institution_detail.private_ind;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).public_ind := institution_detail.public_ind;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).homeschool_ind := institution_detail.homeschool_ind;
         END LOOP;
--
       END IF;
--
       FOR i IN prosp_student_recs.FIRST..prosp_student_recs.LAST
       LOOP
--
         OPEN edw_general_extr.get_georegion(default_rec.multi_source_cleanse_value, prosp_student_recs(i).multi_source, prosp_student_recs(i).person_uid, prosp_student_recs(i).address_type, prosp_student_recs(i).address_seq_no, parm_rec.mtvparm_external_code);
         FETCH edw_general_extr.get_georegion INTO georegion_rec;
         CLOSE edw_general_extr.get_georegion;
--
         OPEN get_sec_school(default_rec.multi_source_cleanse_value, prosp_student_recs(i).multi_source, prosp_student_recs(i).person_uid);
         FETCH get_sec_school INTO sec_school_rec;
         CLOSE get_sec_school;
--
         inst_indx := prosp_student_recs(i).multi_source || '{' ||  sec_school_rec.institution ;
--
         ret_row.multi_source := prosp_student_recs(i).multi_source;
         ret_row.process_group := prosp_student_recs(i).process_group;
         ret_row.administrative_group := prosp_student_recs(i).administrative_group;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.msrc_user_attribute_01 := NULL;
         ret_row.msrc_user_attribute_01 := ret_row.multi_source;
         ret_row.msrc_user_attribute_02 := NULL;
         ret_row.msrc_user_attribute_03 := NULL;
         ret_row.msrc_user_attribute_04 := NULL;
         ret_row.msrc_user_attribute_05 := NULL;
         ret_row.person_uid := prosp_student_recs(i).warehouse_entity_uid;
         ret_row.id :=  prosp_student_recs(i).id;
         ret_row.full_name_lfmi :=  prosp_student_recs(i).full_name_lfmi;
         ret_row.birth_date :=  prosp_student_recs(i).birth_date;
         ret_row.deceased_date :=  prosp_student_recs(i).deceased_date;
         ret_row.email_address :=  prosp_student_recs(i).email_address;
         ret_row.phone_number_combined :=  prosp_student_recs(i).phone_number_combined;
         ret_row.confidentiality_ind :=  prosp_student_recs(i).confidentiality_ind;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.pers_user_attribute_01 := NULL;
         ret_row.pers_user_attribute_01 := ret_row.multi_source;
         ret_row.pers_user_attribute_02 := NULL;
         ret_row.pers_user_attribute_03 := NULL;
         ret_row.pers_user_attribute_04 := NULL;
         ret_row.pers_user_attribute_05 := NULL;
         ret_row.gender := prosp_student_recs(i).gender;
         ret_row.ethnicity_category :=  prosp_student_recs(i).ethnicity_category;
         ret_row.hispanic_latino_ethn_ind :=  prosp_student_recs(i).hispanic_latino_ethnicity_ind;
         ret_row.asian_ind :=  prosp_student_recs(i).asian_ind;
         ret_row.native_amer_or_alaskan_ind :=  prosp_student_recs(i).native_american_or_alaskan_ind;
         ret_row.black_or_african_ind :=  prosp_student_recs(i).black_or_african_ind;
         ret_row.pacific_islander_ind :=  prosp_student_recs(i).pacific_islander_ind;
         ret_row.white_ind :=  prosp_student_recs(i).white_ind;
         IF  prosp_student_recs(i).number_of_races = 0 and  prosp_student_recs(i).resident_alien_visa_count > 0 THEN
            ret_row.non_resident_ind := 'Y';
         ELSE
            ret_row.non_resident_ind := 'N';
         END IF;
         IF NVL( prosp_student_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND prosp_student_recs(i).number_of_races= 0 AND prosp_student_recs(i).resident_alien_visa_count = 0 THEN
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
         ELSE
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
         END IF;
         ret_row.two_or_more_ind :=  prosp_student_recs(i).two_or_more_ind;
         ret_row.race_ethnicity_confirm_ind :=  prosp_student_recs(i).race_ethnicity_confirm_ind;
         ret_row.minority_ind :=  prosp_student_recs(i).minority_ind;
         ret_row.ethnicity :=  prosp_student_recs(i).ethnicity;
         ret_row.deceased_ind :=  prosp_student_recs(i).deceased_ind;
         ret_row.citizenship_ind :=  prosp_student_recs(i).citizenship_ind;
         ret_row.citizenship_type :=  prosp_student_recs(i).citizenship_type;
         ret_row.visa_type :=  prosp_student_recs(i).visa_type;
         ret_row.nation_of_citizenship :=  prosp_student_recs(i).nation_of_citizenship;
         ret_row.nation_of_birth :=  prosp_student_recs(i).nation_of_birth;
         ret_row.primary_disability :=  prosp_student_recs(i).primary_disability;
         ret_row.legacy :=  prosp_student_recs(i).legacy;
         ret_row.marital_status :=  prosp_student_recs(i).marital_status;
         ret_row.religion :=  prosp_student_recs(i).religion;
         ret_row.veteran_type :=  prosp_student_recs(i).veteran_type;
         ret_row.veteran_category :=  prosp_student_recs(i).veteran_category;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.demo_user_attribute_01 := NULL;
         ret_row.demo_user_attribute_01 := ret_row.multi_source;
         ret_row.demo_user_attribute_02 := NULL;
         ret_row.demo_user_attribute_03 := NULL;
         ret_row.demo_user_attribute_04 := NULL;
         ret_row.demo_user_attribute_05 := NULL;
         ret_row.street_line1 := nvl(prosp_student_recs(i).street_line1, default_rec.null_cleanse_value);
         ret_row.street_line2 := nvl(prosp_student_recs(i).street_line2, default_rec.null_cleanse_value);
         ret_row.street_line3 := nvl(prosp_student_recs(i).street_line3, default_rec.null_cleanse_value);
         ret_row.street_line4 := nvl(prosp_student_recs(i).street_line4, default_rec.null_cleanse_value);
         --BLM mepped 6/2/14 for security reasons
         --ret_row.stad_user_attribute_01 := NULL;
         ret_row.stad_user_attribute_01 := ret_row.multi_source;
         ret_row.stad_user_attribute_02 := NULL;
         ret_row.stad_user_attribute_03 := NULL;
         ret_row.stad_user_attribute_04 := NULL;
         ret_row.stad_user_attribute_05 := NULL;
         ret_row.geographic_region := georegion_rec.geographic_region;
         ret_row.geographic_division := georegion_rec.geographic_division;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.geor_user_attribute_01 := NULL;
         ret_row.geor_user_attribute_01 := ret_row.multi_source;
         ret_row.geor_user_attribute_02 := NULL;
         ret_row.geor_user_attribute_03 := NULL;
         ret_row.geor_user_attribute_04 := NULL;
         ret_row.geor_user_attribute_05 := NULL;
         ret_row.postal_code := nvl(prosp_student_recs(i).postal_code, default_rec.null_cleanse_value);
         ret_row.city := nvl(prosp_student_recs(i).city, default_rec.null_cleanse_value);
         ret_row.county := prosp_student_recs(i).county_code;
         ret_row.state_province := prosp_student_recs(i).state_province;
         IF prosp_student_recs(i).state_province IS NOT NULL THEN
           ret_row.nation := NVL(prosp_student_recs(i).nation, null_nation_rec.mtvparm_external_code);
         ELSE
           ret_row.nation := prosp_student_recs(i).nation;
         END IF;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.post_user_attribute_01 := NULL;
         ret_row.post_user_attribute_01 := ret_row.multi_source;
         ret_row.post_user_attribute_02 := NULL;
         ret_row.post_user_attribute_03 := NULL;
         ret_row.post_user_attribute_04 := NULL;
         ret_row.post_user_attribute_05 := NULL;
         ret_row.institution := sec_school_rec.institution;

        IF institution_detail_recs.EXISTS(inst_indx) THEN
           ret_row.fice_code := institution_detail_recs(inst_indx).fice_code;
           ret_row.institution_type := institution_detail_recs(inst_indx).institution_type;
           ret_row.two_year_institution_ind := TO_CHAR(NVL(institution_detail_recs(inst_indx).two_year_ind,0));
           ret_row.four_year_institution_ind := TO_CHAR(NVL(institution_detail_recs(inst_indx).four_year_ind,0));
           ret_row.private_institution_ind := TO_CHAR(NVL(institution_detail_recs(inst_indx).private_ind,0));
           ret_row.public_institution_ind := TO_CHAR(NVL(institution_detail_recs(inst_indx).public_ind,0));
           ret_row.homeschool_ind := TO_CHAR(NVL(institution_detail_recs(inst_indx).homeschool_ind,0));
           ret_row.accreditation_type := institution_detail_recs(inst_indx).accreditation_type;
           ret_row.approved_ind := TO_CHAR(NVL(institution_detail_recs(inst_indx).approved_ind,0));
           ret_row.demographic_calendar_year := TO_CHAR(institution_detail_recs(inst_indx).calendar_year);
        END IF;
--
         --BLM 5/6/14 testing multi source here to fix prospective student load merge error
         ret_row.inst_user_attribute_01 := ret_row.multi_source;
         --ret_row.inst_user_attribute_01 := NULL;
         ret_row.inst_user_attribute_02 := NULL;
         ret_row.inst_user_attribute_03 := NULL;
         ret_row.inst_user_attribute_04 := NULL;
         ret_row.inst_user_attribute_05 := NULL;
         ret_row.secondary_percentile_range := sec_school_rec.percentile;
         ret_row.secondary_gpa_range := edw_general_extr.f_safe_to_number(sec_school_rec.school_gpa);
         ret_row.secondary_diploma := sec_school_rec.secondary_diploma;
         ret_row.college_prep_ind := sec_school_rec.college_prep;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.secs_user_attribute_01 := NULL;
         ret_row.secs_user_attribute_01 := ret_row.multi_source;
         ret_row.secs_user_attribute_02 := NULL;
         ret_row.secs_user_attribute_03 := NULL;
         ret_row.secs_user_attribute_04 := NULL;
         ret_row.secs_user_attribute_05 := NULL;
         ret_row.secondary_school_grad_date := TRUNC(NVL(sec_school_rec.secondary_school_grad_date, '31-DEC-2099'));
         ret_row.secondary_school_percentile := sec_school_rec.percentile;
         ret_row.secondary_school_gpa := edw_general_extr.f_safe_to_number(sec_school_rec.school_gpa);
         ret_row.secondary_school_rank := sec_school_rec.school_rank;
         ret_row.secondary_school_size := sec_school_rec.school_size;
         ret_row.user_measure_01 := NULL;
         ret_row.user_measure_02 := NULL;
         ret_row.user_measure_03 := NULL;
         ret_row.user_measure_04 := NULL;
         ret_row.user_measure_05 := NULL;
         ret_row.system_load_process := 'PROSPECTIVE_STUDENT';
--
         PIPE ROW(ret_row);
--
         ret_row := ret_row_init;
         georegion_rec := georegion_rec_init;
         sec_school_rec := sec_school_rec_init;
--
       END LOOP; -- prosp_student_rec
--
    END LOOP;
--
    CLOSE prosp_student_cur;
--
    RETURN;
--
  END f_get_prosp_students;
/******************************************************************************/
FUNCTION f_get_admissions_source( process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_admissions_source_extr PIPELINED IS
    ret_row                             WTT_CMB_ADMS_SOURCE_INPUT%ROWTYPE;
    ret_row_init                       WTT_CMB_ADMS_SOURCE_INPUT%ROWTYPE;
    default_rec                         WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                          MTVPARM%ROWTYPE;
    bulk_size                           NUMBER;

    cursor get_admissions_source_info(def_multi_source_in varchar2, process_ind_in varchar2, process_date_in date,null_cleanse_value varchar2) is

    SELECT --multi source
               NVL(main_union.mif_value, def_multi_source_in) multi_source,
               main_union.zone_value process_group,
               main_union.domain_value administrative_group,
               --academic time
               main_union.academic_period academic_period,
               acy.start_date academic_period_begin_date,
               acy.end_date academic_period_end_date,
               acy.year_code academic_year,
               -- Person
               NVL(we.warehouse_entity_uid, 0) person_uid,
               pd.*,
               -- Sequence
               main_union.application_number,
               -- Institution
               inst_dtl.institution,
               inst_dtl.fice_code,
               inst_dtl.institution_type,
               inst_dtl.accreditation_type,
               inst_dtl.approved_ind,
               inst_dtl.calendar_year,
               inst_dtl.two_year_ind,
               inst_dtl.four_year_ind,
               inst_dtl.private_ind,
               inst_dtl.public_ind,
               inst_dtl.homeschool_ind,
               -- Measures, Indicators
               main_union.record_type,
               trunc(main_union.activity_date)activity_date,
               main_union.primary_source_ind,
               main_union.initial_source_ind,
               CASE WHEN
                 row_number() over
                 ( partition by main_union.person_uid,main_union.academic_period,main_union.application_number
                   order by main_union.activity_date asc,main_union.psi desc nulls last,main_union.record_type desc nulls last,main_union.institution asc) =1 then 1
               ELSE 0
               END overall_initial_source_ind,
               main_union.system_load_process
          FROM (        SELECT NVL(mif_value, def_multi_source_in) mif_value,
                               zone_value,
                               domain_value,
                               academic_period,
                               person_uid,
                               application_number,
                               'ADMISSIONS' record_type,
                               adms_source_activity_date activity_date,
                               primary_source_ind psi,
                               CASE WHEN primary_source_ind = 'Y' THEN 1  ELSE 0  END primary_source_ind,
                               CASE WHEN
                                       row_number() over ( partition by person_uid,academic_period,application_number  order by adms_source_activity_date asc,primary_source_ind desc nulls last,institution asc) =1 then 1
                                ELSE 0
                                END initial_source_ind,
                               institution,
                               'ADMISSIONS_SOURCE' system_load_process
                          FROM mst_admissions_source
                UNION ALL
                        SELECT NVL(mif_value, def_multi_source_in) mif_value,
                               zone_value,
                               domain_value,
                               academic_period,
                               person_uid,
                               recruit_number record_number_key,
                               'RECRUIT' record_type,
                               recruit_source_activity_date activity_date,
                               primary_source_ind psi,
                               CASE WHEN primary_source_ind = 'Y' THEN 1  ELSE 0  END primary_source_ind,
                               CASE WHEN
                                       row_number() over ( partition by person_uid,academic_period,recruit_number  order by recruit_source_activity_date asc,primary_source_ind desc nulls last,institution asc) =1 then 1
                                ELSE 0
                                END initial_source_ind,
                               institution,
                               'RECRUITMENT_SOURCE' system_load_process
                          FROM mst_recruitment_source) main_union,
               mgt_year_type_definition acy,
               wdt_warehouse_entity we,
               wcv_extr_person_details pd,
               wcv_extr_institution_details inst_dtl
         WHERE acy.year_type(+) = 'ACYR'
           AND main_union.academic_period = acy.academic_period(+)
           AND NVL(main_union.mif_value, def_multi_source_in) = NVL(acy.mif_value(+), def_multi_source_in)
           AND we.banner_pidm = main_union.person_uid
           --BLM 7/29/14 added next line for MEP
           and we.user_attribute_01 = nvl(main_union.mif_value, def_multi_source_in)
           AND main_union.person_uid = pd.person_id (+)
           -- JOS update
           -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
           --AND NVL(main_union.mif_value, def_multi_source_in) = pd.multi_src(+)
           AND main_union.institution = inst_dtl.institution(+)
           AND NVL(main_union.mif_value, def_multi_source_in) = inst_dtl.multi_src(+)
           AND ((process_ind_in = 'L')
             OR (EXISTS
                  (        SELECT 'x'
                             FROM chg_combined_admissions_source chg
                            WHERE chg.person_uid = main_union.person_uid)))
           AND (debug_var_in IS NULL
             OR main_union.person_uid LIKE debug_var_in);


        TYPE tab_admissions_source_info   IS TABLE OF   get_admissions_source_info%ROWTYPE INDEX BY PLS_INTEGER;
        ADMISSIONS_SOURCE_INFO_RECS  tab_admissions_source_info;
        fetch_adms_source_details boolean:=true;
BEGIN
   IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_COMBINED_ADMISSIONS_SOURCE');
       ELSE
         edw_general_extr.p_delete_fact_records('CHG_COMBINED_ADMISSIONS_SOURCE', 'WFT_COMBINED_ADMISSIONS_SOURCE', 'PERSON_UID');
       END IF;
    END IF;

 --
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
 --
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
 --
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);

    OPEN get_admissions_source_info(default_rec.multi_source_cleanse_value, process_ind_in, process_date,default_rec.null_cleanse_value);
    LOOP
           FETCH get_admissions_source_info BULK COLLECT INTO admissions_source_info_recs LIMIT bulk_size;
           EXIT WHEN admissions_source_info_recs.COUNT = 0;

           IF admissions_source_info_recs.COUNT > 0 AND fetch_adms_source_details THEN
                fetch_adms_source_details := FALSE;
           END IF;

           FOR i IN admissions_source_info_recs.FIRST..admissions_source_info_recs.LAST
           LOOP
                ret_row.multi_source:= admissions_source_info_recs(i).multi_source;
                ret_row.process_group :=admissions_source_info_recs(i).process_group ;
                ret_row.administrative_group :=admissions_source_info_recs(i).administrative_group ;
                ret_row.academic_period :=admissions_source_info_recs(i).academic_period ;
                ret_row.academic_period_begin_date :=admissions_source_info_recs(i).academic_period_begin_date ;
                ret_row.academic_period_end_date :=admissions_source_info_recs(i).academic_period_end_date ;
                ret_row.academic_year :=admissions_source_info_recs(i).academic_year ;
                ret_row.person_uid :=admissions_source_info_recs(i).person_uid ;
                ret_row.id :=admissions_source_info_recs(i).id ;
                ret_row.full_name_lfmi :=admissions_source_info_recs(i).full_name_lfmi ;
                ret_row.birth_date :=admissions_source_info_recs(i).birth_date ;
                ret_row.deceased_date :=admissions_source_info_recs(i).deceased_date ;
                ret_row.email_address :=admissions_source_info_recs(i).email_address ;
                ret_row.phone_number_combined :=admissions_source_info_recs(i).phone_number_combined ;
                ret_row.confidentiality_ind :=admissions_source_info_recs(i).confidentiality_ind ;
                ret_row.institution :=admissions_source_info_recs(i).institution ;
                ret_row.fice_code :=admissions_source_info_recs(i).fice_code ;
                ret_row.institution_type :=admissions_source_info_recs(i).institution_type ;
                ret_row.two_year_institution_ind :=admissions_source_info_recs(i).two_year_ind ;
                ret_row.four_year_institution_ind :=admissions_source_info_recs(i).four_year_ind ;
                ret_row.private_institution_ind :=admissions_source_info_recs(i).private_ind ;
                ret_row.public_institution_ind :=admissions_source_info_recs(i).public_ind ;
                ret_row.homeschool_ind :=admissions_source_info_recs(i).homeschool_ind ;
                ret_row.accreditation_type :=admissions_source_info_recs(i).accreditation_type ;
                ret_row.approved_ind :=admissions_source_info_recs(i).approved_ind ;
                ret_row.demographic_calendar_year :=admissions_source_info_recs(i).calendar_year ;
                ret_row.application_number :=admissions_source_info_recs(i).application_number ;
                ret_row.record_type :=admissions_source_info_recs(i).record_type ;
                ret_row.source_reported_date :=admissions_source_info_recs(i).activity_date ;
                ret_row.primary_source_ind :=admissions_source_info_recs(i).primary_source_ind ;
                ret_row.initial_source_ind :=admissions_source_info_recs(i).initial_source_ind ;
                ret_row.overall_initial_source_ind :=admissions_source_info_recs(i).overall_initial_source_ind ;
                -------------Demographic
                ret_row.gender := admissions_source_info_recs(i).gender;
                ret_row.ethnicity_category := admissions_source_info_recs(i).ethnicity_category;
                ret_row.hispanic_latino_ethn_ind := admissions_source_info_recs(i).hispanic_latino_ethnicity_ind;
                ret_row.asian_ind := admissions_source_info_recs(i).asian_ind;
                ret_row.native_amer_or_alaskan_ind := admissions_source_info_recs(i).native_american_or_alaskan_ind;
                ret_row.black_or_african_ind := admissions_source_info_recs(i).black_or_african_ind;
                ret_row.pacific_islander_ind := admissions_source_info_recs(i).pacific_islander_ind;
                ret_row.white_ind := admissions_source_info_recs(i).white_ind;
                ret_row.two_or_more_ind := admissions_source_info_recs(i).two_or_more_ind;
                IF admissions_source_info_recs(i).number_of_races = 0 and admissions_source_info_recs(i).resident_alien_visa_count > 0 THEN
                   ret_row.non_resident_ind := 'Y';
                ELSE
                   ret_row.non_resident_ind := 'N';
                END IF;
                IF NVL(admissions_source_info_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND
                   admissions_source_info_recs(i).number_of_races = 0 AND
                   admissions_source_info_recs(i).resident_alien_visa_count = 0 THEN
                   ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
                ELSE
                        ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
                END IF;
                ret_row.race_ethnicity_confirm_ind := admissions_source_info_recs(i).race_ethnicity_confirm_ind;
                ret_row.minority_ind := admissions_source_info_recs(i).minority_ind;
                ret_row.ethnicity := admissions_source_info_recs(i).ethnicity;
                ret_row.deceased_ind := admissions_source_info_recs(i).deceased_ind;
                ret_row.citizenship_ind := admissions_source_info_recs(i).citizenship_ind;
                ret_row.citizenship_type := admissions_source_info_recs(i).citizenship_type;
                ret_row.visa_type := admissions_source_info_recs(i).visa_type;
                ret_row.nation_of_citizenship := admissions_source_info_recs(i).nation_of_citizenship;
                ret_row.nation_of_birth := admissions_source_info_recs(i).nation_of_birth;
                ret_row.primary_disability := admissions_source_info_recs(i).primary_disability;
                ret_row.legacy := admissions_source_info_recs(i).legacy;
                ret_row.marital_status := admissions_source_info_recs(i).marital_status;
                ret_row.religion := admissions_source_info_recs(i).religion;
                ret_row.veteran_type := admissions_source_info_recs(i).veteran_type;
                ret_row.veteran_category := admissions_source_info_recs(i).veteran_category;
                --BLM mepped 6/2/14 for security reasons
                --ret_row.demo_user_attribute_01 := NULL;
                ret_row.demo_user_attribute_01 := ret_row.multi_source;
                ret_row.demo_user_attribute_02 := NULL;
                ret_row.demo_user_attribute_03 := NULL;
                ret_row.demo_user_attribute_04 := NULL;
                ret_row.demo_user_attribute_05 := NULL;

                ret_row.system_load_process :='COMBINED_ADMISSIONS_SOURCE' ;

                PIPE ROW(ret_row);
                ret_row := ret_row_init;
           END LOOP;
    END LOOP;
CLOSE get_admissions_source_info;

RETURN;

END f_get_admissions_source;
/******************************************************************************/

FUNCTION f_get_feedback (process_ind_in    VARCHAR2,process_date      DATE,debug_var_in      VARCHAR2 DEFAULT NULL) RETURN tab_feedback_extr PIPELINED
IS
   ret_row                  wtt_feedback_input%ROWTYPE;
   ret_row_init             wtt_feedback_input%ROWTYPE;
   default_rec              wcv_default_values%ROWTYPE;
   bulk_limit               mtvparm%ROWTYPE;
   bulk_size                NUMBER;
   fact_dpt_clg_rec         edw_student_extr.get_fact_dept_college%ROWTYPE;
   fact_dpt_clg_init        edw_student_extr.get_fact_dept_college%ROWTYPE;

   CURSOR get_feedback_info (def_multi_source_in    VARCHAR2,process_ind_in         VARCHAR2,process_date_in        DATE,null_cleanse_value     VARCHAR2)
   IS
      SELECT * FROM
                (  SELECT
                       multi_source,
                       process_group,
                       administrative_group,
                       academic_period,
                       academic_period_begin_date,
                       academic_period_end_date,
                       academic_year,
                       warehouse_entity_uid,
                       instructor_id,
                       instructor_uid,
                       instructor_name,
                       feedback_session,
                       feedback_session_start_date,
                       feedback_session_end_date,
                       feedback_type,
                       feedback,
                       feedback_status,
                       feedback_comment,
                       feedback_estimated_grade,
                       person_uid,
                       id,
                       full_name_lfmi,
                       birth_date,
                       deceased_date,
                       email_address,
                       phone_number_combined,
                       confidentiality_ind,
                       course_reference_number,
                       feedback_date,
                       comment_date,
                       feedback_summary,
                       source_pidm,
                       monitored_student_ind,
                       monitored_complete_ind,
                       optional_ind,
                       issue_ind,
                       recommendation_ind,
                       NULL last_feedback_acad_period,
                       NULL last_feedback_acad_year,
                       person_grade_comment_key,
                       mst_feedback_key
                  FROM (
                              SELECT all_student_crn_list.person_uid source_pidm,
                               -- for refresh processing
                               fb.person_grade_comment_key
                                  person_grade_comment_key,
                               fbd.feedback_key mst_feedback_key,
                               --multi source
                               NVL (all_student_crn_list.mif_value,def_multi_source_in)
                                  multi_source,
                               all_student_crn_list.zone_value process_group,
                               all_student_crn_list.domain_value
                                  administrative_group,
                               all_student_crn_list.academic_period
                                  academic_period,
                               acy.start_date academic_period_begin_date,
                               acy.end_date academic_period_end_date,
                               acy.year_code academic_year,
                               NVL (we.warehouse_entity_uid, 0)
                                  warehouse_entity_uid,
                               --instructor
                               fb.instuctor_uid instructor_id,
                               NVL (we_inst.warehouse_entity_uid, 0)
                                  instructor_uid,
                               mst_inst.instructor_name,
                               --feedback session
                               all_student_crn_list.feedback_session_key
                                  feedback_session,
                               fb.feedback_session_start_date
                                  feedback_session_start_date,
                               fb.feedback_session_end_date
                                  feedback_session_end_date,
                               -- feedback type
                               fbd.feedback_type feedback_type,
                               fbd.feedback feedback,
                               -- following case statement ensures that any student who doesnt have any feedback is marked as optional, basically no record should have feddback_key as 0.
                               (CASE WHEN (    (fbd.feedback_type IS NULL) AND (fbd.feedback IS NULL) AND (fb.feedback_status IS NULL)) THEN 'O' ELSE fb.feedback_status END) feedback_status,
                               -- feedback comment
                               NVL (TRIM (fb.feedback_comment),null_cleanse_value)
                                  feedback_comment,
                               NVL (fb.feedback_estimated_grade,null_cleanse_value)
                                  feedback_estimated_grade,
                               -- Person
                               NVL (we.warehouse_entity_uid, 0) person_uid,
                               pd.id,
                               pd.full_name_lfmi,
                               pd.birth_date,
                               pd.deceased_date,
                               pd.email_address,
                               pd.phone_number_combined,
                               pd.confidentiality_ind,
                               -- course refrence number
                               all_student_crn_list.course_reference_number,
                               fbd.feedback_activity_date feedback_date,
                               fb.comment_grade_activity_date comment_date,
                               -- measures
                               NULL feedback_summary,
                               (CASE WHEN fb.feedback_status IN ('M', 'C') THEN 1 ELSE 0 END) monitored_student_ind,
                               (CASE WHEN fb.feedback_status = 'C' THEN 1 ELSE 0 END) AS monitored_complete_ind,
                               (CASE WHEN NVL (fb.feedback_status, 'O') = 'O' THEN 1 ELSE 0 END) AS optional_ind,
                               (CASE WHEN fbd.feedback_type = 'ISSUE' THEN 1 ELSE 0 END) AS issue_ind,
                               (CASE WHEN fbd.feedback_type = 'RECOMMENDATION' THEN 1 ELSE 0 END) AS recommendation_ind
                          FROM mst_faculty_feedback fb,
                               mst_faculty_feedback_detail fbd,
                               wdt_warehouse_entity we,
                               wdt_warehouse_entity we_inst,
                               mgt_year_type_definition acy,
                               wcv_extr_person_details pd,
                               (
                                     SELECT DISTINCT NVL (sc.mif_value, def_multi_source_in) mif_value, sc.zone_value, sc.domain_value, sc.academic_period AS academic_period, sc.course_reference_number AS course_reference_number,
                                                               sc.person_uid AS person_uid, mfb.feedback_session_key
                                      FROM mst_faculty_feedback mfb, mst_student_course sc
                                     WHERE mfb.course_reference_number IS NOT NULL AND sc.academic_period = mfb.academic_period AND sc.course_reference_number = mfb.course_reference_number
                                                 AND NVL (sc.mif_value, def_multi_source_in) = NVL (mfb.mif_value, def_multi_source_in)
                                ) all_student_crn_list,
                               (
                                      SELECT DISTINCT mif_value, person_uid, DECODE ( instructor_first_name, NULL, instructor_last_name, instructor_last_name || ', ' || instructor_first_name) instructor_name
                                      FROM mst_instructional_assignment
                                ) mst_inst
                         WHERE all_student_crn_list.academic_period = fb.academic_period(+) AND
                                    all_student_crn_list.course_reference_number = fb.course_reference_number(+) AND
                                    all_student_crn_list.person_uid = fb.person_uid(+) AND
                                    all_student_crn_list.feedback_session_key = fb.feedback_session_key(+) AND
                                    all_student_crn_list.mif_value = NVL (fb.mif_value, def_multi_source_in) AND
                                    fb.academic_period = fbd.academic_period(+) AND
                                    fb.course_reference_number = fbd.course_reference_number(+) AND
                                    fb.feedback_session_key = fbd.feedback_session_key(+) AND
                                    fb.person_uid = fbd.person_uid(+) AND
                                    NVL (fb.mif_value, def_multi_source_in) = NVL (fbd.mif_value, def_multi_source_in) AND
                                    mst_inst.person_uid(+) = fb.instuctor_uid AND
                                    NVL (mst_inst.mif_value, def_multi_source_in) = all_student_crn_list.mif_value AND
                                    we.banner_pidm = all_student_crn_list.person_uid AND
                                    --BLM added MEP 7/29, next 2 lines
                                    we.user_attribute_01 = all_student_crn_list.mif_value and
                                    we_inst.user_attribute_01(+) = fb.mif_value and
                                    we_inst.banner_pidm(+) = fb.instuctor_uid AND
                                    acy.year_type(+) = 'ACYR' AND
                                    all_student_crn_list.academic_period = acy.academic_period(+) AND
                                    all_student_crn_list.mif_value = NVL (acy.mif_value, def_multi_source_in) AND
                                    all_student_crn_list.person_uid = pd.person_id(+)
                                    --JOS Update
                                    -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
                                    --AND
                                    --all_student_crn_list.mif_value = pd.multi_src(+)
                       ) main_query
            ) main_query_block
             WHERE (
                            (process_ind_in = 'L')
                            OR (EXISTS (SELECT mf.person_uid
                                                   FROM chg_feedback chg,
                                                   (SELECT DISTINCT person_grade_comment_key, person_uid FROM mst_faculty_feedback) mf,
                                                   (SELECT DISTINCT feedback_key, person_uid FROM mst_faculty_feedback_detail) mfd
                                                WHERE (chg.person_grade_comment_key = mf.person_grade_comment_key(+) AND chg.mst_feedback_key = mfd.feedback_key(+)) AND
                                                            ( (mf.person_uid = main_query_block.source_pidm) OR (mfd.person_uid = main_query_block.source_pidm)  )
                                               )
                                  )
                          )
                         AND ( (debug_var_in IS NULL) OR (main_query_block.person_uid LIKE debug_var_in));

   TYPE tab_feedback_info IS TABLE OF get_feedback_info%ROWTYPE INDEX BY PLS_INTEGER;
   feedback_info_recs       tab_feedback_info;
   fetch_feedback_details   BOOLEAN := TRUE;
BEGIN
   IF debug_var_in IS NULL THEN
      IF process_ind_in = 'L' THEN
         edw_general_extr.p_delete_fact_table ('WFT_FEEDBACK');
      ELSE
         edw_general_extr.p_delete_feedback_fact_records;
         edw_general_extr.p_insert_student_crse_chg_rec;
      END IF;
   END IF;


   OPEN edw_general_extr.get_default_values;

   FETCH edw_general_extr.get_default_values INTO default_rec;

   CLOSE edw_general_extr.get_default_values;

   OPEN edw_general_extr.get_mtvparm ('EDW EXTRACT PARAMETERS', 'BULK_OPERATIONS_SIZE', 'STUDENT_EXTRACT_PROCESS');

   FETCH edw_general_extr.get_mtvparm INTO bulk_limit;

   CLOSE edw_general_extr.get_mtvparm;

   bulk_size := NVL (bulk_limit.mtvparm_desc, 10000);

   OPEN get_feedback_info (default_rec.multi_source_cleanse_value, process_ind_in, process_date, default_rec.null_cleanse_value);

   LOOP
      FETCH get_feedback_info
      BULK COLLECT INTO feedback_info_recs
      LIMIT bulk_size;

      EXIT WHEN feedback_info_recs.COUNT = 0;

      IF feedback_info_recs.COUNT > 0 AND fetch_feedback_details
      THEN
         fetch_feedback_details := FALSE;
      END IF;

      FOR i IN feedback_info_recs.FIRST .. feedback_info_recs.LAST
      LOOP
         OPEN get_fact_dept_college (default_rec.multi_source_cleanse_value, feedback_info_recs (i).multi_source, feedback_info_recs (i).instructor_id, feedback_info_recs (i).academic_period);

         FETCH get_fact_dept_college INTO fact_dpt_clg_rec;

         CLOSE get_fact_dept_college;
         --     instructor
         ret_row.multi_source := feedback_info_recs (i).multi_source;
         ret_row.process_group := feedback_info_recs (i).process_group;
         ret_row.administrative_group := feedback_info_recs (i).administrative_group;
         ret_row.academic_period := feedback_info_recs (i).academic_period;
         ret_row.academic_period_begin_date := feedback_info_recs (i).academic_period_begin_date;
         ret_row.academic_period_end_date := feedback_info_recs (i).academic_period_end_date;
         ret_row.academic_year := feedback_info_recs (i).academic_year;
         ret_row.person_uid := feedback_info_recs (i).person_uid;
         ret_row.id := feedback_info_recs (i).id;
         ret_row.full_name_lfmi := feedback_info_recs (i).full_name_lfmi;
         ret_row.birth_date := feedback_info_recs (i).birth_date;
         ret_row.deceased_date := feedback_info_recs (i).deceased_date;
         ret_row.email_address := feedback_info_recs (i).email_address;
         ret_row.phone_number_combined := feedback_info_recs (i).phone_number_combined;
         ret_row.confidentiality_ind := feedback_info_recs (i).confidentiality_ind;
         ret_row.course_reference_number := feedback_info_recs (i).course_reference_number;
         ret_row.feedback_instructor_uid := NVL (feedback_info_recs (i).instructor_uid, 0);
         ret_row.instructor_uid := NVL (feedback_info_recs (i).instructor_uid, 0);
         ret_row.instructor_name := NVL (feedback_info_recs (i).instructor_name, default_rec.null_cleanse_value);
         IF feedback_info_recs (i).instructor_id IS NOT NULL
         THEN
            ret_row.home_college := fact_dpt_clg_rec.home_college;
            ret_row.home_department := fact_dpt_clg_rec.home_department;
         END IF;
         ret_row.fedbk_session := feedback_info_recs (i).feedback_session;
         ret_row.fedbk_session_start_date := feedback_info_recs (i).feedback_session_start_date;
         ret_row.fedbk_session_end_date := feedback_info_recs (i).feedback_session_end_date;
         ret_row.feedback_type := feedback_info_recs (i).feedback_type;
         ret_row.feedback := feedback_info_recs (i).feedback;
         ret_row.feedback_status := feedback_info_recs (i).feedback_status;
         ret_row.feedback_comment := feedback_info_recs (i).feedback_comment;
         ret_row.feedback_estimated_grade := feedback_info_recs (i).feedback_estimated_grade;
         ret_row.feedback_provider_type := 'Faculty';
         ret_row.latest_feedback_date :=
            (CASE
                WHEN TO_DATE (feedback_info_recs (i).feedback_date) IS NULL THEN TO_DATE ('12/31/2099', 'mm/dd/yyyy')
                ELSE TO_DATE (feedback_info_recs (i).feedback_date)
             END);
         ret_row.comment_date := feedback_info_recs (i).comment_date;
         ret_row.last_feedback_acad_period := feedback_info_recs (i).last_feedback_acad_period;
         ret_row.last_feedback_acad_year := feedback_info_recs (i).last_feedback_acad_year;
         ret_row.feedback_summary := feedback_info_recs (i).feedback_summary;
         ret_row.monitored_student_ind := feedback_info_recs (i).monitored_student_ind;
         ret_row.monitored_complete_ind := feedback_info_recs (i).monitored_complete_ind;
         ret_row.optional_ind := feedback_info_recs (i).optional_ind;
         ret_row.issue_ind := feedback_info_recs (i).issue_ind;
         ret_row.recommendation_ind := feedback_info_recs (i).recommendation_ind;
         ret_row.system_load_process := 'FEEDBACK';

         PIPE ROW (ret_row);
         ret_row := ret_row_init;
         fact_dpt_clg_rec := fact_dpt_clg_init;
      END LOOP;
   END LOOP;

   CLOSE get_feedback_info;

   RETURN;
END f_get_feedback;

/******************************************************************************/

  FUNCTION f_get_course_instructor(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL)
   RETURN tab_course_instructor_extr PIPELINED IS
    ret_row                             WTT_COURSE_INSTRUCTOR_INPUT%ROWTYPE;
    ret_row_init                        WTT_COURSE_INSTRUCTOR_INPUT%ROWTYPE;
    default_rec                         WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                          MTVPARM%ROWTYPE;
    bulk_size                           NUMBER;
    fact_dpt_clg_rec                    EDW_STUDENT_EXTR.GET_FACT_DEPT_COLLEGE%ROWTYPE;
   fact_dpt_clg_init                   EDW_STUDENT_EXTR.GET_FACT_DEPT_COLLEGE%ROWTYPE;

    CURSOR get_course_instructor(def_multi_source_in VARCHAR2, process_ind_in VARCHAR2, process_date_in DATE) IS
        SELECT *
          FROM (
                  SELECT ROW_NUMBER()
                  OVER (PARTITION BY NVL(x.mif_value, def_multi_source_in), x.academic_period, x.person_uid, x.course_reference_number
                        ORDER BY (DECODE(x.primary_ind, 'Y', 1, 0)) DESC)
                   record_num,
                  -- multi_source
                  NVL(x.mif_value, def_multi_source_in) multi_source,
                  x.zone_value process_group,
                  x.domain_value administrative_group,
                  -- academic_time
                  x.academic_period academic_period,
                  ac.start_date academic_period_begin_date,
                  ac.end_date academic_period_end_date,
                  ac.year_code academic_year,
                  -- person
                  x.person_uid scr_person_uid,
                  nvl(we.warehouse_entity_uid,0) person_uid,
                  pd.id id,
                  pd.full_name_lfmi full_name_lfmi,
                  pd.birth_date birth_date,
                  pd.deceased_date deceased_date,
                  pd.email_address email_address,
                  pd.phone_number_combined phone_number_combined,
                  pd.confidentiality_ind confidentiality_ind,
                  -- crn
                  x.course_reference_number course_reference_number,
                  -- instructor
                  -- x.instructor_uid                      -- same as person uid above
                  DECODE(x.instructor_first_name,
                         NULL, x.instructor_last_name,
                         x.instructor_last_name || ', ' || x.instructor_first_name)
                   instructor_name,
                  -- x.home_college                        -- to be populated by internal cursor
                  -- x.home_department                     -- to be populated by internal cursor
                  -- measures
                  DECODE(x.primary_ind, 'Y', 1, 0) primary_instructor_ind,
                  0 instructor_group_key,
                  0 instructor_crn_count,
                  0 crn_instructor_count
             FROM mst_instructional_assignment x,
                  wdt_warehouse_entity we,
                  wcv_extr_person_details pd,
                  mgt_year_type_definition ac
            WHERE
                 ac.year_type(+) = 'ACYR'
              AND x.academic_period = ac.academic_period(+)
              AND NVL(x.mif_value, def_multi_source_in) = NVL(ac.mif_value(+), def_multi_source_in)
              AND x.person_uid = pd.person_id(+)
              --JOS Update
              -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
              --AND NVL(x.mif_value, def_multi_source_in) = pd.multi_src(+)
              AND x.person_uid = we.banner_pidm
              --BLM mepped 7/29 for wdt_warehouse_entity
              and x.mif_value  = we.user_attribute_01
              AND (((process_ind_in = 'L') AND (academic_year_in = 'ALL'  OR (EXISTS
                       (SELECT 'x'
                           FROM mgt_year_type_definition ytd
                          WHERE ytd.academic_period = x.academic_period
                            AND ytd.year_type = 'ACYR'
                            AND ytd.year_code = academic_year_in
                            AND NVL(x.mif_value, def_multi_source_in) = NVL(ytd.mif_value, def_multi_source_in)))))
                OR (EXISTS
                     (SELECT 'x'
                        FROM chg_course_instructor chg
                       WHERE chg.person_uid = x.person_uid)))
              AND (debug_var_in IS NULL OR x.person_uid LIKE debug_var_in)
          )
         WHERE record_num = 1;


   TYPE tab_course_instructor IS TABLE OF get_course_instructor%ROWTYPE INDEX BY PLS_INTEGER;
   course_instructor_recs tab_course_instructor;
   fetch_course_instructor boolean:=true;

  BEGIN


   IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_COURSE_INSTRUCTOR', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_COURSE_INSTRUCTOR', 'WFT_COURSE_INSTRUCTOR', 'PERSON_UID');
       END IF;
    END IF;


--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    OPEN get_course_instructor(default_rec.multi_source_cleanse_value, process_ind_in, process_date);
    LOOP

       FETCH get_course_instructor BULK COLLECT INTO course_instructor_recs LIMIT bulk_size;
       EXIT WHEN course_instructor_recs.COUNT = 0;
       IF course_instructor_recs.COUNT > 0 AND fetch_course_instructor THEN
         fetch_course_instructor := FALSE;
       END IF;
       FOR i IN course_instructor_recs.FIRST..course_instructor_recs.LAST
       LOOP
--
          OPEN get_fact_dept_college(default_rec.multi_source_cleanse_value, course_instructor_recs(i).multi_source, course_instructor_recs(i).scr_person_uid, course_instructor_recs(i).academic_period);
          FETCH get_fact_dept_college INTO fact_dpt_clg_rec;
          CLOSE get_fact_dept_college;

          --  multi_source
          ret_row.multi_source := course_instructor_recs(i).multi_source;
          ret_row.process_group := course_instructor_recs(i).process_group;
          ret_row.administrative_group := course_instructor_recs(i).administrative_group;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.msrc_user_attribute_01 := NULL;
          ret_row.msrc_user_attribute_01 := ret_row.multi_source;
          ret_row.msrc_user_attribute_02 := NULL;
          ret_row.msrc_user_attribute_03 := NULL;
          ret_row.msrc_user_attribute_04 := NULL;
          ret_row.msrc_user_attribute_05 := NULL;
           --  academic_time
          ret_row.academic_period := course_instructor_recs(i).academic_period;
          ret_row.academic_period_begin_date := course_instructor_recs(i).academic_period_begin_date;
          ret_row.academic_period_end_date := course_instructor_recs(i).academic_period_end_date;
          ret_row.academic_year := course_instructor_recs(i).academic_year;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.atim_user_attribute_01 := NULL;
          ret_row.atim_user_attribute_01 := ret_row.multi_source;
          ret_row.atim_user_attribute_02 := NULL;
          ret_row.atim_user_attribute_03 := NULL;
          ret_row.atim_user_attribute_04 := NULL;
          ret_row.atim_user_attribute_05 := NULL;
           --  person
          ret_row.person_uid := nvl(course_instructor_recs(i).person_uid,0);
          ret_row.id := course_instructor_recs(i).id;
          ret_row.full_name_lfmi := course_instructor_recs(i).full_name_lfmi;
          ret_row.birth_date := course_instructor_recs(i).birth_date;
          ret_row.deceased_date := course_instructor_recs(i).deceased_date;
          ret_row.email_address := course_instructor_recs(i).email_address;
          ret_row.phone_number_combined := course_instructor_recs(i).phone_number_combined;
          ret_row.confidentiality_ind := course_instructor_recs(i).confidentiality_ind;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.pers_user_attribute_01 := NULL;
          ret_row.pers_user_attribute_01 := ret_row.multi_source;
          ret_row.pers_user_attribute_02 := NULL;
          ret_row.pers_user_attribute_03 := NULL;
          ret_row.pers_user_attribute_04 := NULL;
          ret_row.pers_user_attribute_05 := NULL;
           --  crn
          ret_row.course_reference_number := course_instructor_recs(i).course_reference_number;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.crnb_user_attribute_01 := NULL;
          ret_row.crnb_user_attribute_01 := ret_row.multi_source;
          ret_row.crnb_user_attribute_02 := NULL;
          ret_row.crnb_user_attribute_03 := NULL;
          ret_row.crnb_user_attribute_04 := NULL;
          ret_row.crnb_user_attribute_05 := NULL;
           --  instructor
          ret_row.instructor_uid := nvl(course_instructor_recs(i).person_uid,0);
          ret_row.instructor_name := nvl(course_instructor_recs(i).instructor_name, default_rec.null_cleanse_value);
          ret_row.home_college := fact_dpt_clg_rec.home_college;
          ret_row.home_department := fact_dpt_clg_rec.home_department;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.inst_user_attribute_01 := NULL;
          ret_row.inst_user_attribute_01 := ret_row.multi_source;
          ret_row.inst_user_attribute_02 := NULL;
          ret_row.inst_user_attribute_03 := NULL;
          ret_row.inst_user_attribute_04 := NULL;
          ret_row.inst_user_attribute_05 := NULL;
           --  measures
          ret_row.primary_instructor_ind := course_instructor_recs(i).primary_instructor_ind;
          ret_row.instructor_group_key := 0;
          ret_row.instructor_crn_count := NULL;
          ret_row.crn_instructor_count := NULL;
          ret_row.user_measure_01 := NULL;
          ret_row.user_measure_02 := NULL;
          ret_row.user_measure_03 := NULL;
          ret_row.user_measure_04 := NULL;
          ret_row.user_measure_05 := NULL;
           --  system
          ret_row.system_load_process := 'COURSE_INSTRUCTOR';

         PIPE ROW(ret_row);
         ret_row := ret_row_init;
         fact_dpt_clg_rec := fact_dpt_clg_init;
       END LOOP;
   END LOOP;

   CLOSE get_course_instructor;

   RETURN;
  END f_get_course_instructor;

/******************************************************************************/
  FUNCTION f_get_admissions_application(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_admissions_appl_extr PIPELINED IS
--
    ret_row                             WTT_ADMISSIONS_APPL_INPUT%ROWTYPE;
    ret_row_init                        WTT_ADMISSIONS_APPL_INPUT%ROWTYPE;
    default_rec                         WCV_DEFAULT_VALUES%ROWTYPE;
    null_nation_rec                     MTVPARM%ROWTYPE;
    bulk_limit                          MTVPARM%ROWTYPE;
    bulk_size                           NUMBER;
    fetch_finaid_details                BOOLEAN := TRUE;
--
--

--
   finaid_appl_amt_recs                edw_finaid_extr.tab_finaid_appl_amts;
   finaid_appl_need_recs               edw_finaid_extr.tab_finaid_appl_need;
   total_offer_amts_acad_pd_recs  edw_finaid_extr.tab_total_offer_amts_acad_pd;
   application_ind_recs                  edw_finaid_extr.tab_application_inds;
--
   appl_indx         VARCHAR2(4000);
   finaid_indx       VARCHAR2(2000);
   finaid_ap_indx  VARCHAR2(2000);

        TYPE application_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          APPLICATION_NUMBER                      NUMBER,
          APPLICATION_RANKING_ORDER               NUMBER,
          APPLICATION_STATUS                      VARCHAR2(63),
          PRIMARY_SOURCE                          VARCHAR2(63),
          RECRUITER                               VARCHAR2(63),
          RECRUIT_TYPE                            VARCHAR2(63),
          WITHDRAWAL_REASON                       VARCHAR2(63),
          INSTITUTION_ATTENDING                   VARCHAR2(63),
          STUDENT_POPULATION                      VARCHAR2(63),
          ADMISSIONS_POPULATION                   VARCHAR2(63),
          INTENDED_TIME_STATUS                    VARCHAR2(1),
          EDUCATION_GOAL                          VARCHAR2(63),
          EDUCATION_LEVEL                         VARCHAR2(63),
          RESIDENCY                               VARCHAR2(63),
          RESIDENCY_IND                           VARCHAR2(1),
          SITE                                    VARCHAR2(63),
          RATE                                    VARCHAR2(63),
          INQUIRED_IND                            VARCHAR2(1),
          APPLIED_IND                             CHAR(1),
          ADMITTED_IND                            VARCHAR2(1),
          ACCEPTED_IND                            VARCHAR2(1),
          ENROLLED_TMP                            VARCHAR2(1),
          STUDENT_LEVEL                           VARCHAR2(63),
          PROGRAM                                 VARCHAR2(63),
          CAMPUS                                  VARCHAR2(63),
          COLLEGE                                 VARCHAR2(63),
          AWARD_CATEGORY                          VARCHAR2(63),
          DEGREE                                  VARCHAR2(63),
          MAJOR                                   VARCHAR2(63),
          PROGRAM_CLASSIFICATION                  VARCHAR2(63),
          DEPARTMENT                              VARCHAR2(63),
          SECOND_MAJOR                            VARCHAR2(63),
          SECOND_PROGRAM_CLASSIFICATION           VARCHAR2(63),
          SECOND_DEPARTMENT                       VARCHAR2(63),
          POST_CODE_ADMIT                         VARCHAR2(63),
          COUNTY_ADMIT                            VARCHAR2(63),
          STATE_ADMIT                             VARCHAR2(63),
          NATION_ADMIT                            VARCHAR2(63),
          APPL_SUPL_IND_01_TYPE                   VARCHAR2(63),
          APPL_SUPL_IND_01                        VARCHAR2(1),
          APPL_SUPL_IND_02_TYPE                   VARCHAR2(63),
          APPL_SUPL_IND_02                        VARCHAR2(1),
          APPL_SUPL_IND_03_TYPE                   VARCHAR2(63),
          APPL_SUPL_IND_03                        VARCHAR2(1),
          APPL_SUPL_IND_04_TYPE                   VARCHAR2(63),
          APPL_SUPL_IND_04                        VARCHAR2(1),
          APPL_SUPL_IND_05_TYPE                   VARCHAR2(63),
          APPL_SUPL_IND_05                        VARCHAR2(1),
          APPL_SUPL_IND_06_TYPE                   VARCHAR2(63),
          APPL_SUPL_IND_06                        VARCHAR2(1),
          APPL_SUPL_IND_07_TYPE                   VARCHAR2(63),
          APPL_SUPL_IND_07                        VARCHAR2(1),
          APPL_SUPL_IND_08_TYPE                   VARCHAR2(63),
          APPL_SUPL_IND_08                        VARCHAR2(1),
          APPL_SUPL_IND_09_TYPE                   VARCHAR2(63),
          APPL_SUPL_IND_09                        VARCHAR2(1),
          APPL_SUPL_IND_10_TYPE                   VARCHAR2(63),
          APPL_SUPL_IND_10                        VARCHAR2(1),
          APPL_SUPL_DATA_01_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_01                       VARCHAR2(255),
          APPL_SUPL_DATA_02_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_02                       VARCHAR2(255),
          APPL_SUPL_DATA_03_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_03                       VARCHAR2(255),
          APPL_SUPL_DATA_04_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_04                       VARCHAR2(255),
          APPL_SUPL_DATA_05_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_05                       VARCHAR2(255),
          APPL_SUPL_DATA_06_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_06                       VARCHAR2(255),
          APPL_SUPL_DATA_07_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_07                       VARCHAR2(255),
          APPL_SUPL_DATA_08_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_08                       VARCHAR2(255),
          APPL_SUPL_DATA_09_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_09                       VARCHAR2(255),
          APPL_SUPL_DATA_10_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_10                       VARCHAR2(255),
          APPL_SUPL_DATA_11_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_11                       VARCHAR2(255),
          APPL_SUPL_DATA_12_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_12                       VARCHAR2(255),
          APPL_SUPL_DATA_13_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_13                       VARCHAR2(255),
          APPL_SUPL_DATA_14_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_14                       VARCHAR2(255),
          APPL_SUPL_DATA_15_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_15                       VARCHAR2(255),
          APPL_SUPL_DATA_16_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_16                       VARCHAR2(255),
          APPL_SUPL_DATA_17_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_17                       VARCHAR2(255),
          APPL_SUPL_DATA_18_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_18                       VARCHAR2(255),
          APPL_SUPL_DATA_19_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_19                       VARCHAR2(255),
          APPL_SUPL_DATA_20_TYPE                  VARCHAR2(63),
          APPL_SUPL_DATA_20                       VARCHAR2(255),
          APPLICATION_DATE                        DATE,
          APPLICATION_STATUS_DATE                 DATE,
          APPLICATION_FEE_RECEIVED_DATE           DATE,
          APPLICATION_FEE_REQUIRED_IND            NUMBER,
          APPLICATION_COMPLETE_IND                NUMBER,
          TUITION_DEPOSITED_IND                   CHAR(1),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          ENROLLED_IND                            VARCHAR2(1),
          START_DATE                              DATE,
          END_DATE                                DATE,
          AID_YEAR                                VARCHAR2(63),
          STUDENT_CLASSIFICATION                  VARCHAR2(63)
    );
    TYPE refCurType     IS REF CURSOR;
    application_info_cur       refCurType;
    application_info_rec        application_info_rec_type;
    TYPE tab_application_info_rec_type   IS TABLE OF application_info_rec_type INDEX BY PLS_INTEGER;
    application_info_recs        tab_application_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)                                                      multi_source,
                 A.ZONE_VALUE                                                                               process_group,
                 A.DOMAIN_VALUE                                                                             administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                                                             warehouse_entity_uid,
                 A.APPLICATION_NUMBER,
                 A.APPLICATION_RANKING_ORDER,
                 A.APPLICATION_STATUS,
                 A.PRIMARY_SOURCE,
                 A.RECRUITER,
                 A.RECRUIT_TYPE,
                 A.WITHDRAWAL_REASON,
                 A.INSTITUTION_ATTENDING,
                 A.STUDENT_POPULATION,
                 A.ADMISSIONS_POPULATION,
                 A.FULL_PART_TIME_IND                                                                       intended_time_status,
                 A.EDUCATION_GOAL,
                 A.EDUCATION_LEVEL,
                 A.RESIDENCY,
                 DECODE(A.IN_OUT_STATE_IND,'I','Y','N')                                                     residency_ind,
                 A.SITE,
                 A.RATE,
                 NVL((SELECT 'Y' FROM MST_ADMISSIONS_APPLICATION AA
                       WHERE AA.PERSON_UID = A.PERSON_UID
                         AND AA.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                         AND AA.INQUIRER_IND = 'Y'
                         AND ROWNUM = 1), 'N')                                                              inquired_ind,
                 'Y'                                                                                        applied_ind,
                 NVL(A.INST_ADMIT_ANY_TIME_IND, 'N')                                                        admitted_ind,
                 NVL(A.APPL_ACCEPT_ANY_TIME_IND, 'N')                                                       accepted_ind,
                 NVL(A.INST_ADMIT_ANY_TIME_IND,'N')                                                         enrolled_tmp,
                 A.STUDENT_LEVEL,
                 A.PROGRAM,
                 A.CAMPUS,
                 A.COLLEGE,
                 A.AWARD_CATEGORY,
                 A.DEGREE,
                 A.MAJOR,
                 A.PROGRAM_CLASSIFICATION,
                 A.DEPARTMENT1                                                                              department,
                 A.SECOND_MAJOR,
                 A.SECOND_PROGRAM_CLASSIFICATION,
                 A.SECOND_DEPARTMENT,
                 A.POST_CODE_ADMIT,
                 A.COUNTY_ADMIT,
                 A.STATE_ADMIT,
                 A.NATION_ADMIT,
                 A.APPLICATION_IND_TYPE1                                                                    appl_supl_ind_01_type,
                 A.APPLICATION_IND1                                                                         appl_supl_ind_01,
                 A.APPLICATION_IND_TYPE2                                                                    appl_supl_ind_02_type,
                 A.APPLICATION_IND2                                                                         appl_supl_ind_02,
                 A.APPLICATION_IND_TYPE3                                                                    appl_supl_ind_03_type,
                 A.APPLICATION_IND3                                                                         appl_supl_ind_03,
                 A.APPLICATION_IND_TYPE4                                                                    appl_supl_ind_04_type,
                 A.APPLICATION_IND4                                                                         appl_supl_ind_04,
                 A.APPLICATION_IND_TYPE5                                                                    appl_supl_ind_05_type,
                 A.APPLICATION_IND5                                                                         appl_supl_ind_05,
                 A.APPLICATION_IND_TYPE6                                                                    appl_supl_ind_06_type,
                 A.APPLICATION_IND6                                                                         appl_supl_ind_06,
                 A.APPLICATION_IND_TYPE7                                                                    appl_supl_ind_07_type,
                 A.APPLICATION_IND7                                                                         appl_supl_ind_07,
                 A.APPLICATION_IND_TYPE8                                                                    appl_supl_ind_08_type,
                 A.APPLICATION_IND8                                                                         appl_supl_ind_08,
                 A.APPLICATION_IND_TYPE9                                                                    appl_supl_ind_09_type,
                 A.APPLICATION_IND9                                                                         appl_supl_ind_09,
                 A.APPLICATION_IND_TYPE10                                                                   appl_supl_ind_10_type,
                 A.APPLICATION_IND10                                                                        appl_supl_ind_10,
                 A.APPLICATION_INFO_TYPE1                                                                   appl_supl_data_01_type,
                 A.APPLICATION_INFO1                                                                        appl_supl_data_01,
                 A.APPLICATION_INFO_TYPE2                                                                   appl_supl_data_02_type,
                 A.APPLICATION_INFO2                                                                        appl_supl_data_02,
                 A.APPLICATION_INFO_TYPE3                                                                   appl_supl_data_03_type,
                 A.APPLICATION_INFO3                                                                        appl_supl_data_03,
                 A.APPLICATION_INFO_TYPE4                                                                   appl_supl_data_04_type,
                 A.APPLICATION_INFO4                                                                        appl_supl_data_04,
                 A.APPLICATION_INFO_TYPE5                                                                   appl_supl_data_05_type,
                 A.APPLICATION_INFO5                                                                        appl_supl_data_05,
                 A.APPLICATION_INFO_TYPE6                                                                   appl_supl_data_06_type,
                 A.APPLICATION_INFO6                                                                        appl_supl_data_06,
                 A.APPLICATION_INFO_TYPE7                                                                   appl_supl_data_07_type,
                 A.APPLICATION_INFO7                                                                        appl_supl_data_07,
                 A.APPLICATION_INFO_TYPE8                                                                   appl_supl_data_08_type,
                 A.APPLICATION_INFO8                                                                        appl_supl_data_08,
                 A.APPLICATION_INFO_TYPE9                                                                   appl_supl_data_09_type,
                 A.APPLICATION_INFO9                                                                        appl_supl_data_09,
                 A.APPLICATION_INFO_TYPE10                                                                  appl_supl_data_10_type,
                 A.APPLICATION_INFO10                                                                       appl_supl_data_10,
                 A.APPLICATION_INFO_TYPE11                                                                  appl_supl_data_11_type,
                 A.APPLICATION_INFO11                                                                       appl_supl_data_11,
                 A.APPLICATION_INFO_TYPE12                                                                  appl_supl_data_12_type,
                 A.APPLICATION_INFO12                                                                       appl_supl_data_12,
                 A.APPLICATION_INFO_TYPE13                                                                  appl_supl_data_13_type,
                 A.APPLICATION_INFO13                                                                       appl_supl_data_13,
                 A.APPLICATION_INFO_TYPE14                                                                  appl_supl_data_14_type,
                 A.APPLICATION_INFO14                                                                       appl_supl_data_14,
                 A.APPLICATION_INFO_TYPE15                                                                  appl_supl_data_15_type,
                 A.APPLICATION_INFO15                                                                       appl_supl_data_15,
                 A.APPLICATION_INFO_TYPE16                                                                  appl_supl_data_16_type,
                 A.APPLICATION_INFO16                                                                       appl_supl_data_16,
                 A.APPLICATION_INFO_TYPE17                                                                  appl_supl_data_17_type,
                 A.APPLICATION_INFO17                                                                       appl_supl_data_17,
                 A.APPLICATION_INFO_TYPE18                                                                  appl_supl_data_18_type,
                 A.APPLICATION_INFO18                                                                       appl_supl_data_18,
                 A.APPLICATION_INFO_TYPE19                                                                  appl_supl_data_19_type,
                 A.APPLICATION_INFO19                                                                       appl_supl_data_19,
                 A.APPLICATION_INFO_TYPE20                                                                  appl_supl_data_20_type,
                 A.APPLICATION_INFO20                                                                       appl_supl_data_20,
                 A.APPLICATION_DATE,
                 A.APPLICATION_STATUS_DATE,
                 A.APPLICATION_FEE_RECEIVED_DATE,
                 DECODE(A.APPLICATION_FEE_REQUIRED_IND,'Y', 1, 0)                                           application_fee_required_ind,
                 DECODE(A.COMPLETE_IND,'Y', 1, 0)                                                           application_complete_ind,
                 (SELECT 'Y'
                    FROM MTT_AR_DEPOSIT
                  WHERE ACCOUNT_UID = A.PERSON_UID
                      AND ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                      AND NVL(MIF_VALUE, ' ') = NVL(A.MIF_VALUE, ' ')
                      AND ROWNUM = 1
                 ) tuition_deposited_ind,
                 PD.*,
                 EN.enrolled_ind,
                 AC.start_date,
                 AC.end_date,
                 FY.aid_year,
                 SC.student_classification
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_ADMISSIONS_APPLICATION A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MST_ENROLLMENT EN,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 MGT_STUDENT_PERIOD_DEFINITION FY,
                 WCV_EXTR_STUD_CLASSIFICATION SC
           WHERE A.CURRICULUM_ORDER = 1
             AND ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
              AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
              AND WE.BANNER_PIDM = A.PERSON_UID
              --BLM mepped 7/29 for wdt_warehouse_entity
              and we.user_attribute_01 = a.mif_value
              AND A.PERSON_UID =  PD.PERSON_ID
              -- JOS update
              -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--              AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC
              AND A.PERSON_UID = EN.PERSON_UID(+)
              AND A.ACADEMIC_PERIOD = EN.ACADEMIC_PERIOD(+)
              AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(EN.MIF_VALUE(+), def_multi_source_in)
              AND AC.YEAR_TYPE(+) = 'ACYR'
              AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
              AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)
              AND A.PERSON_UID = FY.PERSON_UID(+)
              AND A.ACADEMIC_PERIOD = FY.ACADEMIC_PERIOD(+)
              AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(FY.MIF_VALUE(+), def_multi_source_in)
              AND A.PERSON_UID = SC.PERSON_UID(+)
              AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(SC.MIF_VALUE(+), def_multi_source_in)
              AND A.STUDENT_LEVEL = SC.STUDENT_LEVEL(+)
              AND (A.ACADEMIC_PERIOD >= SC.MIN_ACAD_PER(+) AND  A.ACADEMIC_PERIOD < SC.MAX_ACAD_PER(+) ) ;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)                                                      multi_source,
                 A.ZONE_VALUE                                                                               process_group,
                 A.DOMAIN_VALUE                                                                             administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                                                             warehouse_entity_uid,
                 A.APPLICATION_NUMBER,
                 A.APPLICATION_RANKING_ORDER,
                 A.APPLICATION_STATUS,
                 A.PRIMARY_SOURCE,
                 A.RECRUITER,
                 A.RECRUIT_TYPE,
                 A.WITHDRAWAL_REASON,
                 A.INSTITUTION_ATTENDING,
                 A.STUDENT_POPULATION,
                 A.ADMISSIONS_POPULATION,
                 A.FULL_PART_TIME_IND                                                                       intended_time_status,
                 A.EDUCATION_GOAL,
                 A.EDUCATION_LEVEL,
                 A.RESIDENCY,
                 DECODE(A.IN_OUT_STATE_IND,'I','Y','N')                                                     residency_ind,
                 A.SITE,
                 A.RATE,
                 NVL((SELECT 'Y' FROM MST_ADMISSIONS_APPLICATION AA
                       WHERE AA.PERSON_UID = A.PERSON_UID
                         AND AA.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                         AND AA.INQUIRER_IND = 'Y'
                         AND ROWNUM = 1), 'N')                                                              inquired_ind,
                 'Y'                                                                                        applied_ind,
                 NVL(A.INST_ADMIT_ANY_TIME_IND, 'N')                                                        admitted_ind,
                 NVL(A.APPL_ACCEPT_ANY_TIME_IND, 'N')                                                       accepted_ind,
                 NVL(A.INST_ADMIT_ANY_TIME_IND,'N')                                                         enrolled_tmp,
                 A.STUDENT_LEVEL,
                 A.PROGRAM,
                 A.CAMPUS,
                 A.COLLEGE,
                 A.AWARD_CATEGORY,
                 A.DEGREE,
                 A.MAJOR,
                 A.PROGRAM_CLASSIFICATION,
                 A.DEPARTMENT1                                                                              department,
                 A.SECOND_MAJOR,
                 A.SECOND_PROGRAM_CLASSIFICATION,
                 A.SECOND_DEPARTMENT,
                 A.POST_CODE_ADMIT,
                 A.COUNTY_ADMIT,
                 A.STATE_ADMIT,
                 A.NATION_ADMIT,
                 A.APPLICATION_IND_TYPE1                                                                    appl_supl_ind_01_type,
                 A.APPLICATION_IND1                                                                         appl_supl_ind_01,
                 A.APPLICATION_IND_TYPE2                                                                    appl_supl_ind_02_type,
                 A.APPLICATION_IND2                                                                         appl_supl_ind_02,
                 A.APPLICATION_IND_TYPE3                                                                    appl_supl_ind_03_type,
                 A.APPLICATION_IND3                                                                         appl_supl_ind_03,
                 A.APPLICATION_IND_TYPE4                                                                    appl_supl_ind_04_type,
                 A.APPLICATION_IND4                                                                         appl_supl_ind_04,
                 A.APPLICATION_IND_TYPE5                                                                    appl_supl_ind_05_type,
                 A.APPLICATION_IND5                                                                         appl_supl_ind_05,
                 A.APPLICATION_IND_TYPE6                                                                    appl_supl_ind_06_type,
                 A.APPLICATION_IND6                                                                         appl_supl_ind_06,
                 A.APPLICATION_IND_TYPE7                                                                    appl_supl_ind_07_type,
                 A.APPLICATION_IND7                                                                         appl_supl_ind_07,
                 A.APPLICATION_IND_TYPE8                                                                    appl_supl_ind_08_type,
                 A.APPLICATION_IND8                                                                         appl_supl_ind_08,
                 A.APPLICATION_IND_TYPE9                                                                    appl_supl_ind_09_type,
                 A.APPLICATION_IND9                                                                         appl_supl_ind_09,
                 A.APPLICATION_IND_TYPE10                                                                   appl_supl_ind_10_type,
                 A.APPLICATION_IND10                                                                        appl_supl_ind_10,
                 A.APPLICATION_INFO_TYPE1                                                                   appl_supl_data_01_type,
                 A.APPLICATION_INFO1                                                                        appl_supl_data_01,
                 A.APPLICATION_INFO_TYPE2                                                                   appl_supl_data_02_type,
                 A.APPLICATION_INFO2                                                                        appl_supl_data_02,
                 A.APPLICATION_INFO_TYPE3                                                                   appl_supl_data_03_type,
                 A.APPLICATION_INFO3                                                                        appl_supl_data_03,
                 A.APPLICATION_INFO_TYPE4                                                                   appl_supl_data_04_type,
                 A.APPLICATION_INFO4                                                                        appl_supl_data_04,
                 A.APPLICATION_INFO_TYPE5                                                                   appl_supl_data_05_type,
                 A.APPLICATION_INFO5                                                                        appl_supl_data_05,
                 A.APPLICATION_INFO_TYPE6                                                                   appl_supl_data_06_type,
                 A.APPLICATION_INFO6                                                                        appl_supl_data_06,
                 A.APPLICATION_INFO_TYPE7                                                                   appl_supl_data_07_type,
                 A.APPLICATION_INFO7                                                                        appl_supl_data_07,
                 A.APPLICATION_INFO_TYPE8                                                                   appl_supl_data_08_type,
                 A.APPLICATION_INFO8                                                                        appl_supl_data_08,
                 A.APPLICATION_INFO_TYPE9                                                                   appl_supl_data_09_type,
                 A.APPLICATION_INFO9                                                                        appl_supl_data_09,
                 A.APPLICATION_INFO_TYPE10                                                                  appl_supl_data_10_type,
                 A.APPLICATION_INFO10                                                                       appl_supl_data_10,
                 A.APPLICATION_INFO_TYPE11                                                                  appl_supl_data_11_type,
                 A.APPLICATION_INFO11                                                                       appl_supl_data_11,
                 A.APPLICATION_INFO_TYPE12                                                                  appl_supl_data_12_type,
                 A.APPLICATION_INFO12                                                                       appl_supl_data_12,
                 A.APPLICATION_INFO_TYPE13                                                                  appl_supl_data_13_type,
                 A.APPLICATION_INFO13                                                                       appl_supl_data_13,
                 A.APPLICATION_INFO_TYPE14                                                                  appl_supl_data_14_type,
                 A.APPLICATION_INFO14                                                                       appl_supl_data_14,
                 A.APPLICATION_INFO_TYPE15                                                                  appl_supl_data_15_type,
                 A.APPLICATION_INFO15                                                                       appl_supl_data_15,
                 A.APPLICATION_INFO_TYPE16                                                                  appl_supl_data_16_type,
                 A.APPLICATION_INFO16                                                                       appl_supl_data_16,
                 A.APPLICATION_INFO_TYPE17                                                                  appl_supl_data_17_type,
                 A.APPLICATION_INFO17                                                                       appl_supl_data_17,
                 A.APPLICATION_INFO_TYPE18                                                                  appl_supl_data_18_type,
                 A.APPLICATION_INFO18                                                                       appl_supl_data_18,
                 A.APPLICATION_INFO_TYPE19                                                                  appl_supl_data_19_type,
                 A.APPLICATION_INFO19                                                                       appl_supl_data_19,
                 A.APPLICATION_INFO_TYPE20                                                                  appl_supl_data_20_type,
                 A.APPLICATION_INFO20                                                                       appl_supl_data_20,
                 A.APPLICATION_DATE,
                 A.APPLICATION_STATUS_DATE,
                 A.APPLICATION_FEE_RECEIVED_DATE,
                 DECODE(A.APPLICATION_FEE_REQUIRED_IND,'Y', 1, 0)                                           application_fee_required_ind,
                 DECODE(A.COMPLETE_IND,'Y', 1, 0)                                                           application_complete_ind,
                 (SELECT 'Y'
                    FROM MTT_AR_DEPOSIT
                  WHERE ACCOUNT_UID = A.PERSON_UID
                      AND ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                      AND NVL(MIF_VALUE, ' ') = NVL(A.MIF_VALUE, ' ')
                      AND ROWNUM = 1
                 ) tuition_deposited_ind,
                 PD.*,
                 EN.enrolled_ind,
                 AC.start_date,
                 AC.end_date,
                 FY.aid_year,
                 SC.student_classification
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_ADMISSIONS_APPLICATION A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MST_ENROLLMENT EN,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 MGT_STUDENT_PERIOD_DEFINITION FY,
                 WCV_EXTR_STUD_CLASSIFICATION SC,
                 CHG_ADMISSIONS_APPLICATION CHG
           WHERE A.CURRICULUM_ORDER = 1
             AND CHG.PERSON_UID = A.PERSON_UID
              AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
              --BLM mepped 7/29 for wdt_warehouse_entity
              and we.user_attribute_01 = a.mif_value
              AND WE.BANNER_PIDM = A.PERSON_UID
              AND A.PERSON_UID =  PD.PERSON_ID
              --JOS Update
              -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
	      --AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC
              AND A.PERSON_UID = EN.PERSON_UID(+)
              AND A.ACADEMIC_PERIOD = EN.ACADEMIC_PERIOD(+)
              AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(EN.MIF_VALUE(+), def_multi_source_in)
              AND AC.YEAR_TYPE(+) = 'ACYR'
              AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
              AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)
              AND A.PERSON_UID = FY.PERSON_UID(+)
              AND A.ACADEMIC_PERIOD = FY.ACADEMIC_PERIOD(+)
              AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(FY.MIF_VALUE(+), def_multi_source_in)
              AND A.PERSON_UID = SC.PERSON_UID(+)
              AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(SC.MIF_VALUE(+), def_multi_source_in)
              AND A.STUDENT_LEVEL = SC.STUDENT_LEVEL(+)
              AND (A.ACADEMIC_PERIOD >= SC.MIN_ACAD_PER(+) AND  A.ACADEMIC_PERIOD < SC.MAX_ACAD_PER(+) ) ;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_ADMISSIONS_APPLICATION', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_ADMISSIONS_APPLICATION', 'WFT_ADMISSIONS_APPLICATION', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','NULL_NATION','NULL_NATION_VALUE');
    FETCH edw_general_extr.get_mtvparm INTO null_nation_rec;
    CLOSE edw_general_extr.get_mtvparm;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        application_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        application_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH application_info_cur BULK COLLECT INTO application_info_recs LIMIT bulk_size;
       EXIT WHEN application_info_recs.COUNT = 0;
--
       IF application_info_recs.COUNT > 0 AND fetch_finaid_details THEN
--
          fetch_finaid_details := FALSE;
--
          FOR finaid_appl_amts in edw_finaid_extr.get_finaid_appl_amts(default_rec.multi_source_cleanse_value, 'ALL') LOOP
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).APPLICATION_IND :=finaid_appl_amts.APPLICATION_IND;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).DEPENDENCY_IND :=finaid_appl_amts.DEPENDENCY_IND;
          END LOOP;
--
          FOR finaid_appl_need in edw_finaid_extr.get_finaid_appl_need(default_rec.multi_source_cleanse_value, 'ALL') LOOP
              finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN || '{' ||  finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).AID_PERIOD :=finaid_appl_need.AID_PERIOD;
              finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN || '{' ||  finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).FM_NEED_ELIGIBLE_IND :=finaid_appl_need.FM_NEED_ELIGIBLE_IND;
              finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).FM_FULLY_MET_NEED_IND :=finaid_appl_need.FM_FULLY_MET_NEED_IND;
              finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).IM_NEED_ELIGIBLE_IND :=finaid_appl_need.IM_NEED_ELIGIBLE_IND;
              finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).IM_FULLY_MET_NEED_IND :=finaid_appl_need.IM_FULLY_MET_NEED_IND;
          END LOOP;
--
          FOR offer_composition_amt in edw_finaid_extr.get_total_offer_amts_acad_pd(default_rec.multi_source_cleanse_value) LOOP
               total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_OFFERED_IND :=offer_composition_amt.AWARD_OFFERED_IND;
               total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_ACCEPTED_IND :=offer_composition_amt.AWARD_ACCEPTED_IND;
               total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_DECLINED_IND :=offer_composition_amt.AWARD_DECLINED_IND;
               total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_CANCELED_IND :=offer_composition_amt.AWARD_CANCELED_IND;
               total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_PAID_IND :=offer_composition_amt.AWARD_PAID_IND;
          END LOOP;
--
          FOR application_ind in edw_finaid_extr.get_application_inds(default_rec.multi_source_cleanse_value, 'ALL') LOOP
              application_ind_recs(application_ind.MULTI_SRC_IN ||   '{' || application_ind.PERSON_UID ||   '{' || application_ind.AID_YEAR ).FM_APPLICATION_IND :=application_ind.FM_APPLICATION_IND;
              application_ind_recs(application_ind.MULTI_SRC_IN ||   '{' || application_ind.PERSON_UID ||   '{' || application_ind.AID_YEAR ).IM_APPLICATION_IND :=application_ind.IM_APPLICATION_IND;
          END LOOP;
--
      END IF;
--
      FOR i IN application_info_recs.FIRST..application_info_recs.LAST
      LOOP
--
         finaid_indx         := application_info_recs(i).multi_source || '{' || application_info_recs(i).person_uid || '{' ||  application_info_recs(i).aid_year;
         finaid_ap_indx    := application_info_recs(i).multi_source || '{' || application_info_recs(i).person_uid || '{' ||  application_info_recs(i).academic_period;
--
         ret_row.multi_source := application_info_recs(i).multi_source;
         ret_row.process_group := application_info_recs(i).process_group;
         ret_row.administrative_group := application_info_recs(i).administrative_group;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.msrc_user_attribute_01 := NULL;
         ret_row.msrc_user_attribute_01 := ret_row.multi_source;
         ret_row.msrc_user_attribute_02 := NULL;
         ret_row.msrc_user_attribute_03 := NULL;
         ret_row.msrc_user_attribute_04 := NULL;
         ret_row.msrc_user_attribute_05 := NULL;
         ret_row.academic_period := application_info_recs(i).academic_period;
         ret_row.academic_period_begin_date := application_info_recs(i).start_date;
         ret_row.academic_period_end_date := application_info_recs(i).end_date;
         ret_row.academic_year := application_info_recs(i).academic_year;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.atim_user_attribute_01 := NULL;
         ret_row.atim_user_attribute_01 := ret_row.multi_source;
         ret_row.atim_user_attribute_02 := NULL;
         ret_row.atim_user_attribute_03 := NULL;
         ret_row.atim_user_attribute_04 := NULL;
         ret_row.atim_user_attribute_05 := NULL;
         ret_row.financial_aid_year := application_info_recs(i).aid_year;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.fayr_user_attribute_01 := NULL;
         ret_row.fayr_user_attribute_01 := ret_row.multi_source;
         ret_row.fayr_user_attribute_02 := NULL;
         ret_row.fayr_user_attribute_03 := NULL;
         ret_row.fayr_user_attribute_04 := NULL;
         ret_row.fayr_user_attribute_05 := NULL;
         ret_row.person_uid := application_info_recs(i).warehouse_entity_uid;
         ret_row.id := application_info_recs(i).id;
         ret_row.full_name_lfmi := application_info_recs(i).full_name_lfmi;
         ret_row.birth_date := application_info_recs(i).birth_date;
         ret_row.deceased_date := application_info_recs(i).deceased_date;
         ret_row.email_address := application_info_recs(i).email_address;
         ret_row.phone_number_combined := application_info_recs(i).phone_number_combined;
         ret_row.confidentiality_ind := application_info_recs(i).confidentiality_ind;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.pers_user_attribute_01 := NULL;
         ret_row.pers_user_attribute_01 := ret_row.multi_source;
         ret_row.pers_user_attribute_02 := NULL;
         ret_row.pers_user_attribute_03 := NULL;
         ret_row.pers_user_attribute_04 := NULL;
         ret_row.pers_user_attribute_05 := NULL;
         ret_row.gender := application_info_recs(i).gender;
         ret_row.ethnicity_category := application_info_recs(i).ethnicity_category;
         ret_row.hispanic_latino_ethn_ind := application_info_recs(i).hispanic_latino_ethnicity_ind;
         ret_row.asian_ind := application_info_recs(i).asian_ind;
         ret_row.native_amer_or_alaskan_ind := application_info_recs(i).native_american_or_alaskan_ind;
         ret_row.black_or_african_ind := application_info_recs(i).black_or_african_ind;
         ret_row.pacific_islander_ind := application_info_recs(i).pacific_islander_ind;
         ret_row.white_ind := application_info_recs(i).white_ind;
         IF  application_info_recs(i).number_of_races = 0 and  application_info_recs(i).resident_alien_visa_count > 0 THEN
            ret_row.non_resident_ind := 'Y';
         ELSE
            ret_row.non_resident_ind := 'N';
         END IF;
         IF NVL(application_info_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND application_info_recs(i).number_of_races = 0 AND application_info_recs(i).resident_alien_visa_count = 0 THEN
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
         ELSE
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
         END IF;
         ret_row.two_or_more_ind := application_info_recs(i).two_or_more_ind;
         ret_row.race_ethnicity_confirm_ind := application_info_recs(i).race_ethnicity_confirm_ind;
         ret_row.minority_ind := application_info_recs(i).minority_ind;
         ret_row.ethnicity := application_info_recs(i).ethnicity;
         ret_row.deceased_ind := application_info_recs(i).deceased_ind;
         ret_row.citizenship_ind := application_info_recs(i).citizenship_ind;
         ret_row.citizenship_type := application_info_recs(i).citizenship_type;
         ret_row.visa_type := application_info_recs(i).visa_type;
         ret_row.nation_of_citizenship := application_info_recs(i).nation_of_citizenship;
         ret_row.nation_of_birth := application_info_recs(i).nation_of_birth;
         ret_row.primary_disability := application_info_recs(i).primary_disability;
         ret_row.legacy := application_info_recs(i).legacy;
         ret_row.marital_status := application_info_recs(i).marital_status;
         ret_row.religion := application_info_recs(i).religion;
         ret_row.veteran_type := application_info_recs(i).veteran_type;
         ret_row.veteran_category := application_info_recs(i).veteran_category;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.demo_user_attribute_01 := NULL;
         ret_row.demo_user_attribute_01 := ret_row.multi_source;
         ret_row.demo_user_attribute_02 := NULL;
         ret_row.demo_user_attribute_03 := NULL;
         ret_row.demo_user_attribute_04 := NULL;
         ret_row.demo_user_attribute_05 := NULL;
         ret_row.application_number := application_info_recs(i).application_number;
         ret_row.application_ranking := NVL(application_info_recs(i).application_ranking_order, 0);
         ret_row.application_status := application_info_recs(i).application_status;
         ret_row.primary_source := application_info_recs(i).primary_source;
         ret_row.recruiter := application_info_recs(i).recruiter;
         ret_row.recruit_type := application_info_recs(i).recruit_type;
         ret_row.withdrawal_reason := application_info_recs(i).withdrawal_reason;
         ret_row.institution_attending := application_info_recs(i).institution_attending;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.sapp_user_attribute_01 := NULL;
         ret_row.sapp_user_attribute_01 := ret_row.multi_source;
         ret_row.sapp_user_attribute_02 := NULL;
         ret_row.sapp_user_attribute_03 := NULL;
         ret_row.sapp_user_attribute_04 := NULL;
         ret_row.sapp_user_attribute_05 := NULL;
         ret_row.student_population := application_info_recs(i).student_population;
         ret_row.admissions_population := application_info_recs(i).admissions_population;
         ret_row.intended_time_status := application_info_recs(i).intended_time_status;
         ret_row.student_classification := application_info_recs(i).student_classification;
         ret_row.education_goal := application_info_recs(i).education_goal;
         ret_row.education_level := application_info_recs(i).education_level;
         ret_row.residency := application_info_recs(i).residency;
         ret_row.residency_ind := application_info_recs(i).residency_ind;
         ret_row.housing_ind := NULL;
         ret_row.site := application_info_recs(i).site;
         ret_row.rate := application_info_recs(i).rate;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.stud_user_attribute_01 := NULL;
         ret_row.stud_user_attribute_01 := ret_row.multi_source;
         ret_row.stud_user_attribute_02 := NULL;
         ret_row.stud_user_attribute_03 := NULL;
         ret_row.stud_user_attribute_04 := NULL;
         ret_row.stud_user_attribute_05 := NULL;
         ret_row.inquired_ind := application_info_recs(i).inquired_ind;
         ret_row.applied_ind := application_info_recs(i).applied_ind;
         ret_row.admitted_ind := application_info_recs(i).admitted_ind;
         ret_row.accepted_ind := application_info_recs(i).accepted_ind;
         ret_row.tuition_deposited_ind := NVL(application_info_recs(i).tuition_deposited_ind, 'N');
         IF application_info_recs(i).enrolled_tmp = 'N' THEN
           ret_row.enrolled_ind := 'N';
         ELSE
           ret_row.enrolled_ind := NVL(application_info_recs(i).enrolled_ind, 'N');
         END IF;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.pstd_user_attribute_01 := NULL;
         ret_row.pstd_user_attribute_01 := ret_row.multi_source;
         ret_row.pstd_user_attribute_02 := NULL;
         ret_row.pstd_user_attribute_03 := NULL;
         ret_row.pstd_user_attribute_04 := NULL;
         ret_row.pstd_user_attribute_05 := NULL;
         ret_row.student_level := application_info_recs(i).student_level;
         ret_row.program := application_info_recs(i).program;
         ret_row.campus := application_info_recs(i).campus;
         ret_row.college := application_info_recs(i).college;
         ret_row.award_category := application_info_recs(i).award_category;
         ret_row.degree := application_info_recs(i).degree;
         ret_row.major := application_info_recs(i).major;
         ret_row.program_classification := application_info_recs(i).program_classification;
         ret_row.department := application_info_recs(i).department;
         ret_row.second_major := application_info_recs(i).second_major;
         ret_row.second_prog_classification := application_info_recs(i).second_program_classification;
         ret_row.second_department := application_info_recs(i).second_department;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.astd_user_attribute_01 := NULL;
         ret_row.astd_user_attribute_01 := ret_row.multi_source;
         ret_row.astd_user_attribute_02 := NULL;
         ret_row.astd_user_attribute_03 := NULL;
         ret_row.astd_user_attribute_04 := NULL;
         ret_row.astd_user_attribute_05 := NULL;
         --need to mep MRKFUNC function call
         --ret_row.financial_aid_applicant_ind := mrkfunc.f_finaid_applicant_ind(application_info_recs(i).person_uid, application_info_recs(i).academic_period);
         ret_row.financial_aid_applicant_ind := mrkfunc.f_finaid_applicant_ind(application_info_recs(i).multi_source, application_info_recs(i).person_uid, application_info_recs(i).academic_period);
         IF finaid_appl_amt_recs.EXISTS(finaid_indx) THEN
            ret_row.finaid_application_ind := NVL(finaid_appl_amt_recs(finaid_indx).application_ind,'N');
            ret_row.dependent_ind := finaid_appl_amt_recs(finaid_indx).dependency_ind;
         ELSE
            ret_row.finaid_application_ind := 'N';
         END IF;
         IF application_ind_recs.EXISTS(finaid_indx) THEN
           ret_row.fm_application_ind := NVL(application_ind_recs(finaid_indx).fm_application_ind,'N');
           ret_row.im_application_ind := NVL(application_ind_recs(finaid_indx).im_application_ind,'N');
         ELSE
            ret_row.fm_application_ind := 'N';
            ret_row.im_application_ind := 'N';
         END IF;
         IF total_offer_amts_acad_pd_recs.EXISTS(finaid_ap_indx) THEN
              ret_row.award_offered_ind := total_offer_amts_acad_pd_recs(finaid_ap_indx).award_offered_ind;
              ret_row.award_accepted_ind := total_offer_amts_acad_pd_recs(finaid_ap_indx).award_accepted_ind;
              ret_row.award_declined_ind := total_offer_amts_acad_pd_recs(finaid_ap_indx).award_declined_ind;
              ret_row.award_canceled_ind := total_offer_amts_acad_pd_recs(finaid_ap_indx).award_canceled_ind;
              ret_row.award_paid_ind := total_offer_amts_acad_pd_recs(finaid_ap_indx).award_paid_ind;
         END IF;
         IF finaid_appl_need_recs.EXISTS(finaid_indx) THEN
              ret_row.fm_need_eligible_ind := finaid_appl_need_recs(finaid_indx).fm_need_eligible_ind;
              ret_row.fm_fully_met_need_ind := finaid_appl_need_recs(finaid_indx).fm_fully_met_need_ind;
              ret_row.im_need_eligible_ind := finaid_appl_need_recs(finaid_indx).im_need_eligible_ind;
              ret_row.im_fully_met_need_ind := finaid_appl_need_recs(finaid_indx).im_fully_met_need_ind;
         END IF;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.fast_user_attribute_01 := NULL;
         ret_row.fast_user_attribute_01 := ret_row.multi_source;
         ret_row.fast_user_attribute_02 := NULL;
         ret_row.fast_user_attribute_03 := NULL;
         ret_row.fast_user_attribute_04 := NULL;
         ret_row.fast_user_attribute_05 := NULL;
         ret_row.postal_code := nvl(application_info_recs(i).post_code_admit,default_rec.null_cleanse_value);
         ret_row.city := default_rec.null_cleanse_value;
         ret_row.county := application_info_recs(i).county_admit;
         ret_row.state_province := application_info_recs(i).state_admit;
         IF application_info_recs(i).state_admit IS NOT NULL THEN
           ret_row.nation := NVL(application_info_recs(i).nation_admit, null_nation_rec.mtvparm_external_code);
         ELSE
           ret_row.nation := application_info_recs(i).nation_admit;
         END IF;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.post_user_attribute_01 := NULL;
         ret_row.post_user_attribute_01 := ret_row.multi_source;
         ret_row.post_user_attribute_02 := NULL;
         ret_row.post_user_attribute_03 := NULL;
         ret_row.post_user_attribute_04 := NULL;
         ret_row.post_user_attribute_05 := NULL;
         ret_row.appl_supl_ind_01 := application_info_recs(i).appl_supl_ind_01;
         ret_row.appl_supl_ind_01_type := nvl(application_info_recs(i).appl_supl_ind_01_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_ind_02 := application_info_recs(i).appl_supl_ind_02;
         ret_row.appl_supl_ind_02_type := nvl(application_info_recs(i).appl_supl_ind_02_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_ind_03 := application_info_recs(i).appl_supl_ind_03;
         ret_row.appl_supl_ind_03_type := nvl(application_info_recs(i).appl_supl_ind_03_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_ind_04 := application_info_recs(i).appl_supl_ind_04;
         ret_row.appl_supl_ind_04_type := nvl(application_info_recs(i).appl_supl_ind_04_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_ind_05 := application_info_recs(i).appl_supl_ind_05;
         ret_row.appl_supl_ind_05_type := nvl(application_info_recs(i).appl_supl_ind_05_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_ind_06 := application_info_recs(i).appl_supl_ind_06;
         ret_row.appl_supl_ind_06_type := nvl(application_info_recs(i).appl_supl_ind_06_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_ind_07 := application_info_recs(i).appl_supl_ind_07;
         ret_row.appl_supl_ind_07_type := nvl(application_info_recs(i).appl_supl_ind_07_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_ind_08 := application_info_recs(i).appl_supl_ind_08;
         ret_row.appl_supl_ind_08_type := nvl(application_info_recs(i).appl_supl_ind_08_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_ind_09 := application_info_recs(i).appl_supl_ind_09;
         ret_row.appl_supl_ind_09_type := nvl(application_info_recs(i).appl_supl_ind_09_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_ind_10 := application_info_recs(i).appl_supl_ind_10;
         ret_row.appl_supl_ind_10_type := nvl(application_info_recs(i).appl_supl_ind_10_type,default_rec.null_cleanse_value);
         --BLM mepped 6/2/14 for security reasons
         --ret_row.appl_supl_ind_attribute_01 := NULL;
         ret_row.appl_supl_ind_attribute_01 := ret_row.multi_source;
         ret_row.appl_supl_ind_attribute_02 := NULL;
         ret_row.appl_supl_ind_attribute_03 := NULL;
         ret_row.appl_supl_ind_attribute_04 := NULL;
         ret_row.appl_supl_ind_attribute_05 := NULL;
         ret_row.appl_supl_data_01 := application_info_recs(i).appl_supl_data_01;
         ret_row.appl_supl_data_01_type := nvl(application_info_recs(i).appl_supl_data_01_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_02 := application_info_recs(i).appl_supl_data_02;
         ret_row.appl_supl_data_02_type := nvl(application_info_recs(i).appl_supl_data_02_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_03 := application_info_recs(i).appl_supl_data_03;
         ret_row.appl_supl_data_03_type := nvl(application_info_recs(i).appl_supl_data_03_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_04 := application_info_recs(i).appl_supl_data_04;
         ret_row.appl_supl_data_04_type := nvl(application_info_recs(i).appl_supl_data_04_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_05 := application_info_recs(i).appl_supl_data_05;
         ret_row.appl_supl_data_05_type := nvl(application_info_recs(i).appl_supl_data_05_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_06 := application_info_recs(i).appl_supl_data_06;
         ret_row.appl_supl_data_06_type := nvl(application_info_recs(i).appl_supl_data_06_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_07 := application_info_recs(i).appl_supl_data_07;
         ret_row.appl_supl_data_07_type := nvl(application_info_recs(i).appl_supl_data_07_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_08 := application_info_recs(i).appl_supl_data_08;
         ret_row.appl_supl_data_08_type := nvl(application_info_recs(i).appl_supl_data_08_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_09 := application_info_recs(i).appl_supl_data_09;
         ret_row.appl_supl_data_09_type := nvl(application_info_recs(i).appl_supl_data_09_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_10 := application_info_recs(i).appl_supl_data_10;
         ret_row.appl_supl_data_10_type := nvl(application_info_recs(i).appl_supl_data_10_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_11 := application_info_recs(i).appl_supl_data_11;
         ret_row.appl_supl_data_11_type := nvl(application_info_recs(i).appl_supl_data_11_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_12 := application_info_recs(i).appl_supl_data_12;
         ret_row.appl_supl_data_12_type := nvl(application_info_recs(i).appl_supl_data_12_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_13 := application_info_recs(i).appl_supl_data_13;
         ret_row.appl_supl_data_13_type := nvl(application_info_recs(i).appl_supl_data_13_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_14 := application_info_recs(i).appl_supl_data_14;
         ret_row.appl_supl_data_14_type := nvl(application_info_recs(i).appl_supl_data_14_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_15 := application_info_recs(i).appl_supl_data_15;
         ret_row.appl_supl_data_15_type := nvl(application_info_recs(i).appl_supl_data_15_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_16 := application_info_recs(i).appl_supl_data_16;
         ret_row.appl_supl_data_16_type := nvl(application_info_recs(i).appl_supl_data_16_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_17 := application_info_recs(i).appl_supl_data_17;
         ret_row.appl_supl_data_17_type := nvl(application_info_recs(i).appl_supl_data_17_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_18 := application_info_recs(i).appl_supl_data_18;
         ret_row.appl_supl_data_18_type := nvl(application_info_recs(i).appl_supl_data_18_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_19 := application_info_recs(i).appl_supl_data_19;
         ret_row.appl_supl_data_19_type := nvl(application_info_recs(i).appl_supl_data_19_type,default_rec.null_cleanse_value);
         ret_row.appl_supl_data_20 := application_info_recs(i).appl_supl_data_20;
         ret_row.appl_supl_data_20_type := nvl(application_info_recs(i).appl_supl_data_20_type,default_rec.null_cleanse_value);
         --BLM mepped 6/2/14 for security reasons
         --ret_row.appl_supl_data_attribute_01 := NULL;
         ret_row.appl_supl_data_attribute_01 := ret_row.multi_source;
         ret_row.appl_supl_data_attribute_02 := NULL;
         ret_row.appl_supl_data_attribute_03 := NULL;
         ret_row.appl_supl_data_attribute_04 := NULL;
         ret_row.appl_supl_data_attribute_05 := NULL;
         ret_row.application_date := TRUNC(NVL(application_info_recs(i).application_date, '31-DEC-2099'));
         ret_row.application_status_date := TRUNC(NVL(application_info_recs(i).application_status_date, '31-DEC-2099'));
         ret_row.application_fee_received_date := TRUNC(NVL(application_info_recs(i).application_fee_received_date, '31-DEC-2099'));
         ret_row.application_fee_required_ind := application_info_recs(i).application_fee_required_ind;
         ret_row.application_complete_ind := application_info_recs(i).application_complete_ind;
         ret_row.user_measure_01 := NULL;
         ret_row.user_measure_02 := NULL;
         ret_row.user_measure_03 := NULL;
         ret_row.user_measure_04 := NULL;
         ret_row.user_measure_05 := NULL;
         ret_row.system_load_process := 'ADMISSIONS_APPLICATION';
--
         PIPE ROW(ret_row);
--
         ret_row := ret_row_init;
--
      END LOOP; -- admissions_appl_rec
--
    END LOOP;
--
    CLOSE application_info_cur;
--
    RETURN;
--
  END f_get_admissions_application;
/******************************************************************************/
  FUNCTION f_get_test(process_ind_in VARCHAR2,
                      process_date DATE,
                      debug_var_in VARCHAR2 DEFAULT NULL)
                      RETURN tab_test_extr PIPELINED IS
--
    ret_row                     WTT_TEST_INPUT%ROWTYPE;
    ret_row_init                WTT_TEST_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE test_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          TEST                                    VARCHAR2(63),
          TEST_SOURCE                             VARCHAR2(63),
          TEST_SCORE                              NUMBER,
          TEST_DATE                               DATE,
          LATEST_TEST_DATE_IND                    NUMBER,
          HIGHEST_TEST_SCORE_IND                  NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    test_cur       refCurType;
    test_rec        test_rec_type;
    TYPE tab_test_rec_type   IS TABLE OF test_rec_type INDEX BY PLS_INTEGER;
    test_recs        tab_test_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT 
          --BLM 7/29/14 put in we.mif_value instead of a.mif_value as mst_test is not mepped and WE alias is mepped
                 NVL(we.user_attribute_01, def_multi_source_in)    multi_source,
                 A.ZONE_VALUE                             process_group,
                 A.DOMAIN_VALUE                           administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)           warehouse_entity_uid,
                 A.TEST,
                 A.TEST_SOURCE,
                 EDW_GENERAL_EXTR.F_SAFE_TO_NUMBER(A.TEST_SCORE)  TEST_SCORE,
                 A.TEST_DATE,
                 ROW_NUMBER() OVER (PARTITION BY A.PERSON_UID, A.TEST ORDER BY A.TEST_DATE DESC) AS latest_test_date_ind,
                 ROW_NUMBER() OVER (PARTITION BY A.PERSON_UID, A.TEST ORDER BY A.TEST_SCORE DESC) AS highest_test_score_ind,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_TEST A,
                 WCV_EXTR_PERSON_DETAILS PD
           WHERE
             (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND EDW_GENERAL_EXTR.F_SAFE_TO_NUMBER(A.TEST_SCORE) IS NOT NULL
             --BLM note:  mst_test not mepped, should just leave MEP join out here. We will get 13 records for each person but nothing we can do about that
             --Unless we were to MEP (aka, cartesian) mst_test, which we aren't going to do
             AND WE.BANNER_PIDM = A.PERSON_UID
             AND A.PERSON_UID =  PD.PERSON_ID;
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT 
                    --BLM 7/29/14 put in we.mif_value instead of a.mif_value as mst_test is not mepped and WE alias is mepped
          --DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)    multi_source,
          DISTINCT NVL(we.user_attribute_01, def_multi_source_in)    multi_source,
                 A.ZONE_VALUE                             process_group,
                 A.DOMAIN_VALUE                           administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)           warehouse_entity_uid,
                 A.TEST,
                 A.TEST_SOURCE,
                 EDW_GENERAL_EXTR.F_SAFE_TO_NUMBER(A.TEST_SCORE)  TEST_SCORE,
                 A.TEST_DATE,
                 ROW_NUMBER() OVER (PARTITION BY A.PERSON_UID, A.TEST ORDER BY A.TEST_DATE DESC) AS latest_test_date_ind,
                 ROW_NUMBER() OVER (PARTITION BY A.PERSON_UID, A.TEST ORDER BY A.TEST_SCORE DESC) AS highest_test_score_ind,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_TEST A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 CHG_TEST CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND EDW_GENERAL_EXTR.F_SAFE_TO_NUMBER(A.TEST_SCORE) IS NOT NULL
             AND WE.BANNER_PIDM = A.PERSON_UID
             AND A.PERSON_UID =  PD.PERSON_ID;
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_TEST');
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_TEST', 'WFT_TEST', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        test_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        test_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH test_cur BULK COLLECT INTO test_recs LIMIT bulk_size;
       EXIT WHEN test_recs.COUNT = 0;
--
       FOR i IN test_recs.FIRST..test_recs.LAST
       LOOP
--
         ret_row.multi_source := test_recs(i).multi_source;
         ret_row.process_group := test_recs(i).process_group;
         ret_row.administrative_group := test_recs(i).administrative_group;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.msrc_user_attribute_01 := NULL;
         ret_row.msrc_user_attribute_01 := ret_row.multi_source;
         ret_row.msrc_user_attribute_02 := NULL;
         ret_row.msrc_user_attribute_03 := NULL;
         ret_row.msrc_user_attribute_04 := NULL;
         ret_row.msrc_user_attribute_05 := NULL;
         ret_row.person_uid := test_recs(i).warehouse_entity_uid;
         ret_row.id := test_recs(i).id;
         ret_row.full_name_lfmi := test_recs(i).full_name_lfmi;
         ret_row.birth_date := test_recs(i).birth_date;
         ret_row.deceased_date := test_recs(i).deceased_date;
         ret_row.email_address := test_recs(i).email_address;
         ret_row.phone_number_combined := test_recs(i).phone_number_combined;
         ret_row.confidentiality_ind := test_recs(i).confidentiality_ind;
         --BLM mepped 6/2/14 for security reasons
         ret_row.pers_user_attribute_01 := ret_row.multi_source;
         ret_row.pers_user_attribute_02 := NULL;
         ret_row.pers_user_attribute_03 := NULL;
         ret_row.pers_user_attribute_04 := NULL;
         ret_row.pers_user_attribute_05 := NULL;
         ret_row.gender := test_recs(i).gender;
         ret_row.ethnicity_category := test_recs(i).ethnicity_category;
         ret_row.hispanic_latino_ethn_ind := test_recs(i).hispanic_latino_ethnicity_ind;
         ret_row.asian_ind := test_recs(i).asian_ind;
         ret_row.native_amer_or_alaskan_ind := test_recs(i).native_american_or_alaskan_ind;
         ret_row.black_or_african_ind := test_recs(i).black_or_african_ind;
         ret_row.pacific_islander_ind := test_recs(i).pacific_islander_ind;
         ret_row.white_ind := test_recs(i).white_ind;
         IF test_recs(i).number_of_races = 0 and test_recs(i).resident_alien_visa_count > 0 THEN
            ret_row.non_resident_ind := 'Y';
         ELSE
            ret_row.non_resident_ind := 'N';
         END IF;
         IF NVL(test_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND test_recs(i).number_of_races = 0 AND test_recs(i).resident_alien_visa_count = 0 THEN
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
         ELSE
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
         END IF;
         ret_row.two_or_more_ind := test_recs(i).two_or_more_ind;
         ret_row.race_ethnicity_confirm_ind := test_recs(i).race_ethnicity_confirm_ind;
         ret_row.minority_ind := test_recs(i).minority_ind;
         ret_row.ethnicity := test_recs(i).ethnicity;
         ret_row.deceased_ind := test_recs(i).deceased_ind;
         ret_row.citizenship_ind := test_recs(i).citizenship_ind;
         ret_row.citizenship_type := test_recs(i).citizenship_type;
         ret_row.visa_type := test_recs(i).visa_type;
         ret_row.nation_of_citizenship := test_recs(i).nation_of_citizenship;
         ret_row.nation_of_birth := test_recs(i).nation_of_birth;
         ret_row.primary_disability := test_recs(i).primary_disability;
         ret_row.legacy := test_recs(i).legacy;
         ret_row.marital_status := test_recs(i).marital_status;
         ret_row.religion := test_recs(i).religion;
         ret_row.veteran_type := test_recs(i).veteran_type;
         ret_row.veteran_category := test_recs(i).veteran_category;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.demo_user_attribute_01 := NULL;
         ret_row.demo_user_attribute_01 := ret_row.multi_source;
         ret_row.demo_user_attribute_02 := NULL;
         ret_row.demo_user_attribute_03 := NULL;
         ret_row.demo_user_attribute_04 := NULL;
         ret_row.demo_user_attribute_05 := NULL;
         ret_row.test := test_recs(i).test;
         ret_row.test_source := test_recs(i).test_source;
         ret_row.test_score_range := test_recs(i).test_score;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.test_user_attribute_01 := NULL;
         ret_row.test_user_attribute_01 := ret_row.multi_source;
         ret_row.test_user_attribute_02 := NULL;
         ret_row.test_user_attribute_03 := NULL;
         ret_row.test_user_attribute_04 := NULL;
         ret_row.test_user_attribute_05 := NULL;
--    measures
         ret_row.test_date := TRUNC(NVL(test_recs(i).test_date, '31-DEC-2099'));
         ret_row.test_score := test_recs(i).test_score;
         IF test_recs(i).latest_test_date_ind = 1 THEN
           ret_row.latest_score_ind := 1;
         ELSE
           ret_row.latest_score_ind := 0;
         END IF;
         IF test_recs(i).highest_test_score_ind = 1 THEN
           ret_row.highest_score_ind := 1;
         ELSE
           ret_row.highest_score_ind := 0;
         END IF;
         ret_row.user_measure_01 := NULL;
         ret_row.user_measure_02 := NULL;
         ret_row.user_measure_03 := NULL;
         ret_row.user_measure_04 := NULL;
         ret_row.user_measure_05 := NULL;
         ret_row.system_load_process := 'TEST';
--
         PIPE ROW(ret_row);
--
         ret_row := ret_row_init;
--
       END LOOP; -- test_rec
--
    END LOOP;
--
    CLOSE test_cur;
--
    RETURN;

  END f_get_test;
  /******************************************************************************/
  FUNCTION f_get_interest(process_ind_in VARCHAR2,
                          process_date DATE,
                          debug_var_in VARCHAR2 DEFAULT NULL)
                      RETURN tab_interest_extr PIPELINED IS
--
    ret_row                     WTT_INTEREST_INPUT%ROWTYPE;
    ret_row_init                WTT_INTEREST_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE interest_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          INTEREST                                VARCHAR2(63),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    interest_cur       refCurType;
    interest_rec        interest_rec_type;
    TYPE tab_interest_rec_type   IS TABLE OF interest_rec_type INDEX BY PLS_INTEGER;
    interest_recs        tab_interest_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)    multi_source,
                 A.ZONE_VALUE                             process_group,
                 A.DOMAIN_VALUE                           administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)           warehouse_entity_uid,
                 A.INTEREST,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_INTEREST A,
                 WCV_EXTR_PERSON_DETAILS PD
           WHERE WE.BANNER_PIDM = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             --BLM added 7/29 for MEP of wdt_warehouse_entity
             and a.mif_value  =  we.user_attribute_01
             AND A.PERSON_UID =  PD.PERSON_ID;
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--             AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)    multi_source,
                 A.ZONE_VALUE                             process_group,
                 A.DOMAIN_VALUE                           administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)           warehouse_entity_uid,
                 A.INTEREST,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_INTEREST A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 CHG_INTEREST CHG
           WHERE WE.BANNER_PIDM = A.PERSON_UID
             --BLM added 7/29/14 for mep of wdt_warehouse_entity
             and a.mif_value = we.user_attribute_01
             AND CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND A.PERSON_UID =  PD.PERSON_ID;
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_INTEREST');
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_INTEREST', 'WFT_INTEREST', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        interest_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        interest_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
  LOOP
     FETCH interest_cur BULK COLLECT INTO interest_recs LIMIT bulk_size;
     EXIT WHEN interest_recs.COUNT = 0;
--
     FOR i IN interest_recs.FIRST..interest_recs.LAST
     LOOP
--
       ret_row.multi_source := interest_recs(i).multi_source;
       ret_row.process_group := interest_recs(i).process_group;
       ret_row.administrative_group := interest_recs(i).administrative_group;
       --BLM mepped 6/2/14 for security reasons
       --ret_row.msrc_user_attribute_01 := NULL;
       ret_row.msrc_user_attribute_01 := ret_row.multi_source;
       ret_row.msrc_user_attribute_02 := NULL;
       ret_row.msrc_user_attribute_03 := NULL;
       ret_row.msrc_user_attribute_04 := NULL;
       ret_row.msrc_user_attribute_05 := NULL;
       ret_row.person_uid := interest_recs(i).warehouse_entity_uid;
       ret_row.id := interest_recs(i).id;
       ret_row.full_name_lfmi := interest_recs(i).full_name_lfmi;
       ret_row.birth_date := interest_recs(i).birth_date;
       ret_row.deceased_date := interest_recs(i).deceased_date;
       ret_row.email_address := interest_recs(i).email_address;
       ret_row.phone_number_combined := interest_recs(i).phone_number_combined;
       ret_row.confidentiality_ind := interest_recs(i).confidentiality_ind;
       --BLM mepped 6/2/14 for security reasons
       --ret_row.pers_user_attribute_01 := NULL;
       ret_row.pers_user_attribute_01 := ret_row.multi_source;
       ret_row.pers_user_attribute_02 := NULL;
       ret_row.pers_user_attribute_03 := NULL;
       ret_row.pers_user_attribute_04 := NULL;
       ret_row.pers_user_attribute_05 := NULL;
       ret_row.gender := interest_recs(i).gender;
       ret_row.ethnicity_category := interest_recs(i).ethnicity_category;
       ret_row.hispanic_latino_ethn_ind := interest_recs(i).hispanic_latino_ethnicity_ind;
       ret_row.asian_ind := interest_recs(i).asian_ind;
       ret_row.native_amer_or_alaskan_ind := interest_recs(i).native_american_or_alaskan_ind;
       ret_row.black_or_african_ind := interest_recs(i).black_or_african_ind;
       ret_row.pacific_islander_ind := interest_recs(i).pacific_islander_ind;
       ret_row.white_ind := interest_recs(i).white_ind;
       IF interest_recs(i).number_of_races = 0 and interest_recs(i).resident_alien_visa_count > 0 THEN
          ret_row.non_resident_ind := 'Y';
       ELSE
          ret_row.non_resident_ind := 'N';
       END IF;
       IF NVL(interest_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND interest_recs(i).number_of_races = 0 AND interest_recs(i).resident_alien_visa_count = 0 THEN
          ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
       ELSE
          ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
       END IF;
       ret_row.two_or_more_ind := interest_recs(i).two_or_more_ind;
       ret_row.race_ethnicity_confirm_ind := interest_recs(i).race_ethnicity_confirm_ind;
       ret_row.minority_ind := interest_recs(i).minority_ind;
       ret_row.ethnicity := interest_recs(i).ethnicity;
       ret_row.deceased_ind := interest_recs(i).deceased_ind;
       ret_row.citizenship_ind := interest_recs(i).citizenship_ind;
       ret_row.citizenship_type := interest_recs(i).citizenship_type;
       ret_row.visa_type := interest_recs(i).visa_type;
       ret_row.nation_of_citizenship := interest_recs(i).nation_of_citizenship;
       ret_row.nation_of_birth := interest_recs(i).nation_of_birth;
       ret_row.primary_disability := interest_recs(i).primary_disability;
       ret_row.legacy := interest_recs(i).legacy;
       ret_row.marital_status := interest_recs(i).marital_status;
       ret_row.religion := interest_recs(i).religion;
       ret_row.veteran_type := interest_recs(i).veteran_type;
       ret_row.veteran_category := interest_recs(i).veteran_category;
       --BLM mepped 6/2/14 for security reasons
       --ret_row.demo_user_attribute_01 := NULL;
       ret_row.demo_user_attribute_01 := ret_row.multi_source;
       ret_row.demo_user_attribute_02 := NULL;
       ret_row.demo_user_attribute_03 := NULL;
       ret_row.demo_user_attribute_04 := NULL;
       ret_row.demo_user_attribute_05 := NULL;
       ret_row.interest := interest_recs(i).interest;
       --BLM mepped 6/2/14 for security reasons
       --ret_row.intr_user_attribute_01 := NULL;
       ret_row.intr_user_attribute_01 := ret_row.multi_source;
       ret_row.intr_user_attribute_02 := NULL;
       ret_row.intr_user_attribute_03 := NULL;
       ret_row.intr_user_attribute_04 := NULL;
       ret_row.intr_user_attribute_05 := NULL;
--  measures
       ret_row.user_measure_01 := NULL;
       ret_row.user_measure_02 := NULL;
       ret_row.user_measure_03 := NULL;
       ret_row.user_measure_04 := NULL;
       ret_row.user_measure_05 := NULL;
       ret_row.system_load_process := 'INTEREST';
--
       PIPE ROW(ret_row);
--
       ret_row := ret_row_init;
--
     END LOOP; -- interest_rec
--
   END LOOP;
--
   CLOSE  interest_cur;
--
   RETURN;
--
  END f_get_interest;
  /******************************************************************************/
 FUNCTION f_get_post_secondary(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_post_secondary_extr PIPELINED IS
--
    ret_row                     WTT_POST_SECONDARY_INPUT%ROWTYPE;
    ret_row_init                WTT_POST_SECONDARY_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    parm_rec                    MTVPARM%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
    fetch_inst_details          BOOLEAN := TRUE;
--
--

--
  TYPE tab_institution_detail   IS TABLE OF   WCV_EXTR_INSTITUTION_DETAILS%ROWTYPE INDEX BY VARCHAR2(4000);
  institution_detail_recs  tab_institution_detail;
--
  inst_indx VARCHAR2(4000);
--
        TYPE post_secondary_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          SEQUENCE_NUMBER                         NUMBER,
          POST_SECONDARY_DEGREE_DATE              DATE,
          POST_SECONDARY_SCHOOL                   VARCHAR2(63),
          POST_SECONDARY_SCHOOL_SD                VARCHAR2(255),
          POST_SECONDARY_DEGREE                   VARCHAR2(63),
          POST_SECONDARY_DEGREE_SD                VARCHAR2(255),
          AWARD_CATEGORY                          VARCHAR2(63),
          AWARD_CATEGORY_DESC                     VARCHAR2(255),
          POST_SECONDARY_MAJOR                    VARCHAR2(63),
          POST_SECONDARY_MAJOR_SD                 VARCHAR2(255),
          TRANSFER_CREDITS                        NUMBER,
          SCHOOL_GPA                              NUMBER,
          OUTCOME_AWARDED_IND                     NUMBER,
          LAST_DATE                               DATE,
          LAST_OVERALL_DATE_IND                   NUMBER,
          POST_SECONDARY_ATTEND_FROM              DATE,
          POST_SECONDARY_ATTEND_TO                DATE,
          HIGHEST_DEGREE_AWARDED_IND              NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    post_secondary_cur       refCurType;
    post_secondary_rec        post_secondary_rec_type;
    TYPE tab_post_secondary_rec_type   IS TABLE OF post_secondary_rec_type INDEX BY PLS_INTEGER;
    post_secondary_recs        tab_post_secondary_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2,def_institution_value VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(DRIVER.MULTI_SOURCE, def_multi_source_in)   MULTI_SOURCE,
                 DRIVER.PROCESS_GROUP,
                 DRIVER.ADMINISTRATIVE_GROUP,
                 DRIVER.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                  WAREHOUSE_ENTITY_UID,
                 DRIVER.SEQUENCE_NUMBER,
                 DRIVER.POST_SECONDARY_DEGREE_DATE,
                 DRIVER.POST_SECONDARY_SCHOOL,
                 DRIVER.POST_SECONDARY_SCHOOL_SD,
                 DRIVER.POST_SECONDARY_DEGREE,
                 DRIVER.POST_SECONDARY_DEGREE_SD,
                 DRIVER.AWARD_CATEGORY,
                 DRIVER.AWARD_CATEGORY_DESC,
                 DRIVER.POST_SECONDARY_MAJOR,
                 DRIVER.POST_SECONDARY_MAJOR_SD,
                 DRIVER.TRANSFER_CREDITS,
                 DRIVER.SCHOOL_GPA,
                 DRIVER.OUTCOME_AWARDED_IND,
                 DRIVER.LAST_DATE,
                 ROW_NUMBER() OVER (PARTITION BY DRIVER.PERSON_UID ORDER BY DRIVER.LAST_DATE DESC NULLS LAST) AS LAST_OVERALL_DATE_IND,
                 DRIVER.POST_SECONDARY_ATTEND_FROM,
                 DRIVER.POST_SECONDARY_ATTEND_TO,
                 CASE
                  WHEN DRIVER.OUTCOME_AWARDED_IND = 1 THEN
                    ROW_NUMBER() OVER (PARTITION BY DRIVER.PERSON_UID
                    ORDER BY DRIVER.AWARD_CATEGORY DESC NULLS LAST,
                             DRIVER.POST_SECONDARY_DEGREE_DATE DESC,
                             DRIVER.POST_SECONDARY_ATTEND_FROM DESC NULLS LAST)
                  ELSE
                    0
                  END HIGHEST_DEGREE_AWARDED_IND,
                  PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 (SELECT A.MIF_VALUE                            multi_source,
                         A.ZONE_VALUE                           process_group,
                         A.DOMAIN_VALUE                         administrative_group,
                         A.PERSON_UID                           person_uid,
                         A.SEQUENCE_NUMBER,
                         A.POST_SECONDARY_DEGREE_DATE           post_secondary_degree_date,
                         A.INSTITUTION                          post_secondary_school,
                         A.INSTITUTION_DESC                     post_secondary_school_sd,
                         A.POST_SECONDARY_DEGREE                post_secondary_degree,
                         A.POST_SECONDARY_DEGREE_DESC           post_secondary_degree_sd,
                         A.AWARD_CATEGORY,
                         A.AWARD_CATEGORY_DESC,
                         A.POST_SECONDARY_MAJOR1                post_secondary_major,
                         A.POST_SECONDARY_MAJOR_DESC1           post_secondary_major_sd,
                         A.TOTAL_TRANSFER_CREDITS               transfer_credits,
                         EDW_GENERAL_EXTR.F_SAFE_TO_NUMBER(A.SCHOOL_GPA) school_gpa,
                         DECODE(A.POST_SECONDARY_DEGREE_DATE,NULL,0,1) outcome_awarded_ind,
                         NVL(A.POST_SECONDARY_DEGREE_DATE,A.ATTEND_TO_DATE)  last_date,
                         A.ATTEND_FROM_DATE                     post_secondary_attend_from,
                         A.ATTEND_TO_DATE                       post_secondary_attend_to
                    FROM MST_PREVIOUS_EDUCATION A
                   WHERE A.SOURCE_FLAG = 'P'
                  UNION ALL
                  SELECT AO.MIF_VALUE                         multi_source,
                         AO.ZONE_VALUE                        process_group,
                         AO.DOMAIN_VALUE                      administrative_group,
                         AO.PERSON_UID                        person_uid,
                         AO.OUTCOME_NUMBER                    sequence_number,
                         AO.OUTCOME_GRADUATION_DATE           post_secondary_degree_date,
                         I.INSTITUTION                        post_secondary_school,
                         I.NAME                               post_secondary_school_sd,
                         AO.OUTCOME                           post_secondary_degree,
                         AO.OUTCOME_DESC                      post_secondary_degree_sd,
                         AO.CATEGORY                          award_category,
                         AO.CATEGORY_DESC                     award_category_desc,
                         AO.MAJOR                             post_secondary_major,
                         AO.MAJOR_DESC                        post_secondary_major_sd,
                         0                                    transfer_credits,
                         ROUND(AO.GPA,2)                      school_gpa,
                         DECODE(AO.OUTCOME_AWARDED_IND,'A',1,0)  outcome_awarded_ind,
                         AO.OUTCOME_GRADUATION_DATE           last_date,
                         AO.OUTCOME_APPLICATION_DATE          post_secondary_attend_from,
                         AO.OUTCOME_GRADUATION_DATE           post_secondary_attend_to
                    FROM MST_INSTITUTION I, MST_ACADEMIC_OUTCOME AO
                   WHERE I.INSTITUTION = def_institution_value
                     -- JOS 11/01/2012; mod for MEP
		     -- Removed multi-source join on MST_ACADEMIC_OUTCOME (AO)
                     --AND NVL(I.MIF_VALUE, def_multi_source_in) = NVL(AO.MIF_VALUE, def_multi_source_in)
                     AND AO.CURRICULUM_ORDER = 1) DRIVER,
                  WCV_EXTR_PERSON_DETAILS PD
           WHERE (debug_var_in IS NULL OR DRIVER.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = DRIVER.PERSON_UID
             --BLM mepped for wdt_warehouse_entity MEP effort
             and we.user_attribute_01 = driver.multi_source
             AND DRIVER.PERSON_UID =  PD.PERSON_ID;
             -- Removed multi-source join on WCV_EXTR_PERSON_DETAILS (PD) per Jon Strother
             --AND NVL(DRIVER.multi_source, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2,def_institution_value VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(DRIVER.MULTI_SOURCE, def_multi_source_in)   MULTI_SOURCE,
                 DRIVER.PROCESS_GROUP,
                 DRIVER.ADMINISTRATIVE_GROUP,
                 DRIVER.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                  WAREHOUSE_ENTITY_UID,
                 DRIVER.SEQUENCE_NUMBER,
                 DRIVER.POST_SECONDARY_DEGREE_DATE,
                 DRIVER.POST_SECONDARY_SCHOOL,
                 DRIVER.POST_SECONDARY_SCHOOL_SD,
                 DRIVER.POST_SECONDARY_DEGREE,
                 DRIVER.POST_SECONDARY_DEGREE_SD,
                 DRIVER.AWARD_CATEGORY,
                 DRIVER.AWARD_CATEGORY_DESC,
                 DRIVER.POST_SECONDARY_MAJOR,
                 DRIVER.POST_SECONDARY_MAJOR_SD,
                 DRIVER.TRANSFER_CREDITS,
                 DRIVER.SCHOOL_GPA,
                 DRIVER.OUTCOME_AWARDED_IND,
                 DRIVER.LAST_DATE,
                 ROW_NUMBER() OVER (PARTITION BY DRIVER.PERSON_UID ORDER BY DRIVER.LAST_DATE DESC NULLS LAST) AS LAST_OVERALL_DATE_IND,
                 DRIVER.POST_SECONDARY_ATTEND_FROM,
                 DRIVER.POST_SECONDARY_ATTEND_TO,
                 CASE
                  WHEN DRIVER.OUTCOME_AWARDED_IND = 1 THEN
                    ROW_NUMBER() OVER (PARTITION BY DRIVER.PERSON_UID
                    ORDER BY DRIVER.AWARD_CATEGORY DESC NULLS LAST,
                             DRIVER.POST_SECONDARY_DEGREE_DATE DESC,
                             DRIVER.POST_SECONDARY_ATTEND_FROM DESC NULLS LAST)
                  ELSE
                    0
                  END HIGHEST_DEGREE_AWARDED_IND,
                  PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 (SELECT A.MIF_VALUE                            multi_source,
                         A.ZONE_VALUE                           process_group,
                         A.DOMAIN_VALUE                         administrative_group,
                         A.PERSON_UID                           person_uid,
                         A.SEQUENCE_NUMBER,
                         A.POST_SECONDARY_DEGREE_DATE           post_secondary_degree_date,
                         A.INSTITUTION                          post_secondary_school,
                         A.INSTITUTION_DESC                     post_secondary_school_sd,
                         A.POST_SECONDARY_DEGREE                post_secondary_degree,
                         A.POST_SECONDARY_DEGREE_DESC           post_secondary_degree_sd,
                         A.AWARD_CATEGORY,
                         A.AWARD_CATEGORY_DESC,
                         A.POST_SECONDARY_MAJOR1                post_secondary_major,
                         A.POST_SECONDARY_MAJOR_DESC1           post_secondary_major_sd,
                         A.TOTAL_TRANSFER_CREDITS               transfer_credits,
                         EDW_GENERAL_EXTR.F_SAFE_TO_NUMBER(A.SCHOOL_GPA) school_gpa,
                         DECODE(A.POST_SECONDARY_DEGREE_DATE,NULL,0,1) outcome_awarded_ind,
                         NVL(A.POST_SECONDARY_DEGREE_DATE,A.ATTEND_TO_DATE)  last_date,
                         A.ATTEND_FROM_DATE                     post_secondary_attend_from,
                         A.ATTEND_TO_DATE                       post_secondary_attend_to
                    FROM MST_PREVIOUS_EDUCATION A
                   WHERE A.SOURCE_FLAG = 'P'
                  UNION ALL
                  SELECT AO.MIF_VALUE                         multi_source,
                         AO.ZONE_VALUE                        process_group,
                         AO.DOMAIN_VALUE                      administrative_group,
                         AO.PERSON_UID                        person_uid,
                         AO.OUTCOME_NUMBER                    sequence_number,
                         AO.OUTCOME_GRADUATION_DATE           post_secondary_degree_date,
                         I.INSTITUTION                        post_secondary_school,
                         I.NAME                               post_secondary_school_sd,
                         AO.OUTCOME                           post_secondary_degree,
                         AO.OUTCOME_DESC                      post_secondary_degree_sd,
                         AO.CATEGORY                          award_category,
                         AO.CATEGORY_DESC                     award_category_desc,
                         AO.MAJOR                             post_secondary_major,
                         AO.MAJOR_DESC                        post_secondary_major_sd,
                         0                                    transfer_credits,
                         ROUND(AO.GPA,2)                      school_gpa,
                         DECODE(AO.OUTCOME_AWARDED_IND,'A',1,0)  outcome_awarded_ind,
                         AO.OUTCOME_GRADUATION_DATE           last_date,
                         AO.OUTCOME_APPLICATION_DATE          post_secondary_attend_from,
                         AO.OUTCOME_GRADUATION_DATE           post_secondary_attend_to
                    FROM MST_INSTITUTION I, MST_ACADEMIC_OUTCOME AO
                   WHERE I.INSTITUTION = def_institution_value
                     AND NVL(I.MIF_VALUE, def_multi_source_in) = NVL(AO.MIF_VALUE, def_multi_source_in)
                     AND AO.CURRICULUM_ORDER = 1) DRIVER,
                  WCV_EXTR_PERSON_DETAILS PD,
                  CHG_POST_SECONDARY_SCHOOL CHG
            WHERE CHG.PERSON_UID = DRIVER.PERSON_UID
             AND (debug_var_in IS NULL OR DRIVER.PERSON_UID LIKE debug_var_in)
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = driver.multi_source
             AND WE.BANNER_PIDM = DRIVER.PERSON_UID
             AND DRIVER.PERSON_UID =  PD.PERSON_ID;
             --JOS Update
             ---- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--             AND NVL(DRIVER.multi_source, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_POST_SECONDARY_SCHOOL');
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_POST_SECONDARY_SCHOOL', 'WFT_POST_SECONDARY_SCHOOL', 'PERSON_UID');
       END IF;
    END IF;
--
--
   OPEN edw_general_extr.get_default_values;
   FETCH edw_general_extr.get_default_values INTO default_rec;
   CLOSE edw_general_extr.get_default_values;
--
   OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','INSTITUTION','HOME_INSTITUTION');
   FETCH edw_general_extr.get_mtvparm INTO parm_rec;
   CLOSE edw_general_extr.get_mtvparm;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        post_secondary_cur := f_getLoadResults(default_rec.multi_source_cleanse_value, parm_rec.mtvparm_external_code);
    ELSE
        post_secondary_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value, parm_rec.mtvparm_external_code);
    END IF;
   LOOP
      FETCH post_secondary_cur BULK COLLECT INTO post_secondary_recs LIMIT bulk_size;
      EXIT WHEN post_secondary_recs.COUNT = 0;
--
     IF post_secondary_recs.COUNT > 0 AND fetch_inst_details THEN
--
         fetch_inst_details := FALSE;
--
         FOR institution_detail in (SELECT * FROM WCV_EXTR_INSTITUTION_DETAILS) LOOP
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION ).MULTI_SRC := institution_detail.MULTI_SRC;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).INSTITUTION := institution_detail.INSTITUTION;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).fice_code := institution_detail.fice_code;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).institution_type := institution_detail.institution_type;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).accreditation_type := institution_detail.accreditation_type;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).approved_ind := institution_detail.approved_ind;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).calendar_year := institution_detail.calendar_year;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).two_year_ind := institution_detail.two_year_ind;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).four_year_ind := institution_detail.four_year_ind;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).private_ind := institution_detail.private_ind;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).public_ind := institution_detail.public_ind;
             institution_detail_recs(institution_detail.MULTI_SRC || '{' || institution_detail.INSTITUTION).homeschool_ind := institution_detail.homeschool_ind;
         END LOOP;
--
     END IF;
--
     FOR i IN post_secondary_recs.FIRST..post_secondary_recs.LAST
     LOOP
--
       inst_indx := post_secondary_recs(i).multi_source || '{' ||  post_secondary_recs(i).post_secondary_school ;
--
        ret_row.multi_source := post_secondary_recs(i).multi_source;
        ret_row.process_group := post_secondary_recs(i).process_group;
        ret_row.administrative_group := post_secondary_recs(i).administrative_group;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.msrc_user_attribute_01 := NULL;
        ret_row.msrc_user_attribute_01 := ret_row.multi_source;
        ret_row.msrc_user_attribute_02 := NULL;
        ret_row.msrc_user_attribute_03 := NULL;
        ret_row.msrc_user_attribute_04 := NULL;
        ret_row.msrc_user_attribute_05 := NULL;
        ret_row.person_uid := post_secondary_recs(i).warehouse_entity_uid;
        ret_row.id := post_secondary_recs(i).id;
        ret_row.full_name_lfmi := post_secondary_recs(i).full_name_lfmi;
        ret_row.birth_date := post_secondary_recs(i).birth_date;
        ret_row.deceased_date := post_secondary_recs(i).deceased_date;
        ret_row.email_address := post_secondary_recs(i).email_address;
        ret_row.phone_number_combined := post_secondary_recs(i).phone_number_combined;
        ret_row.confidentiality_ind := post_secondary_recs(i).confidentiality_ind;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.pers_user_attribute_01 := NULL;
        ret_row.pers_user_attribute_01 := ret_row.multi_source;
        ret_row.pers_user_attribute_02 := NULL;
        ret_row.pers_user_attribute_03 := NULL;
        ret_row.pers_user_attribute_04 := NULL;
        ret_row.pers_user_attribute_05 := NULL;
        ret_row.gender := post_secondary_recs(i).gender;
        ret_row.ethnicity_category := post_secondary_recs(i).ethnicity_category;
        ret_row.hispanic_latino_ethn_ind := post_secondary_recs(i).hispanic_latino_ethnicity_ind;
        ret_row.asian_ind := post_secondary_recs(i).asian_ind;
        ret_row.native_amer_or_alaskan_ind := post_secondary_recs(i).native_american_or_alaskan_ind;
        ret_row.black_or_african_ind := post_secondary_recs(i).black_or_african_ind;
        ret_row.pacific_islander_ind := post_secondary_recs(i).pacific_islander_ind;
        ret_row.white_ind := post_secondary_recs(i).white_ind;
        IF post_secondary_recs(i).number_of_races = 0 and post_secondary_recs(i).resident_alien_visa_count > 0 THEN
           ret_row.non_resident_ind := 'Y';
        ELSE
           ret_row.non_resident_ind := 'N';
        END IF;
        IF NVL(post_secondary_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND
           post_secondary_recs(i).number_of_races = 0 AND
           post_secondary_recs(i).resident_alien_visa_count = 0 THEN
           ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
        ELSE
           ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
        END IF;
        ret_row.two_or_more_ind := post_secondary_recs(i).two_or_more_ind;
        ret_row.race_ethnicity_confirm_ind := post_secondary_recs(i).race_ethnicity_confirm_ind;
        ret_row.minority_ind := post_secondary_recs(i).minority_ind;
        ret_row.ethnicity := post_secondary_recs(i).ethnicity;
        ret_row.deceased_ind := post_secondary_recs(i).deceased_ind;
        ret_row.citizenship_ind := post_secondary_recs(i).citizenship_ind;
        ret_row.citizenship_type := post_secondary_recs(i).citizenship_type;
        ret_row.visa_type := post_secondary_recs(i).visa_type;
        ret_row.nation_of_citizenship := post_secondary_recs(i).nation_of_citizenship;
        ret_row.nation_of_birth := post_secondary_recs(i).nation_of_birth;
        ret_row.primary_disability := post_secondary_recs(i).primary_disability;
        ret_row.legacy := post_secondary_recs(i).legacy;
        ret_row.marital_status := post_secondary_recs(i).marital_status;
        ret_row.religion := post_secondary_recs(i).religion;
        ret_row.veteran_type := post_secondary_recs(i).veteran_type;
        ret_row.veteran_category := post_secondary_recs(i).veteran_category;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.demo_user_attribute_01 := NULL;
        ret_row.demo_user_attribute_01 := ret_row.multi_source;
        ret_row.demo_user_attribute_02 := NULL;
        ret_row.demo_user_attribute_03 := NULL;
        ret_row.demo_user_attribute_04 := NULL;
        ret_row.demo_user_attribute_05 := NULL;
        ret_row.institution := post_secondary_recs(i).post_secondary_school;
        ret_row.fice_code := institution_detail_recs(inst_indx).fice_code;
        ret_row.institution_type := institution_detail_recs(inst_indx).institution_type;
        ret_row.two_year_institution_ind := TO_CHAR(NVL(institution_detail_recs(inst_indx).two_year_ind,0));
        ret_row.four_year_institution_ind := TO_CHAR(NVL(institution_detail_recs(inst_indx).four_year_ind,0));
        ret_row.private_institution_ind := TO_CHAR(NVL(institution_detail_recs(inst_indx).private_ind,0));
        ret_row.public_institution_ind := TO_CHAR(NVL(institution_detail_recs(inst_indx).public_ind,0));
        ret_row.homeschool_ind := TO_CHAR(NVL(institution_detail_recs(inst_indx).homeschool_ind,0));
        ret_row.accreditation_type := institution_detail_recs(inst_indx).accreditation_type;
        ret_row.approved_ind := TO_CHAR(NVL(institution_detail_recs(inst_indx).approved_ind,0));
        ret_row.demographic_calendar_year := TO_CHAR(institution_detail_recs(inst_indx).calendar_year);
        --BLM mepped 6/2/14 for security reasons
        --ret_row.inst_user_attribute_01 := NULL;
        ret_row.inst_user_attribute_01 := ret_row.multi_source;
        ret_row.inst_user_attribute_02 := NULL;
        ret_row.inst_user_attribute_03 := NULL;
        ret_row.inst_user_attribute_04 := NULL;
        ret_row.inst_user_attribute_05 := NULL;
        ret_row.post_secondary_degree := post_secondary_recs(i).post_secondary_degree;
        ret_row.post_secondary_awd_category := post_secondary_recs(i).award_category;
        ret_row.post_secondary_major := post_secondary_recs(i).post_secondary_major;
        ret_row.post_secondary_gpa_range := post_secondary_recs(i).school_gpa;
        ret_row.transfer_credit_range := post_secondary_recs(i).transfer_credits;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.psecs_user_attribute_01 := NULL;
        ret_row.psecs_user_attribute_01 := ret_row.multi_source;
        ret_row.psecs_user_attribute_02 := NULL;
        ret_row.psecs_user_attribute_03 := NULL;
        ret_row.psecs_user_attribute_04 := NULL;
        ret_row.psecs_user_attribute_05 := NULL;
        ret_row.post_secondary_sequence_number := post_secondary_recs(i).sequence_number;
        ret_row.post_secondary_attend_from := TRUNC(NVL(post_secondary_recs(i).post_secondary_attend_from, '31-DEC-2099'));
        ret_row.post_secondary_attend_to := TRUNC(NVL(post_secondary_recs(i).post_secondary_attend_to, '31-DEC-2099'));
        ret_row.post_secondary_degree_date := TRUNC(NVL(post_secondary_recs(i).post_secondary_degree_date, '31-DEC-2099'));
        IF post_secondary_recs(i).LAST_OVERALL_DATE_IND = 1 THEN
          ret_row.last_post_secondary_ind := 1;
        ELSE
          ret_row.last_post_secondary_ind := 0;
        END IF;
        ret_row.outcome_award_ind := post_secondary_recs(i).outcome_awarded_ind;
        IF post_secondary_recs(i).highest_degree_awarded_ind = 1 THEN
           ret_row.highest_degree_awarded_ind := 1;
        ELSE
           ret_row.highest_degree_awarded_ind := 0;
        END IF;
        ret_row.post_secondary_gpa := post_secondary_recs(i).school_gpa;
        ret_row.post_secondary_trans_credits := post_secondary_recs(i).transfer_credits;
        ret_row.user_measure_01 := NULL;
        ret_row.user_measure_02 := NULL;
        ret_row.user_measure_03 := NULL;
        ret_row.user_measure_04 := NULL;
        ret_row.user_measure_05 := NULL;
        ret_row.system_load_process := 'POST_SECONDARY';
--
        PIPE ROW(ret_row);
--
        ret_row := ret_row_init;
--
      END LOOP; -- post_secondary_rec
--
   END LOOP;
--
   CLOSE post_secondary_cur;
--
   RETURN;
--
  END f_get_post_secondary;
  /******************************************************************************/
  FUNCTION f_get_adms_appl_decision(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_adms_appl_dec_extr PIPELINED IS
--
    ret_row                     WTT_APPLICATION_DECISION_INPUT%ROWTYPE;
    ret_row_init                WTT_APPLICATION_DECISION_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE adms_appl_dec_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          APPLICATION_NUMBER                      NUMBER,
          DECISION_NUMBER                         NUMBER,
          DECISION                                VARCHAR2(63),
          DECISION_SOURCE                         VARCHAR2(63),
          DECISION_DATE                           DATE,
          LATEST_DECISION_NUMBER                  NUMBER,
          INSTITUTION_ADMIT_IND                   VARCHAR2(1),
          APPLICANT_ACCEPT_IND                    VARCHAR2(1),
          APPLICATION_INACTIVE_IND                VARCHAR2(1),
          INSTITUTION_DENIED_IND                  VARCHAR2(1),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          START_DATE                              DATE,
          END_DATE                                DATE
    );
    TYPE refCurType     IS REF CURSOR;
    adms_appl_dec_info_cur       refCurType;
    adms_appl_dec_info_rec        adms_appl_dec_info_rec_type;
    TYPE tab_a_appl_dec_info_rec_type   IS TABLE OF adms_appl_dec_info_rec_type INDEX BY PLS_INTEGER;
    adms_appl_dec_info_recs        tab_a_appl_dec_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.APPLICATION_NUMBER,
                 A.DECISION_NUMBER,
                 A.DECISION,
                 A.DECISION_SOURCE,
                 A.DECISION_DATE,
                 FIRST_VALUE(A.DECISION_NUMBER) OVER (PARTITION BY A.PERSON_UID, A.ACADEMIC_PERIOD, A.APPLICATION_NUMBER ORDER BY A.DECISION_NUMBER DESC) AS LATEST_DECISION_NUMBER,
                 A.INSTITUTION_ADMIT_IND,
                 A.APPLICANT_ACCEPT_IND,
                 A.APPLICATION_INACTIVE_IND,
                 A.INSTITUTION_DENIED_IND,
                 PD.*,
                 AC.start_date,
                 AC.end_date
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_ADMISSIONS_DECISION A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
             --JOS Update
             ---- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in);
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.APPLICATION_NUMBER,
                 A.DECISION_NUMBER,
                 A.DECISION,
                 A.DECISION_SOURCE,
                 A.DECISION_DATE,
                 FIRST_VALUE(A.DECISION_NUMBER) OVER (PARTITION BY A.PERSON_UID, A.ACADEMIC_PERIOD, A.APPLICATION_NUMBER ORDER BY A.DECISION_NUMBER DESC) AS LATEST_DECISION_NUMBER,
                 A.INSTITUTION_ADMIT_IND,
                 A.APPLICANT_ACCEPT_IND,
                 A.APPLICATION_INACTIVE_IND,
                 A.INSTITUTION_DENIED_IND,
                 PD.*,
                 AC.start_date,
                 AC.end_date
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_ADMISSIONS_DECISION A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 CHG_APPLICATION_DECISION CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29 for the wdt_warehouse_entity MEP effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in);
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_APPLICATION_DECISION', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_APPLICATION_DECISION', 'WFT_APPLICATION_DECISION', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        adms_appl_dec_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        adms_appl_dec_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH adms_appl_dec_info_cur BULK COLLECT INTO adms_appl_dec_info_recs LIMIT bulk_size;
       EXIT WHEN adms_appl_dec_info_recs.COUNT = 0;
--
       FOR i IN adms_appl_dec_info_recs.FIRST..adms_appl_dec_info_recs.LAST
       LOOP
--
          ret_row.multi_source := adms_appl_dec_info_recs(i).multi_source;
          ret_row.process_group := adms_appl_dec_info_recs(i).process_group;
          ret_row.administrative_group := adms_appl_dec_info_recs(i).administrative_group;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.msrc_user_attribute_01 := NULL;
          ret_row.msrc_user_attribute_01 := ret_row.multi_source;
          ret_row.msrc_user_attribute_02 := NULL;
          ret_row.msrc_user_attribute_03 := NULL;
          ret_row.msrc_user_attribute_04 := NULL;
          ret_row.msrc_user_attribute_05 := NULL;
          ret_row.academic_period := adms_appl_dec_info_recs(i).academic_period;
          ret_row.academic_period_begin_date := adms_appl_dec_info_recs(i).start_date;
          ret_row.academic_period_end_date := adms_appl_dec_info_recs(i).end_date;
          ret_row.academic_year := adms_appl_dec_info_recs(i).academic_year;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.atim_user_attribute_01 := NULL;
          ret_row.atim_user_attribute_01 := ret_row.multi_source;
          ret_row.atim_user_attribute_02 := NULL;
          ret_row.atim_user_attribute_03 := NULL;
          ret_row.atim_user_attribute_04 := NULL;
          ret_row.atim_user_attribute_05 := NULL;
          ret_row.person_uid := adms_appl_dec_info_recs(i).warehouse_entity_uid;
          ret_row.id := adms_appl_dec_info_recs(i).id;
          ret_row.full_name_lfmi := adms_appl_dec_info_recs(i).full_name_lfmi;
          ret_row.birth_date := adms_appl_dec_info_recs(i).birth_date;
          ret_row.deceased_date := adms_appl_dec_info_recs(i).deceased_date;
          ret_row.email_address := adms_appl_dec_info_recs(i).email_address;
          ret_row.phone_number_combined := adms_appl_dec_info_recs(i).phone_number_combined;
          ret_row.confidentiality_ind := adms_appl_dec_info_recs(i).confidentiality_ind;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.pers_user_attribute_01 := NULL;
          ret_row.pers_user_attribute_01 := ret_row.multi_source;
          ret_row.pers_user_attribute_02 := NULL;
          ret_row.pers_user_attribute_03 := NULL;
          ret_row.pers_user_attribute_04 := NULL;
          ret_row.pers_user_attribute_05 := NULL;
          ret_row.gender := adms_appl_dec_info_recs(i).gender;
          ret_row.ethnicity_category := adms_appl_dec_info_recs(i).ethnicity_category;
          ret_row.hispanic_latino_ethn_ind := adms_appl_dec_info_recs(i).hispanic_latino_ethnicity_ind;
          ret_row.asian_ind := adms_appl_dec_info_recs(i).asian_ind;
          ret_row.native_amer_or_alaskan_ind := adms_appl_dec_info_recs(i).native_american_or_alaskan_ind;
          ret_row.black_or_african_ind := adms_appl_dec_info_recs(i).black_or_african_ind;
          ret_row.pacific_islander_ind := adms_appl_dec_info_recs(i).pacific_islander_ind;
          ret_row.white_ind := adms_appl_dec_info_recs(i).white_ind;
          IF adms_appl_dec_info_recs(i).number_of_races = 0 and adms_appl_dec_info_recs(i).resident_alien_visa_count > 0 THEN
             ret_row.non_resident_ind := 'Y';
          ELSE
             ret_row.non_resident_ind := 'N';
          END IF;
          IF NVL(adms_appl_dec_info_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND adms_appl_dec_info_recs(i).number_of_races = 0 AND adms_appl_dec_info_recs(i).resident_alien_visa_count = 0 THEN
             ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
          ELSE
             ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
          END IF;
          ret_row.two_or_more_ind := adms_appl_dec_info_recs(i).two_or_more_ind;
          ret_row.race_ethnicity_confirm_ind := adms_appl_dec_info_recs(i).race_ethnicity_confirm_ind;
          ret_row.minority_ind := adms_appl_dec_info_recs(i).minority_ind;
          ret_row.ethnicity := adms_appl_dec_info_recs(i).ethnicity;
          ret_row.deceased_ind := adms_appl_dec_info_recs(i).deceased_ind;
          ret_row.citizenship_ind := adms_appl_dec_info_recs(i).citizenship_ind;
          ret_row.citizenship_type := adms_appl_dec_info_recs(i).citizenship_type;
          ret_row.visa_type := adms_appl_dec_info_recs(i).visa_type;
          ret_row.nation_of_citizenship := adms_appl_dec_info_recs(i).nation_of_citizenship;
          ret_row.nation_of_birth := adms_appl_dec_info_recs(i).nation_of_birth;
          ret_row.primary_disability := adms_appl_dec_info_recs(i).primary_disability;
          ret_row.legacy := adms_appl_dec_info_recs(i).legacy;
          ret_row.marital_status := adms_appl_dec_info_recs(i).marital_status;
          ret_row.religion := adms_appl_dec_info_recs(i).religion;
          ret_row.veteran_type := adms_appl_dec_info_recs(i).veteran_type;
          ret_row.veteran_category := adms_appl_dec_info_recs(i).veteran_category;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.demo_user_attribute_01 := NULL;
          ret_row.demo_user_attribute_01 := ret_row.multi_source;
          ret_row.demo_user_attribute_02 := NULL;
          ret_row.demo_user_attribute_03 := NULL;
          ret_row.demo_user_attribute_04 := NULL;
          ret_row.demo_user_attribute_05 := NULL;
          ret_row.application_number := adms_appl_dec_info_recs(i).application_number;
          ret_row.decision_number := adms_appl_dec_info_recs(i).decision_number;
          ret_row.decision := adms_appl_dec_info_recs(i).decision;
          ret_row.decision_source := adms_appl_dec_info_recs(i).decision_source;
          ret_row.institution_admit_ind := adms_appl_dec_info_recs(i).institution_admit_ind;
          ret_row.applicant_accept_ind := adms_appl_dec_info_recs(i).applicant_accept_ind;
          ret_row.application_inactive_ind := adms_appl_dec_info_recs(i).application_inactive_ind;
          ret_row.institution_denied_ind := adms_appl_dec_info_recs(i).institution_denied_ind;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.appd_user_attribute_01 := NULL;
          ret_row.appd_user_attribute_01 := ret_row.multi_source;
          ret_row.appd_user_attribute_02 := NULL;
          ret_row.appd_user_attribute_03 := NULL;
          ret_row.appd_user_attribute_04 := NULL;
          ret_row.appd_user_attribute_05 := NULL;
          ret_row.application_decision_date := TRUNC(NVL(adms_appl_dec_info_recs(i).decision_date, '31-DEC-2099'));
          IF adms_appl_dec_info_recs(i).latest_decision_number = adms_appl_dec_info_recs(i).decision_number THEN
            ret_row.latest_decision_ind := 1;
          ELSE
            ret_row.latest_decision_ind := 0;
          END IF;
          ret_row.user_measure_01 := NULL;
          ret_row.user_measure_02 := NULL;
          ret_row.user_measure_03 := NULL;
          ret_row.user_measure_04 := NULL;
          ret_row.user_measure_05 := NULL;
          ret_row.system_load_process := 'ADMS_APPL_DECISION';
--
          PIPE ROW(ret_row);
--
          ret_row := ret_row_init;
--
       END LOOP; -- adms_appl_decision_rec
--
   END LOOP;
--
   CLOSE adms_appl_dec_info_cur;
--
   RETURN;
--
  END f_get_adms_appl_decision;
  /******************************************************************************/
  FUNCTION f_get_adms_appl_rating(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_adms_appl_rating_extr PIPELINED IS
--
    ret_row                     WTT_APPLICATION_RATING_INPUT%ROWTYPE;
    ret_row_init                WTT_APPLICATION_RATING_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE adms_appl_rating_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          PERSON_UID                              NUMBER,
          PERSON_WAREHOUSE_UID                    NUMBER,
          APPLICATION_NUMBER                      NUMBER,
          RATING_TYPE                             VARCHAR2(63),
          ADMINISTRATOR_UID                       NUMBER,
          ADMIN_WAREHOUSE_UID                     NUMBER,
          ADMINISTRATOR_ROLE                      VARCHAR2(63),
          ADMINISTRATOR_RATING                    NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          A_ID                                    NUMBER,
          A_FULL_NAME_LFMI                        VARCHAR2(255),
          A_BIRTH_DATE                            DATE,
          A_DECEASED_DATE                         DATE,
          A_EMAIL_ADDRESS                         VARCHAR2(255),
          A_PHONE_NUMBER_COMBINED                 VARCHAR2(63),
          A_CONFIDENTIALITY_IND                   VARCHAR2(1),
          START_DATE                              DATE,
          END_DATE                                DATE
    );
    TYPE refCurType     IS REF CURSOR;
    adms_appl_rating_info_cur       refCurType;
    adms_appl_rating_info_rec        adms_appl_rating_info_rec_type;
    TYPE tab_a_a_rating_info_rec_type   IS TABLE OF adms_appl_rating_info_rec_type INDEX BY PLS_INTEGER;
    adms_appl_rating_info_recs        tab_a_a_rating_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(PW.WAREHOUSE_ENTITY_UID,0)                person_warehouse_uid,
                 A.APPLICATION_NUMBER,
                 A.RATING_TYPE,
                 A.ADMINISTRATOR_UID,
                 NVL(AW.WAREHOUSE_ENTITY_UID,0)                admin_warehouse_uid,
                 A.ADMINISTRATOR_ROLE,
                 A.ADMINISTRATOR_RATING,
                 PD.*,
                 AD.PERSON_ID                                  a_id,
                 AD.FULL_NAME_LFMI                             a_full_name_lfmi,
                 AD.BIRTH_DATE                                 a_birth_date,
                 AD.DECEASED_DATE                              a_deceased_date,
                 AD.EMAIL_ADDRESS                              a_email_address,
                 AD.PHONE_NUMBER_COMBINED                      a_phone_number_combined,
                 AD.CONFIDENTIALITY_IND                        a_confidentiality_ind,
                 AC.start_date,
                 AC.end_date
            FROM WDT_WAREHOUSE_ENTITY PW,
                 WDT_WAREHOUSE_ENTITY AW,
                 MST_ADMISSIONS_RATING A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 WCV_EXTR_PERSON_DETAILS AD,
                 MGT_YEAR_TYPE_DEFINITION AC
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND AW.BANNER_PIDM = A.ADMINISTRATOR_UID
             --BLM mepped (next 2 lines) 7/29 for wdt_warehouse_entity mep effort
             and pw.user_attribute_01 = a.mif_value
             and aw.user_attribute_01 = a.mif_value
             AND PW.BANNER_PIDM = A.PERSON_UID
             AND A.PERSON_UID =  PD.PERSON_ID
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--             AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND A.ADMINISTRATOR_UID =  AD.PERSON_ID
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (AD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) = AD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in) ;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(PW.WAREHOUSE_ENTITY_UID,0)                person_warehouse_uid,
                 A.APPLICATION_NUMBER,
                 A.RATING_TYPE,
                 A.ADMINISTRATOR_UID,
                 NVL(AW.WAREHOUSE_ENTITY_UID,0)                admin_warehouse_uid,
                 A.ADMINISTRATOR_ROLE,
                 A.ADMINISTRATOR_RATING,
                 PD.*,
                 AD.PERSON_ID                                  a_id,
                 AD.FULL_NAME_LFMI                             a_full_name_lfmi,
                 AD.BIRTH_DATE                                 a_birth_date,
                 AD.DECEASED_DATE                              a_deceased_date,
                 AD.EMAIL_ADDRESS                              a_email_address,
                 AD.PHONE_NUMBER_COMBINED                      a_phone_number_combined,
                 AD.CONFIDENTIALITY_IND                        a_confidentiality_ind,
                 AC.start_date,
                 AC.end_date
            FROM WDT_WAREHOUSE_ENTITY PW,
                 WDT_WAREHOUSE_ENTITY AW,
                 MST_ADMISSIONS_RATING A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 WCV_EXTR_PERSON_DETAILS AD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 CHG_APPLICATION_RATING CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             --BLM mepped (next 2 lines) 7/29 for wdt_warehouse_entity mep effort
             and pw.user_attribute_01 = a.mif_value
             and aw.user_attribute_01 = a.mif_value
             AND AW.BANNER_PIDM = A.ADMINISTRATOR_UID
             AND PW.BANNER_PIDM = A.PERSON_UID
             AND A.PERSON_UID =  PD.PERSON_ID
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND A.ADMINISTRATOR_UID =  AD.PERSON_ID
                                       --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (AD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) = AD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in) ;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_APPLICATION_RATING', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_APPLICATION_RATING', 'WFT_APPLICATION_RATING', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        adms_appl_rating_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        adms_appl_rating_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH adms_appl_rating_info_cur BULK COLLECT INTO adms_appl_rating_info_recs LIMIT bulk_size;
       EXIT WHEN adms_appl_rating_info_recs.COUNT = 0;

       FOR i IN adms_appl_rating_info_recs.FIRST..adms_appl_rating_info_recs.LAST
       LOOP
--
         ret_row.multi_source := adms_appl_rating_info_recs(i).multi_source;
         ret_row.process_group := adms_appl_rating_info_recs(i).process_group;
         ret_row.administrative_group := adms_appl_rating_info_recs(i).administrative_group;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.msrc_user_attribute_01 := NULL;
         ret_row.msrc_user_attribute_01 := ret_row.multi_source;
         ret_row.msrc_user_attribute_02 := NULL;
         ret_row.msrc_user_attribute_03 := NULL;
         ret_row.msrc_user_attribute_04 := NULL;
         ret_row.msrc_user_attribute_05 := NULL;
         ret_row.academic_period := adms_appl_rating_info_recs(i).academic_period;
         ret_row.academic_period_begin_date :=  adms_appl_rating_info_recs(i).start_date;
         ret_row.academic_period_end_date :=  adms_appl_rating_info_recs(i).end_date;
         ret_row.academic_year := adms_appl_rating_info_recs(i).academic_year;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.atim_user_attribute_01 := NULL;
         ret_row.atim_user_attribute_01 := ret_row.multi_source;
         ret_row.atim_user_attribute_02 := NULL;
         ret_row.atim_user_attribute_03 := NULL;
         ret_row.atim_user_attribute_04 := NULL;
         ret_row.atim_user_attribute_05 := NULL;
         ret_row.person_uid := adms_appl_rating_info_recs(i).person_warehouse_uid;
         ret_row.id := adms_appl_rating_info_recs(i).id;
         ret_row.full_name_lfmi := adms_appl_rating_info_recs(i).full_name_lfmi;
         ret_row.birth_date := adms_appl_rating_info_recs(i).birth_date;
         ret_row.deceased_date := adms_appl_rating_info_recs(i).deceased_date;
         ret_row.email_address := adms_appl_rating_info_recs(i).email_address;
         ret_row.phone_number_combined := adms_appl_rating_info_recs(i).phone_number_combined;
         ret_row.confidentiality_ind := adms_appl_rating_info_recs(i).confidentiality_ind;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.pers_user_attribute_01 := NULL;
         ret_row.pers_user_attribute_01 := ret_row.multi_source;
         ret_row.pers_user_attribute_02 := NULL;
         ret_row.pers_user_attribute_03 := NULL;
         ret_row.pers_user_attribute_04 := NULL;
         ret_row.pers_user_attribute_05 := NULL;
         ret_row.gender := adms_appl_rating_info_recs(i).gender;
         ret_row.ethnicity_category := adms_appl_rating_info_recs(i).ethnicity_category;
         ret_row.hispanic_latino_ethn_ind := adms_appl_rating_info_recs(i).hispanic_latino_ethnicity_ind;
         ret_row.asian_ind := adms_appl_rating_info_recs(i).asian_ind;
         ret_row.native_amer_or_alaskan_ind := adms_appl_rating_info_recs(i).native_american_or_alaskan_ind;
         ret_row.black_or_african_ind := adms_appl_rating_info_recs(i).black_or_african_ind;
         ret_row.pacific_islander_ind := adms_appl_rating_info_recs(i).pacific_islander_ind;
         ret_row.white_ind := adms_appl_rating_info_recs(i).white_ind;
         IF adms_appl_rating_info_recs(i).number_of_races = 0 and adms_appl_rating_info_recs(i).resident_alien_visa_count > 0 THEN
            ret_row.non_resident_ind := 'Y';
         ELSE
            ret_row.non_resident_ind := 'N';
         END IF;
         IF NVL(adms_appl_rating_info_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND
            adms_appl_rating_info_recs(i).number_of_races = 0 AND
            adms_appl_rating_info_recs(i).resident_alien_visa_count = 0 THEN
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
         ELSE
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
         END IF;
         ret_row.two_or_more_ind := adms_appl_rating_info_recs(i).two_or_more_ind;
         ret_row.race_ethnicity_confirm_ind := adms_appl_rating_info_recs(i).race_ethnicity_confirm_ind;
         ret_row.minority_ind := adms_appl_rating_info_recs(i).minority_ind;
         ret_row.ethnicity := adms_appl_rating_info_recs(i).ethnicity;
         ret_row.deceased_ind := adms_appl_rating_info_recs(i).deceased_ind;
         ret_row.citizenship_ind := adms_appl_rating_info_recs(i).citizenship_ind;
         ret_row.citizenship_type := adms_appl_rating_info_recs(i).citizenship_type;
         ret_row.visa_type := adms_appl_rating_info_recs(i).visa_type;
         ret_row.nation_of_citizenship := adms_appl_rating_info_recs(i).nation_of_citizenship;
         ret_row.nation_of_birth := adms_appl_rating_info_recs(i).nation_of_birth;
         ret_row.primary_disability := adms_appl_rating_info_recs(i).primary_disability;
         ret_row.legacy := adms_appl_rating_info_recs(i).legacy;
         ret_row.marital_status := adms_appl_rating_info_recs(i).marital_status;
         ret_row.religion := adms_appl_rating_info_recs(i).religion;
         ret_row.veteran_type := adms_appl_rating_info_recs(i).veteran_type;
         ret_row.veteran_category := adms_appl_rating_info_recs(i).veteran_category;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.demo_user_attribute_01 := NULL;
         ret_row.demo_user_attribute_01 := ret_row.multi_source;
         ret_row.demo_user_attribute_02 := NULL;
         ret_row.demo_user_attribute_03 := NULL;
         ret_row.demo_user_attribute_04 := NULL;
         ret_row.demo_user_attribute_05 := NULL;
         ret_row.application_number := adms_appl_rating_info_recs(i).application_number;
         ret_row.administrator_uid := adms_appl_rating_info_recs(i).admin_warehouse_uid;
         ret_row.a_id := adms_appl_rating_info_recs(i).a_id;
         ret_row.a_full_name_lfmi := adms_appl_rating_info_recs(i).a_full_name_lfmi;
         ret_row.a_birth_date := adms_appl_rating_info_recs(i).a_birth_date;
         ret_row.a_deceased_date := adms_appl_rating_info_recs(i).a_deceased_date;
         ret_row.a_email_address := adms_appl_rating_info_recs(i).a_email_address;
         ret_row.a_phone_number_combined := adms_appl_rating_info_recs(i).a_phone_number_combined;
         ret_row.a_confidentiality_ind := adms_appl_rating_info_recs(i).a_confidentiality_ind;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.adst_user_attribute_01 := NULL;
         ret_row.adst_user_attribute_01 := ret_row.multi_source;
         ret_row.adst_user_attribute_02 := NULL;
         ret_row.adst_user_attribute_03 := NULL;
         ret_row.adst_user_attribute_04 := NULL;
         ret_row.adst_user_attribute_05 := NULL;
         ret_row.administrator_role := adms_appl_rating_info_recs(i).administrator_role;
         ret_row.rater_ind := 'Y';
         --BLM mepped 6/2/14 for security reasons
         --ret_row.admn_user_attribute_01 := NULL;
         ret_row.admn_user_attribute_01 := ret_row.multi_source;
         ret_row.admn_user_attribute_02 := NULL;
         ret_row.admn_user_attribute_03 := NULL;
         ret_row.admn_user_attribute_04 := NULL;
         ret_row.admn_user_attribute_05 := NULL;
         ret_row.application_rating_type := adms_appl_rating_info_recs(i).rating_type;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.appr_user_attribute_01 := NULL;
         ret_row.appr_user_attribute_01 := ret_row.multi_source;
         ret_row.appr_user_attribute_02 := NULL;
         ret_row.appr_user_attribute_03 := NULL;
         ret_row.appr_user_attribute_04 := NULL;
         ret_row.appr_user_attribute_05 := NULL;
         ret_row.application_rating := adms_appl_rating_info_recs(i).administrator_rating;
         ret_row.user_measure_01 := NULL;
         ret_row.user_measure_02 := NULL;
         ret_row.user_measure_03 := NULL;
         ret_row.user_measure_04 := NULL;
         ret_row.user_measure_05 := NULL;
         ret_row.system_load_process := 'ADMS_APPL_RATING';
--
         PIPE ROW(ret_row);
--
         ret_row := ret_row_init;
--
       END LOOP; -- adms_appl_rating_rec
--
    END LOOP;
--
    CLOSE adms_appl_rating_info_cur;
--
    RETURN;
--
  END f_get_adms_appl_rating;
/******************************************************************************/
FUNCTION f_get_adms_appl_cohort(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_adms_appl_cohort_extr PIPELINED IS
--
    ret_row                     WTT_APPLICATION_COHORT_INPUT%ROWTYPE;
    ret_row_init                WTT_APPLICATION_COHORT_INPUT%ROWTYPE;
    acad_time_rec               MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    acad_time_rec_init          MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
--
--
        TYPE adms_appl_cohort_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          APPLICATION_NUMBER                      NUMBER,
          COHORT                                  VARCHAR2(63),
          COHORT_REPORT_IND                       VARCHAR2(63),
          COHORT_INACTIVE_REASON                  VARCHAR2(63),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    adms_appl_cohort_info_cur       refCurType;
    adms_appl_cohort_rec        adms_appl_cohort_info_rec_type;
    TYPE tab_a_a_cohort_info_rec_type   IS TABLE OF adms_appl_cohort_info_rec_type INDEX BY PLS_INTEGER;
    adms_appl_cohort_info_recs        tab_a_a_cohort_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.APPLICATION_NUMBER,
                 A.COHORT,
                 A.COHORT_REPORT                               cohort_report_ind,
                 A.COHORT_INACTIVE_REASON,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_ADMISSIONS_COHORT A,
                 WCV_EXTR_PERSON_DETAILS PD
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID;
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--             AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.APPLICATION_NUMBER,
                 A.COHORT,
                 A.COHORT_REPORT                               cohort_report_ind,
                 A.COHORT_INACTIVE_REASON,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_ADMISSIONS_COHORT A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 CHG_APPLICATION_COHORT CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID;
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--             AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_APPLICATION_COHORT', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_APPLICATION_COHORT', 'WFT_APPLICATION_COHORT', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    IF process_ind_in = 'L' THEN
        adms_appl_cohort_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        adms_appl_cohort_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
        FETCH adms_appl_cohort_info_cur INTO adms_appl_cohort_rec;
        EXIT WHEN adms_appl_cohort_info_cur%NOTFOUND;
--
      OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, adms_appl_cohort_rec.multi_source, adms_appl_cohort_rec.academic_period, 'ACYR');
      FETCH edw_general_extr.get_year_type INTO acad_time_rec;
      CLOSE edw_general_extr.get_year_type;
--
      ret_row.multi_source := adms_appl_cohort_rec.multi_source;
      ret_row.process_group := adms_appl_cohort_rec.process_group;
      ret_row.administrative_group := adms_appl_cohort_rec.administrative_group;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.msrc_user_attribute_01 := NULL;
      ret_row.msrc_user_attribute_01 := ret_row.multi_source;
      ret_row.msrc_user_attribute_02 := NULL;
      ret_row.msrc_user_attribute_03 := NULL;
      ret_row.msrc_user_attribute_04 := NULL;
      ret_row.msrc_user_attribute_05 := NULL;
      ret_row.academic_period := adms_appl_cohort_rec.academic_period;
      ret_row.academic_period_begin_date := acad_time_rec.start_date;
      ret_row.academic_period_end_date := acad_time_rec.end_date;
      ret_row.academic_year := adms_appl_cohort_rec.academic_year;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.atim_user_attribute_01 := NULL;
      ret_row.atim_user_attribute_01 := ret_row.multi_source;
      ret_row.atim_user_attribute_02 := NULL;
      ret_row.atim_user_attribute_03 := NULL;
      ret_row.atim_user_attribute_04 := NULL;
      ret_row.atim_user_attribute_05 := NULL;
      ret_row.person_uid := adms_appl_cohort_rec.warehouse_entity_uid;
      ret_row.id := adms_appl_cohort_rec.id;
      ret_row.full_name_lfmi := adms_appl_cohort_rec.full_name_lfmi;
      ret_row.birth_date := adms_appl_cohort_rec.birth_date;
      ret_row.deceased_date := adms_appl_cohort_rec.deceased_date;
      ret_row.email_address := adms_appl_cohort_rec.email_address;
      ret_row.phone_number_combined := adms_appl_cohort_rec.phone_number_combined;
      ret_row.confidentiality_ind := adms_appl_cohort_rec.confidentiality_ind;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.pers_user_attribute_01 := NULL;
      ret_row.pers_user_attribute_01 := ret_row.multi_source;
      ret_row.pers_user_attribute_02 := NULL;
      ret_row.pers_user_attribute_03 := NULL;
      ret_row.pers_user_attribute_04 := NULL;
      ret_row.pers_user_attribute_05 := NULL;
      ret_row.gender := adms_appl_cohort_rec.gender;
      ret_row.ethnicity_category := adms_appl_cohort_rec.ethnicity_category;
      ret_row.hispanic_latino_ethn_ind := adms_appl_cohort_rec.hispanic_latino_ethnicity_ind;
      ret_row.asian_ind := adms_appl_cohort_rec.asian_ind;
      ret_row.native_amer_or_alaskan_ind := adms_appl_cohort_rec.native_american_or_alaskan_ind;
      ret_row.black_or_african_ind := adms_appl_cohort_rec.black_or_african_ind;
      ret_row.pacific_islander_ind := adms_appl_cohort_rec.pacific_islander_ind;
      ret_row.white_ind := adms_appl_cohort_rec.white_ind;
      IF adms_appl_cohort_rec.number_of_races = 0 and adms_appl_cohort_rec.resident_alien_visa_count > 0 THEN
         ret_row.non_resident_ind := 'Y';
      ELSE
         ret_row.non_resident_ind := 'N';
      END IF;
      IF NVL(adms_appl_cohort_rec.hispanic_latino_ethnicity_ind,'N') = 'N' AND
         adms_appl_cohort_rec.number_of_races = 0 AND
         adms_appl_cohort_rec.resident_alien_visa_count = 0 THEN
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
      ELSE
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
      END IF;
      ret_row.two_or_more_ind := adms_appl_cohort_rec.two_or_more_ind;
      ret_row.race_ethnicity_confirm_ind := adms_appl_cohort_rec.race_ethnicity_confirm_ind;
      ret_row.minority_ind := adms_appl_cohort_rec.minority_ind;
      ret_row.ethnicity := adms_appl_cohort_rec.ethnicity;
      ret_row.deceased_ind := adms_appl_cohort_rec.deceased_ind;
      ret_row.citizenship_ind := adms_appl_cohort_rec.citizenship_ind;
      ret_row.citizenship_type := adms_appl_cohort_rec.citizenship_type;
      ret_row.visa_type := adms_appl_cohort_rec.visa_type;
      ret_row.nation_of_citizenship := adms_appl_cohort_rec.nation_of_citizenship;
      ret_row.nation_of_birth := adms_appl_cohort_rec.nation_of_birth;
      ret_row.primary_disability := adms_appl_cohort_rec.primary_disability;
      ret_row.legacy := adms_appl_cohort_rec.legacy;
      ret_row.marital_status := adms_appl_cohort_rec.marital_status;
      ret_row.religion := adms_appl_cohort_rec.religion;
      ret_row.veteran_type := adms_appl_cohort_rec.veteran_type;
      ret_row.veteran_category := adms_appl_cohort_rec.veteran_category;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.demo_user_attribute_01 := NULL;
      ret_row.demo_user_attribute_01 := ret_row.multi_source;
      ret_row.demo_user_attribute_02 := NULL;
      ret_row.demo_user_attribute_03 := NULL;
      ret_row.demo_user_attribute_04 := NULL;
      ret_row.demo_user_attribute_05 := NULL;
      ret_row.application_number := adms_appl_cohort_rec.application_number;
      ret_row.cohort := adms_appl_cohort_rec.cohort;
      ret_row.cohort_report_ind := adms_appl_cohort_rec.cohort_report_ind;
      ret_row.cohort_inactive_reason := adms_appl_cohort_rec.cohort_inactive_reason;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.coht_user_attribute_01 := NULL;
      ret_row.coht_user_attribute_01 := ret_row.multi_source;
      ret_row.coht_user_attribute_02 := NULL;
      ret_row.coht_user_attribute_03 := NULL;
      ret_row.coht_user_attribute_04 := NULL;
      ret_row.coht_user_attribute_05 := NULL;
      ret_row.user_measure_01 := NULL;
      ret_row.user_measure_02 := NULL;
      ret_row.user_measure_03 := NULL;
      ret_row.user_measure_04 := NULL;
      ret_row.user_measure_05 := NULL;
      ret_row.system_load_process := 'ADMS_APPL_COHORT';
--
      PIPE ROW(ret_row);
--
      ret_row := ret_row_init;
      acad_time_rec := acad_time_rec_init;
--
    END LOOP; -- adms_appl_cohort_rec
--
    RETURN;
--
  END f_get_adms_appl_cohort;
  /******************************************************************************/
  FUNCTION f_get_adms_appl_attr(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_adms_appl_attr_extr PIPELINED IS
--
    ret_row                     WTT_APPL_ATTRIBUTE_INPUT%ROWTYPE;
    ret_row_init                WTT_APPL_ATTRIBUTE_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE adms_appl_attr_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          APPLICATION_NUMBER                      NUMBER,
          ADMISSIONS_ATTRIBUTE                    VARCHAR2(63),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          START_DATE                              DATE,
          END_DATE                                DATE
    );
    TYPE refCurType     IS REF CURSOR;
    adms_appl_attr_info_cur       refCurType;
    adms_appl_attr_info_rec        adms_appl_attr_info_rec_type;
    TYPE tab_a_appl_attr_info_rec_type   IS TABLE OF adms_appl_attr_info_rec_type INDEX BY PLS_INTEGER;
    adms_appl_attr_info_recs        tab_a_appl_attr_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.APPLICATION_NUMBER,
                 A.ADMISSIONS_ATTRIBUTE,
                 PD.*,
                 AC.start_date,
                 AC.end_date
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_ADMISSIONS_ATTRIBUTE A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in);
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.APPLICATION_NUMBER,
                 A.ADMISSIONS_ATTRIBUTE,
                 PD.*,
                 AC.start_date,
                 AC.end_date
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_ADMISSIONS_ATTRIBUTE A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 CHG_APPLICATION_ATTRIBUTE CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in);
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_APPLICATION_ATTRIBUTE', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_APPLICATION_ATTRIBUTE', 'WFT_APPLICATION_ATTRIBUTE', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        adms_appl_attr_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        adms_appl_attr_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH adms_appl_attr_info_cur BULK COLLECT INTO adms_appl_attr_info_recs LIMIT bulk_size;
       EXIT WHEN adms_appl_attr_info_recs.COUNT = 0;
--
       FOR i IN adms_appl_attr_info_recs.FIRST..adms_appl_attr_info_recs.LAST
       LOOP
--
         ret_row.multi_source := adms_appl_attr_info_recs(i).multi_source;
         ret_row.process_group := adms_appl_attr_info_recs(i).process_group;
         ret_row.administrative_group := adms_appl_attr_info_recs(i).administrative_group;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.msrc_user_attribute_01 := NULL;
         ret_row.msrc_user_attribute_01 := ret_row.multi_source;
         ret_row.msrc_user_attribute_02 := NULL;
         ret_row.msrc_user_attribute_03 := NULL;
         ret_row.msrc_user_attribute_04 := NULL;
         ret_row.msrc_user_attribute_05 := NULL;
         ret_row.academic_period := adms_appl_attr_info_recs(i).academic_period;
         ret_row.academic_period_begin_date := adms_appl_attr_info_recs(i).start_date;
         ret_row.academic_period_end_date := adms_appl_attr_info_recs(i).end_date;
         ret_row.academic_year := adms_appl_attr_info_recs(i).academic_year;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.atim_user_attribute_01 := NULL;
         ret_row.atim_user_attribute_01 := ret_row.multi_source;
         ret_row.atim_user_attribute_02 := NULL;
         ret_row.atim_user_attribute_03 := NULL;
         ret_row.atim_user_attribute_04 := NULL;
         ret_row.atim_user_attribute_05 := NULL;
         ret_row.person_uid := adms_appl_attr_info_recs(i).warehouse_entity_uid;
         ret_row.id := adms_appl_attr_info_recs(i).id;
         ret_row.full_name_lfmi := adms_appl_attr_info_recs(i).full_name_lfmi;
         ret_row.birth_date := adms_appl_attr_info_recs(i).birth_date;
         ret_row.deceased_date := adms_appl_attr_info_recs(i).deceased_date;
         ret_row.email_address := adms_appl_attr_info_recs(i).email_address;
         ret_row.phone_number_combined := adms_appl_attr_info_recs(i).phone_number_combined;
         ret_row.confidentiality_ind := adms_appl_attr_info_recs(i).confidentiality_ind;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.pers_user_attribute_01 := NULL;
         ret_row.pers_user_attribute_01 := ret_row.multi_source;
         ret_row.pers_user_attribute_02 := NULL;
         ret_row.pers_user_attribute_03 := NULL;
         ret_row.pers_user_attribute_04 := NULL;
         ret_row.pers_user_attribute_05 := NULL;
         ret_row.gender := adms_appl_attr_info_recs(i).gender;
         ret_row.ethnicity_category := adms_appl_attr_info_recs(i).ethnicity_category;
         ret_row.hispanic_latino_ethn_ind := adms_appl_attr_info_recs(i).hispanic_latino_ethnicity_ind;
         ret_row.asian_ind := adms_appl_attr_info_recs(i).asian_ind;
         ret_row.native_amer_or_alaskan_ind := adms_appl_attr_info_recs(i).native_american_or_alaskan_ind;
         ret_row.black_or_african_ind := adms_appl_attr_info_recs(i).black_or_african_ind;
         ret_row.pacific_islander_ind := adms_appl_attr_info_recs(i).pacific_islander_ind;
         ret_row.white_ind := adms_appl_attr_info_recs(i).white_ind;
         IF adms_appl_attr_info_recs(i).number_of_races = 0 and adms_appl_attr_info_recs(i).resident_alien_visa_count > 0 THEN
            ret_row.non_resident_ind := 'Y';
         ELSE
            ret_row.non_resident_ind := 'N';
         END IF;
         IF NVL(adms_appl_attr_info_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N'
            AND adms_appl_attr_info_recs(i).number_of_races = 0
            AND adms_appl_attr_info_recs(i).resident_alien_visa_count = 0 THEN
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
         ELSE
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
         END IF;
         ret_row.two_or_more_ind := adms_appl_attr_info_recs(i).two_or_more_ind;
         ret_row.race_ethnicity_confirm_ind := adms_appl_attr_info_recs(i).race_ethnicity_confirm_ind;
         ret_row.minority_ind := adms_appl_attr_info_recs(i).minority_ind;
         ret_row.ethnicity := adms_appl_attr_info_recs(i).ethnicity;
         ret_row.deceased_ind := adms_appl_attr_info_recs(i).deceased_ind;
         ret_row.citizenship_ind := adms_appl_attr_info_recs(i).citizenship_ind;
         ret_row.citizenship_type := adms_appl_attr_info_recs(i).citizenship_type;
         ret_row.visa_type := adms_appl_attr_info_recs(i).visa_type;
         ret_row.nation_of_citizenship := adms_appl_attr_info_recs(i).nation_of_citizenship;
         ret_row.nation_of_birth := adms_appl_attr_info_recs(i).nation_of_birth;
         ret_row.primary_disability := adms_appl_attr_info_recs(i).primary_disability;
         ret_row.legacy := adms_appl_attr_info_recs(i).legacy;
         ret_row.marital_status := adms_appl_attr_info_recs(i).marital_status;
         ret_row.religion := adms_appl_attr_info_recs(i).religion;
         ret_row.veteran_type := adms_appl_attr_info_recs(i).veteran_type;
         ret_row.veteran_category := adms_appl_attr_info_recs(i).veteran_category;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.demo_user_attribute_01 := NULL;
         ret_row.demo_user_attribute_01 := ret_row.multi_source;
         ret_row.demo_user_attribute_02 := NULL;
         ret_row.demo_user_attribute_03 := NULL;
         ret_row.demo_user_attribute_04 := NULL;
         ret_row.demo_user_attribute_05 := NULL;
         ret_row.application_number := adms_appl_attr_info_recs(i).application_number;
         ret_row.attribute := adms_appl_attr_info_recs(i).admissions_attribute;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.attr_user_attribute_01 := NULL;
         ret_row.attr_user_attribute_01 := ret_row.multi_source;
         ret_row.attr_user_attribute_02 := NULL;
         ret_row.attr_user_attribute_03 := NULL;
         ret_row.attr_user_attribute_04 := NULL;
         ret_row.attr_user_attribute_05 := NULL;
         ret_row.user_measure_01 := NULL;
         ret_row.user_measure_02 := NULL;
         ret_row.user_measure_03 := NULL;
         ret_row.user_measure_04 := NULL;
         ret_row.user_measure_05 := NULL;
         ret_row.system_load_process := 'ADMS_APPL_ATTR';
--
         PIPE ROW(ret_row);
--
         ret_row := ret_row_init;
--
       END LOOP; -- adms_appl_attr_rec
--
    END LOOP;
--
    CLOSE adms_appl_attr_info_cur;
--
    RETURN;
--
  END f_get_adms_appl_attr;
/******************************************************************************/
  FUNCTION f_get_adms_appl_reqr(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_adms_appl_reqr_extr PIPELINED IS
--
    ret_row                     WTT_APPL_REQUIREMENT_INPUT%ROWTYPE;
    ret_row_init                WTT_APPL_REQUIREMENT_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE adms_appl_reqr_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          APPLICATION_NUMBER                      NUMBER,
          REQUIREMENT                             VARCHAR2(63),
          WAIVED_IND                              NUMBER,
          COMPLETED_IND                           NUMBER,
          REQUIREMENT_MANDATORY_IND               NUMBER,
          FIRST_REQUEST_DATE                      DATE,
          MOST_RECENT_REQUEST_DATE                DATE,
          REQUIREMENT_DEADLINE_DATE               DATE,
          REQUIREMENT_RECEIVED_DATE               DATE,
          REQUIREMENT_REQUESTED_COUNT             NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          START_DATE                              DATE,
          END_DATE                                DATE
    );
    TYPE refCurType     IS REF CURSOR;
    adms_appl_reqr_info_cur       refCurType;
    adms_appl_reqr_info_rec        adms_appl_reqr_info_rec_type;
    TYPE tab_a_appl_reqr_info_rec_type   IS TABLE OF adms_appl_reqr_info_rec_type INDEX BY PLS_INTEGER;
    adms_appl_reqr_info_recs        tab_a_appl_reqr_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)                  multi_source,
                 A.ZONE_VALUE                                           process_group,
                 A.DOMAIN_VALUE                                         administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                         warehouse_entity_uid,
                 A.APPLICATION_NUMBER,
                 A.REQUIREMENT,
                 DECODE(A.WAIVED_IND,'Y', 1, 0)                         waived_ind,
                 DECODE(A.COMPLETED_IND,'Y', 1, 0)                      completed_ind,
                 DECODE(A.REQUIREMENT_MANDATORY_IND,'Y', 1, 0)          requirement_mandatory_ind,
                 NVL(TRUNC(A.FIRST_REQUEST_DATE),'31-DEC-2099')         first_request_date,
                 NVL(TRUNC(A.MOST_RECENT_REQUEST_DATE),'31-DEC-2099')   most_recent_request_date,
                 NVL(TRUNC(A.REQUIREMENT_DEADLINE_DATE),'31-DEC-2099')  requirement_deadline_date,
                 NVL(TRUNC(A.REQUIREMENT_RECEIVED_DATE),'31-DEC-2099')  requirement_received_date,
                 A.REQUIREMENT_REQUESTED_COUNT,
                 PD.*,
                 AC.start_date,
                 AC.end_date
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_ADMISSIONS_REQUIREMENT A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in) ;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)                  multi_source,
                 A.ZONE_VALUE                                           process_group,
                 A.DOMAIN_VALUE                                         administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                         warehouse_entity_uid,
                 A.APPLICATION_NUMBER,
                 A.REQUIREMENT,
                 DECODE(A.WAIVED_IND,'Y', 1, 0)                         waived_ind,
                 DECODE(A.COMPLETED_IND,'Y', 1, 0)                      completed_ind,
                 DECODE(A.REQUIREMENT_MANDATORY_IND,'Y', 1, 0)          requirement_mandatory_ind,
                 NVL(TRUNC(A.FIRST_REQUEST_DATE),'31-DEC-2099')         first_request_date,
                 NVL(TRUNC(A.MOST_RECENT_REQUEST_DATE),'31-DEC-2099')   most_recent_request_date,
                 NVL(TRUNC(A.REQUIREMENT_DEADLINE_DATE),'31-DEC-2099')  requirement_deadline_date,
                 NVL(TRUNC(A.REQUIREMENT_RECEIVED_DATE),'31-DEC-2099')  requirement_received_date,
                 A.REQUIREMENT_REQUESTED_COUNT,
                 PD.*,
                 AC.start_date,
                 AC.end_date
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_ADMISSIONS_REQUIREMENT A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 CHG_APPLICATION_REQUIREMENT CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in) ;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_APPLICATION_REQUIREMENT', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_APPLICATION_REQUIREMENT', 'WFT_APPLICATION_REQUIREMENT', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        adms_appl_reqr_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        adms_appl_reqr_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
   LOOP
      FETCH adms_appl_reqr_info_cur BULK COLLECT INTO adms_appl_reqr_info_recs LIMIT bulk_size;
      EXIT WHEN adms_appl_reqr_info_recs.COUNT = 0;
--
      FOR i IN adms_appl_reqr_info_recs.FIRST..adms_appl_reqr_info_recs.LAST
      LOOP
--
         ret_row.multi_source := adms_appl_reqr_info_recs(i).multi_source;
         ret_row.process_group := adms_appl_reqr_info_recs(i).process_group;
         ret_row.administrative_group := adms_appl_reqr_info_recs(i).administrative_group;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.msrc_user_attribute_01 := NULL;
         ret_row.msrc_user_attribute_01 := ret_row.multi_source;
         ret_row.msrc_user_attribute_02 := NULL;
         ret_row.msrc_user_attribute_03 := NULL;
         ret_row.msrc_user_attribute_04 := NULL;
         ret_row.msrc_user_attribute_05 := NULL;
         ret_row.academic_period := adms_appl_reqr_info_recs(i).academic_period;
         ret_row.academic_period_begin_date := adms_appl_reqr_info_recs(i).start_date;
         ret_row.academic_period_end_date := adms_appl_reqr_info_recs(i).end_date;
         ret_row.academic_year := adms_appl_reqr_info_recs(i).academic_year;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.atim_user_attribute_01 := NULL;
         ret_row.atim_user_attribute_01 := ret_row.multi_source;
         ret_row.atim_user_attribute_02 := NULL;
         ret_row.atim_user_attribute_03 := NULL;
         ret_row.atim_user_attribute_04 := NULL;
         ret_row.atim_user_attribute_05 := NULL;
         ret_row.person_uid := adms_appl_reqr_info_recs(i).warehouse_entity_uid;
         ret_row.id := adms_appl_reqr_info_recs(i).id;
         ret_row.full_name_lfmi := adms_appl_reqr_info_recs(i).full_name_lfmi;
         ret_row.birth_date := adms_appl_reqr_info_recs(i).birth_date;
         ret_row.deceased_date := adms_appl_reqr_info_recs(i).deceased_date;
         ret_row.email_address := adms_appl_reqr_info_recs(i).email_address;
         ret_row.phone_number_combined := adms_appl_reqr_info_recs(i).phone_number_combined;
         ret_row.confidentiality_ind := adms_appl_reqr_info_recs(i).confidentiality_ind;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.pers_user_attribute_01 := NULL;
         ret_row.pers_user_attribute_01 := ret_row.multi_source;
         ret_row.pers_user_attribute_02 := NULL;
         ret_row.pers_user_attribute_03 := NULL;
         ret_row.pers_user_attribute_04 := NULL;
         ret_row.pers_user_attribute_05 := NULL;
         ret_row.gender := adms_appl_reqr_info_recs(i).gender;
         ret_row.ethnicity_category := adms_appl_reqr_info_recs(i).ethnicity_category;
         ret_row.hispanic_latino_ethn_ind := adms_appl_reqr_info_recs(i).hispanic_latino_ethnicity_ind;
         ret_row.asian_ind := adms_appl_reqr_info_recs(i).asian_ind;
         ret_row.native_amer_or_alaskan_ind := adms_appl_reqr_info_recs(i).native_american_or_alaskan_ind;
         ret_row.black_or_african_ind := adms_appl_reqr_info_recs(i).black_or_african_ind;
         ret_row.pacific_islander_ind := adms_appl_reqr_info_recs(i).pacific_islander_ind;
         ret_row.white_ind := adms_appl_reqr_info_recs(i).white_ind;
         IF adms_appl_reqr_info_recs(i).number_of_races = 0 and adms_appl_reqr_info_recs(i).resident_alien_visa_count > 0 THEN
            ret_row.non_resident_ind := 'Y';
         ELSE
            ret_row.non_resident_ind := 'N';
         END IF;
         IF NVL(adms_appl_reqr_info_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N'
             AND adms_appl_reqr_info_recs(i).number_of_races = 0
             AND adms_appl_reqr_info_recs(i).resident_alien_visa_count = 0 THEN
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
         ELSE
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
         END IF;
         ret_row.two_or_more_ind := adms_appl_reqr_info_recs(i).two_or_more_ind;
         ret_row.race_ethnicity_confirm_ind := adms_appl_reqr_info_recs(i).race_ethnicity_confirm_ind;
         ret_row.minority_ind := adms_appl_reqr_info_recs(i).minority_ind;
         ret_row.ethnicity := adms_appl_reqr_info_recs(i).ethnicity;
         ret_row.deceased_ind := adms_appl_reqr_info_recs(i).deceased_ind;
         ret_row.citizenship_ind := adms_appl_reqr_info_recs(i).citizenship_ind;
         ret_row.citizenship_type := adms_appl_reqr_info_recs(i).citizenship_type;
         ret_row.visa_type := adms_appl_reqr_info_recs(i).visa_type;
         ret_row.nation_of_citizenship := adms_appl_reqr_info_recs(i).nation_of_citizenship;
         ret_row.nation_of_birth := adms_appl_reqr_info_recs(i).nation_of_birth;
         ret_row.primary_disability := adms_appl_reqr_info_recs(i).primary_disability;
         ret_row.legacy := adms_appl_reqr_info_recs(i).legacy;
         ret_row.marital_status := adms_appl_reqr_info_recs(i).marital_status;
         ret_row.religion := adms_appl_reqr_info_recs(i).religion;
         ret_row.veteran_type := adms_appl_reqr_info_recs(i).veteran_type;
         ret_row.veteran_category := adms_appl_reqr_info_recs(i).veteran_category;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.demo_user_attribute_01 := NULL;
         ret_row.demo_user_attribute_01 := ret_row.multi_source;
         ret_row.demo_user_attribute_02 := NULL;
         ret_row.demo_user_attribute_03 := NULL;
         ret_row.demo_user_attribute_04 := NULL;
         ret_row.demo_user_attribute_05 := NULL;
         ret_row.application_number := adms_appl_reqr_info_recs(i).application_number;
         ret_row.application_requirement := adms_appl_reqr_info_recs(i).requirement;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.apprq_user_attribute_01 := NULL;
         ret_row.apprq_user_attribute_01 := ret_row.multi_source;
         ret_row.apprq_user_attribute_02 := NULL;
         ret_row.apprq_user_attribute_03 := NULL;
         ret_row.apprq_user_attribute_04 := NULL;
         ret_row.apprq_user_attribute_05 := NULL;
         ret_row.requirement_waived_ind := adms_appl_reqr_info_recs(i).waived_ind;
         ret_row.requirement_completed_ind := adms_appl_reqr_info_recs(i).completed_ind;
         ret_row.requirement_mandatory_ind := adms_appl_reqr_info_recs(i).requirement_mandatory_ind;
         ret_row.first_request_date := TRUNC(NVL(adms_appl_reqr_info_recs(i).first_request_date, '31-DEC-2099'));
         ret_row.most_recent_request_date := TRUNC(NVL(adms_appl_reqr_info_recs(i).most_recent_request_date, '31-DEC-2099'));
         ret_row.requirement_deadline_date := TRUNC(NVL(adms_appl_reqr_info_recs(i).requirement_deadline_date, '31-DEC-2099'));
         ret_row.requirement_received_date := TRUNC(NVL(adms_appl_reqr_info_recs(i).requirement_received_date, '31-DEC-2099'));
         ret_row.requirement_requested_count := adms_appl_reqr_info_recs(i).requirement_requested_count;
         ret_row.user_measure_01 := NULL;
         ret_row.user_measure_02 := NULL;
         ret_row.user_measure_03 := NULL;
         ret_row.user_measure_04 := NULL;
         ret_row.user_measure_05 := NULL;
         ret_row.system_load_process := 'ADMS_APPL_REQR';
--
         PIPE ROW(ret_row);
--
         ret_row := ret_row_init;
--
      END LOOP; -- adms_appl_reqr_rec
--
   END LOOP;
--
   CLOSE adms_appl_reqr_info_cur;
--
   RETURN;
--
  END f_get_adms_appl_reqr;
/******************************************************************************/
  FUNCTION f_get_admissions_recruitment(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_admissions_recr_extr PIPELINED IS
--
    ret_row                             WTT_ADMISSIONS_RECR_INPUT%ROWTYPE;
    ret_row_init                        WTT_ADMISSIONS_RECR_INPUT%ROWTYPE;
    georegion_rec                       MGT_GEOGRAPHIC_REGION%ROWTYPE;
    georegion_rec_init                  MGT_GEOGRAPHIC_REGION%ROWTYPE;
    default_rec                         WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                          MTVPARM%ROWTYPE;
    bulk_size                           NUMBER;
    fetch_finaid_details                BOOLEAN := TRUE;
--
--

--
   finaid_appl_amt_recs            edw_finaid_extr.tab_finaid_appl_amts;
   finaid_appl_need_recs           edw_finaid_extr.tab_finaid_appl_need;
   total_offer_amts_acad_pd_recs  edw_finaid_extr.tab_total_offer_amts_acad_pd;
   application_ind_recs             edw_finaid_extr.tab_application_inds;
--
   finaid_indx       VARCHAR2(2000);
   finaid_ap_indx    VARCHAR2(2000);
--
        TYPE recruitment_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(4),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          RECRUIT_NUMBER                          NUMBER,
          RECRUIT_STATUS                          VARCHAR2(63),
          PRIMARY_SOURCE                          VARCHAR2(63),
          RECRUITER                               VARCHAR2(63),
          RECRUIT_TYPE                            VARCHAR2(63),
          WITHDRAWAL_REASON                       VARCHAR2(63),
          INSTITUTION_ATTENDING                   VARCHAR2(63),
          STUDENT_POPULATION                      VARCHAR2(63),
          ADMISSION_POPULATION                    VARCHAR2(63),
          INTENDED_TIME_STATUS                    VARCHAR2(1),
          EDUCATION_GOAL                          VARCHAR2(63),
          EDUCATION_LEVEL                         VARCHAR2(63),
          RESIDENCY                               VARCHAR2(63),
          RESIDENCY_IND                           VARCHAR2(1),
          SITE                                    VARCHAR2(63),
          INQUIRED_IND                            CHAR(1),
          APPLIED_IND                             CHAR(1),
          ADMITTED_IND                            CHAR(1),
          ACCEPTED_IND                            CHAR(1),
          ENROLLED_IND                            CHAR(1),
          STUDENT_LEVEL                           VARCHAR2(63),
          PROGRAM                                 VARCHAR2(63),
          CAMPUS                                  VARCHAR2(63),
          COLLEGE                                 VARCHAR2(63),
          AWARD_CATEGORY                          VARCHAR2(63),
          DEGREE                                  VARCHAR2(63),
          MAJOR                                   VARCHAR2(63),
          PROGRAM_CLASSIFICATION                  VARCHAR2(63),
          DEPARTMENT                              VARCHAR2(63),
          SECOND_MAJOR                            VARCHAR2(63),
          SECOND_PROGRAM_CLASSIFICATION           VARCHAR2(63),
          SECOND_DEPARTMENT                       VARCHAR2(63),
          RECRUIT_ADD_DATE                        DATE,
          PRIMARY_RECRUIT_RECORD_IND              NUMBER,
          TUITION_DEPOSITED_IND                   CHAR(1),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          START_DATE                              DATE,
          END_DATE                                DATE,
          AID_YEAR                                VARCHAR2(63),
          STUDENT_CLASSIFICATION                  VARCHAR2(63)
    );
    TYPE refCurType     IS REF CURSOR;
    recruitment_info_cur       refCurType;
    recruitment_info_rec        recruitment_info_rec_type;
    TYPE tab_recruitment_info_rec_type   IS TABLE OF recruitment_info_rec_type INDEX BY PLS_INTEGER;
    recruitment_info_recs        tab_recruitment_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT 
          --BLM 7/29/14 source view is not mepped so this will cartesian on wdt_warehouse_entity
          --changing from a.mif_value to we.user_attribute_01
          --NVL(A.MIF_VALUE, def_multi_source_in)                                                      multi_source,
            NVL(we.user_attribute_01, def_multi_source_in)                                                      multi_source,
                 A.ZONE_VALUE                                                                               process_group,
                 A.DOMAIN_VALUE                                                                             administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                                                             warehouse_entity_uid,
                 A.RECRUIT_NUMBER,
                 A.RECRUIT_STATUS,
                 A.PRIMARY_SOURCE,
                 A.RECRUITER,
                 A.RECRUIT_TYPE,
                 A.WITHDRAWAL_REASON,
                 A.OTHER_INSTITUTION                                                                        institution_attending,
                 A.STUDENT_POPULATION,
                 A.ADMISSION_POPULATION,
                 A.FULL_PART_TIME_IND                                                                       intended_time_status,
                 A.EDUCATION_GOAL,
                 A.EDUCATION_LEVEL,
                 A.RESIDENCY,
                 DECODE(A.RESIDENCY_IND,'I','Y','N')                                                        residency_ind,
                 A.SITE,
                 'Y'                                                                                        inquired_ind,
                 'N'                                                                                        applied_ind,
                 'N'                                                                                        admitted_ind,
                 'N'                                                                                        accepted_ind,
                 'N'                                                                                        enrolled_ind,
                 A.RECRUIT_LEVEL                                                                            student_level,
                 A.PROGRAM,
                 A.CAMPUS,
                 A.COLLEGE,
                 A.AWARD_CATEGORY,
                 A.DEGREE,
                 A.MAJOR,
                 A.PROGRAM_CLASSIFICATION,
                 A.DEPARTMENT,
                 A.SECOND_MAJOR,
                 A.SECOND_PROGRAM_CLASSIFICATION,
                 A.SECOND_DEPARTMENT,
                 A.DATE_ADDED                                                                               recruit_add_date,
                 DECODE(A.PRIMARY_RECRUIT_RECORD_IND, 'Y', 1, 0)                                            primary_recruit_record_ind,
                 (SELECT 'Y'
                    FROM MTT_AR_DEPOSIT
                  WHERE ACCOUNT_UID = A.PERSON_UID
                      AND ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                      AND NVL(MIF_VALUE, ' ') = NVL(A.MIF_VALUE, ' ')
                      AND ROWNUM = 1
                 ) tuition_deposited_ind,
                 PD.*,
                 AC.start_date,
                 AC.end_date,
                 FY.aid_year,
                 SC.student_classification
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_RECRUITMENT_INFORMATION A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 MGT_STUDENT_PERIOD_DEFINITION FY,
                 WCV_EXTR_STUD_CLASSIFICATION SC
           WHERE A.CURRICULUM_ORDER = 1
             AND ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             AND A.PERSON_UID =  PD.PERSON_ID
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)
             --BLM added 7/29/14 for wdt_warehouse_entity mep effort
             and nvl(we.user_attribute_01, def_multi_source_in) = nvl(ac.mif_value(+), def_multi_source_in)
             AND A.PERSON_UID = FY.PERSON_UID(+)
             AND A.ACADEMIC_PERIOD = FY.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(FY.MIF_VALUE(+), def_multi_source_in)
             --BLM added 7/29/14 for wdt_warehouse_entity mep effort
             and nvl(we.user_attribute_01, def_multi_source_in) = nvl(fy.mif_value(+), def_multi_source_in)
             AND A.PERSON_UID = SC.PERSON_UID(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(SC.MIF_VALUE(+), def_multi_source_in)
             --BLM added 7/29/14 for wdt_warehouse_entity mep effort
             and nvl(we.user_attribute_01, def_multi_source_in) = nvl(sc.mif_value(+), def_multi_source_in)
             AND A.RECRUIT_LEVEL = SC.STUDENT_LEVEL(+)
             AND (A.ACADEMIC_PERIOD >= SC.MIN_ACAD_PER(+) AND  A.ACADEMIC_PERIOD < SC.MAX_ACAD_PER(+) ) ;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT           --BLM 7/29/14 source view is not mepped so this will cartesian on wdt_warehouse_entity
          --changing from a.mif_value to we.user_attribute_01
                 --DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)                                                      multi_source,
                 DISTINCT NVL(we.user_attribute_01, def_multi_source_in)                                    multi_source,
                 A.ZONE_VALUE                                                                               process_group,
                 A.DOMAIN_VALUE                                                                             administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                                                             warehouse_entity_uid,
                 A.RECRUIT_NUMBER,
                 A.RECRUIT_STATUS,
                 A.PRIMARY_SOURCE,
                 A.RECRUITER,
                 A.RECRUIT_TYPE,
                 A.WITHDRAWAL_REASON,
                 A.OTHER_INSTITUTION                                                                        institution_attending,
                 A.STUDENT_POPULATION,
                 A.ADMISSION_POPULATION,
                 A.FULL_PART_TIME_IND                                                                       intended_time_status,
                 A.EDUCATION_GOAL,
                 A.EDUCATION_LEVEL,
                 A.RESIDENCY,
                 DECODE(A.RESIDENCY_IND,'I','Y','N')                                                        residency_ind,
                 A.SITE,
                 'Y'                                                                                        inquired_ind,
                 'N'                                                                                        applied_ind,
                 'N'                                                                                        admitted_ind,
                 'N'                                                                                        accepted_ind,
                 'N'                                                                                        enrolled_ind,
                 A.RECRUIT_LEVEL                                                                            student_level,
                 A.PROGRAM,
                 A.CAMPUS,
                 A.COLLEGE,
                 A.AWARD_CATEGORY,
                 A.DEGREE,
                 A.MAJOR,
                 A.PROGRAM_CLASSIFICATION,
                 A.DEPARTMENT,
                 A.SECOND_MAJOR,
                 A.SECOND_PROGRAM_CLASSIFICATION,
                 A.SECOND_DEPARTMENT,
                 A.DATE_ADDED                                                                               recruit_add_date,
                 DECODE(A.PRIMARY_RECRUIT_RECORD_IND, 'Y', 1, 0)                                            primary_recruit_record_ind,
                 (SELECT 'Y'
                    FROM MTT_AR_DEPOSIT
                  WHERE ACCOUNT_UID = A.PERSON_UID
                      AND ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                      AND NVL(MIF_VALUE, ' ') = NVL(A.MIF_VALUE, ' ')
                      AND ROWNUM = 1
                 ) tuition_deposited_ind,
                 PD.*,
                 AC.start_date,
                 AC.end_date,
                 FY.aid_year,
                 SC.student_classification
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_RECRUITMENT_INFORMATION A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 MGT_STUDENT_PERIOD_DEFINITION FY,
                 WCV_EXTR_STUD_CLASSIFICATION SC,
                 CHG_ADMISSIONS_RECRUITMENT CHG
           WHERE A.CURRICULUM_ORDER = 1
             AND CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             AND A.PERSON_UID =  PD.PERSON_ID
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)
             --BLM added 7/29/14 for wdt_warehouse_entity mep effort
             and nvl(we.user_attribute_01, def_multi_source_in) = nvl(ac.mif_value(+), def_multi_source_in)             
             AND A.PERSON_UID = FY.PERSON_UID(+)
             AND A.ACADEMIC_PERIOD = FY.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(FY.MIF_VALUE(+), def_multi_source_in)
             --BLM added 7/29/14 for wdt_warehouse_entity mep effort
             and nvl(we.user_attribute_01, def_multi_source_in) = nvl(fy.mif_value(+), def_multi_source_in)             
             AND A.PERSON_UID = SC.PERSON_UID(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(SC.MIF_VALUE(+), def_multi_source_in)
             --BLM added 7/29/14 for wdt_warehouse_entity mep effort
             and nvl(we.user_attribute_01, def_multi_source_in) = nvl(sc.mif_value(+), def_multi_source_in)             
             AND A.RECRUIT_LEVEL = SC.STUDENT_LEVEL(+)
             AND (A.ACADEMIC_PERIOD >= SC.MIN_ACAD_PER(+) AND  A.ACADEMIC_PERIOD < SC.MAX_ACAD_PER(+) ) ;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_ADMISSIONS_RECRUITMENT', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_ADMISSIONS_RECRUITMENT', 'WFT_ADMISSIONS_RECRUITMENT', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        recruitment_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        recruitment_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
   LOOP
      FETCH recruitment_info_cur BULK COLLECT INTO recruitment_info_recs LIMIT bulk_size;
      EXIT WHEN recruitment_info_recs.COUNT = 0;
--
      IF recruitment_info_recs.COUNT > 0 AND fetch_finaid_details THEN
--
         fetch_finaid_details := FALSE;
--
         FOR finaid_appl_amts in edw_finaid_extr.get_finaid_appl_amts(default_rec.multi_source_cleanse_value, 'ALL') LOOP
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).APPLICATION_IND :=finaid_appl_amts.APPLICATION_IND;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).DEPENDENCY_IND :=finaid_appl_amts.DEPENDENCY_IND;
         END LOOP;
--
         FOR finaid_appl_need in edw_finaid_extr.get_finaid_appl_need(default_rec.multi_source_cleanse_value, 'ALL') LOOP
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN || '{' ||  finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).AID_PERIOD :=finaid_appl_need.AID_PERIOD;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN || '{' ||  finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).FM_NEED_ELIGIBLE_IND :=finaid_appl_need.FM_NEED_ELIGIBLE_IND;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).FM_FULLY_MET_NEED_IND :=finaid_appl_need.FM_FULLY_MET_NEED_IND;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).IM_NEED_ELIGIBLE_IND :=finaid_appl_need.IM_NEED_ELIGIBLE_IND;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).IM_FULLY_MET_NEED_IND :=finaid_appl_need.IM_FULLY_MET_NEED_IND;
         END LOOP;
--
         FOR offer_composition_amt in edw_finaid_extr.get_total_offer_amts_acad_pd(default_rec.multi_source_cleanse_value) LOOP
             total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_OFFERED_IND :=offer_composition_amt.AWARD_OFFERED_IND;
             total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_ACCEPTED_IND :=offer_composition_amt.AWARD_ACCEPTED_IND;
             total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_DECLINED_IND :=offer_composition_amt.AWARD_DECLINED_IND;
             total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_CANCELED_IND :=offer_composition_amt.AWARD_CANCELED_IND;
             total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_PAID_IND :=offer_composition_amt.AWARD_PAID_IND;
         END LOOP;
--
         FOR application_ind in edw_finaid_extr.get_application_inds(default_rec.multi_source_cleanse_value, 'ALL') LOOP
             application_ind_recs(application_ind.MULTI_SRC_IN ||   '{' || application_ind.PERSON_UID ||   '{' || application_ind.AID_YEAR ).FM_APPLICATION_IND :=application_ind.FM_APPLICATION_IND;
             application_ind_recs(application_ind.MULTI_SRC_IN ||   '{' || application_ind.PERSON_UID ||   '{' || application_ind.AID_YEAR ).IM_APPLICATION_IND :=application_ind.IM_APPLICATION_IND;
         END LOOP;
--
     END IF;
--
     FOR i IN recruitment_info_recs.FIRST..recruitment_info_recs.LAST
     LOOP
--
        finaid_indx         := recruitment_info_recs(i).multi_source || '{' || recruitment_info_recs(i).person_uid || '{' ||  recruitment_info_recs(i).aid_year;
        finaid_ap_indx    := recruitment_info_recs(i).multi_source || '{' || recruitment_info_recs(i).person_uid || '{' ||  recruitment_info_recs(i).academic_period;
--
        ret_row.multi_source :=  recruitment_info_recs(i).multi_source;
        ret_row.process_group :=  recruitment_info_recs(i).process_group;
        ret_row.administrative_group :=  recruitment_info_recs(i).administrative_group;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.msrc_user_attribute_01 := NULL;
        ret_row.msrc_user_attribute_01 := ret_row.multi_source;
        ret_row.msrc_user_attribute_02 := NULL;
        ret_row.msrc_user_attribute_03 := NULL;
        ret_row.msrc_user_attribute_04 := NULL;
        ret_row.msrc_user_attribute_05 := NULL;
        ret_row.academic_period :=  recruitment_info_recs(i).academic_period;
        ret_row.academic_period_begin_date := recruitment_info_recs(i).start_date;
        ret_row.academic_period_end_date := recruitment_info_recs(i).end_date;
        ret_row.academic_year :=  recruitment_info_recs(i).academic_year;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.atim_user_attribute_01 := NULL;
        ret_row.atim_user_attribute_01 := ret_row.multi_source;
        ret_row.atim_user_attribute_02 := NULL;
        ret_row.atim_user_attribute_03 := NULL;
        ret_row.atim_user_attribute_04 := NULL;
        ret_row.atim_user_attribute_05 := NULL;
        ret_row.financial_aid_year := recruitment_info_recs(i).aid_year;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.fayr_user_attribute_01 := NULL;
        ret_row.fayr_user_attribute_01 := ret_row.multi_source;
        ret_row.fayr_user_attribute_02 := NULL;
        ret_row.fayr_user_attribute_03 := NULL;
        ret_row.fayr_user_attribute_04 := NULL;
        ret_row.fayr_user_attribute_05 := NULL;
        ret_row.person_uid :=  recruitment_info_recs(i).warehouse_entity_uid;
        ret_row.id :=  recruitment_info_recs(i).id;
        ret_row.full_name_lfmi :=  recruitment_info_recs(i).full_name_lfmi;
        ret_row.birth_date :=  recruitment_info_recs(i).birth_date;
        ret_row.deceased_date :=  recruitment_info_recs(i).deceased_date;
        ret_row.email_address :=  recruitment_info_recs(i).email_address;
        ret_row.phone_number_combined :=  recruitment_info_recs(i).phone_number_combined;
        ret_row.confidentiality_ind :=  recruitment_info_recs(i).confidentiality_ind;
        --BLM mepped 6/2/14 for security resaons
        --ret_row.pers_user_attribute_01 := NULL;
        ret_row.pers_user_attribute_01 := ret_row.multi_source;
        ret_row.pers_user_attribute_02 := NULL;
        ret_row.pers_user_attribute_03 := NULL;
        ret_row.pers_user_attribute_04 := NULL;
        ret_row.pers_user_attribute_05 := NULL;
        ret_row.gender :=  recruitment_info_recs(i).gender;
        ret_row.ethnicity_category :=  recruitment_info_recs(i).ethnicity_category;
        ret_row.hispanic_latino_ethn_ind :=  recruitment_info_recs(i).hispanic_latino_ethnicity_ind;
        ret_row.asian_ind :=  recruitment_info_recs(i).asian_ind;
        ret_row.native_amer_or_alaskan_ind :=  recruitment_info_recs(i).native_american_or_alaskan_ind;
        ret_row.black_or_african_ind :=  recruitment_info_recs(i).black_or_african_ind;
        ret_row.pacific_islander_ind :=  recruitment_info_recs(i).pacific_islander_ind;
        ret_row.white_ind :=  recruitment_info_recs(i).white_ind;
        IF  recruitment_info_recs(i).number_of_races = 0 and recruitment_info_recs(i).resident_alien_visa_count > 0 THEN
           ret_row.non_resident_ind := 'Y';
        ELSE
           ret_row.non_resident_ind := 'N';
        END IF;
        IF NVL( recruitment_info_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N'
            AND recruitment_info_recs(i).number_of_races = 0
            AND recruitment_info_recs(i).resident_alien_visa_count = 0 THEN
           ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
        ELSE
           ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
        END IF;
        ret_row.two_or_more_ind :=  recruitment_info_recs(i).two_or_more_ind;
        ret_row.race_ethnicity_confirm_ind :=  recruitment_info_recs(i).race_ethnicity_confirm_ind;
        ret_row.minority_ind :=  recruitment_info_recs(i).minority_ind;
        ret_row.ethnicity :=  recruitment_info_recs(i).ethnicity;
        ret_row.deceased_ind :=  recruitment_info_recs(i).deceased_ind;
        ret_row.citizenship_ind :=  recruitment_info_recs(i).citizenship_ind;
        ret_row.citizenship_type :=  recruitment_info_recs(i).citizenship_type;
        ret_row.visa_type :=  recruitment_info_recs(i).visa_type;
        ret_row.nation_of_citizenship := recruitment_info_recs(i).nation_of_citizenship;
        ret_row.nation_of_birth := recruitment_info_recs(i).nation_of_birth;
        ret_row.primary_disability :=  recruitment_info_recs(i).primary_disability;
        ret_row.legacy :=  recruitment_info_recs(i).legacy;
        ret_row.marital_status := recruitment_info_recs(i).marital_status;
        ret_row.religion :=  recruitment_info_recs(i).religion;
        ret_row.veteran_type :=  recruitment_info_recs(i).veteran_type;
        ret_row.veteran_category :=  recruitment_info_recs(i).veteran_category;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.demo_user_attribute_01 := NULL;
        ret_row.demo_user_attribute_01 := ret_row.multi_source;
        ret_row.demo_user_attribute_02 := NULL;
        ret_row.demo_user_attribute_03 := NULL;
        ret_row.demo_user_attribute_04 := NULL;
        ret_row.demo_user_attribute_05 := NULL;
        ret_row.recruit_number :=  recruitment_info_recs(i).recruit_number;
        ret_row.recruit_status :=  recruitment_info_recs(i).recruit_status;
        ret_row.primary_source :=  recruitment_info_recs(i).primary_source;
        ret_row.recruiter :=  recruitment_info_recs(i).recruiter;
        ret_row.recruit_type :=  recruitment_info_recs(i).recruit_type;
        ret_row.withdrawal_reason :=  recruitment_info_recs(i).withdrawal_reason;
        ret_row.institution_attending :=  recruitment_info_recs(i).institution_attending;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.srec_user_attribute_01 := NULL;
        ret_row.srec_user_attribute_01 := ret_row.multi_source;
        ret_row.srec_user_attribute_02 := NULL;
        ret_row.srec_user_attribute_03 := NULL;
        ret_row.srec_user_attribute_04 := NULL;
        ret_row.srec_user_attribute_05 := NULL;
        ret_row.student_population :=  recruitment_info_recs(i).student_population;
        ret_row.admissions_population :=  recruitment_info_recs(i).admission_population;
        ret_row.intended_time_status :=  recruitment_info_recs(i).intended_time_status;
        ret_row.student_classification := recruitment_info_recs(i).student_classification;
        ret_row.education_goal :=  recruitment_info_recs(i).education_goal;
        ret_row.education_level :=  recruitment_info_recs(i).education_level;
        ret_row.residency :=  recruitment_info_recs(i).residency;
        ret_row.residency_ind :=  recruitment_info_recs(i).residency_ind;
        ret_row.housing_ind := NULL;
        ret_row.site :=  recruitment_info_recs(i).site;
        ret_row.rate := NULL;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.stud_user_attribute_01 := NULL;
        ret_row.stud_user_attribute_01 := ret_row.multi_source;
        ret_row.stud_user_attribute_02 := NULL;
        ret_row.stud_user_attribute_03 := NULL;
        ret_row.stud_user_attribute_04 := NULL;
        ret_row.stud_user_attribute_05 := NULL;
        ret_row.inquired_ind :=  recruitment_info_recs(i).inquired_ind;
        ret_row.applied_ind :=  recruitment_info_recs(i).applied_ind;
        ret_row.admitted_ind :=  recruitment_info_recs(i).admitted_ind;
        ret_row.accepted_ind :=  recruitment_info_recs(i).accepted_ind;
        ret_row.tuition_deposited_ind := NVL(recruitment_info_recs(i).tuition_deposited_ind, 'N');
        ret_row.enrolled_ind :=  recruitment_info_recs(i).enrolled_ind;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.pstd_user_attribute_01 := NULL;
        ret_row.pstd_user_attribute_01 := ret_row.multi_source;
        ret_row.pstd_user_attribute_02 := NULL;
        ret_row.pstd_user_attribute_03 := NULL;
        ret_row.pstd_user_attribute_04 := NULL;
        ret_row.pstd_user_attribute_05 := NULL;
        ret_row.student_level :=  recruitment_info_recs(i).student_level;
        ret_row.program :=  recruitment_info_recs(i).program;
        ret_row.campus :=  recruitment_info_recs(i).campus;
        ret_row.college :=  recruitment_info_recs(i).college;
        ret_row.award_category :=  recruitment_info_recs(i).award_category;
        ret_row.degree :=  recruitment_info_recs(i).degree;
        ret_row.major :=  recruitment_info_recs(i).major;
        ret_row.program_classification :=  recruitment_info_recs(i).program_classification;
        ret_row.department :=  recruitment_info_recs(i).department;
        ret_row.second_major :=  recruitment_info_recs(i).second_major;
        ret_row.second_prog_classification :=  recruitment_info_recs(i).second_program_classification;
        ret_row.second_department :=  recruitment_info_recs(i).second_department;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.astd_user_attribute_01 := NULL;
        ret_row.astd_user_attribute_01 := ret_row.multi_source;
        ret_row.astd_user_attribute_02 := NULL;
        ret_row.astd_user_attribute_03 := NULL;
        ret_row.astd_user_attribute_04 := NULL;
        ret_row.astd_user_attribute_05 := NULL;
        --need to mep MRKFUNC function call
--        ret_row.financial_aid_applicant_ind := mrkfunc.f_finaid_applicant_ind( recruitment_info_recs(i).person_uid,  recruitment_info_recs(i).academic_period);
ret_row.financial_aid_applicant_ind := mrkfunc.f_finaid_applicant_ind(recruitment_info_recs(i).multi_source, recruitment_info_recs(i).person_uid, recruitment_info_recs(i).academic_period);
        IF finaid_appl_amt_recs.EXISTS(finaid_indx) THEN
            ret_row.finaid_application_ind := NVL(finaid_appl_amt_recs(finaid_indx).application_ind,'N');
            ret_row.dependent_ind := finaid_appl_amt_recs(finaid_indx).dependency_ind;
        ELSE
           ret_row.finaid_application_ind := 'N';
        END IF;
        IF application_ind_recs.EXISTS(finaid_indx) THEN
            ret_row.fm_application_ind := NVL(application_ind_recs(finaid_indx).fm_application_ind,'N');
            ret_row.im_application_ind := NVL(application_ind_recs(finaid_indx).im_application_ind,'N');
        ELSE
            ret_row.fm_application_ind := 'N';
            ret_row.im_application_ind := 'N';
        END IF;
        IF total_offer_amts_acad_pd_recs.EXISTS(finaid_ap_indx) THEN
              ret_row.award_offered_ind := total_offer_amts_acad_pd_recs(finaid_ap_indx).award_offered_ind;
              ret_row.award_accepted_ind :=  total_offer_amts_acad_pd_recs(finaid_ap_indx).award_accepted_ind;
              ret_row.award_declined_ind :=  total_offer_amts_acad_pd_recs(finaid_ap_indx).award_declined_ind;
              ret_row.award_canceled_ind :=  total_offer_amts_acad_pd_recs(finaid_ap_indx).award_canceled_ind;
              ret_row.award_paid_ind :=  total_offer_amts_acad_pd_recs(finaid_ap_indx).award_paid_ind;
        END IF;
        IF finaid_appl_need_recs.EXISTS(finaid_indx) THEN
              ret_row.fm_need_eligible_ind := finaid_appl_need_recs(finaid_indx).fm_need_eligible_ind;
              ret_row.fm_fully_met_need_ind := finaid_appl_need_recs(finaid_indx).fm_fully_met_need_ind;
              ret_row.im_need_eligible_ind := finaid_appl_need_recs(finaid_indx).im_need_eligible_ind;
              ret_row.im_fully_met_need_ind := finaid_appl_need_recs(finaid_indx).im_fully_met_need_ind;
        END IF;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.fast_user_attribute_01 := NULL;
        ret_row.fast_user_attribute_01 := ret_row.multi_source;
        ret_row.fast_user_attribute_02 := NULL;
        ret_row.fast_user_attribute_03 := NULL;
        ret_row.fast_user_attribute_04 := NULL;
        ret_row.fast_user_attribute_05 := NULL;
        ret_row.recruit_add_date := TRUNC(NVL( recruitment_info_recs(i).recruit_add_date, '31-DEC-2099'));
        ret_row.primary_recruit_record_ind :=  recruitment_info_recs(i).primary_recruit_record_ind;
        ret_row.user_measure_01 := NULL;
        ret_row.user_measure_02 := NULL;
        ret_row.user_measure_03 := NULL;
        ret_row.user_measure_04 := NULL;
        ret_row.user_measure_05 := NULL;
        ret_row.system_load_process := 'ADMISSIONS_RECRUITMENT';
--
        PIPE ROW(ret_row);
--
        ret_row := ret_row_init;
--
      END LOOP; -- admissions_recr_rec
--
   END LOOP;
--
   CLOSE recruitment_info_cur;
--
   RETURN;
--
  END f_get_admissions_recruitment;
/******************************************************************************/
FUNCTION f_get_recruit_cohort(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_recruit_cohort_extr PIPELINED IS
--
    ret_row                     WTT_RECRUITMENT_COHORT_INPUT%ROWTYPE;
    ret_row_init                WTT_RECRUITMENT_COHORT_INPUT%ROWTYPE;
    acad_time_rec               MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    acad_time_rec_init          MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
--
--
        TYPE recruit_cohort_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          RECRUIT_NUMBER                          NUMBER,
          COHORT                                  VARCHAR2(63),
          COHORT_REPORT_IND                       CHAR(1),
          COHORT_INACTIVE_REASON                  VARCHAR2(63),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    recruit_cohort_info_cur       refCurType;
    recruit_cohort_rec        recruit_cohort_info_rec_type;
    TYPE tab_r_cohort_info_rec_type   IS TABLE OF recruit_cohort_info_rec_type INDEX BY PLS_INTEGER;
    recruit_cohort_info_recs        tab_r_cohort_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.RECRUIT_NUMBER,
                 A.COHORT,
                 'N'                                           cohort_report_ind,
                 A.COHORT_INACTIVE_REASON,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_RECRUITMENT_COHORT A,
                 WCV_EXTR_PERSON_DETAILS PD
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID;
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--             AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.RECRUIT_NUMBER,
                 A.COHORT,
                 'N'                                           cohort_report_ind,
                 A.COHORT_INACTIVE_REASON,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_RECRUITMENT_COHORT A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 CHG_RECRUITMENT_COHORT CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID;
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_RECRUITMENT_COHORT', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_RECRUITMENT_COHORT', 'WFT_RECRUITMENT_COHORT', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    IF process_ind_in = 'L' THEN
        recruit_cohort_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        recruit_cohort_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
        FETCH recruit_cohort_info_cur INTO recruit_cohort_rec;
        EXIT WHEN recruit_cohort_info_cur%NOTFOUND;
--
      OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, recruit_cohort_rec.multi_source, recruit_cohort_rec.academic_period, 'ACYR');
      FETCH edw_general_extr.get_year_type INTO acad_time_rec;
      CLOSE edw_general_extr.get_year_type;
--
      ret_row.multi_source := recruit_cohort_rec.multi_source;
      ret_row.process_group := recruit_cohort_rec.process_group;
      ret_row.administrative_group := recruit_cohort_rec.administrative_group;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.msrc_user_attribute_01 := NULL;
      ret_row.msrc_user_attribute_01 := ret_row.multi_source;
      ret_row.msrc_user_attribute_02 := NULL;
      ret_row.msrc_user_attribute_03 := NULL;
      ret_row.msrc_user_attribute_04 := NULL;
      ret_row.msrc_user_attribute_05 := NULL;
      ret_row.academic_period := recruit_cohort_rec.academic_period;
      ret_row.academic_period_begin_date := acad_time_rec.start_date;
      ret_row.academic_period_end_date := acad_time_rec.end_date;
      ret_row.academic_year := recruit_cohort_rec.academic_year;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.atim_user_attribute_01 := NULL;
      ret_row.atim_user_attribute_01 := ret_row.multi_source;
      ret_row.atim_user_attribute_02 := NULL;
      ret_row.atim_user_attribute_03 := NULL;
      ret_row.atim_user_attribute_04 := NULL;
      ret_row.atim_user_attribute_05 := NULL;
      ret_row.person_uid := recruit_cohort_rec.warehouse_entity_uid;
      ret_row.id := recruit_cohort_rec.id;
      ret_row.full_name_lfmi := recruit_cohort_rec.full_name_lfmi;
      ret_row.birth_date := recruit_cohort_rec.birth_date;
      ret_row.deceased_date := recruit_cohort_rec.deceased_date;
      ret_row.email_address := recruit_cohort_rec.email_address;
      ret_row.phone_number_combined := recruit_cohort_rec.phone_number_combined;
      ret_row.confidentiality_ind := recruit_cohort_rec.confidentiality_ind;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.pers_user_attribute_01 := NULL;
      ret_row.pers_user_attribute_01 := ret_row.multi_source;
      ret_row.pers_user_attribute_02 := NULL;
      ret_row.pers_user_attribute_03 := NULL;
      ret_row.pers_user_attribute_04 := NULL;
      ret_row.pers_user_attribute_05 := NULL;
      ret_row.gender := recruit_cohort_rec.gender;
      ret_row.ethnicity_category := recruit_cohort_rec.ethnicity_category;
      ret_row.hispanic_latino_ethn_ind := recruit_cohort_rec.hispanic_latino_ethnicity_ind;
      ret_row.asian_ind := recruit_cohort_rec.asian_ind;
      ret_row.native_amer_or_alaskan_ind := recruit_cohort_rec.native_american_or_alaskan_ind;
      ret_row.black_or_african_ind := recruit_cohort_rec.black_or_african_ind;
      ret_row.pacific_islander_ind := recruit_cohort_rec.pacific_islander_ind;
      ret_row.white_ind := recruit_cohort_rec.white_ind;
      IF recruit_cohort_rec.number_of_races = 0 and recruit_cohort_rec.resident_alien_visa_count > 0 THEN
         ret_row.non_resident_ind := 'Y';
      ELSE
         ret_row.non_resident_ind := 'N';
      END IF;
      IF NVL(recruit_cohort_rec.hispanic_latino_ethnicity_ind,'N') = 'N' AND
         recruit_cohort_rec.number_of_races = 0 AND
         recruit_cohort_rec.resident_alien_visa_count = 0 THEN
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
      ELSE
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
      END IF;
      ret_row.two_or_more_ind := recruit_cohort_rec.two_or_more_ind;
      ret_row.race_ethnicity_confirm_ind := recruit_cohort_rec.race_ethnicity_confirm_ind;
      ret_row.minority_ind := recruit_cohort_rec.minority_ind;
      ret_row.ethnicity := recruit_cohort_rec.ethnicity;
      ret_row.deceased_ind := recruit_cohort_rec.deceased_ind;
      ret_row.citizenship_ind := recruit_cohort_rec.citizenship_ind;
      ret_row.citizenship_type := recruit_cohort_rec.citizenship_type;
      ret_row.visa_type := recruit_cohort_rec.visa_type;
      ret_row.nation_of_citizenship := recruit_cohort_rec.nation_of_citizenship;
      ret_row.nation_of_birth := recruit_cohort_rec.nation_of_birth;
      ret_row.primary_disability := recruit_cohort_rec.primary_disability;
      ret_row.legacy := recruit_cohort_rec.legacy;
      ret_row.marital_status := recruit_cohort_rec.marital_status;
      ret_row.religion := recruit_cohort_rec.religion;
      ret_row.veteran_type := recruit_cohort_rec.veteran_type;
      ret_row.veteran_category := recruit_cohort_rec.veteran_category;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.demo_user_attribute_01 := NULL;
      ret_row.demo_user_attribute_01 := ret_row.multi_source;
      ret_row.demo_user_attribute_02 := NULL;
      ret_row.demo_user_attribute_03 := NULL;
      ret_row.demo_user_attribute_04 := NULL;
      ret_row.demo_user_attribute_05 := NULL;
      ret_row.recruit_number := recruit_cohort_rec.recruit_number;
      ret_row.cohort := recruit_cohort_rec.cohort;
      ret_row.cohort_report_ind := recruit_cohort_rec.cohort_report_ind;
      ret_row.cohort_inactive_reason := recruit_cohort_rec.cohort_inactive_reason;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.coht_user_attribute_01 := NULL;
      ret_row.coht_user_attribute_01 := ret_row.multi_source;
      ret_row.coht_user_attribute_02 := NULL;
      ret_row.coht_user_attribute_03 := NULL;
      ret_row.coht_user_attribute_04 := NULL;
      ret_row.coht_user_attribute_05 := NULL;
      ret_row.user_measure_01 := NULL;
      ret_row.user_measure_02 := NULL;
      ret_row.user_measure_03 := NULL;
      ret_row.user_measure_04 := NULL;
      ret_row.user_measure_05 := NULL;
      ret_row.system_load_process := 'RECRUIT_COHORT';
--
      PIPE ROW(ret_row);
--
      ret_row := ret_row_init;
      acad_time_rec := acad_time_rec_init;
--
    END LOOP; -- recruit_cohort_rec
--
    RETURN;
--
  END f_get_recruit_cohort;
/******************************************************************************/
FUNCTION f_get_recruit_attr(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_recruit_attr_extr PIPELINED IS
--
    ret_row                     WTT_RECRUIT_ATTRIBUTE_INPUT%ROWTYPE;
    ret_row_init                WTT_RECRUIT_ATTRIBUTE_INPUT%ROWTYPE;
    acad_time_rec               MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    acad_time_rec_init          MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
--
--
        TYPE recruit_attr_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          RECRUIT_NUMBER                          NUMBER,
          RECRUITING_ATTRIBUTE                    VARCHAR2(63),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    recruit_attr_info_cur       refCurType;
    recruit_attr_rec        recruit_attr_info_rec_type;
    TYPE tab_recruit_attr_info_rec_type   IS TABLE OF recruit_attr_info_rec_type INDEX BY PLS_INTEGER;
    recruit_attr_info_recs        tab_recruit_attr_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.RECRUIT_NUMBER,
                 A.RECRUITING_ATTRIBUTE,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_RECRUITMENT_ATTRIBUTE A,
                 WCV_EXTR_PERSON_DETAILS PD
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID;
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.RECRUIT_NUMBER,
                 A.RECRUITING_ATTRIBUTE,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_RECRUITMENT_ATTRIBUTE A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 CHG_RECRUITMENT_ATTRIBUTE CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID;
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_RECRUITMENT_ATTRIBUTE', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_RECRUITMENT_ATTRIBUTE', 'WFT_RECRUITMENT_ATTRIBUTE', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    IF process_ind_in = 'L' THEN
        recruit_attr_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        recruit_attr_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
        FETCH recruit_attr_info_cur INTO recruit_attr_rec;
        EXIT WHEN recruit_attr_info_cur%NOTFOUND;
--
      OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, recruit_attr_rec.multi_source, recruit_attr_rec.academic_period, 'ACYR');
      FETCH edw_general_extr.get_year_type INTO acad_time_rec;
      CLOSE edw_general_extr.get_year_type;
--
      ret_row.multi_source := recruit_attr_rec.multi_source;
      ret_row.process_group := recruit_attr_rec.process_group;
      ret_row.administrative_group := recruit_attr_rec.administrative_group;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.msrc_user_attribute_01 := NULL;
      ret_row.msrc_user_attribute_01 := ret_row.multi_source;
      ret_row.msrc_user_attribute_02 := NULL;
      ret_row.msrc_user_attribute_03 := NULL;
      ret_row.msrc_user_attribute_04 := NULL;
      ret_row.msrc_user_attribute_05 := NULL;
      ret_row.academic_period := recruit_attr_rec.academic_period;
      ret_row.academic_period_begin_date := acad_time_rec.start_date;
      ret_row.academic_period_end_date := acad_time_rec.end_date;
      ret_row.academic_year := recruit_attr_rec.academic_year;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.atim_user_attribute_01 := NULL;
      ret_row.atim_user_attribute_01 := ret_row.multi_source;
      ret_row.atim_user_attribute_02 := NULL;
      ret_row.atim_user_attribute_03 := NULL;
      ret_row.atim_user_attribute_04 := NULL;
      ret_row.atim_user_attribute_05 := NULL;
      ret_row.person_uid := recruit_attr_rec.warehouse_entity_uid;
      ret_row.id := recruit_attr_rec.id;
      ret_row.full_name_lfmi := recruit_attr_rec.full_name_lfmi;
      ret_row.birth_date := recruit_attr_rec.birth_date;
      ret_row.deceased_date := recruit_attr_rec.deceased_date;
      ret_row.email_address := recruit_attr_rec.email_address;
      ret_row.phone_number_combined := recruit_attr_rec.phone_number_combined;
      ret_row.confidentiality_ind := recruit_attr_rec.confidentiality_ind;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.pers_user_attribute_01 := NULL;
      ret_row.pers_user_attribute_01 := ret_row.multi_source;
      ret_row.pers_user_attribute_02 := NULL;
      ret_row.pers_user_attribute_03 := NULL;
      ret_row.pers_user_attribute_04 := NULL;
      ret_row.pers_user_attribute_05 := NULL;
      ret_row.gender := recruit_attr_rec.gender;
      ret_row.ethnicity_category := recruit_attr_rec.ethnicity_category;
      ret_row.hispanic_latino_ethn_ind := recruit_attr_rec.hispanic_latino_ethnicity_ind;
      ret_row.asian_ind := recruit_attr_rec.asian_ind;
      ret_row.native_amer_or_alaskan_ind := recruit_attr_rec.native_american_or_alaskan_ind;
      ret_row.black_or_african_ind := recruit_attr_rec.black_or_african_ind;
      ret_row.pacific_islander_ind := recruit_attr_rec.pacific_islander_ind;
      ret_row.white_ind := recruit_attr_rec.white_ind;
      IF recruit_attr_rec.number_of_races = 0 and recruit_attr_rec.resident_alien_visa_count > 0 THEN
         ret_row.non_resident_ind := 'Y';
      ELSE
         ret_row.non_resident_ind := 'N';
      END IF;
      IF NVL(recruit_attr_rec.hispanic_latino_ethnicity_ind,'N') = 'N' AND
         recruit_attr_rec.number_of_races = 0 AND
         recruit_attr_rec.resident_alien_visa_count = 0 THEN
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
      ELSE
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
      END IF;
      ret_row.two_or_more_ind := recruit_attr_rec.two_or_more_ind;
      ret_row.race_ethnicity_confirm_ind := recruit_attr_rec.race_ethnicity_confirm_ind;
      ret_row.minority_ind := recruit_attr_rec.minority_ind;
      ret_row.ethnicity := recruit_attr_rec.ethnicity;
      ret_row.deceased_ind := recruit_attr_rec.deceased_ind;
      ret_row.citizenship_ind := recruit_attr_rec.citizenship_ind;
      ret_row.citizenship_type := recruit_attr_rec.citizenship_type;
      ret_row.visa_type := recruit_attr_rec.visa_type;
      ret_row.nation_of_citizenship := recruit_attr_rec.nation_of_citizenship;
      ret_row.nation_of_birth := recruit_attr_rec.nation_of_birth;
      ret_row.primary_disability := recruit_attr_rec.primary_disability;
      ret_row.legacy := recruit_attr_rec.legacy;
      ret_row.marital_status := recruit_attr_rec.marital_status;
      ret_row.religion := recruit_attr_rec.religion;
      ret_row.veteran_type := recruit_attr_rec.veteran_type;
      ret_row.veteran_category := recruit_attr_rec.veteran_category;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.demo_user_attribute_01 := NULL;
      ret_row.demo_user_attribute_01 := ret_row.multi_source;
      ret_row.demo_user_attribute_02 := NULL;
      ret_row.demo_user_attribute_03 := NULL;
      ret_row.demo_user_attribute_04 := NULL;
      ret_row.demo_user_attribute_05 := NULL;
      ret_row.recruit_number := recruit_attr_rec.recruit_number;
      ret_row.attribute := recruit_attr_rec.recruiting_attribute;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.attr_user_attribute_01 := NULL;
      ret_row.attr_user_attribute_01 := ret_row.multi_source;
      ret_row.attr_user_attribute_02 := NULL;
      ret_row.attr_user_attribute_03 := NULL;
      ret_row.attr_user_attribute_04 := NULL;
      ret_row.attr_user_attribute_05 := NULL;
      ret_row.user_measure_01 := NULL;
      ret_row.user_measure_02 := NULL;
      ret_row.user_measure_03 := NULL;
      ret_row.user_measure_04 := NULL;
      ret_row.user_measure_05 := NULL;
      ret_row.system_load_process := 'RECRUIT_ATTR';
--
      PIPE ROW(ret_row);
--
      ret_row := ret_row_init;
      acad_time_rec := acad_time_rec_init;
--
    END LOOP; -- recruit_attr_rec
--
    RETURN;
--
  END f_get_recruit_attr;
   /******************************************************************************/
  FUNCTION f_get_contact(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_contact_extr PIPELINED IS
--
    ret_row                     WTT_CONTACT_INPUT%ROWTYPE;
    ret_row_init                WTT_CONTACT_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE contact_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          CONTACT_TYPE                            VARCHAR2(63),
          CONTACT_DATE                            DATE,
          CONTACT_COUNT_DATE                      DATE,
          FIRST_IND                               NUMBER,
          LAST_IND                                NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    contact_info_cur       refCurType;
    contact_info_rec        contact_info_rec_type;
    TYPE tab_contact_info_rec_type   IS TABLE OF contact_info_rec_type INDEX BY PLS_INTEGER;
    contact_info_recs        tab_contact_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.CONTACT_TYPE,
                 TRUNC(A.CONTACT_DATE)                         contact_date,
                 A.CONTACT_DATE                                contact_count_date,
                 ROW_NUMBER() OVER (PARTITION BY A.PERSON_UID ORDER BY A.CONTACT_DATE ASC,  A.CONTACT_TYPE) first_ind,
                 ROW_NUMBER() OVER (PARTITION BY A.PERSON_UID ORDER BY A.CONTACT_DATE DESC, A.CONTACT_TYPE) last_ind,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_CONTACT A,
                 WCV_EXTR_PERSON_DETAILS PD
           WHERE
             (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID;
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--             AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.CONTACT_TYPE,
                 TRUNC(A.CONTACT_DATE)                         contact_date,
                 A.CONTACT_DATE                                contact_count_date,
                 ROW_NUMBER() OVER (PARTITION BY A.PERSON_UID ORDER BY A.CONTACT_DATE ASC,  A.CONTACT_TYPE) first_ind,
                 ROW_NUMBER() OVER (PARTITION BY A.PERSON_UID ORDER BY A.CONTACT_DATE DESC, A.CONTACT_TYPE) last_ind,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_CONTACT A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 CHG_CONTACT CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID;
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--             AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_CONTACT');
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_CONTACT', 'WFT_CONTACT', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        contact_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        contact_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
   LOOP
      FETCH contact_info_cur BULK COLLECT INTO contact_info_recs LIMIT bulk_size;
      EXIT WHEN contact_info_recs.COUNT = 0;
--
      FOR i IN contact_info_recs.FIRST..contact_info_recs.LAST
      LOOP
--
         ret_row.multi_source := contact_info_recs(i).multi_source;
         ret_row.process_group := contact_info_recs(i).process_group;
         ret_row.administrative_group := contact_info_recs(i).administrative_group;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.msrc_user_attribute_01 := NULL;
         ret_row.msrc_user_attribute_01 := ret_row.multi_source;
         ret_row.msrc_user_attribute_02 := NULL;
         ret_row.msrc_user_attribute_03 := NULL;
         ret_row.msrc_user_attribute_04 := NULL;
         ret_row.msrc_user_attribute_05 := NULL;
         ret_row.person_uid := contact_info_recs(i).warehouse_entity_uid;
         ret_row.id := contact_info_recs(i).id;
         ret_row.full_name_lfmi := contact_info_recs(i).full_name_lfmi;
         ret_row.birth_date := contact_info_recs(i).birth_date;
         ret_row.deceased_date := contact_info_recs(i).deceased_date;
         ret_row.email_address := contact_info_recs(i).email_address;
         ret_row.phone_number_combined := contact_info_recs(i).phone_number_combined;
         ret_row.confidentiality_ind := contact_info_recs(i).confidentiality_ind;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.pers_user_attribute_01 := NULL;
         ret_row.pers_user_attribute_01 := ret_row.multi_source;
         ret_row.pers_user_attribute_02 := NULL;
         ret_row.pers_user_attribute_03 := NULL;
         ret_row.pers_user_attribute_04 := NULL;
         ret_row.pers_user_attribute_05 := NULL;
         ret_row.gender := contact_info_recs(i).gender;
         ret_row.ethnicity_category := contact_info_recs(i).ethnicity_category;
         ret_row.hispanic_latino_ethn_ind := contact_info_recs(i).hispanic_latino_ethnicity_ind;
         ret_row.asian_ind := contact_info_recs(i).asian_ind;
         ret_row.native_amer_or_alaskan_ind := contact_info_recs(i).native_american_or_alaskan_ind;
         ret_row.black_or_african_ind := contact_info_recs(i).black_or_african_ind;
         ret_row.pacific_islander_ind := contact_info_recs(i).pacific_islander_ind;
         ret_row.white_ind := contact_info_recs(i).white_ind;
         IF contact_info_recs(i).number_of_races = 0 and contact_info_recs(i).resident_alien_visa_count > 0 THEN
            ret_row.non_resident_ind := 'Y';
         ELSE
            ret_row.non_resident_ind := 'N';
         END IF;
         IF NVL(contact_info_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND
            contact_info_recs(i).number_of_races = 0 AND
            contact_info_recs(i).resident_alien_visa_count = 0 THEN
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
         ELSE
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
         END IF;
         ret_row.two_or_more_ind := contact_info_recs(i).two_or_more_ind;
         ret_row.race_ethnicity_confirm_ind := contact_info_recs(i).race_ethnicity_confirm_ind;
         ret_row.minority_ind := contact_info_recs(i).minority_ind;
         ret_row.ethnicity := contact_info_recs(i).ethnicity;
         ret_row.deceased_ind := contact_info_recs(i).deceased_ind;
         ret_row.citizenship_ind := contact_info_recs(i).citizenship_ind;
         ret_row.citizenship_type := contact_info_recs(i).citizenship_type;
         ret_row.visa_type := contact_info_recs(i).visa_type;
         ret_row.nation_of_citizenship := contact_info_recs(i).nation_of_citizenship;
         ret_row.nation_of_birth := contact_info_recs(i).nation_of_birth;
         ret_row.primary_disability := contact_info_recs(i).primary_disability;
         ret_row.legacy := contact_info_recs(i).legacy;
         ret_row.marital_status := contact_info_recs(i).marital_status;
         ret_row.religion := contact_info_recs(i).religion;
         ret_row.veteran_type := contact_info_recs(i).veteran_type;
         ret_row.veteran_category := contact_info_recs(i).veteran_category;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.demo_user_attribute_01 := NULL;
         ret_row.demo_user_attribute_01 := ret_row.multi_source;
         ret_row.demo_user_attribute_02 := NULL;
         ret_row.demo_user_attribute_03 := NULL;
         ret_row.demo_user_attribute_04 := NULL;
         ret_row.demo_user_attribute_05 := NULL;
         ret_row.contact_type := contact_info_recs(i).contact_type;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.cont_user_attribute_01 := NULL;
         ret_row.cont_user_attribute_01 := ret_row.multi_source;
         ret_row.cont_user_attribute_02 := NULL;
         ret_row.cont_user_attribute_03 := NULL;
         ret_row.cont_user_attribute_04 := NULL;
         ret_row.cont_user_attribute_05 := NULL;
         ret_row.contact_date :=  NVL(contact_info_recs(i).contact_date, '31-DEC-2099');
         ret_row.contact_count_date :=  NVL(contact_info_recs(i).contact_count_date, '31-DEC-2099');
         IF contact_info_recs(i).first_ind = 1 THEN
           ret_row.first_contact_ind :=  1;
         ELSE
           ret_row.first_contact_ind :=  0;
         END IF;
         IF contact_info_recs(i).last_ind = 1 THEN
           ret_row.latest_contact_ind := 1;
         ELSE
           ret_row.latest_contact_ind := 0;
         END IF;
         ret_row.user_measure_01 := NULL;
         ret_row.user_measure_02 := NULL;
         ret_row.user_measure_03 := NULL;
         ret_row.user_measure_04 := NULL;
         ret_row.user_measure_05 := NULL;
         ret_row.system_load_process := 'CONTACT';
--
         PIPE ROW(ret_row);
--
         ret_row := ret_row_init;
--
      END LOOP; -- contact_rec
--
   END LOOP;
--
   CLOSE contact_info_cur;
--
   RETURN;
--
  END f_get_contact;
    /******************************************************************************/
  FUNCTION f_get_sec_schl_subj(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_sec_schl_subj_extr PIPELINED IS
--
    ret_row                     WTT_SEC_SCHL_SUBJECT_INPUT%ROWTYPE;
    ret_row_init                WTT_SEC_SCHL_SUBJECT_INPUT%ROWTYPE;
    institution_rec             MST_INSTITUTION%ROWTYPE;
    institution_rec_init        MST_INSTITUTION%ROWTYPE;
    inst_char_rec               EDW_GENERAL_EXTR.GET_INST_CHAR%ROWTYPE;
    inst_char_rec_init          EDW_GENERAL_EXTR.GET_INST_CHAR%ROWTYPE;
    inst_demo_rec               EDW_GENERAL_EXTR.GET_INST_DEMO%ROWTYPE;
    inst_demo_rec_init          EDW_GENERAL_EXTR.GET_INST_DEMO%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
--
--
        TYPE sec_schl_subj_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          INSTITUTION                             VARCHAR2(63),
          SUBJECT                                 VARCHAR2(63),
          YEARS_TAKEN                             NUMBER,
          GRADE                                   VARCHAR2(6),
          GPA                                     NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          FICE_CODE                               VARCHAR2(63),
          INSTITUTION_TYPE                        VARCHAR2(63),
          ACCREDITATION_TYPE                      VARCHAR2(63),
          APPROVED_IND                            VARCHAR2(1),
          CALENDAR_YEAR                           NUMBER,
          TWO_YEAR_IND                            NUMBER,
          FOUR_YEAR_IND                           NUMBER,
          PRIVATE_IND                             NUMBER,
          PUBLIC_IND                              NUMBER,
          HOMESCHOOL_IND                          NUMBER
    );
    TYPE refCurType     IS REF CURSOR;
    sec_schl_subj_cur       refCurType;
    sec_schl_subj_rec        sec_schl_subj_rec_type;
    TYPE tab_sec_schl_subj_rec_type   IS TABLE OF sec_schl_subj_rec_type INDEX BY PLS_INTEGER;
    sec_schl_subj_recs        tab_sec_schl_subj_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.INSTITUTION,
                 A.SUBJECT,
                 A.YEARS_TAKEN,
                 A.GRADE,
                 EDW_GENERAL_EXTR.F_SAFE_TO_NUMBER(A.GPA) GPA,
                 PD.*,
                 ID.FICE_CODE,
                 ID.INSTITUTION_TYPE,
                 ID.ACCREDITATION_TYPE,
                 ID.APPROVED_IND,
                 ID.CALENDAR_YEAR,
                 ID.TWO_YEAR_IND,
                 ID.FOUR_YEAR_IND,
                 ID.PRIVATE_IND,
                 ID.PUBLIC_IND,
                 ID.HOMESCHOOL_IND
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_SECONDARY_SCHOOL_SUBJECT A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 WCV_EXTR_INSTITUTION_DETAILS ID
           WHERE
             (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--             AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND A.INSTITUTION = ID.INSTITUTION(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = ID.MULTI_SRC(+);
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.INSTITUTION,
                 A.SUBJECT,
                 A.YEARS_TAKEN,
                 A.GRADE,
                 EDW_GENERAL_EXTR.F_SAFE_TO_NUMBER(A.GPA) GPA,
                 PD.*,
                 ID.FICE_CODE,
                 ID.INSTITUTION_TYPE,
                 ID.ACCREDITATION_TYPE,
                 ID.APPROVED_IND,
                 ID.CALENDAR_YEAR,
                 ID.TWO_YEAR_IND,
                 ID.FOUR_YEAR_IND,
                 ID.PRIVATE_IND,
                 ID.PUBLIC_IND,
                 ID.HOMESCHOOL_IND
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_SECONDARY_SCHOOL_SUBJECT A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 WCV_EXTR_INSTITUTION_DETAILS ID,
                 CHG_SECONDARY_SCHOOL_SUBJECT CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value             
             AND A.PERSON_UID =  PD.PERSON_ID
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND A.INSTITUTION = ID.INSTITUTION(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = ID.MULTI_SRC(+);
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_SECONDARY_SCHOOL_SUBJECT');
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_SECONDARY_SCHOOL_SUBJECT', 'WFT_SECONDARY_SCHOOL_SUBJECT', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    IF process_ind_in = 'L' THEN
        sec_schl_subj_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        sec_schl_subj_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
        FETCH sec_schl_subj_cur INTO sec_schl_subj_rec;
        EXIT WHEN sec_schl_subj_cur%NOTFOUND;
--
      ret_row.multi_source := sec_schl_subj_rec.multi_source;
      ret_row.process_group := sec_schl_subj_rec.process_group;
      ret_row.administrative_group := sec_schl_subj_rec.administrative_group;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.msrc_user_attribute_01 := NULL;
      ret_row.msrc_user_attribute_01 := ret_row.multi_source;
      ret_row.msrc_user_attribute_02 := NULL;
      ret_row.msrc_user_attribute_03 := NULL;
      ret_row.msrc_user_attribute_04 := NULL;
      ret_row.msrc_user_attribute_05 := NULL;
      ret_row.person_uid := sec_schl_subj_rec.warehouse_entity_uid;
      ret_row.id := sec_schl_subj_rec.id;
      ret_row.full_name_lfmi := sec_schl_subj_rec.full_name_lfmi;
      ret_row.birth_date := sec_schl_subj_rec.birth_date;
      ret_row.deceased_date := sec_schl_subj_rec.deceased_date;
      ret_row.email_address := sec_schl_subj_rec.email_address;
      ret_row.phone_number_combined := sec_schl_subj_rec.phone_number_combined;
      ret_row.confidentiality_ind := sec_schl_subj_rec.confidentiality_ind;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.pers_user_attribute_01 := NULL;
      ret_row.pers_user_attribute_01 := ret_row.multi_source;
      ret_row.pers_user_attribute_02 := NULL;
      ret_row.pers_user_attribute_03 := NULL;
      ret_row.pers_user_attribute_04 := NULL;
      ret_row.pers_user_attribute_05 := NULL;
      ret_row.gender := sec_schl_subj_rec.gender;
      ret_row.ethnicity_category := sec_schl_subj_rec.ethnicity_category;
      ret_row.hispanic_latino_ethn_ind := sec_schl_subj_rec.hispanic_latino_ethnicity_ind;
      ret_row.asian_ind := sec_schl_subj_rec.asian_ind;
      ret_row.native_amer_or_alaskan_ind := sec_schl_subj_rec.native_american_or_alaskan_ind;
      ret_row.black_or_african_ind := sec_schl_subj_rec.black_or_african_ind;
      ret_row.pacific_islander_ind := sec_schl_subj_rec.pacific_islander_ind;
      ret_row.white_ind := sec_schl_subj_rec.white_ind;
      IF sec_schl_subj_rec.number_of_races = 0 and sec_schl_subj_rec.resident_alien_visa_count > 0 THEN
         ret_row.non_resident_ind := 'Y';
      ELSE
         ret_row.non_resident_ind := 'N';
      END IF;
      IF NVL(sec_schl_subj_rec.hispanic_latino_ethnicity_ind,'N') = 'N' AND
         sec_schl_subj_rec.number_of_races = 0 AND
         sec_schl_subj_rec.resident_alien_visa_count = 0 THEN
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
      ELSE
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
      END IF;
      ret_row.two_or_more_ind := sec_schl_subj_rec.two_or_more_ind;
      ret_row.race_ethnicity_confirm_ind := sec_schl_subj_rec.race_ethnicity_confirm_ind;
      ret_row.minority_ind := sec_schl_subj_rec.minority_ind;
      ret_row.ethnicity := sec_schl_subj_rec.ethnicity;
      ret_row.deceased_ind := sec_schl_subj_rec.deceased_ind;
      ret_row.citizenship_ind := sec_schl_subj_rec.citizenship_ind;
      ret_row.citizenship_type := sec_schl_subj_rec.citizenship_type;
      ret_row.visa_type := sec_schl_subj_rec.visa_type;
      ret_row.nation_of_citizenship := sec_schl_subj_rec.nation_of_citizenship;
      ret_row.nation_of_birth := sec_schl_subj_rec.nation_of_birth;
      ret_row.primary_disability := sec_schl_subj_rec.primary_disability;
      ret_row.legacy := sec_schl_subj_rec.legacy;
      ret_row.marital_status := sec_schl_subj_rec.marital_status;
      ret_row.religion := sec_schl_subj_rec.religion;
      ret_row.veteran_type := sec_schl_subj_rec.veteran_type;
      ret_row.veteran_category := sec_schl_subj_rec.veteran_category;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.demo_user_attribute_01 := NULL;
      ret_row.demo_user_attribute_01 := ret_row.multi_source;
      ret_row.demo_user_attribute_02 := NULL;
      ret_row.demo_user_attribute_03 := NULL;
      ret_row.demo_user_attribute_04 := NULL;
      ret_row.demo_user_attribute_05 := NULL;
      ret_row.institution := sec_schl_subj_rec.institution;
      ret_row.fice_code := sec_schl_subj_rec.fice_code;
      ret_row.institution_type := sec_schl_subj_rec.institution_type;
      ret_row.two_year_institution_ind := TO_CHAR(NVL(sec_schl_subj_rec.two_year_ind,0));
      ret_row.four_year_institution_ind := TO_CHAR(NVL(sec_schl_subj_rec.four_year_ind,0));
      ret_row.private_institution_ind := TO_CHAR(NVL(sec_schl_subj_rec.private_ind,0));
      ret_row.public_institution_ind := TO_CHAR(NVL(sec_schl_subj_rec.public_ind,0));
      ret_row.homeschool_ind := TO_CHAR(NVL(sec_schl_subj_rec.homeschool_ind,0));
      ret_row.accreditation_type := sec_schl_subj_rec.accreditation_type;
      ret_row.approved_ind := TO_CHAR(NVL(sec_schl_subj_rec.approved_ind,0));
      ret_row.demographic_calendar_year := TO_CHAR(sec_schl_subj_rec.calendar_year);
      --BLM mepped 6/2/14 for security reasons
      --ret_row.inst_user_attribute_01 := NULL;
      ret_row.inst_user_attribute_01 := ret_row.multi_source;
      ret_row.inst_user_attribute_02 := NULL;
      ret_row.inst_user_attribute_03 := NULL;
      ret_row.inst_user_attribute_04 := NULL;
      ret_row.inst_user_attribute_05 := NULL;
      ret_row.secondary_school_subject := sec_schl_subj_rec.subject;
      ret_row.secondary_subject_grade := NVL(sec_schl_subj_rec.grade, default_rec.null_cleanse_value);
      ret_row.secondary_subject_gpa_range := sec_schl_subj_rec.gpa;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.sschs_user_attribute_01 := NULL;
      ret_row.sschs_user_attribute_01 := ret_row.multi_source;
      ret_row.sschs_user_attribute_02 := NULL;
      ret_row.sschs_user_attribute_03 := NULL;
      ret_row.sschs_user_attribute_04 := NULL;
      ret_row.sschs_user_attribute_05 := NULL;
      ret_row.years_taken := sec_schl_subj_rec.years_taken;
      ret_row.secondary_school_subject_gpa := sec_schl_subj_rec.gpa;
      ret_row.user_measure_01 := NULL;
      ret_row.user_measure_02 := NULL;
      ret_row.user_measure_03 := NULL;
      ret_row.user_measure_04 := NULL;
      ret_row.user_measure_05 := NULL;
      ret_row.system_load_process := 'SEC_SCHL_SUBJ';
--
      PIPE ROW(ret_row);
--
      ret_row := ret_row_init;
--
    END LOOP; -- sec_schl_subj_rec
--
    RETURN;
--
  END f_get_sec_schl_subj;
  /******************************************************************************/
  function f_get_administrator(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_administrator_extr PIPELINED IS
--
    ret_row                     WTT_ADMINISTRATOR_INPUT%ROWTYPE;
    ret_row_init                WTT_ADMINISTRATOR_INPUT%ROWTYPE;
    acad_time_rec               MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    acad_time_rec_init          MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
--
--
        TYPE administrator_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          APPLICATION_RECRUIT_NUMBER              NUMBER,
          MODULE                                  VARCHAR2(10),
          ADMINISTRATOR_UID                       NUMBER,
          WAREHOUSE_ADMINISTRATOR_UID             NUMBER,
          ADMINISTRATOR_ROLE                      VARCHAR2(63),
          RATER_IND                               VARCHAR2(1),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          A_ID                                    VARCHAR2(63),
          A_FULL_NAME_LFMI                        VARCHAR2(255),
          A_BIRTH_DATE                            DATE,
          A_DECEASED_DATE                         DATE,
          A_EMAIL_ADDRESS                         VARCHAR2(255),
          A_CONFIDENTIALITY_IND                   VARCHAR2(1),
          A_GENDER                                VARCHAR2(63),
          A_ETHNICITY_CATEGORY                    VARCHAR2(63),
          A_HISPANIC_LATINO_ETHNICITY_IN          VARCHAR2(1),
          A_ETHNICITY                             VARCHAR2(63),
          A_DECEASED_IND                          VARCHAR2(1),
          A_CITIZENSHIP_IND                       VARCHAR2(1),
          A_CITIZENSHIP_TYPE                      VARCHAR2(63),
          A_NATION_OF_CITIZENSHIP                 VARCHAR2(63),
          A_NATION_OF_BIRTH                       VARCHAR2(63),
          A_PRIMARY_DISABILITY                    VARCHAR2(63),
          A_LEGACY                                VARCHAR2(63),
          A_MARITAL_STATUS                        VARCHAR2(63),
          A_RELIGION                              VARCHAR2(63),
          A_VETERAN_CATEGORY                      VARCHAR2(1),
          A_RACE_ETHNICITY_CONFIRM_IND            VARCHAR2(1),
          A_RACE_ETHNICITY_CONFIRM_DATE           DATE,
          A_PHONE_NUMBER_COMBINED                 VARCHAR2(63),
          A_VISA_TYPE                             VARCHAR2(63),
          A_NATIVE_AMERICAN_OR_ALASKAN_I          VARCHAR2(1),
          A_ASIAN_IND                             VARCHAR2(1),
          A_BLACK_OR_AFRICAN_IND                  VARCHAR2(1),
          A_PACIFIC_ISLANDER_IND                  VARCHAR2(1),
          A_WHITE_IND                             VARCHAR2(1),
          A_TWO_OR_MORE_IND                       VARCHAR2(1),
          A_NUMBER_OF_RACES                       NUMBER,
          A_MINORITY_IND                          NUMBER,
          A_RESIDENT_ALIEN_VISA_COUNT             NUMBER,
          A_VETERAN_TYPE                          VARCHAR2(1),
          A_MAX_ACAD_PER                          VARCHAR2(63)
    );
    TYPE refCurType     IS REF CURSOR;
    administrator_info_cur       refCurType;
    administrator_rec        administrator_info_rec_type;
    TYPE tab_a_info_rec_type   IS TABLE OF administrator_info_rec_type INDEX BY PLS_INTEGER;
    administrator_info_recs        tab_a_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WP.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.APPLICATION_RECRUIT_NUMBER,
                 DECODE(A.MODULE,'A','ADMISSIONS', 'R','RECRUIT', NULL) MODULE,
                 A.ADMINISTRATOR_UID,
                 NVL(WA.WAREHOUSE_ENTITY_UID,0)                warehouse_administrator_uid,
                 A.ADMINISTRATOR_ROLE,
                 A.RATER_IND,
                 PD.*,
                 AD.ID                                         A_ID,
                 AD.FULL_NAME_LFMI                             A_FULL_NAME_LFMI,
                 AD.BIRTH_DATE                                 A_BIRTH_DATE,
                 AD.DECEASED_DATE                              A_DECEASED_DATE,
                 AD.EMAIL_ADDRESS                              A_EMAIL_ADDRESS,
                 AD.CONFIDENTIALITY_IND                        A_CONFIDENTIALITY_IND,
                 AD.GENDER                                     A_GENDER,
                 AD.ETHNICITY_CATEGORY                         A_ETHNICITY_CATEGORY,
                 AD.HISPANIC_LATINO_ETHNICITY_IND              A_HISPANIC_LATINO_ETHNICITY_IN,
                 AD.ETHNICITY                                  A_ETHNICITY,
                 AD.DECEASED_IND                               A_DECEASED_IND,
                 AD.CITIZENSHIP_IND                            A_CITIZENSHIP_IND,
                 AD.CITIZENSHIP_TYPE                           A_CITIZENSHIP_TYPE,
                 AD.NATION_OF_CITIZENSHIP                      A_NATION_OF_CITIZENSHIP,
                 AD.NATION_OF_BIRTH                            A_NATION_OF_BIRTH,
                 AD.PRIMARY_DISABILITY                         A_PRIMARY_DISABILITY,
                 AD.LEGACY                                     A_LEGACY,
                 AD.MARITAL_STATUS                             A_MARITAL_STATUS,
                 AD.RELIGION                                   A_RELIGION,
                 AD.VETERAN_CATEGORY                           A_VETERAN_CATEGORY,
                 AD.RACE_ETHNICITY_CONFIRM_IND                 A_RACE_ETHNICITY_CONFIRM_IND,
                 AD.RACE_ETHNICITY_CONFIRM_DATE                A_RACE_ETHNICITY_CONFIRM_DATE,
                 AD.PHONE_NUMBER_COMBINED                      A_PHONE_NUMBER_COMBINED,
                 AD.VISA_TYPE                                  A_VISA_TYPE,
                 AD.NATIVE_AMERICAN_OR_ALASKAN_IND             A_NATIVE_AMERICAN_OR_ALASKAN_I,
                 AD.ASIAN_IND                                  A_ASIAN_IND,
                 AD.BLACK_OR_AFRICAN_IND                       A_BLACK_OR_AFRICAN_IND,
                 AD.PACIFIC_ISLANDER_IND                       A_PACIFIC_ISLANDER_IND,
                 AD.WHITE_IND                                  A_WHITE_IND,
                 AD.TWO_OR_MORE_IND                            A_TWO_OR_MORE_IND,
                 AD.NUMBER_OF_RACES                            A_NUMBER_OF_RACES,
                 AD.MINORITY_IND                               A_MINORITY_IND,
                 AD.RESIDENT_ALIEN_VISA_COUNT                  A_RESIDENT_ALIEN_VISA_COUNT,
                 AD.VETERAN_TYPE                               A_VETERAN_TYPE,
                 AD.MAX_ACAD_PER                               A_MAX_ACAD_PER
            FROM WDT_WAREHOUSE_ENTITY WP,
                 WDT_WAREHOUSE_ENTITY WA,
                 MST_ADMINISTRATOR A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 WCV_EXTR_PERSON_DETAILS AD
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in OR A.ADMINISTRATOR_UID LIKE debug_var_in)
             AND WP.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehoue_entity mep effort
             and wp.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
             --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC
             AND WA.BANNER_PIDM = A.ADMINISTRATOR_UID
             --BLM mepped 7/29/14 for wdt_warehoue_entity mep effort
             and wa.user_attribute_01 = a.mif_value
             AND A.ADMINISTRATOR_UID = AD.PERSON_ID;
                                       --JOS Update
	                  -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (AD)
             --             AND NVL(A.MIF_VALUE, def_multi_source_in) = AD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WP.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.APPLICATION_RECRUIT_NUMBER,
                 DECODE(A.MODULE,'A','ADMISSIONS', 'R','RECRUIT', NULL) MODULE,
                 A.ADMINISTRATOR_UID,
                 NVL(WA.WAREHOUSE_ENTITY_UID,0)                warehouse_administrator_uid,
                 A.ADMINISTRATOR_ROLE,
                 A.RATER_IND,
                 PD.*,
                 AD.ID                                         A_ID,
                 AD.FULL_NAME_LFMI                             A_FULL_NAME_LFMI,
                 AD.BIRTH_DATE                                 A_BIRTH_DATE,
                 AD.DECEASED_DATE                              A_DECEASED_DATE,
                 AD.EMAIL_ADDRESS                              A_EMAIL_ADDRESS,
                 AD.CONFIDENTIALITY_IND                        A_CONFIDENTIALITY_IND,
                 AD.GENDER                                     A_GENDER,
                 AD.ETHNICITY_CATEGORY                         A_ETHNICITY_CATEGORY,
                 AD.HISPANIC_LATINO_ETHNICITY_IND              A_HISPANIC_LATINO_ETHNICITY_IN,
                 AD.ETHNICITY                                  A_ETHNICITY,
                 AD.DECEASED_IND                               A_DECEASED_IND,
                 AD.CITIZENSHIP_IND                            A_CITIZENSHIP_IND,
                 AD.CITIZENSHIP_TYPE                           A_CITIZENSHIP_TYPE,
                 AD.NATION_OF_CITIZENSHIP                      A_NATION_OF_CITIZENSHIP,
                 AD.NATION_OF_BIRTH                            A_NATION_OF_BIRTH,
                 AD.PRIMARY_DISABILITY                         A_PRIMARY_DISABILITY,
                 AD.LEGACY                                     A_LEGACY,
                 AD.MARITAL_STATUS                             A_MARITAL_STATUS,
                 AD.RELIGION                                   A_RELIGION,
                 AD.VETERAN_CATEGORY                           A_VETERAN_CATEGORY,
                 AD.RACE_ETHNICITY_CONFIRM_IND                 A_RACE_ETHNICITY_CONFIRM_IND,
                 AD.RACE_ETHNICITY_CONFIRM_DATE                A_RACE_ETHNICITY_CONFIRM_DATE,
                 AD.PHONE_NUMBER_COMBINED                      A_PHONE_NUMBER_COMBINED,
                 AD.VISA_TYPE                                  A_VISA_TYPE,
                 AD.NATIVE_AMERICAN_OR_ALASKAN_IND             A_NATIVE_AMERICAN_OR_ALASKAN_I,
                 AD.ASIAN_IND                                  A_ASIAN_IND,
                 AD.BLACK_OR_AFRICAN_IND                       A_BLACK_OR_AFRICAN_IND,
                 AD.PACIFIC_ISLANDER_IND                       A_PACIFIC_ISLANDER_IND,
                 AD.WHITE_IND                                  A_WHITE_IND,
                 AD.TWO_OR_MORE_IND                            A_TWO_OR_MORE_IND,
                 AD.NUMBER_OF_RACES                            A_NUMBER_OF_RACES,
                 AD.MINORITY_IND                               A_MINORITY_IND,
                 AD.RESIDENT_ALIEN_VISA_COUNT                  A_RESIDENT_ALIEN_VISA_COUNT,
                 AD.VETERAN_TYPE                               A_VETERAN_TYPE,
                 AD.MAX_ACAD_PER                               A_MAX_ACAD_PER
            FROM WDT_WAREHOUSE_ENTITY WP,
                 WDT_WAREHOUSE_ENTITY WA,
                 MST_ADMINISTRATOR A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 WCV_EXTR_PERSON_DETAILS AD,
                 CHG_ADMINISTRATOR CHG
    WHERE (CHG.PERSON_UID = A.PERSON_UID OR CHG.PERSON_UID = A.ADMINISTRATOR_UID)
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in OR A.ADMINISTRATOR_UID LIKE debug_var_in)
             AND WP.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and wp.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC
             AND WA.BANNER_PIDM = A.ADMINISTRATOR_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and wa.user_attribute_01 = a.mif_value             
             AND A.ADMINISTRATOR_UID = AD.PERSON_ID;
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (AD)
             --             AND NVL(A.MIF_VALUE, def_multi_source_in) = AD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_ADMINISTRATOR', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_ADMINISTRATOR', 'WFT_ADMINISTRATOR', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    IF process_ind_in = 'L' THEN
        administrator_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        administrator_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
        FETCH administrator_info_cur INTO administrator_rec;
        EXIT WHEN administrator_info_cur%NOTFOUND;
--
      OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, administrator_rec.multi_source, administrator_rec.academic_period, 'ACYR');
      FETCH edw_general_extr.get_year_type INTO acad_time_rec;
      CLOSE edw_general_extr.get_year_type;
--
      ret_row.multi_source := administrator_rec.multi_source;
      ret_row.process_group := administrator_rec.process_group;
      ret_row.administrative_group := administrator_rec.administrative_group;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.msrc_user_attribute_01 := NULL;
      ret_row.msrc_user_attribute_01 := ret_row.multi_source;
      ret_row.msrc_user_attribute_02 := NULL;
      ret_row.msrc_user_attribute_03 := NULL;
      ret_row.msrc_user_attribute_04 := NULL;
      ret_row.msrc_user_attribute_05 := NULL;
      ret_row.academic_period := administrator_rec.academic_period;
      ret_row.academic_period_begin_date := acad_time_rec.start_date;
      ret_row.academic_period_end_date := acad_time_rec.end_date;
      ret_row.academic_year := administrator_rec.academic_year;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.atim_user_attribute_01 := NULL;
      ret_row.atim_user_attribute_01 := ret_row.multi_source;
      ret_row.atim_user_attribute_02 := NULL;
      ret_row.atim_user_attribute_03 := NULL;
      ret_row.atim_user_attribute_04 := NULL;
      ret_row.atim_user_attribute_05 := NULL;
      ret_row.person_uid := administrator_rec.warehouse_entity_uid;
      ret_row.id := administrator_rec.id;
      ret_row.full_name_lfmi := administrator_rec.full_name_lfmi;
      ret_row.birth_date := administrator_rec.birth_date;
      ret_row.deceased_date := administrator_rec.deceased_date;
      ret_row.email_address := administrator_rec.email_address;
      ret_row.phone_number_combined := administrator_rec.phone_number_combined;
      ret_row.confidentiality_ind := administrator_rec.confidentiality_ind;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.pers_user_attribute_01 := NULL;
      ret_row.pers_user_attribute_01 := ret_row.multi_source;
      ret_row.pers_user_attribute_02 := NULL;
      ret_row.pers_user_attribute_03 := NULL;
      ret_row.pers_user_attribute_04 := NULL;
      ret_row.pers_user_attribute_05 := NULL;
      ret_row.gender := administrator_rec.gender;
      ret_row.ethnicity_category := administrator_rec.ethnicity_category;
      ret_row.hispanic_latino_ethn_ind := administrator_rec.hispanic_latino_ethnicity_ind;
      ret_row.asian_ind := administrator_rec.asian_ind;
      ret_row.native_amer_or_alaskan_ind := administrator_rec.native_american_or_alaskan_ind;
      ret_row.black_or_african_ind := administrator_rec.black_or_african_ind;
      ret_row.pacific_islander_ind := administrator_rec.pacific_islander_ind;
      ret_row.white_ind := administrator_rec.white_ind;
      IF administrator_rec.number_of_races = 0 and administrator_rec.resident_alien_visa_count > 0 THEN
         ret_row.non_resident_ind := 'Y';
      ELSE
         ret_row.non_resident_ind := 'N';
      END IF;
      IF NVL(administrator_rec.hispanic_latino_ethnicity_ind,'N') = 'N' AND
         administrator_rec.number_of_races = 0 AND
         administrator_rec.resident_alien_visa_count = 0 THEN
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
      ELSE
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
      END IF;
      ret_row.two_or_more_ind := administrator_rec.two_or_more_ind;
      ret_row.race_ethnicity_confirm_ind := administrator_rec.race_ethnicity_confirm_ind;
      ret_row.minority_ind := administrator_rec.minority_ind;
      ret_row.ethnicity := administrator_rec.ethnicity;
      ret_row.deceased_ind := administrator_rec.deceased_ind;
      ret_row.citizenship_ind := administrator_rec.citizenship_ind;
      ret_row.citizenship_type := administrator_rec.citizenship_type;
      ret_row.visa_type := administrator_rec.visa_type;
      ret_row.nation_of_citizenship := administrator_rec.nation_of_citizenship;
      ret_row.nation_of_birth := administrator_rec.nation_of_birth;
      ret_row.primary_disability := administrator_rec.primary_disability;
      ret_row.legacy := administrator_rec.legacy;
      ret_row.marital_status := administrator_rec.marital_status;
      ret_row.religion := administrator_rec.religion;
      ret_row.veteran_type := administrator_rec.veteran_type;
      ret_row.veteran_category := administrator_rec.veteran_category;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.demo_user_attribute_01 := NULL;
      ret_row.demo_user_attribute_01 := ret_row.multi_source;
      ret_row.demo_user_attribute_02 := NULL;
      ret_row.demo_user_attribute_03 := NULL;
      ret_row.demo_user_attribute_04 := NULL;
      ret_row.demo_user_attribute_05 := NULL;
      ret_row.administrator_uid := administrator_rec.warehouse_administrator_uid;
      ret_row.a_id := administrator_rec.a_id;
      ret_row.a_full_name_lfmi := administrator_rec.a_full_name_lfmi;
      ret_row.a_birth_date := administrator_rec.a_birth_date;
      ret_row.a_deceased_date := administrator_rec.a_deceased_date;
      ret_row.a_email_address := administrator_rec.a_email_address;
      ret_row.a_phone_number_combined := administrator_rec.a_phone_number_combined;
      ret_row.a_confidentiality_ind := administrator_rec.a_confidentiality_ind;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.adst_user_attribute_01 := NULL;
      ret_row.adst_user_attribute_01 := ret_row.multi_source;
      ret_row.adst_user_attribute_02 := NULL;
      ret_row.adst_user_attribute_03 := NULL;
      ret_row.adst_user_attribute_04 := NULL;
      ret_row.adst_user_attribute_05 := NULL;
      ret_row.a_gender := administrator_rec.a_gender;
      ret_row.a_ethnicity_category := administrator_rec.a_ethnicity_category;
      ret_row.a_hispanic_latino_ethn_ind := administrator_rec.a_hispanic_latino_ethnicity_in;
      ret_row.a_asian_ind := administrator_rec.a_asian_ind;
      ret_row.a_nat_amer_or_alaskan_ind := administrator_rec.a_native_american_or_alaskan_i;
      ret_row.a_black_or_african_ind := administrator_rec.a_black_or_african_ind;
      ret_row.a_pacific_islander_ind := administrator_rec.a_pacific_islander_ind;
      ret_row.a_white_ind := administrator_rec.a_white_ind;
      IF administrator_rec.a_number_of_races = 0 and administrator_rec.a_resident_alien_visa_count > 0 THEN
         ret_row.a_non_resident_ind := 'Y';
      ELSE
         ret_row.a_non_resident_ind := 'N';
      END IF;
      IF NVL(administrator_rec.a_hispanic_latino_ethnicity_in,'N') = 'N' AND
         administrator_rec.a_number_of_races = 0 AND
         administrator_rec.a_resident_alien_visa_count = 0 THEN
         ret_row.a_RACE_ETHN_UNKNOWN_IND := 'Y';
      ELSE
         ret_row.a_RACE_ETHN_UNKNOWN_IND := 'N';
      END IF;
      ret_row.a_two_or_more_ind := administrator_rec.a_two_or_more_ind;
      ret_row.a_race_ethn_confirm_ind := administrator_rec.a_race_ethnicity_confirm_ind;
      ret_row.a_ethnicity := administrator_rec.a_ethnicity;
      ret_row.a_deceased_ind := administrator_rec.a_deceased_ind;
      ret_row.a_citizenship_ind := administrator_rec.a_citizenship_ind;
      ret_row.a_citizenship_type := administrator_rec.a_citizenship_type;
      ret_row.a_visa_type := administrator_rec.a_visa_type;
      ret_row.a_nation_of_citizenship := administrator_rec.a_nation_of_citizenship;
      ret_row.a_nation_of_birth := administrator_rec.a_nation_of_birth;
      ret_row.a_primary_disability := administrator_rec.a_primary_disability;
      ret_row.a_legacy := administrator_rec.a_legacy;
      ret_row.a_marital_status := administrator_rec.a_marital_status;
      ret_row.a_religion := administrator_rec.a_religion;
      ret_row.a_veteran_type := administrator_rec.a_veteran_type;
      ret_row.a_veteran_category := administrator_rec.a_veteran_category;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.ademo_user_attribute_01 := NULL;
      ret_row.ademo_user_attribute_01 := ret_row.multi_source;
      ret_row.ademo_user_attribute_02 := NULL;
      ret_row.ademo_user_attribute_03 := NULL;
      ret_row.ademo_user_attribute_04 := NULL;
      ret_row.ademo_user_attribute_05 := NULL;
      ret_row.administrator_role := administrator_rec.administrator_role;
      ret_row.rater_ind := administrator_rec.rater_ind;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.admn_user_attribute_01 := NULL;
      ret_row.admn_user_attribute_01 := ret_row.multi_source;
      ret_row.admn_user_attribute_02 := NULL;
      ret_row.admn_user_attribute_03 := NULL;
      ret_row.admn_user_attribute_04 := NULL;
      ret_row.admn_user_attribute_05 := NULL;
      ret_row.record_type := administrator_rec.module;
      ret_row.record_number := administrator_rec.application_recruit_number;
      ret_row.user_measure_01 := NULL;
      ret_row.user_measure_02 := NULL;
      ret_row.user_measure_03 := NULL;
      ret_row.user_measure_04 := NULL;
      ret_row.user_measure_05 := NULL;
      ret_row.system_load_process := 'ADMINISTRATOR';
--
      PIPE ROW(ret_row);
--
      ret_row := ret_row_init;
      acad_time_rec := acad_time_rec_init;
--
    END LOOP; -- administrator_rec
--
    RETURN;
--
  END f_get_administrator;
/******************************************************************************/
  FUNCTION f_get_student_activity(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_student_activity_extr PIPELINED IS
--
    ret_row                     WTT_STUDENT_ACTIVITY_INPUT%ROWTYPE;
    ret_row_init                WTT_STUDENT_ACTIVITY_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE all_student_activity_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(1000),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          ACTIVITY                                VARCHAR2(63),
          ACTIVITY_TYPE                           VARCHAR2(63),
          ACTIVITY_CATEGORY                       VARCHAR2(63),
          ACTIVITY_FIRST_ACADEMIC_PERIOD          VARCHAR2(63),
          ACTIVITY_LAST_ACADEMIC_PERIOD           VARCHAR2(63),
          ACTIVITY_TOTAL_ACAD_PERIODS             NUMBER,
          ACTIVITY_FIRST_YEAR                     VARCHAR2(63),
          ACTIVITY_LAST_YEAR                      VARCHAR2(63),
          ACTIVITY_TOTAL_YEARS                    NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          AC_ACADEMIC_PERIOD                      VARCHAR2(63),
          AC_START_DATE                           DATE,
          AC_END_DATE                             DATE,
          AC_YEAR_CODE                            VARCHAR2(63),
          ACF_ACADEMIC_PERIOD                     VARCHAR2(63),
          ACF_START_DATE                          DATE,
          ACF_END_DATE                            DATE,
          ACF_YEAR_CODE                           VARCHAR2(63),
          ACL_ACADEMIC_PERIOD                     VARCHAR2(63),
          ACL_START_DATE                          DATE,
          ACL_END_DATE                            DATE,
          ACL_YEAR_CODE                           VARCHAR2(63)
    );
    TYPE refCurType     IS REF CURSOR;
    all_student_activity_cur       refCurType;
    all_student_activity_rec        all_student_activity_rec_type;
    TYPE tab_a_s_activity_rec_type   IS TABLE OF all_student_activity_rec_type INDEX BY PLS_INTEGER;
    all_student_activity_recs        tab_a_s_activity_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DRIVER.*,
                      ACF.ACADEMIC_PERIOD                        acf_academic_period,
                      ACF.START_DATE                                acf_start_date,
                      ACF.END_DATE                                    acf_end_date,
                      ACF.YEAR_CODE                                  acf_year_code,
                      ACL.ACADEMIC_PERIOD                        acl_academic_period,
                      ACL.START_DATE                                acl_start_date,
                      ACL.END_DATE                                    acl_end_date,
                      ACL.YEAR_CODE                                  acl_year_code
            FROM (SELECT DISTINCT
                         NVL(SA.MIF_VALUE, def_multi_source_in)                           multi_source,
                         SA.ZONE_VALUE                                                    process_group,
                         SA.DOMAIN_VALUE                                                  administrative_group,
                         SA.PERSON_UID                                                    person_uid,
                         NVL(WE.WAREHOUSE_ENTITY_UID,0)                                   warehouse_entity_uid,
                         SA.ACADEMIC_YEAR                                                 academic_year,
                         SA.ACADEMIC_PERIOD                                               academic_period,
                         SA.STUDENT_ACTIVITY                                              activity,
                         SA.ACTIVITY_TYPE                                                 activity_type,
                         SA.ACTIVITY_CATEGORY                                             activity_category,
                         NVL((SELECT NVL(MIN(ACADEMIC_PERIOD), '000000')
                                FROM MST_STUDENT_ACTIVITY ACT
                               WHERE ACT.PERSON_UID = SA.PERSON_UID
                                 AND ACT.STUDENT_ACTIVITY = SA.STUDENT_ACTIVITY), '000000') activity_first_academic_period,
                         NVL((SELECT NVL(MAX(ACADEMIC_PERIOD), '999999')
                                FROM MST_STUDENT_ACTIVITY ACT
                               WHERE ACT.PERSON_UID = SA.PERSON_UID
                                 AND ACT.STUDENT_ACTIVITY = SA.STUDENT_ACTIVITY), '999999') activity_last_academic_period,
                         (SELECT COUNT(DISTINCT ACADEMIC_PERIOD)
                            FROM MST_STUDENT_ACTIVITY ACT
                           WHERE ACT.PERSON_UID = SA.PERSON_UID
                             AND ACT.STUDENT_ACTIVITY = SA.STUDENT_ACTIVITY)              activity_total_acad_periods,
                         NVL((SELECT NVL(MIN(ACADEMIC_YEAR), '1900')
                                FROM MST_STUDENT_ACTIVITY ACT
                               WHERE ACT.PERSON_UID = SA.PERSON_UID
                                 AND ACT.STUDENT_ACTIVITY = SA.STUDENT_ACTIVITY), 1900)   activity_first_year,
                         NVL((SELECT NVL(MAX(ACADEMIC_YEAR), '2099')
                                FROM MST_STUDENT_ACTIVITY ACT
                               WHERE ACT.PERSON_UID = SA.PERSON_UID
                                 AND ACT.STUDENT_ACTIVITY = SA.STUDENT_ACTIVITY), 2099)   activity_last_year,
                         (SELECT COUNT(DISTINCT ACADEMIC_YEAR)
                            FROM MST_STUDENT_ACTIVITY ACT
                           WHERE ACT.PERSON_UID = SA.PERSON_UID
                             AND ACT.STUDENT_ACTIVITY = SA.STUDENT_ACTIVITY)              activity_total_years,
                             PD.*,
                             AC.ACADEMIC_PERIOD                                           ac_academic_period,
                             AC.START_DATE                                                ac_start_date,
                             AC.END_DATE                                                  ac_end_date,
                             AC.YEAR_CODE                                                 ac_year_code
                    FROM WDT_WAREHOUSE_ENTITY WE,
                         MST_STUDENT_ACTIVITY SA,
                         WCV_EXTR_PERSON_DETAILS PD,
                         MGT_YEAR_TYPE_DEFINITION AC
                   WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                         FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                        WHERE YTD.ACADEMIC_PERIOD = SA.ACADEMIC_PERIOD
                                                          AND YTD.YEAR_TYPE = 'ACYR'
                                                          AND YTD.YEAR_CODE = academic_year_in
                                                          AND NVL(SA.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
                     AND (debug_var_in IS NULL OR SA.PERSON_UID LIKE debug_var_in)
                     AND WE.BANNER_PIDM = SA.PERSON_UID
                     --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
                     and we.user_attribute_01 = sa.mif_value
                     AND SA.PERSON_UID =  PD.PERSON_ID
                                  --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(SA.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
                     AND AC.YEAR_TYPE(+) = 'ACYR'
                     AND SA.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
                     AND NVL(SA.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)
                     ) DRIVER,
                  MGT_YEAR_TYPE_DEFINITION ACF,
                  MGT_YEAR_TYPE_DEFINITION ACL
            WHERE ACF.YEAR_TYPE(+) = 'ACYR'
              AND DRIVER.ACTIVITY_FIRST_ACADEMIC_PERIOD = ACF.ACADEMIC_PERIOD(+)
              AND DRIVER.MULTI_SOURCE = NVL(ACF.MIF_VALUE(+), def_multi_source_in)
              AND ACL.YEAR_TYPE(+) = 'ACYR'
              AND DRIVER.ACTIVITY_LAST_ACADEMIC_PERIOD = ACL.ACADEMIC_PERIOD(+)
              AND DRIVER.MULTI_SOURCE = NVL(ACL.MIF_VALUE(+), def_multi_source_in) ;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT DRIVER.*,
                      ACF.ACADEMIC_PERIOD                        acf_academic_period,
                      ACF.START_DATE                                acf_start_date,
                      ACF.END_DATE                                    acf_end_date,
                      ACF.YEAR_CODE                                  acf_year_code,
                      ACL.ACADEMIC_PERIOD                        acl_academic_period,
                      ACL.START_DATE                                acl_start_date,
                      ACL.END_DATE                                    acl_end_date,
                      ACL.YEAR_CODE                                  acl_year_code
            FROM (SELECT DISTINCT
                         NVL(SA.MIF_VALUE, def_multi_source_in)                           multi_source,
                         SA.ZONE_VALUE                                                    process_group,
                         SA.DOMAIN_VALUE                                                  administrative_group,
                         SA.PERSON_UID                                                    person_uid,
                         NVL(WE.WAREHOUSE_ENTITY_UID,0)                                   warehouse_entity_uid,
                         SA.ACADEMIC_YEAR                                                 academic_year,
                         SA.ACADEMIC_PERIOD                                               academic_period,
                         SA.STUDENT_ACTIVITY                                              activity,
                         SA.ACTIVITY_TYPE                                                 activity_type,
                         SA.ACTIVITY_CATEGORY                                             activity_category,
                         NVL((SELECT NVL(MIN(ACADEMIC_PERIOD), '000000')
                                FROM MST_STUDENT_ACTIVITY ACT
                               WHERE ACT.PERSON_UID = SA.PERSON_UID
                                 AND ACT.STUDENT_ACTIVITY = SA.STUDENT_ACTIVITY), '000000') activity_first_academic_period,
                         NVL((SELECT NVL(MAX(ACADEMIC_PERIOD), '999999')
                                FROM MST_STUDENT_ACTIVITY ACT
                               WHERE ACT.PERSON_UID = SA.PERSON_UID
                                 AND ACT.STUDENT_ACTIVITY = SA.STUDENT_ACTIVITY), '999999') activity_last_academic_period,
                         (SELECT COUNT(DISTINCT ACADEMIC_PERIOD)
                            FROM MST_STUDENT_ACTIVITY ACT
                           WHERE ACT.PERSON_UID = SA.PERSON_UID
                             AND ACT.STUDENT_ACTIVITY = SA.STUDENT_ACTIVITY)              activity_total_acad_periods,
                         NVL((SELECT NVL(MIN(ACADEMIC_YEAR), '1900')
                                FROM MST_STUDENT_ACTIVITY ACT
                               WHERE ACT.PERSON_UID = SA.PERSON_UID
                                 AND ACT.STUDENT_ACTIVITY = SA.STUDENT_ACTIVITY), 1900)   activity_first_year,
                         NVL((SELECT NVL(MAX(ACADEMIC_YEAR), '2099')
                                FROM MST_STUDENT_ACTIVITY ACT
                               WHERE ACT.PERSON_UID = SA.PERSON_UID
                                 AND ACT.STUDENT_ACTIVITY = SA.STUDENT_ACTIVITY), 2099)   activity_last_year,
                         (SELECT COUNT(DISTINCT ACADEMIC_YEAR)
                            FROM MST_STUDENT_ACTIVITY ACT
                           WHERE ACT.PERSON_UID = SA.PERSON_UID
                             AND ACT.STUDENT_ACTIVITY = SA.STUDENT_ACTIVITY)              activity_total_years,
                             PD.*,
                             AC.ACADEMIC_PERIOD                                           ac_academic_period,
                             AC.START_DATE                                                ac_start_date,
                             AC.END_DATE                                                  ac_end_date,
                             AC.YEAR_CODE                                                 ac_year_code
                    FROM WDT_WAREHOUSE_ENTITY WE,
                         MST_STUDENT_ACTIVITY SA,
                         WCV_EXTR_PERSON_DETAILS PD,
                         MGT_YEAR_TYPE_DEFINITION AC,
                         CHG_STUDENT_ACTIVITY CHG
                   WHERE CHG.PERSON_UID = SA.PERSON_UID
                     AND (debug_var_in IS NULL OR SA.PERSON_UID LIKE debug_var_in)
                     AND WE.BANNER_PIDM = SA.PERSON_UID
                     --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
                     and we.user_attribute_01 = sa.mif_value                     
                     AND SA.PERSON_UID =  PD.PERSON_ID
                                  --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(SA.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
                     AND AC.YEAR_TYPE(+) = 'ACYR'
                     AND SA.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
                     AND NVL(SA.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)
                     ) DRIVER,
                  MGT_YEAR_TYPE_DEFINITION ACF,
                  MGT_YEAR_TYPE_DEFINITION ACL
            WHERE ACF.YEAR_TYPE(+) = 'ACYR'
              AND DRIVER.ACTIVITY_FIRST_ACADEMIC_PERIOD = ACF.ACADEMIC_PERIOD(+)
              AND DRIVER.MULTI_SOURCE = NVL(ACF.MIF_VALUE(+), def_multi_source_in)
              AND ACL.YEAR_TYPE(+) = 'ACYR'
              AND DRIVER.ACTIVITY_LAST_ACADEMIC_PERIOD = ACL.ACADEMIC_PERIOD(+)
              AND DRIVER.MULTI_SOURCE = NVL(ACL.MIF_VALUE(+), def_multi_source_in) ;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_STUDENT_ACTIVITY', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_STUDENT_ACTIVITY', 'WFT_STUDENT_ACTIVITY', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        all_student_activity_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        all_student_activity_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH all_student_activity_cur BULK COLLECT INTO all_student_activity_recs LIMIT bulk_size;
       EXIT WHEN all_student_activity_recs.COUNT = 0;
--
       FOR i IN all_student_activity_recs.FIRST..all_student_activity_recs.LAST
       LOOP
--        multi source
             ret_row.multi_source := all_student_activity_recs(i).multi_source;
             ret_row.process_group := all_student_activity_recs(i).process_group;
             ret_row.administrative_group := all_student_activity_recs(i).administrative_group;
             --BLM mepped 6/2/14 for security reasons
             --ret_row.msrc_user_attribute_01 := NULL;
             ret_row.msrc_user_attribute_01 := ret_row.multi_source;
             ret_row.msrc_user_attribute_02 := NULL;
             ret_row.msrc_user_attribute_03 := NULL;
             ret_row.msrc_user_attribute_04 := NULL;
             ret_row.msrc_user_attribute_05 := NULL;
--        academic time
             ret_row.academic_period := all_student_activity_recs(i).ac_academic_period;
             ret_row.academic_period_begin_date := all_student_activity_recs(i).ac_start_date;
             ret_row.academic_period_end_date := all_student_activity_recs(i).ac_end_date;
             ret_row.academic_year := all_student_activity_recs(i).ac_year_code;
             --BLM mepped 6/2/14 for security reasons
             --ret_row.atim_user_attribute_01 := NULL;
             ret_row.atim_user_attribute_01 := ret_row.multi_source;
             ret_row.atim_user_attribute_02 := NULL;
             ret_row.atim_user_attribute_03 := NULL;
             ret_row.atim_user_attribute_04 := NULL;
             ret_row.atim_user_attribute_05 := NULL;
--        person
             ret_row.person_uid := all_student_activity_recs(i).warehouse_entity_uid;
             ret_row.id := all_student_activity_recs(i).id;
             ret_row.full_name_lfmi := all_student_activity_recs(i).full_name_lfmi;
             ret_row.birth_date := all_student_activity_recs(i).birth_date;
             ret_row.deceased_date := all_student_activity_recs(i).deceased_date;
             ret_row.email_address := all_student_activity_recs(i).email_address;
             ret_row.phone_number_combined := all_student_activity_recs(i).phone_number_combined;
             ret_row.confidentiality_ind := all_student_activity_recs(i).confidentiality_ind;
             --BLM mepped 6/2/14 for security reasons
             --ret_row.pers_user_attribute_01 := NULL;
             ret_row.pers_user_attribute_01 := ret_row.multi_source;
             ret_row.pers_user_attribute_02 := NULL;
             ret_row.pers_user_attribute_03 := NULL;
             ret_row.pers_user_attribute_04 := NULL;
             ret_row.pers_user_attribute_05 := NULL;
--        activity
             ret_row.activity := all_student_activity_recs(i).activity;
             ret_row.activity_type := all_student_activity_recs(i).activity_type;
             ret_row.activity_category := all_student_activity_recs(i).activity_category;
             --BLM mepped 6/2/14 for security reasons
             --ret_row.sact_user_attribute_01 := NULL;
             ret_row.sact_user_attribute_01 := ret_row.multi_source;
             ret_row.sact_user_attribute_02 := NULL;
             ret_row.sact_user_attribute_03 := NULL;
             ret_row.sact_user_attribute_04 := NULL;
             ret_row.sact_user_attribute_05 := NULL;
--        demographic
             ret_row.gender := all_student_activity_recs(i).gender;
             ret_row.ethnicity_category := all_student_activity_recs(i).ethnicity_category;
             ret_row.hispanic_latino_ethn_ind := all_student_activity_recs(i).hispanic_latino_ethnicity_ind;
             ret_row.asian_ind := all_student_activity_recs(i).asian_ind;
             ret_row.native_amer_or_alaskan_ind := all_student_activity_recs(i).native_american_or_alaskan_ind;
             ret_row.black_or_african_ind := all_student_activity_recs(i).black_or_african_ind;
             ret_row.pacific_islander_ind := all_student_activity_recs(i).pacific_islander_ind;
             ret_row.white_ind := all_student_activity_recs(i).white_ind;
             ret_row.two_or_more_ind := all_student_activity_recs(i).two_or_more_ind;
             IF all_student_activity_recs(i).number_of_races = 0 and all_student_activity_recs(i).resident_alien_visa_count > 0 THEN
                ret_row.non_resident_ind := 'Y';
             ELSE
                ret_row.non_resident_ind := 'N';
             END IF;
             IF NVL(all_student_activity_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND all_student_activity_recs(i).number_of_races = 0 AND all_student_activity_recs(i).resident_alien_visa_count = 0 THEN
                ret_row.race_ethnicity_unknown_ind := 'Y';
             else
                ret_row.race_ethnicity_unknown_ind := 'N';
             END IF;
             ret_row.race_ethnicity_confirm_ind := all_student_activity_recs(i).race_ethnicity_confirm_ind;
             ret_row.minority_ind := all_student_activity_recs(i).minority_ind;
             ret_row.ethnicity := all_student_activity_recs(i).ethnicity;
             ret_row.deceased_ind := all_student_activity_recs(i).deceased_ind;
             ret_row.citizenship_ind := all_student_activity_recs(i).citizenship_ind;
             ret_row.citizenship_type := all_student_activity_recs(i).citizenship_type;
             ret_row.visa_type := all_student_activity_recs(i).visa_type;
             ret_row.nation_of_citizenship := all_student_activity_recs(i).nation_of_citizenship;
             ret_row.nation_of_birth := all_student_activity_recs(i).nation_of_birth;
             ret_row.primary_disability := all_student_activity_recs(i).primary_disability;
             ret_row.legacy := all_student_activity_recs(i).legacy;
             ret_row.marital_status := all_student_activity_recs(i).marital_status;
             ret_row.religion := all_student_activity_recs(i).religion;
             ret_row.veteran_type := all_student_activity_recs(i).veteran_type;
             ret_row.veteran_category := all_student_activity_recs(i).veteran_category;
             --BLM mepped 6/2/14 for security reasons
             --ret_row.demo_user_attribute_01 := NULL;
             ret_row.demo_user_attribute_01 := ret_row.multi_source;
             ret_row.demo_user_attribute_02 := NULL;
             ret_row.demo_user_attribute_03 := NULL;
             ret_row.demo_user_attribute_04 := NULL;
             ret_row.demo_user_attribute_05 := NULL;
--        activity first academic time
             ret_row.f_academic_period := all_student_activity_recs(i).acf_academic_period;
             ret_row.f_academic_period_begin_date := all_student_activity_recs(i).acf_start_date;
             ret_row.f_academic_period_end_date := all_student_activity_recs(i).acf_end_date;
             ret_row.f_academic_year := all_student_activity_recs(i).acf_year_code;
             --BLM mepped 6/2/14 for security reasons
             --ret_row.ftim_user_attribute_01 := NULL;
             ret_row.ftim_user_attribute_01 := ret_row.multi_source;
             ret_row.ftim_user_attribute_02 := NULL;
             ret_row.ftim_user_attribute_03 := NULL;
             ret_row.ftim_user_attribute_04 := NULL;
             ret_row.ftim_user_attribute_05 := NULL;
--        activity last academic time
             ret_row.l_academic_period := all_student_activity_recs(i).acl_academic_period;
             ret_row.l_academic_period_begin_date := all_student_activity_recs(i).acl_start_date;
             ret_row.l_academic_period_end_date := all_student_activity_recs(i).acl_end_date;
             ret_row.l_academic_year := all_student_activity_recs(i).acl_year_code;
             --BLM mepped 6/2/14 for security reasons
             --ret_row.ltim_user_attribute_01 := NULL;
             ret_row.ltim_user_attribute_01 := ret_row.multi_source;
             ret_row.ltim_user_attribute_02 := NULL;
             ret_row.ltim_user_attribute_03 := NULL;
             ret_row.ltim_user_attribute_04 := NULL;
             ret_row.ltim_user_attribute_05 := NULL;
--        measures
             ret_row.activity_total_acad_periods := all_student_activity_recs(i).activity_total_acad_periods;
             ret_row.activity_first_year := all_student_activity_recs(i).activity_first_year;
             ret_row.activity_last_year := all_student_activity_recs(i).activity_last_year;
             ret_row.activity_total_years := all_student_activity_recs(i).activity_total_years;
             ret_row.user_measure_01 := NULL;
             ret_row.user_measure_02 := NULL;
             ret_row.user_measure_03 := NULL;
             ret_row.user_measure_04 := NULL;
             ret_row.user_measure_05 := NULL;
             ret_row.system_load_process := 'STUDENT_ACTIVITY';
--
             PIPE ROW(ret_row);
--
             ret_row := ret_row_init;
--
       END LOOP; -- student_activity_rec
--
   END LOOP;
--
   CLOSE all_student_activity_cur;
--
   RETURN;
--
  END f_get_student_activity;
/******************************************************************************/
function f_get_athletic(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_athletic_extr PIPELINED IS
--
    ret_row                     WTT_ATHLETIC_INPUT%ROWTYPE;
    ret_row_init                WTT_ATHLETIC_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE athletic_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          ACTIVITY                                VARCHAR2(63),
          SPORT_STATUS                            VARCHAR2(63),
          ATHLETIC_SPORT_ACTIVE_IND               VARCHAR2(1),
          ELIGIBILITY                             VARCHAR2(63),
          ATHLETIC_AID_IND                        VARCHAR2(1),
          ACTIVITY_TYPE                           VARCHAR2(63),
          ACTIVITY_CATEGORY                       VARCHAR2(63),
          ATHLETIC_ACADEMIC_ELIGIBLE              VARCHAR2(63),
          ATHLETIC_FIRST_YEAR                     VARCHAR2(63),
          ATHLETIC_LAST_YEAR                      VARCHAR2(63),
          BEGIN_ACADPD_OF_ELIG                    VARCHAR2(63),
          END_ACADPD_OF_ELIG                      VARCHAR2(63),
          SEASONS_COMPETITION_REMAINING           NUMBER,
          SEASONS_COMPETITION_USED                NUMBER,
          SEASONS_COMPETITION_AVAILABLE           NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          AC_ACADEMIC_PERIOD                      VARCHAR2(63),
          AC_START_DATE                           DATE,
          AC_END_DATE                             DATE,
          AC_YEAR_CODE                            VARCHAR2(63),
          ACF_ACADEMIC_PERIOD                     VARCHAR2(63),
          ACF_START_DATE                          DATE,
          ACF_END_DATE                            DATE,
          ACF_YEAR_CODE                           VARCHAR2(63),
          ACL_ACADEMIC_PERIOD                     VARCHAR2(63),
          ACL_START_DATE                          DATE,
          ACL_END_DATE                            DATE,
          ACL_YEAR_CODE                           VARCHAR2(63)
    );
    TYPE refCurType     IS REF CURSOR;
    athletic_info_cur       refCurType;
    athletic_info_rec        athletic_info_rec_type;
    TYPE tab_athletic_info_rec_type   IS TABLE OF athletic_info_rec_type INDEX BY PLS_INTEGER;
    athletic_info_recs        tab_athletic_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)             multi_source,
                 A.ZONE_VALUE                                      process_group,
                 A.DOMAIN_VALUE                                    administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                    warehouse_entity_uid,
                 A.ACTIVITY,
                 A.SPORT_STATUS,
                 A.ATHLETIC_SPORT_ACTIVE_IND                       athletic_sport_active_ind,
                 A.ELIGIBILITY,
                 A.ATHLETIC_AID_IND,
                 A.ACTIVITY_TYPE,
                 A.ACTIVITY_CATEGORY,
                 A.ATHLETIC_ACADEMIC_ELIGIBLE                      athletic_academic_eligible,
                 NVL((SELECT MIN(ACADEMIC_YEAR)
                        FROM MST_SPORT SPORT
                       -- JOS 09/18/2012; add in join to MIF_VALUE
                       WHERE sport.mif_value = a.mif_value
                         and SPORT.PERSON_UID = A.PERSON_UID
                         AND SPORT.ACTIVITY = A.ACTIVITY), '1900') athletic_first_year,
                 NVL((SELECT MAX(ACADEMIC_YEAR)
                        FROM MST_SPORT SPORT
                       -- JOS 09/18/2012; add in join to MIF_VALUE
                       WHERE sport.mif_value = a.mif_value
                       and SPORT.PERSON_UID = A.PERSON_UID
                         AND SPORT.ACTIVITY = A.ACTIVITY), '2099') athletic_last_year,
                 A.BEGIN_ACAD_PERIOD_ELIGIBLE                      begin_acadpd_of_elig,
                 A.END_ACAD_PERIOD_ELIGIBLE                        end_acadpd_of_elig,
                 A.SEASONS_COMPETITION_REMAINING                   seasons_competition_remaining,
                 A.SEASONS_COMPETITION_USED                        seasons_competition_used,
                 A.SEASONS_COMPETITION_AVAILABLE                   seasons_competition_available,
                 PD.*,
                 AC.ACADEMIC_PERIOD                                ac_academic_period,
                 AC.START_DATE                                     ac_start_date,
                 AC.END_DATE                                       ac_end_date,
                 AC.YEAR_CODE                                      ac_year_code,
                 ACF.ACADEMIC_PERIOD                               acf_academic_period,
                 ACF.START_DATE                                    acf_start_date,
                 ACF.END_DATE                                      acf_end_date,
                 ACF.YEAR_CODE                                     acf_year_code,
                 ACL.ACADEMIC_PERIOD                               acl_academic_period,
                 ACL.START_DATE                                    acl_start_date,
                 ACL.END_DATE                                      acl_end_date,
                 ACL.YEAR_CODE                                     acl_year_code
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_SPORT A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 MGT_YEAR_TYPE_DEFINITION ACF,
                 MGT_YEAR_TYPE_DEFINITION ACL
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
             -- JOS 09/18/2012; remove join to MIF_VALUE for PD
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)
             AND ACF.YEAR_TYPE(+) = 'ACYR'
             AND A.BEGIN_ACAD_PERIOD_ELIGIBLE = ACF.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(ACF.MIF_VALUE(+), def_multi_source_in)
             AND ACL.YEAR_TYPE(+) = 'ACYR'
             AND A.END_ACAD_PERIOD_ELIGIBLE = ACL.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(ACL.MIF_VALUE(+), def_multi_source_in) ;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)             multi_source,
                 A.ZONE_VALUE                                      process_group,
                 A.DOMAIN_VALUE                                    administrative_group,
                 A.ACADEMIC_YEAR,
                 A.ACADEMIC_PERIOD,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                    warehouse_entity_uid,
                 A.ACTIVITY,
                 A.SPORT_STATUS,
                 A.ATHLETIC_SPORT_ACTIVE_IND                       athletic_sport_active_ind,
                 A.ELIGIBILITY,
                 A.ATHLETIC_AID_IND,
                 A.ACTIVITY_TYPE,
                 A.ACTIVITY_CATEGORY,
                 A.ATHLETIC_ACADEMIC_ELIGIBLE                      athletic_academic_eligible,
                 NVL((SELECT MIN(ACADEMIC_YEAR)
                        FROM MST_SPORT SPORT
                       WHERE SPORT.PERSON_UID = A.PERSON_UID
                         AND SPORT.ACTIVITY = A.ACTIVITY), '1900') athletic_first_year,
                 NVL((SELECT MAX(ACADEMIC_YEAR)
                        FROM MST_SPORT SPORT
                       WHERE SPORT.PERSON_UID = A.PERSON_UID
                         AND SPORT.ACTIVITY = A.ACTIVITY), '2099') athletic_last_year,
                 A.BEGIN_ACAD_PERIOD_ELIGIBLE                      begin_acadpd_of_elig,
                 A.END_ACAD_PERIOD_ELIGIBLE                        end_acadpd_of_elig,
                 A.SEASONS_COMPETITION_REMAINING                   seasons_competition_remaining,
                 A.SEASONS_COMPETITION_USED                        seasons_competition_used,
                 A.SEASONS_COMPETITION_AVAILABLE                   seasons_competition_available,
                 PD.*,
                 AC.ACADEMIC_PERIOD                                ac_academic_period,
                 AC.START_DATE                                     ac_start_date,
                 AC.END_DATE                                       ac_end_date,
                 AC.YEAR_CODE                                      ac_year_code,
                 ACF.ACADEMIC_PERIOD                               acf_academic_period,
                 ACF.START_DATE                                    acf_start_date,
                 ACF.END_DATE                                      acf_end_date,
                 ACF.YEAR_CODE                                     acf_year_code,
                 ACL.ACADEMIC_PERIOD                               acl_academic_period,
                 ACL.START_DATE                                    acl_start_date,
                 ACL.END_DATE                                      acl_end_date,
                 ACL.YEAR_CODE                                     acl_year_code
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_SPORT A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 MGT_YEAR_TYPE_DEFINITION ACF,
                 MGT_YEAR_TYPE_DEFINITION ACL,
                 CHG_ATHLETIC CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value             
             AND A.PERSON_UID =  PD.PERSON_ID
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)
             AND ACF.YEAR_TYPE(+) = 'ACYR'
             AND A.BEGIN_ACAD_PERIOD_ELIGIBLE = ACF.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(ACF.MIF_VALUE(+), def_multi_source_in)
             AND ACL.YEAR_TYPE(+) = 'ACYR'
             AND A.END_ACAD_PERIOD_ELIGIBLE = ACL.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(ACL.MIF_VALUE(+), def_multi_source_in) ;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_ATHLETIC', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_ATHLETIC', 'WFT_ATHLETIC', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        athletic_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        athletic_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH athletic_info_cur BULK COLLECT INTO athletic_info_recs LIMIT bulk_size;
       EXIT WHEN athletic_info_recs.COUNT = 0;
--
       FOR i IN athletic_info_recs.FIRST..athletic_info_recs.LAST
       LOOP
--      multi source
           ret_row.multi_source := athletic_info_recs(i).multi_source;
           ret_row.process_group := athletic_info_recs(i).process_group;
           ret_row.administrative_group := athletic_info_recs(i).administrative_group;
           --BLM mepped 6/2/14 for security reasons
           --ret_row.msrc_user_attribute_01 := NULL;
           ret_row.msrc_user_attribute_01 := ret_row.multi_source;
           ret_row.msrc_user_attribute_02 := NULL;
           ret_row.msrc_user_attribute_03 := NULL;
           ret_row.msrc_user_attribute_04 := NULL;
           ret_row.msrc_user_attribute_05 := NULL;
--      academic time
           ret_row.academic_period := athletic_info_recs(i).ac_academic_period;
           ret_row.academic_period_begin_date := athletic_info_recs(i).ac_start_date;
           ret_row.academic_period_end_date := athletic_info_recs(i).ac_end_date;
           ret_row.academic_year := athletic_info_recs(i).ac_year_code;
           --BLM mepped 6/2/14 for security reasons
           --ret_row.atim_user_attribute_01 := NULL;
           ret_row.atim_user_attribute_01 := ret_row.multi_source;
           ret_row.atim_user_attribute_02 := NULL;
           ret_row.atim_user_attribute_03 := NULL;
           ret_row.atim_user_attribute_04 := NULL;
           ret_row.atim_user_attribute_05 := NULL;
--      person
           ret_row.person_uid := athletic_info_recs(i).warehouse_entity_uid;
           ret_row.id := athletic_info_recs(i).id;
           ret_row.full_name_lfmi := athletic_info_recs(i).full_name_lfmi;
           ret_row.birth_date := athletic_info_recs(i).birth_date;
           ret_row.deceased_date := athletic_info_recs(i).deceased_date;
           ret_row.email_address := athletic_info_recs(i).email_address;
           ret_row.phone_number_combined := athletic_info_recs(i).phone_number_combined;
           ret_row.confidentiality_ind := athletic_info_recs(i).confidentiality_ind;
           --BLM mepped 6/2/14 for security reasons
           --ret_row.pers_user_attribute_01 := NULL;
           ret_row.pers_user_attribute_01 := ret_row.multi_source;
           ret_row.pers_user_attribute_02 := NULL;
           ret_row.pers_user_attribute_03 := NULL;
           ret_row.pers_user_attribute_04 := NULL;
           ret_row.pers_user_attribute_05 := NULL;
--      demographic
           ret_row.gender := athletic_info_recs(i).gender;
           ret_row.ethnicity_category := athletic_info_recs(i).ethnicity_category;
           ret_row.hispanic_latino_ethn_ind := athletic_info_recs(i).hispanic_latino_ethnicity_ind;
           ret_row.asian_ind := athletic_info_recs(i).asian_ind;
           ret_row.native_amer_or_alaskan_ind := athletic_info_recs(i).native_american_or_alaskan_ind;
           ret_row.black_or_african_ind := athletic_info_recs(i).black_or_african_ind;
           ret_row.pacific_islander_ind := athletic_info_recs(i).pacific_islander_ind;
           ret_row.white_ind := athletic_info_recs(i).white_ind;
           ret_row.two_or_more_ind := athletic_info_recs(i).two_or_more_ind;
           IF athletic_info_recs(i).number_of_races = 0 and athletic_info_recs(i).resident_alien_visa_count > 0 THEN
              ret_row.non_resident_ind := 'Y';
           ELSE
              ret_row.non_resident_ind := 'N';
           END IF;
           IF NVL(athletic_info_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND
              athletic_info_recs(i).number_of_races = 0 AND
              athletic_info_recs(i).resident_alien_visa_count = 0 THEN
              ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
           ELSE
              ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
           END IF;
           ret_row.race_ethnicity_confirm_ind := athletic_info_recs(i).race_ethnicity_confirm_ind;
           ret_row.minority_ind := athletic_info_recs(i).minority_ind;
           ret_row.ethnicity := athletic_info_recs(i).ethnicity;
           ret_row.deceased_ind := athletic_info_recs(i).deceased_ind;
           ret_row.citizenship_ind := athletic_info_recs(i).citizenship_ind;
           ret_row.citizenship_type := athletic_info_recs(i).citizenship_type;
           ret_row.visa_type := athletic_info_recs(i).visa_type;
           ret_row.nation_of_citizenship := athletic_info_recs(i).nation_of_citizenship;
           ret_row.nation_of_birth := athletic_info_recs(i).nation_of_birth;
           ret_row.primary_disability := athletic_info_recs(i).primary_disability;
           ret_row.legacy := athletic_info_recs(i).legacy;
           ret_row.marital_status := athletic_info_recs(i).marital_status;
           ret_row.religion := athletic_info_recs(i).religion;
           ret_row.veteran_type := athletic_info_recs(i).veteran_type;
           ret_row.veteran_category := athletic_info_recs(i).veteran_category;
           --BLM mepped 6/2/14 for security reasons
           --ret_row.demo_user_attribute_01 := NULL;
           ret_row.demo_user_attribute_01 := ret_row.multi_source;
           ret_row.demo_user_attribute_02 := NULL;
           ret_row.demo_user_attribute_03 := NULL;
           ret_row.demo_user_attribute_04 := NULL;
           ret_row.demo_user_attribute_05 := NULL;
--      activity
           ret_row.activity := athletic_info_recs(i).activity;
           ret_row.activity_type := athletic_info_recs(i).activity_type;
           ret_row.activity_category := athletic_info_recs(i).activity_category;
           --BLM mepped 6/2/14 for security reasons
           --ret_row.sact_user_attribute_01 := NULL;
           ret_row.sact_user_attribute_01 := ret_row.multi_source;
           ret_row.sact_user_attribute_02 := NULL;
           ret_row.sact_user_attribute_03 := NULL;
           ret_row.sact_user_attribute_04 := NULL;
           ret_row.sact_user_attribute_05 := NULL;
--      athletic
           ret_row.athletic_sport_status := athletic_info_recs(i).sport_status;
           ret_row.athletic_eligibility := athletic_info_recs(i).eligibility;
           ret_row.athletic_academic_eligible := athletic_info_recs(i).athletic_academic_eligible;
           CASE
           WHEN athletic_info_recs(i).athletic_aid_ind = 'Y' THEN ret_row.athletic_aid_ind := 1;
           ELSE ret_row.athletic_aid_ind := 0;
           END CASE;
           CASE
           WHEN athletic_info_recs(i).athletic_sport_active_ind = 'Y' THEN ret_row.athletic_sport_active_ind := 1;
           ELSE ret_row.athletic_sport_active_ind := 0;
           END CASE;
           --BLM mepped 6/2/14 for security reasons
           --ret_row.athl_user_attribute_01 := NULL;
           ret_row.athl_user_attribute_01 := ret_row.multi_source;
           ret_row.athl_user_attribute_02 := NULL;
           ret_row.athl_user_attribute_03 := NULL;
           ret_row.athl_user_attribute_04 := NULL;
           ret_row.athl_user_attribute_05 := NULL;
--      academic time (begin eligibility)
           ret_row.bgnt_academic_period := athletic_info_recs(i).acf_academic_period;
           ret_row.bgnt_academic_period_begin_dt := athletic_info_recs(i).acf_start_date;
           ret_row.bgnt_academic_period_end_dt := athletic_info_recs(i).acf_end_date;
           ret_row.bgnt_academic_year := athletic_info_recs(i).acf_year_code;
           --BLM mepped 6/2/14 for security reasons
           --ret_row.bgnt_user_attribute_01 := NULL;
           ret_row.bgnt_user_attribute_01 := ret_row.multi_source;
           ret_row.bgnt_user_attribute_02 := NULL;
           ret_row.bgnt_user_attribute_03 := NULL;
           ret_row.bgnt_user_attribute_04 := NULL;
           ret_row.bgnt_user_attribute_05 := NULL;
--      academic time (end eligibility)
           ret_row.endt_academic_period :=  athletic_info_recs(i).acl_academic_period;
           ret_row.endt_academic_period_begin_dt :=  athletic_info_recs(i).acl_start_date;
           ret_row.endt_academic_period_end_dt :=  athletic_info_recs(i).acl_end_date;
           ret_row.endt_academic_year :=  athletic_info_recs(i).acl_year_code;
           --BLM mepped 6/2/14 for security reasons
           ret_row.endt_user_attribute_01 := ret_row.multi_source;
           ret_row.endt_user_attribute_02 := NULL;
           ret_row.endt_user_attribute_03 := NULL;
           ret_row.endt_user_attribute_04 := NULL;
           ret_row.endt_user_attribute_05 := NULL;
--      measures
           ret_row.athletic_first_year := athletic_info_recs(i).athletic_first_year;
           ret_row.athletic_last_year := athletic_info_recs(i).athletic_last_year;
           ret_row.seasons_competition_remaining := athletic_info_recs(i).seasons_competition_remaining;
           ret_row.seasons_competition_used := athletic_info_recs(i).seasons_competition_used;
           ret_row.seasons_competition_available := athletic_info_recs(i).seasons_competition_available;
           ret_row.user_measure_01 := NULL;
           ret_row.user_measure_02 := NULL;
           ret_row.user_measure_03 := NULL;
           ret_row.user_measure_04 := NULL;
           ret_row.user_measure_05 := NULL;
           ret_row.system_load_process := 'ATHLETIC';
--
           PIPE ROW(ret_row);
--
           ret_row := ret_row_init;
--
       END LOOP; -- athletic_rec
--
   END LOOP;
--
   CLOSE athletic_info_cur;
--
   RETURN;
--
  END f_get_athletic;
/******************************************************************************/
function f_get_student_attribute(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_student_attribute_extr PIPELINED IS
--
    ret_row                     WTT_STUDENT_ATTRIBUTE_INPUT%ROWTYPE;
    ret_row_init                WTT_STUDENT_ATTRIBUTE_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE student_a_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          ACADEMIC_PERIOD_START                   VARCHAR2(63),
          ACADEMIC_PERIOD_END                     VARCHAR2(63),
          STUDENT_ATTRIBUTE                       VARCHAR2(63),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          YEAR_CODE                               VARCHAR2(63),
          START_DATE                              DATE,
          END_DATE                                DATE
    );
    TYPE refCurType     IS REF CURSOR;
    student_attribute_info_cur       refCurType;
    student_attribute_info_rec        student_a_info_rec_type;
    TYPE tab_student_a_info_rec_type   IS TABLE OF student_a_info_rec_type INDEX BY PLS_INTEGER;
    student_attribute_info_recs        tab_student_a_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.ACADEMIC_PERIOD_START,
                 A.ACADEMIC_PERIOD_END,
                 A.STUDENT_ATTRIBUTE,
                 PD.*,
                 YT.ACADEMIC_PERIOD,
                 YT.YEAR_CODE,
                 YT.START_DATE,
                 YT.END_DATE
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_STUDENT_ATTRIBUTE A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION YT
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD BETWEEN A.ACADEMIC_PERIOD_START AND A.ACADEMIC_PERIOD_END
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND (academic_year_in = 'ALL' OR YT.YEAR_CODE = academic_year_in)
             AND YT.YEAR_TYPE = 'ACYR'
             AND NVL(A.MIF_VALUE, def_multi_source_in)= NVL(YT.MIF_VALUE, def_multi_source_in)
             AND YT.ACADEMIC_PERIOD BETWEEN A.ACADEMIC_PERIOD_START AND A.ACADEMIC_PERIOD_END ;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.ACADEMIC_PERIOD_START,
                 A.ACADEMIC_PERIOD_END,
                 A.STUDENT_ATTRIBUTE,
                 PD.*,
                 YT.ACADEMIC_PERIOD,
                 YT.YEAR_CODE,
                 YT.START_DATE,
                 YT.END_DATE
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_STUDENT_ATTRIBUTE A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION YT,
                 CHG_STUDENT_ATTRIBUTE CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value             
             AND A.PERSON_UID =  PD.PERSON_ID
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND (academic_year_in = 'ALL' OR YT.YEAR_CODE = academic_year_in)
             AND YT.YEAR_TYPE = 'ACYR'
             AND NVL(A.MIF_VALUE, def_multi_source_in)= NVL(YT.MIF_VALUE, def_multi_source_in)
             AND YT.ACADEMIC_PERIOD BETWEEN A.ACADEMIC_PERIOD_START AND A.ACADEMIC_PERIOD_END ;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_STUDENT_ATTRIBUTE', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_STUDENT_ATTRIBUTE', 'WFT_STUDENT_ATTRIBUTE', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        student_attribute_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        student_attribute_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH student_attribute_info_cur BULK COLLECT INTO student_attribute_info_recs LIMIT bulk_size;
       EXIT WHEN student_attribute_info_recs.COUNT = 0;
--
       FOR i IN student_attribute_info_recs.FIRST..student_attribute_info_recs.LAST
       LOOP
--
--     multi source
          ret_row.multi_source := student_attribute_info_recs(i).multi_source;
          ret_row.process_group := student_attribute_info_recs(i).process_group;
          ret_row.administrative_group := student_attribute_info_recs(i).administrative_group;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.msrc_user_attribute_01 := NULL;
          ret_row.msrc_user_attribute_01 := ret_row.multi_source;
          ret_row.msrc_user_attribute_02 := NULL;
          ret_row.msrc_user_attribute_03 := NULL;
          ret_row.msrc_user_attribute_04 := NULL;
          ret_row.msrc_user_attribute_05 := NULL;
--     person
          ret_row.person_uid := student_attribute_info_recs(i).warehouse_entity_uid;
          ret_row.id := student_attribute_info_recs(i).id;
          ret_row.full_name_lfmi := student_attribute_info_recs(i).full_name_lfmi;
          ret_row.birth_date := student_attribute_info_recs(i).birth_date;
          ret_row.deceased_date := student_attribute_info_recs(i).deceased_date;
          ret_row.email_address := student_attribute_info_recs(i).email_address;
          ret_row.phone_number_combined := student_attribute_info_recs(i).phone_number_combined;
          ret_row.confidentiality_ind := student_attribute_info_recs(i).confidentiality_ind;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.pers_user_attribute_01 := NULL;
          ret_row.pers_user_attribute_01 := ret_row.multi_source;
          ret_row.pers_user_attribute_02 := NULL;
          ret_row.pers_user_attribute_03 := NULL;
          ret_row.pers_user_attribute_04 := NULL;
          ret_row.pers_user_attribute_05 := NULL;
--     demographic
          ret_row.gender := student_attribute_info_recs(i).gender;
          ret_row.ethnicity_category := student_attribute_info_recs(i).ethnicity_category;
          ret_row.hispanic_latino_ethn_ind := student_attribute_info_recs(i).hispanic_latino_ethnicity_ind;
          ret_row.asian_ind := student_attribute_info_recs(i).asian_ind;
          ret_row.native_amer_or_alaskan_ind := student_attribute_info_recs(i).native_american_or_alaskan_ind;
          ret_row.black_or_african_ind := student_attribute_info_recs(i).black_or_african_ind;
          ret_row.pacific_islander_ind := student_attribute_info_recs(i).pacific_islander_ind;
          ret_row.white_ind := student_attribute_info_recs(i).white_ind;
          ret_row.two_or_more_ind := student_attribute_info_recs(i).two_or_more_ind;
          IF  student_attribute_info_recs(i).number_of_races = 0 and  student_attribute_info_recs(i).resident_alien_visa_count > 0 THEN
             ret_row.non_resident_ind := 'Y';
          ELSE
             ret_row.non_resident_ind := 'N';
          END IF;
          IF NVL(student_attribute_info_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND student_attribute_info_recs(i).number_of_races = 0 AND student_attribute_info_recs(i).resident_alien_visa_count = 0 THEN
             ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
          ELSE
             ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
          END IF;
          ret_row.race_ethnicity_confirm_ind := student_attribute_info_recs(i).race_ethnicity_confirm_ind;
          ret_row.minority_ind := student_attribute_info_recs(i).minority_ind;
          ret_row.ethnicity := student_attribute_info_recs(i).ethnicity;
          ret_row.deceased_ind := student_attribute_info_recs(i).deceased_ind;
          ret_row.citizenship_ind := student_attribute_info_recs(i).citizenship_ind;
          ret_row.citizenship_type := student_attribute_info_recs(i).citizenship_type;
          ret_row.visa_type := student_attribute_info_recs(i).visa_type;
          ret_row.nation_of_citizenship := student_attribute_info_recs(i).nation_of_citizenship;
          ret_row.nation_of_birth := student_attribute_info_recs(i).nation_of_birth;
          ret_row.primary_disability := student_attribute_info_recs(i).primary_disability;
          ret_row.legacy := student_attribute_info_recs(i).legacy;
          ret_row.marital_status := student_attribute_info_recs(i).marital_status;
          ret_row.religion := student_attribute_info_recs(i).religion;
          ret_row.veteran_type := student_attribute_info_recs(i).veteran_type;
          ret_row.veteran_category := student_attribute_info_recs(i).veteran_category;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.demo_user_attribute_01 := NULL;
          ret_row.demo_user_attribute_01 := ret_row.multi_source;
          ret_row.demo_user_attribute_02 := NULL;
          ret_row.demo_user_attribute_03 := NULL;
          ret_row.demo_user_attribute_04 := NULL;
          ret_row.demo_user_attribute_05 := NULL;
--     student attribute
          ret_row.attribute := student_attribute_info_recs(i).student_attribute;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.satt_user_attribute_01 := NULL;
          ret_row.satt_user_attribute_01 := ret_row.multi_source;
          ret_row.satt_user_attribute_02 := NULL;
          ret_row.satt_user_attribute_03 := NULL;
          ret_row.satt_user_attribute_04 := NULL;
          ret_row.satt_user_attribute_05 := NULL;
--     measures
          ret_row.user_measure_01 := NULL;
          ret_row.user_measure_02 := NULL;
          ret_row.user_measure_03 := NULL;
          ret_row.user_measure_04 := NULL;
          ret_row.user_measure_05 := NULL;
          ret_row.system_load_process := 'STUDENT_ATTRIBUTE';

--        fill in academic periods that fall between academic_period_start and academic_period_end
             ret_row.academic_period := student_attribute_info_recs(i).academic_period;
             ret_row.academic_period_begin_date := student_attribute_info_recs(i).start_date;
             ret_row.academic_period_end_date := student_attribute_info_recs(i).end_date;
             ret_row.academic_year := student_attribute_info_recs(i).year_code;
             --BLM mepped 6/2/14 for security reasons
             --ret_row.atim_user_attribute_01 := NULL;
             ret_row.atim_user_attribute_01 := ret_row.multi_source;
             ret_row.atim_user_attribute_02 := NULL;
             ret_row.atim_user_attribute_03 := NULL;
             ret_row.atim_user_attribute_04 := NULL;
             ret_row.atim_user_attribute_05 := NULL;
--
             PIPE ROW(ret_row);
--
          ret_row := ret_row_init;
--
       END LOOP; -- student_attribute_rec
--

   END LOOP;
--
   CLOSE student_attribute_info_cur;
--
   RETURN;
--
  END f_get_student_attribute;
/******************************************************************************/
function f_get_advisor(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_advisor_extr PIPELINED IS
--
    ret_row                     WTT_ADVISOR_INPUT%ROWTYPE;
    ret_row_init                WTT_ADVISOR_INPUT%ROWTYPE;
    acad_time_s_rec             EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_s_rec_init        EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_e_rec             EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_e_rec_init        EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
--
--
    CURSOR fill_academic_periods(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, start_period_in VARCHAR2, end_period_in VARCHAR2) IS
      SELECT Y.ACADEMIC_PERIOD,
             Y.YEAR_CODE,
             Y.START_DATE,
             Y.END_DATE
        FROM MGT_YEAR_TYPE_DEFINITION Y
       WHERE (academic_year_in = 'ALL' or Y.YEAR_CODE = academic_year_in)
         AND Y.ACADEMIC_PERIOD BETWEEN start_period_in AND end_period_in
         AND Y.YEAR_TYPE = 'ACYR'
         AND NVL(Y.MIF_VALUE, def_multi_source_in) = multi_src_in;
--
        TYPE advisor_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          ACADEMIC_PERIOD_START                   VARCHAR2(63),
          ACADEMIC_PERIOD_END                     VARCHAR2(63),
          ADVISOR_UID                             NUMBER,
          WAREHOUSE_ADVISOR_UID                   NUMBER,
          ADVISOR_TYPE                            VARCHAR2(63),
          PRIMARY_ADVISOR_IND                     NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          A_ID                                    VARCHAR2(63),
          A_FULL_NAME_LFMI                        VARCHAR2(255),
          A_BIRTH_DATE                            DATE,
          A_DECEASED_DATE                         DATE,
          A_EMAIL_ADDRESS                         VARCHAR2(255),
          A_CONFIDENTIALITY_IND                   VARCHAR2(1),
          A_GENDER                                VARCHAR2(63),
          A_ETHNICITY_CATEGORY                    VARCHAR2(63),
          A_HISPANIC_LATINO_ETHNICITY_IN          VARCHAR2(1),
          A_ETHNICITY                             VARCHAR2(63),
          A_DECEASED_IND                          VARCHAR2(1),
          A_CITIZENSHIP_IND                       VARCHAR2(1),
          A_CITIZENSHIP_TYPE                      VARCHAR2(63),
          A_NATION_OF_CITIZENSHIP                 VARCHAR2(63),
          A_NATION_OF_BIRTH                       VARCHAR2(63),
          A_PRIMARY_DISABILITY                    VARCHAR2(63),
          A_LEGACY                                VARCHAR2(63),
          A_MARITAL_STATUS                        VARCHAR2(63),
          A_RELIGION                              VARCHAR2(63),
          A_VETERAN_CATEGORY                      VARCHAR2(1),
          A_RACE_ETHNICITY_CONFIRM_IND            VARCHAR2(1),
          A_RACE_ETHNICITY_CONFIRM_DATE           DATE,
          A_PHONE_NUMBER_COMBINED                 VARCHAR2(63)
    );
    TYPE refCurType     IS REF CURSOR;
    advisor_info_cur       refCurType;
    advisor_rec        advisor_info_rec_type;
    TYPE tab_advisor_info_rec_type   IS TABLE OF advisor_info_rec_type INDEX BY PLS_INTEGER;
    advisor_info_recs        tab_advisor_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.ACADEMIC_PERIOD_START,
                 A.ACADEMIC_PERIOD_END,
                 A.ADVISOR_UID,
                 NVL(ADV.WAREHOUSE_ENTITY_UID,0)               warehouse_advisor_uid,
                 A.ADVISOR_TYPE,
                 CASE PRIMARY_ADVISOR_IND WHEN 'Y' THEN 1
                 ELSE 0
                 END                                           primary_advisor_ind,
                 PD.*,
                 AD.ID                                         A_ID,
                 AD.FULL_NAME_LFMI                             A_FULL_NAME_LFMI,
                 AD.BIRTH_DATE                                 A_BIRTH_DATE,
                 AD.DECEASED_DATE                              A_DECEASED_DATE,
                 AD.EMAIL_ADDRESS                              A_EMAIL_ADDRESS,
                 AD.CONFIDENTIALITY_IND                        A_CONFIDENTIALITY_IND,
                 AD.GENDER                                     A_GENDER,
                 AD.ETHNICITY_CATEGORY                         A_ETHNICITY_CATEGORY,
                 AD.HISPANIC_LATINO_ETHNICITY_IND              A_HISPANIC_LATINO_ETHNICITY_IN,
                 AD.ETHNICITY                                  A_ETHNICITY,
                 AD.DECEASED_IND                               A_DECEASED_IND,
                 AD.CITIZENSHIP_IND                            A_CITIZENSHIP_IND,
                 AD.CITIZENSHIP_TYPE                           A_CITIZENSHIP_TYPE,
                 AD.NATION_OF_CITIZENSHIP                      A_NATION_OF_CITIZENSHIP,
                 AD.NATION_OF_BIRTH                            A_NATION_OF_BIRTH,
                 AD.PRIMARY_DISABILITY                         A_PRIMARY_DISABILITY,
                 AD.LEGACY                                     A_LEGACY,
                 AD.MARITAL_STATUS                             A_MARITAL_STATUS,
                 AD.RELIGION                                   A_RELIGION,
                 AD.VETERAN_CATEGORY                           A_VETERAN_CATEGORY,
                 AD.RACE_ETHNICITY_CONFIRM_IND                 A_RACE_ETHNICITY_CONFIRM_IND,
                 AD.RACE_ETHNICITY_CONFIRM_DATE                A_RACE_ETHNICITY_CONFIRM_DATE,
                 AD.PHONE_NUMBER_COMBINED                      A_PHONE_NUMBER_COMBINED
            FROM WDT_WAREHOUSE_ENTITY ADV,
                 WDT_WAREHOUSE_ENTITY WE,
                 WCV_EXTR_PERSON_DETAILS PD,
                 WCV_EXTR_PERSON_DETAILS AD,
                 MST_ADVISOR A
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD BETWEEN A.ACADEMIC_PERIOD_START AND A.ACADEMIC_PERIOD_END
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND ADV.BANNER_PIDM(+) = A.ADVISOR_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and adv.user_attribute_01(+) = a.mif_value
             AND A.ADVISOR_UID =  AD.PERSON_ID(+);
                                       --JOS Update
	                  -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (AD)
             --             AND NVL(A.MIF_VALUE, def_multi_source_in) = AD.MULTI_SRC(+);
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.ACADEMIC_PERIOD_START,
                 A.ACADEMIC_PERIOD_END,
                 A.ADVISOR_UID,
                 NVL(ADV.WAREHOUSE_ENTITY_UID,0)               warehouse_advisor_uid,
                 A.ADVISOR_TYPE,
                 CASE PRIMARY_ADVISOR_IND WHEN 'Y' THEN 1
                 ELSE 0
                 END                                           primary_advisor_ind,
                 PD.*,
                 AD.ID                                         A_ID,
                 AD.FULL_NAME_LFMI                             A_FULL_NAME_LFMI,
                 AD.BIRTH_DATE                                 A_BIRTH_DATE,
                 AD.DECEASED_DATE                              A_DECEASED_DATE,
                 AD.EMAIL_ADDRESS                              A_EMAIL_ADDRESS,
                 AD.CONFIDENTIALITY_IND                        A_CONFIDENTIALITY_IND,
                 AD.GENDER                                     A_GENDER,
                 AD.ETHNICITY_CATEGORY                         A_ETHNICITY_CATEGORY,
                 AD.HISPANIC_LATINO_ETHNICITY_IND              A_HISPANIC_LATINO_ETHNICITY_IN,
                 AD.ETHNICITY                                  A_ETHNICITY,
                 AD.DECEASED_IND                               A_DECEASED_IND,
                 AD.CITIZENSHIP_IND                            A_CITIZENSHIP_IND,
                 AD.CITIZENSHIP_TYPE                           A_CITIZENSHIP_TYPE,
                 AD.NATION_OF_CITIZENSHIP                      A_NATION_OF_CITIZENSHIP,
                 AD.NATION_OF_BIRTH                            A_NATION_OF_BIRTH,
                 AD.PRIMARY_DISABILITY                         A_PRIMARY_DISABILITY,
                 AD.LEGACY                                     A_LEGACY,
                 AD.MARITAL_STATUS                             A_MARITAL_STATUS,
                 AD.RELIGION                                   A_RELIGION,
                 AD.VETERAN_CATEGORY                           A_VETERAN_CATEGORY,
                 AD.RACE_ETHNICITY_CONFIRM_IND                 A_RACE_ETHNICITY_CONFIRM_IND,
                 AD.RACE_ETHNICITY_CONFIRM_DATE                A_RACE_ETHNICITY_CONFIRM_DATE,
                 AD.PHONE_NUMBER_COMBINED                      A_PHONE_NUMBER_COMBINED
            FROM WDT_WAREHOUSE_ENTITY ADV,
                 WDT_WAREHOUSE_ENTITY WE,
                 WCV_EXTR_PERSON_DETAILS PD,
                 WCV_EXTR_PERSON_DETAILS AD,
                 MST_ADVISOR A,
                 CHG_ADVISOR CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value             
             AND A.PERSON_UID =  PD.PERSON_ID
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND ADV.BANNER_PIDM(+) = A.ADVISOR_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and adv.user_attribute_01(+) = a.mif_value             
             AND A.ADVISOR_UID =  AD.PERSON_ID(+);
                                       --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (AD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) = AD.MULTI_SRC(+);
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_ADVISOR', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_ADVISOR', 'WFT_ADVISOR', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    IF process_ind_in = 'L' THEN
        advisor_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        advisor_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
        FETCH advisor_info_cur INTO advisor_rec;
        EXIT WHEN advisor_info_cur%NOTFOUND;
--
      OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, advisor_rec.multi_source, advisor_rec.academic_period_start, 'ACYR');
      FETCH edw_general_extr.get_year_type INTO acad_time_s_rec;
      CLOSE edw_general_extr.get_year_type;
--
      OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, advisor_rec.multi_source, advisor_rec.academic_period_end, 'ACYR');
      FETCH edw_general_extr.get_year_type INTO acad_time_e_rec;
      CLOSE edw_general_extr.get_year_type;
--
--
-- multi source
      ret_row.multi_source := advisor_rec.multi_source;
      ret_row.process_group := advisor_rec.process_group;
      ret_row.administrative_group := advisor_rec.administrative_group;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.msrc_user_attribute_01 := NULL;
      ret_row.msrc_user_attribute_01 := ret_row.multi_source;
      ret_row.msrc_user_attribute_02 := NULL;
      ret_row.msrc_user_attribute_03 := NULL;
      ret_row.msrc_user_attribute_04 := NULL;
      ret_row.msrc_user_attribute_05 := NULL;
-- academic time start
      ret_row.s_academic_period := acad_time_s_rec.academic_period;
      ret_row.s_academic_period_begin_date := acad_time_s_rec.start_date;
      ret_row.s_academic_period_end_date := acad_time_s_rec.end_date;
      ret_row.s_academic_year := acad_time_s_rec.year_code;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.atims_user_attribute_01 := NULL;
      ret_row.atims_user_attribute_01 := ret_row.multi_source;
      ret_row.atims_user_attribute_02 := NULL;
      ret_row.atims_user_attribute_03 := NULL;
      ret_row.atims_user_attribute_04 := NULL;
      ret_row.atims_user_attribute_05 := NULL;
-- academic time
      ret_row.e_academic_period := acad_time_e_rec.academic_period;
      ret_row.e_academic_period_begin_date := acad_time_e_rec.start_date;
      ret_row.e_academic_period_end_date := acad_time_e_rec.end_date;
      ret_row.e_academic_year := acad_time_e_rec.year_code;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.atime_user_attribute_01 := NULL;
      ret_row.atime_user_attribute_01 := ret_row.multi_source;
      ret_row.atime_user_attribute_02 := NULL;
      ret_row.atime_user_attribute_03 := NULL;
      ret_row.atime_user_attribute_04 := NULL;
      ret_row.atime_user_attribute_05 := NULL;
-- person
      ret_row.person_uid := advisor_rec.warehouse_entity_uid;
      ret_row.id := advisor_rec.id;
      ret_row.full_name_lfmi := advisor_rec.full_name_lfmi;
      ret_row.birth_date := advisor_rec.birth_date;
      ret_row.deceased_date := advisor_rec.deceased_date;
      ret_row.email_address := advisor_rec.email_address;
      ret_row.phone_number_combined := advisor_rec.phone_number_combined;
      ret_row.confidentiality_ind := advisor_rec.confidentiality_ind;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.pers_user_attribute_01 := NULL;
      ret_row.pers_user_attribute_01 := ret_row.multi_source;
      ret_row.pers_user_attribute_02 := NULL;
      ret_row.pers_user_attribute_03 := NULL;
      ret_row.pers_user_attribute_04 := NULL;
      ret_row.pers_user_attribute_05 := NULL;
-- demographic
      ret_row.gender := advisor_rec.gender;
      ret_row.ethnicity_category := advisor_rec.ethnicity_category;
      ret_row.hispanic_latino_ethn_ind := advisor_rec.hispanic_latino_ethnicity_ind;
      ret_row.asian_ind := advisor_rec.asian_ind;
      ret_row.native_amer_or_alaskan_ind := advisor_rec.native_american_or_alaskan_ind;
      ret_row.black_or_african_ind := advisor_rec.black_or_african_ind;
      ret_row.pacific_islander_ind := advisor_rec.pacific_islander_ind;
      ret_row.white_ind := advisor_rec.white_ind;
      ret_row.two_or_more_ind := advisor_rec.two_or_more_ind;
      IF advisor_rec.number_of_races = 0 and advisor_rec.resident_alien_visa_count > 0 THEN
         ret_row.non_resident_ind := 'Y';
      ELSE
         ret_row.non_resident_ind := 'N';
      END IF;
      IF NVL(advisor_rec.hispanic_latino_ethnicity_ind,'N') = 'N' AND
         advisor_rec.number_of_races = 0 AND
         advisor_rec.resident_alien_visa_count = 0 THEN
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
      ELSE
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
      END IF;
      ret_row.race_ethnicity_confirm_ind := advisor_rec.race_ethnicity_confirm_ind;
      ret_row.minority_ind := advisor_rec.minority_ind;
      ret_row.ethnicity := advisor_rec.ethnicity;
      ret_row.deceased_ind := advisor_rec.deceased_ind;
      ret_row.citizenship_ind := advisor_rec.citizenship_ind;
      ret_row.citizenship_type := advisor_rec.citizenship_type;
      ret_row.visa_type := advisor_rec.visa_type;
      ret_row.nation_of_citizenship := advisor_rec.nation_of_citizenship;
      ret_row.nation_of_birth := advisor_rec.nation_of_birth;
      ret_row.primary_disability := advisor_rec.primary_disability;
      ret_row.legacy := advisor_rec.legacy;
      ret_row.marital_status := advisor_rec.marital_status;
      ret_row.religion := advisor_rec.religion;
      ret_row.veteran_type := advisor_rec.veteran_type;
      ret_row.veteran_category := advisor_rec.veteran_category;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.demo_user_attribute_01 := NULL;
      ret_row.demo_user_attribute_01 := ret_row.multi_source;
      ret_row.demo_user_attribute_02 := NULL;
      ret_row.demo_user_attribute_03 := NULL;
      ret_row.demo_user_attribute_04 := NULL;
      ret_row.demo_user_attribute_05 := NULL;
-- advisor uid
      ret_row.a_person_uid := advisor_rec.warehouse_advisor_uid;
      ret_row.a_id := advisor_rec.a_id;
      ret_row.a_full_name_lfmi := advisor_rec.a_full_name_lfmi;
      ret_row.a_birth_date := advisor_rec.a_birth_date;
      ret_row.a_deceased_date := advisor_rec.a_deceased_date;
      ret_row.a_email_address := advisor_rec.a_email_address;
      ret_row.a_phone_number_combined := advisor_rec.a_phone_number_combined;
      ret_row.a_confidentiality_ind := advisor_rec.a_confidentiality_ind;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.advs_user_attribute_01 := NULL;
      ret_row.advs_user_attribute_01 := ret_row.multi_source;
      ret_row.advs_user_attribute_02 := NULL;
      ret_row.advs_user_attribute_03 := NULL;
      ret_row.advs_user_attribute_04 := NULL;
      ret_row.advs_user_attribute_05 := NULL;
-- advisor
      ret_row.advisor_type := advisor_rec.advisor_type;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.adsr_user_attribute_01 := NULL;
      ret_row.adsr_user_attribute_01 := ret_row.multi_source;
      ret_row.adsr_user_attribute_02 := NULL;
      ret_row.adsr_user_attribute_03 := NULL;
      ret_row.adsr_user_attribute_04 := NULL;
      ret_row.adsr_user_attribute_05 := NULL;
-- measures
      ret_row.primary_advisor_ind := advisor_rec.primary_advisor_ind;
      ret_row.user_measure_01 := NULL;
      ret_row.user_measure_02 := NULL;
      ret_row.user_measure_03 := NULL;
      ret_row.user_measure_04 := NULL;
      ret_row.user_measure_05 := NULL;
      ret_row.system_load_process := 'ADVISOR';

--    fill in academic periods that fall between academic_period_start and academic_period_end
      FOR term_rec IN fill_academic_periods(default_rec.multi_source_cleanse_value,
                                            advisor_rec.multi_source,
                                            advisor_rec.academic_period_start,
                                            advisor_rec.academic_period_end) LOOP
      -- academic time
         ret_row.academic_period := term_rec.academic_period;
         ret_row.academic_period_begin_date := term_rec.start_date;
         ret_row.academic_period_end_date := term_rec.end_date;
         ret_row.academic_year := term_rec.year_code;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.atim_user_attribute_01 := NULL;
         ret_row.atim_user_attribute_01 := ret_row.multi_source;
         ret_row.atim_user_attribute_02 := NULL;
         ret_row.atim_user_attribute_03 := NULL;
         ret_row.atim_user_attribute_04 := NULL;
         ret_row.atim_user_attribute_05 := NULL;
--
         PIPE ROW(ret_row);
--
      END LOOP; -- term_rec
--
      ret_row := ret_row_init;
      acad_time_s_rec := acad_time_s_rec_init;
      acad_time_e_rec := acad_time_e_rec_init;
--
    END LOOP; -- advisor_rec
--
    RETURN;

  END f_get_advisor;
/******************************************************************************/
function f_get_student_cohort(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_student_cohort_extr PIPELINED IS
--
    ret_row                     WTT_STUDENT_COHORT_INPUT%ROWTYPE;
    ret_row_init                WTT_STUDENT_COHORT_INPUT%ROWTYPE;
    acad_time_s_rec             EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_s_rec_init        EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_e_rec             EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_e_rec_init        EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_cs_rec            EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_cs_rec_init       EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_ce_rec            EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_ce_rec_init       EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
--
--
    CURSOR fill_academic_periods(def_multi_source_in VARCHAR2, multi_source_in VARCHAR2, start_period_in VARCHAR2, end_period_in VARCHAR2, chrt_end_period_in VARCHAR2, entity_uid_in NUMBER) IS
      SELECT Y.ACADEMIC_PERIOD,
             Y.YEAR_CODE,
             Y.START_DATE,
             Y.END_DATE,
             CASE
                WHEN chrt_end_period_in IS NULL
                THEN 'No Data'
                WHEN Y.ACADEMIC_PERIOD < chrt_end_period_in
                THEN 'NE'
                WHEN Y.ACADEMIC_PERIOD = chrt_end_period_in
                THEN 'EX'
                WHEN Y.ACADEMIC_PERIOD > chrt_end_period_in
                THEN 'PE'
                ELSE 'No Data'
             END                                           cohort_graduation_status,
             CASE
                WHEN Y.ACADEMIC_PERIOD = chrt_end_period_in
                THEN entity_uid_in
                ELSE NULL
             END                                           cohort_expected_graduation_hc
        FROM MGT_YEAR_TYPE_DEFINITION Y
       WHERE (academic_year_in = 'ALL' or Y.YEAR_CODE = academic_year_in)
         AND Y.ACADEMIC_PERIOD BETWEEN start_period_in AND end_period_in
         AND Y.YEAR_TYPE = 'ACYR'
         AND NVL(Y.MIF_VALUE, def_multi_source_in) = multi_source_in;
--
        TYPE student_cohort_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          ACADEMIC_PERIOD_START                   VARCHAR2(63),
          ACADEMIC_PERIOD_END                     VARCHAR2(63),
          COHORT                                  VARCHAR2(63),
          FTE_COHORT_REPORT_IND                   VARCHAR2(1),
          COHORT_INACTIVE_REASON                  VARCHAR2(63),
          COHORT_ACADEMIC_PERIOD_START            VARCHAR2(63),
          COHORT_ACADEMIC_PERIOD_END              VARCHAR2(63),
          COHORT_ACTIVE_IND                       VARCHAR2(1),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    student_cohort_info_cur       refCurType;
    student_cohort_rec        student_cohort_info_rec_type;
    TYPE tab_s_cohort_info_rec_type   IS TABLE OF student_cohort_info_rec_type INDEX BY PLS_INTEGER;
    student_cohort_info_recs        tab_s_cohort_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.ACADEMIC_PERIOD_START,
                 A.ACADEMIC_PERIOD_END,
                 A.COHORT,
                 A.FTE_COHORT_REPORT_IND,
                 A.COHORT_INACTIVE_REASON,
                 A.COHORT_START_ACADEMIC_PERIOD                cohort_academic_period_start,
                 A.COHORT_END_ACADEMIC_PERIOD                  cohort_academic_period_end,
                 A.COHORT_ACTIVE_IND,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MST_STUDENT_COHORT A
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                 FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                WHERE YTD.ACADEMIC_PERIOD BETWEEN A.ACADEMIC_PERIOD_START AND A.ACADEMIC_PERIOD_END
                                                  AND YTD.YEAR_TYPE = 'ACYR'
                                                  AND YTD.YEAR_CODE = academic_year_in
                                                  AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID = PD.PERSON_ID;
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)         multi_source,
                 A.ZONE_VALUE                                  process_group,
                 A.DOMAIN_VALUE                                administrative_group,
                 A.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                warehouse_entity_uid,
                 A.ACADEMIC_PERIOD_START,
                 A.ACADEMIC_PERIOD_END,
                 A.COHORT,
                 A.FTE_COHORT_REPORT_IND,
                 A.COHORT_INACTIVE_REASON,
                 A.COHORT_START_ACADEMIC_PERIOD                cohort_academic_period_start,
                 A.COHORT_END_ACADEMIC_PERIOD                  cohort_academic_period_end,
                 A.COHORT_ACTIVE_IND,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MST_STUDENT_COHORT A,
                 CHG_STUDENT_COHORT CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID = PD.PERSON_ID;
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--             AND NVL(A.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_STUDENT_COHORT', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_STUDENT_COHORT', 'WFT_STUDENT_COHORT', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    IF process_ind_in = 'L' THEN
        student_cohort_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        student_cohort_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
        FETCH student_cohort_info_cur INTO student_cohort_rec;
        EXIT WHEN student_cohort_info_cur%NOTFOUND;
--
      OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, student_cohort_rec.multi_source, student_cohort_rec.academic_period_start, 'ACYR');
      FETCH edw_general_extr.get_year_type INTO acad_time_s_rec;
      CLOSE edw_general_extr.get_year_type;
--
      OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, student_cohort_rec.multi_source, student_cohort_rec.academic_period_end, 'ACYR');
      FETCH edw_general_extr.get_year_type INTO acad_time_e_rec;
      CLOSE edw_general_extr.get_year_type;
--
      IF student_cohort_rec.cohort_academic_period_start IS NOT NULL THEN
         OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, student_cohort_rec.multi_source, student_cohort_rec.cohort_academic_period_start, 'ACYR');
         FETCH edw_general_extr.get_year_type INTO acad_time_cs_rec;
         CLOSE edw_general_extr.get_year_type;
      END IF;
--
      IF student_cohort_rec.cohort_academic_period_end IS NOT NULL THEN
         OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, student_cohort_rec.multi_source, student_cohort_rec.cohort_academic_period_end, 'ACYR');
         FETCH edw_general_extr.get_year_type INTO acad_time_ce_rec;
         CLOSE edw_general_extr.get_year_type;
      END IF;
-- multi source
      ret_row.multi_source := student_cohort_rec.multi_source;
      ret_row.process_group := student_cohort_rec.process_group;
      ret_row.administrative_group := student_cohort_rec.administrative_group;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.msrc_user_attribute_01 := NULL;
      ret_row.msrc_user_attribute_01 := ret_row.multi_source;
      ret_row.msrc_user_attribute_02 := NULL;
      ret_row.msrc_user_attribute_03 := NULL;
      ret_row.msrc_user_attribute_04 := NULL;
      ret_row.msrc_user_attribute_05 := NULL;
-- academic time start
      ret_row.s_academic_period := acad_time_s_rec.academic_period;
      ret_row.s_academic_period_begin_date := acad_time_s_rec.start_date;
      ret_row.s_academic_period_end_date := acad_time_s_rec.end_date;
      ret_row.s_academic_year := acad_time_s_rec.year_code;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.atms_user_attribute_01 := NULL;
      ret_row.atms_user_attribute_01 := ret_row.multi_source;
      ret_row.atms_user_attribute_02 := NULL;
      ret_row.atms_user_attribute_03 := NULL;
      ret_row.atms_user_attribute_04 := NULL;
      ret_row.atms_user_attribute_05 := NULL;
-- academic time end
      ret_row.e_academic_period := acad_time_e_rec.academic_period;
      ret_row.e_academic_period_begin_date := acad_time_e_rec.start_date;
      ret_row.e_academic_period_end_date := acad_time_e_rec.end_date;
      ret_row.e_academic_year := acad_time_e_rec.year_code;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.atme_user_attribute_01 := NULL;
      ret_row.atme_user_attribute_01 := ret_row.multi_source;
      ret_row.atme_user_attribute_02 := NULL;
      ret_row.atme_user_attribute_03 := NULL;
      ret_row.atme_user_attribute_04 := NULL;
      ret_row.atme_user_attribute_05 := NULL;
-- person
      ret_row.person_uid := student_cohort_rec.warehouse_entity_uid;
      ret_row.id := student_cohort_rec.id;
      ret_row.full_name_lfmi := student_cohort_rec.full_name_lfmi;
      ret_row.birth_date := student_cohort_rec.birth_date;
      ret_row.deceased_date := student_cohort_rec.deceased_date;
      ret_row.email_address := student_cohort_rec.email_address;
      ret_row.phone_number_combined := student_cohort_rec.phone_number_combined;
      ret_row.confidentiality_ind := student_cohort_rec.confidentiality_ind;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.pers_user_attribute_01 := NULL;
      ret_row.pers_user_attribute_01 := ret_row.multi_source;
      ret_row.pers_user_attribute_02 := NULL;
      ret_row.pers_user_attribute_03 := NULL;
      ret_row.pers_user_attribute_04 := NULL;
      ret_row.pers_user_attribute_05 := NULL;
-- demographic
      ret_row.gender := student_cohort_rec.gender;
      ret_row.ethnicity_category := student_cohort_rec.ethnicity_category;
      ret_row.hispanic_latino_ethn_ind := student_cohort_rec.hispanic_latino_ethnicity_ind;
      ret_row.asian_ind := student_cohort_rec.asian_ind;
      ret_row.native_amer_or_alaskan_ind := student_cohort_rec.native_american_or_alaskan_ind;
      ret_row.black_or_african_ind := student_cohort_rec.black_or_african_ind;
      ret_row.pacific_islander_ind := student_cohort_rec.pacific_islander_ind;
      ret_row.white_ind := student_cohort_rec.white_ind;
      ret_row.two_or_more_ind := student_cohort_rec.two_or_more_ind;
      IF student_cohort_rec.number_of_races = 0 and student_cohort_rec.resident_alien_visa_count > 0 THEN
         ret_row.non_resident_ind := 'Y';
      ELSE
         ret_row.non_resident_ind := 'N';
      END IF;
      IF NVL(student_cohort_rec.hispanic_latino_ethnicity_ind,'N') = 'N' AND
         student_cohort_rec.number_of_races = 0 AND
         student_cohort_rec.resident_alien_visa_count = 0 THEN
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
      ELSE
         ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
      END IF;
      ret_row.race_ethnicity_confirm_ind := student_cohort_rec.race_ethnicity_confirm_ind;
      ret_row.minority_ind := student_cohort_rec.minority_ind;
      ret_row.ethnicity := student_cohort_rec.ethnicity;
      ret_row.deceased_ind := student_cohort_rec.deceased_ind;
      ret_row.citizenship_ind := student_cohort_rec.citizenship_ind;
      ret_row.citizenship_type := student_cohort_rec.citizenship_type;
      ret_row.visa_type := student_cohort_rec.visa_type;
      ret_row.nation_of_citizenship := student_cohort_rec.nation_of_citizenship;
      ret_row.nation_of_birth := student_cohort_rec.nation_of_birth;
      ret_row.primary_disability := student_cohort_rec.primary_disability;
      ret_row.legacy := student_cohort_rec.legacy;
      ret_row.marital_status := student_cohort_rec.marital_status;
      ret_row.religion := student_cohort_rec.religion;
      ret_row.veteran_type := student_cohort_rec.veteran_type;
      ret_row.veteran_category := student_cohort_rec.veteran_category;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.demo_user_attribute_01 := NULL;
      ret_row.demo_user_attribute_01 := ret_row.multi_source;
      ret_row.demo_user_attribute_02 := NULL;
      ret_row.demo_user_attribute_03 := NULL;
      ret_row.demo_user_attribute_04 := NULL;
      ret_row.demo_user_attribute_05 := NULL;
-- cohort
      ret_row.cohort := student_cohort_rec.cohort;
      ret_row.cohort_report_ind := student_cohort_rec.fte_cohort_report_ind;
      ret_row.cohort_inactive_reason := student_cohort_rec.cohort_inactive_reason;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.chrt_user_attribute_01 := NULL;
      ret_row.chrt_user_attribute_01 := ret_row.multi_source;
      ret_row.chrt_user_attribute_02 := NULL;
      ret_row.chrt_user_attribute_03 := NULL;
      ret_row.chrt_user_attribute_04 := NULL;
      ret_row.chrt_user_attribute_05 := NULL;
-- cohort academic time start
      ret_row.cs_academic_period := acad_time_cs_rec.academic_period;
      ret_row.cs_academic_period_begin_date := acad_time_cs_rec.start_date;
      ret_row.cs_academic_period_end_date := acad_time_cs_rec.end_date;
      ret_row.cs_academic_year := acad_time_cs_rec.year_code;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.cats_user_attribute_01 := NULL;
      ret_row.cats_user_attribute_01 := ret_row.multi_source;
      ret_row.cats_user_attribute_02 := NULL;
      ret_row.cats_user_attribute_03 := NULL;
      ret_row.cats_user_attribute_04 := NULL;
      ret_row.cats_user_attribute_05 := NULL;
-- cohort academic time end
      ret_row.ce_academic_period := acad_time_ce_rec.academic_period;
      ret_row.ce_academic_period_begin_date := acad_time_ce_rec.start_date;
      ret_row.ce_academic_period_end_date := acad_time_ce_rec.end_date;
      ret_row.ce_academic_year := acad_time_ce_rec.year_code;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.cate_user_attribute_01 := NULL;
      ret_row.cate_user_attribute_01 := ret_row.multi_source;
      ret_row.cate_user_attribute_02 := NULL;
      ret_row.cate_user_attribute_03 := NULL;
      ret_row.cate_user_attribute_04 := NULL;
      ret_row.cate_user_attribute_05 := NULL;
--
      FOR term_rec in fill_academic_periods(default_rec.multi_source_cleanse_value,
                                            student_cohort_rec.multi_source,
                                            student_cohort_rec.academic_period_start,
                                            student_cohort_rec.academic_period_end,
                                            student_cohort_rec.cohort_academic_period_end,
                                            student_cohort_rec.warehouse_entity_uid) LOOP

--    academic time
         ret_row.academic_period := term_rec.academic_period;
         ret_row.academic_period_begin_date := term_rec.start_date;
         ret_row.academic_period_end_date := term_rec.end_date;
         ret_row.academic_year := term_rec.year_code;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.atim_user_attribute_01 := NULL;
         ret_row.atim_user_attribute_01 := ret_row.multi_source;
         ret_row.atim_user_attribute_02 := NULL;
         ret_row.atim_user_attribute_03 := NULL;
         ret_row.atim_user_attribute_04 := NULL;
         ret_row.atim_user_attribute_05 := NULL;
--    measures
         CASE WHEN student_cohort_rec.cohort_active_ind = 'Y' THEN
            ret_row.student_cohort_active_ind := 1;
         ELSE
            ret_row.student_cohort_active_ind := 0;
         END CASE;
         ret_row.cohort_graduation_status := term_rec.cohort_graduation_status;
         ret_row.cohort_expected_graduation_hc := term_rec.cohort_expected_graduation_hc;
         ret_row.user_measure_01 := NULL;
         ret_row.user_measure_02 := NULL;
         ret_row.user_measure_03 := NULL;
         ret_row.user_measure_04 := NULL;
         ret_row.user_measure_05 := NULL;
         ret_row.system_load_process := 'STUDENT_COHORT';
--
         PIPE ROW(ret_row);
--
      END LOOP; -- term_rec
--
      ret_row := ret_row_init;
      acad_time_s_rec := acad_time_s_rec_init;
      acad_time_e_rec := acad_time_e_rec_init;
      acad_time_cs_rec := acad_time_s_rec_init;
      acad_time_ce_rec := acad_time_e_rec_init;
--
    END LOOP; -- student_cohort_rec
--
    RETURN;

  END f_get_student_cohort;
/******************************************************************************/
function f_get_meeting_time(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_meeting_time_extr PIPELINED IS
--
    ret_row                     WTT_MEETING_TIME_INPUT%ROWTYPE;
    ret_row_init                WTT_MEETING_TIME_INPUT%ROWTYPE;
    acad_time_rec               EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_rec_init          EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    course_off_rec              EDW_STUDENT_EXTR.GET_COURSE_OFFERING%ROWTYPE;
    course_off_rec_init         EDW_STUDENT_EXTR.GET_COURSE_OFFERING%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    course_catalog_rec          EDW_STUDENT_EXTR.GET_COURSE_CATALOG%ROWTYPE;
    course_catalog_rec_init     EDW_STUDENT_EXTR.GET_COURSE_CATALOG%ROWTYPE;
    course_suppl_rec            EDW_STUDENT_EXTR.GET_COURSE_SUPPL%ROWTYPE;
    course_suppl_rec_init       EDW_STUDENT_EXTR.GET_COURSE_SUPPL%ROWTYPE;
--
--
        TYPE meeting_time_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          ACADEMIC_PERIOD_DESC                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_YEAR_DESC                      VARCHAR2(255),
          SUB_ACADEMIC_PERIOD                     VARCHAR2(63),
          SUB_ACADEMIC_PERIOD_DESC                VARCHAR2(255),
          COURSE_IDENTIFICATION                   VARCHAR2(500),
          COURSE_TITLE_SHORT                      VARCHAR2(500),
          COURSE_TITLE_LONG                       VARCHAR2(500),
          COURSE_NUMBER                           VARCHAR2(500),
          SUBJECT                                 VARCHAR2(63),
          SCHEDULE                                VARCHAR2(63),
          MEETING_TYPE                            VARCHAR2(63),
          BUILDING                                VARCHAR2(63),
          ROOM                                    VARCHAR2(10),
          BUILDING_SITE                           VARCHAR2(63),
          MEETING_TIME_CATEGORY                   VARCHAR2(2),
          BEGIN_TIME                              VARCHAR2(500),
          BEGIN_TIME_RANGE                        VARCHAR2(4),
          END_TIME                                VARCHAR2(500),
          MONDAY_IND                              VARCHAR2(1),
          TUESDAY_IND                             VARCHAR2(1),
          WEDNESDAY_IND                           VARCHAR2(1),
          THURSDAY_IND                            VARCHAR2(1),
          FRIDAY_IND                              VARCHAR2(1),
          SATURDAY_IND                            VARCHAR2(1),
          SUNDAY_IND                              VARCHAR2(1),
          COURSE_REFERENCE_NUMBER                 VARCHAR2(5),
          START_DATE                              DATE,
          END_DATE                                DATE
    );
    TYPE refCurType     IS REF CURSOR;
    meeting_time_info_cur       refCurType;
    meeting_rec        meeting_time_info_rec_type;
    TYPE tab_meeting_time_info_rec_type   IS TABLE OF meeting_time_info_rec_type INDEX BY PLS_INTEGER;
    meeting_time_info_recs        tab_meeting_time_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)                                   multi_source,
                 A.ZONE_VALUE                                                            process_group,
                 A.DOMAIN_VALUE                                                          administrative_group,
                 A.ACADEMIC_PERIOD                                                       academic_period,
                 A.ACADEMIC_PERIOD_DESC                                                  academic_period_desc,
                 A.ACADEMIC_YEAR                                                         academic_year,
                 A.ACADEMIC_YEAR_DESC                                                    academic_year_desc,
                 A.SUB_ACADEMIC_PERIOD                                                   sub_academic_period,
                 A.SUB_ACADEMIC_PERIOD_DESC                                              sub_academic_period_desc,
                 NVL(A.COURSE_IDENTIFICATION, default_rec.null_cleanse_value)            course_identification,
                 NVL(A.TITLE_SHORT_DESC, default_rec.null_cleanse_value)                 course_title_short,
                 NVL(NVL(A.TITLE_LONG_DESC, A.TITLE_SHORT_DESC), default_rec.null_cleanse_value) course_title_long,
                 NVL(A.COURSE_NUMBER, default_rec.null_cleanse_value)                    course_number,
                 A.SUBJECT                                                               subject,
                 A.SCHEDULE                                                              schedule,
                 A.MEETING_TYPE                                                          meeting_type,
                 A.BUILDING                                                              building,
                 A.ROOM                                                                  room,
                 A.BUILDING_SITE                                                         building_site,
                 A.CATEGORY                                                              meeting_time_category,
                 NVL(A.BEGIN_TIME, default_rec.null_cleanse_value)                       begin_time,
                 A.BEGIN_TIME                                                            begin_time_range,
                 NVL(A.END_TIME, default_rec.null_cleanse_value)                         end_time,
                 A.MONDAY_IND                                                            monday_ind,
                 A.TUESDAY_IND                                                           tuesday_ind,
                 A.WEDNESDAY_IND                                                         wednesday_ind,
                 A.THURSDAY_IND                                                          thursday_ind,
                 A.FRIDAY_IND                                                            friday_ind,
                 A.SATURDAY_IND                                                          saturday_ind,
                 A.SUNDAY_IND                                                            sunday_ind,
                 A.COURSE_REFERENCE_NUMBER                                               course_reference_number,
                 A.START_DATE                                                            start_date,
                 A.END_DATE                                                              end_date
            FROM MST_MEETING_TIME A
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                                                      FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                                                     WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                                                        AND YTD.YEAR_TYPE = 'ACYR'
                                                                                        AND YTD.YEAR_CODE = academic_year_in
                                                                                        AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.COURSE_REFERENCE_NUMBER LIKE debug_var_in);
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)                                   multi_source,
                 A.ZONE_VALUE                                                            process_group,
                 A.DOMAIN_VALUE                                                          administrative_group,
                 A.ACADEMIC_PERIOD                                                       academic_period,
                 A.ACADEMIC_PERIOD_DESC                                                  academic_period_desc,
                 A.ACADEMIC_YEAR                                                         academic_year,
                 A.ACADEMIC_YEAR_DESC                                                    academic_year_desc,
                 A.SUB_ACADEMIC_PERIOD                                                   sub_academic_period,
                 A.SUB_ACADEMIC_PERIOD_DESC                                              sub_academic_period_desc,
                 NVL(A.COURSE_IDENTIFICATION, default_rec.null_cleanse_value)            course_identification,
                 NVL(A.TITLE_SHORT_DESC, default_rec.null_cleanse_value)                 course_title_short,
                 NVL(NVL(A.TITLE_LONG_DESC, A.TITLE_SHORT_DESC), default_rec.null_cleanse_value) course_title_long,
                 NVL(A.COURSE_NUMBER, default_rec.null_cleanse_value)                    course_number,
                 A.SUBJECT                                                               subject,
                 A.SCHEDULE                                                              schedule,
                 A.MEETING_TYPE                                                          meeting_type,
                 A.BUILDING                                                              building,
                 A.ROOM                                                                  room,
                 A.BUILDING_SITE                                                         building_site,
                 A.CATEGORY                                                              meeting_time_category,
                 NVL(A.BEGIN_TIME, default_rec.null_cleanse_value)                       begin_time,
                 A.BEGIN_TIME                                                            begin_time_range,
                 NVL(A.END_TIME, default_rec.null_cleanse_value)                         end_time,
                 A.MONDAY_IND                                                            monday_ind,
                 A.TUESDAY_IND                                                           tuesday_ind,
                 A.WEDNESDAY_IND                                                         wednesday_ind,
                 A.THURSDAY_IND                                                          thursday_ind,
                 A.FRIDAY_IND                                                            friday_ind,
                 A.SATURDAY_IND                                                          saturday_ind,
                 A.SUNDAY_IND                                                            sunday_ind,
                 A.COURSE_REFERENCE_NUMBER                                               course_reference_number,
                 A.START_DATE                                                            start_date,
                 A.END_DATE                                                              end_date
            FROM MST_MEETING_TIME A,
                 CHG_MEETING_TIME CHG
           WHERE CHG.COURSE_REFERENCE_NUMBER = A.COURSE_REFERENCE_NUMBER
             AND (debug_var_in IS NULL OR A.COURSE_REFERENCE_NUMBER LIKE debug_var_in);
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_MEETING_TIME', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_MEETING_TIME', 'WFT_MEETING_TIME', 'COURSE_REFERENCE_NUMBER', 'WDT_COURSE_REFERENCE_NUMBER', NULL);
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    IF process_ind_in = 'L' THEN
        meeting_time_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        meeting_time_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
        FETCH meeting_time_info_cur INTO meeting_rec;
        EXIT WHEN meeting_time_info_cur%NOTFOUND;
--
      OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, meeting_rec.multi_source, meeting_rec.academic_period, 'ACYR');
      FETCH edw_general_extr.get_year_type INTO acad_time_rec;
      CLOSE edw_general_extr.get_year_type;
--
      OPEN get_course_offering(default_rec.multi_source_cleanse_value, meeting_rec.multi_source, meeting_rec.course_reference_number, meeting_rec.academic_period);
      FETCH get_course_offering INTO course_off_rec;
      CLOSE get_course_offering;
--
      OPEN get_course_catalog(default_rec.multi_source_cleanse_value,meeting_rec.multi_source,meeting_rec.subject,meeting_rec.course_number,meeting_rec.academic_period);
      FETCH get_course_catalog INTO course_catalog_rec;
      CLOSE get_course_catalog;
--
      OPEN get_course_suppl(default_rec.multi_source_cleanse_value,meeting_rec.multi_source,meeting_rec.subject,meeting_rec.course_number,meeting_rec.academic_period);
      FETCH get_course_suppl INTO course_suppl_rec;
      CLOSE get_course_suppl;
--
-- multi source
      ret_row.multi_source := meeting_rec.multi_source;
      ret_row.process_group := meeting_rec.process_group;
      ret_row.administrative_group := meeting_rec.administrative_group;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.msrc_user_attribute_01 := NULL;
      ret_row.msrc_user_attribute_01 := ret_row.multi_source;
      ret_row.msrc_user_attribute_02 := NULL;
      ret_row.msrc_user_attribute_03 := NULL;
      ret_row.msrc_user_attribute_04 := NULL;
      ret_row.msrc_user_attribute_05 := NULL;
-- academic time
      ret_row.academic_period := acad_time_rec.academic_period;
      ret_row.academic_period_begin_date := acad_time_rec.start_date;
      ret_row.academic_period_end_date := acad_time_rec.end_date;
      ret_row.academic_year := acad_time_rec.year_code;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.atim_user_attribute_01 := NULL;
      ret_row.atim_user_attribute_01 := ret_row.multi_source;
      ret_row.atim_user_attribute_02 := NULL;
      ret_row.atim_user_attribute_03 := NULL;
      ret_row.atim_user_attribute_04 := NULL;
      ret_row.atim_user_attribute_05 := NULL;
-- Sub Academic Period
      ret_row.sub_academic_period := meeting_rec.sub_academic_period;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.sapd_user_attribute_01 := NULL;
      ret_row.sapd_user_attribute_01 := ret_row.multi_source;
      ret_row.sapd_user_attribute_02 := NULL;
      ret_row.sapd_user_attribute_03 := NULL;
      ret_row.sapd_user_attribute_04 := NULL;
      ret_row.sapd_user_attribute_05 := NULL;
-- Course
      ret_row.course_identification := meeting_rec.course_identification;
      ret_row.course_title_short := meeting_rec.course_title_short;
      ret_row.course_title_long := meeting_rec.course_title_long;
      ret_row.course_number := meeting_rec.course_number;
      ret_row.program_classification := course_catalog_rec.program_classification;
      ret_row.subject := meeting_rec.subject;
      ret_row.course_level := NULL;  -- leave NULL since meeting time does not include student course data
      ret_row.course_campus := course_off_rec.campus;
      ret_row.course_college := course_off_rec.college;
      ret_row.course_division := course_off_rec.division;
      ret_row.course_department := course_off_rec.department;
      ret_row.session_type := course_off_rec.student_meeting_time;
      CASE
      WHEN course_catalog_rec.continuing_education_ind = 'Y' THEN ret_row.continuing_education_ind := 1;
      ELSE ret_row.continuing_education_ind := 0;
      END CASE;
      CASE
      WHEN course_suppl_rec.cooperative_education_ind = 'Y' THEN ret_row.cooperative_education_ind := 1;
      ELSE ret_row.cooperative_education_ind := 0;
      END CASE;
      ret_row.schedule := meeting_rec.schedule;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.crse_user_attribute_01 := NULL;
      ret_row.crse_user_attribute_01 := ret_row.multi_source;
      ret_row.crse_user_attribute_02 := NULL;
      ret_row.crse_user_attribute_03 := NULL;
      ret_row.crse_user_attribute_04 := NULL;
      ret_row.crse_user_attribute_05 := NULL;
-- Meeting
      ret_row.meeting_type := meeting_rec.meeting_type;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.mtng_user_attribute_01 := NULL;
      ret_row.mtng_user_attribute_01 := ret_row.multi_source;
      ret_row.mtng_user_attribute_02 := NULL;
      ret_row.mtng_user_attribute_03 := NULL;
      ret_row.mtng_user_attribute_04 := NULL;
      ret_row.mtng_user_attribute_05 := NULL;
-- Meeting Location
      ret_row.building := meeting_rec.building;
      ret_row.room := meeting_rec.room;
      ret_row.building_site := meeting_rec.building_site;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.mtln_user_attribute_01 := NULL;
      ret_row.mtln_user_attribute_01 := ret_row.multi_source;
      ret_row.mtln_user_attribute_02 := NULL;
      ret_row.mtln_user_attribute_03 := NULL;
      ret_row.mtln_user_attribute_04 := NULL;
      ret_row.mtln_user_attribute_05 := NULL;
-- Meeting time
      ret_row.meeting_time_category := meeting_rec.meeting_time_category;
      ret_row.begin_time := meeting_rec.begin_time;
      ret_row.begin_time_range := nvl(meeting_rec.begin_time_range,-1);
      ret_row.end_time := meeting_rec.end_time;
      CASE
      WHEN meeting_rec.monday_ind IS NOT NULL THEN ret_row.monday_ind := 1;
      ELSE ret_row.monday_ind := 0;
      END CASE;
      CASE
      WHEN meeting_rec.tuesday_ind IS NOT NULL THEN ret_row.tuesday_ind := 1;
      ELSE ret_row.tuesday_ind := 0;
      END CASE;
      CASE
      WHEN meeting_rec.wednesday_ind IS NOT NULL THEN ret_row.wednesday_ind := 1;
      ELSE ret_row.wednesday_ind := 0;
      END CASE;
      CASE
      WHEN meeting_rec.thursday_ind IS NOT NULL THEN ret_row.thursday_ind := 1;
      ELSE ret_row.thursday_ind := 0;
      END CASE;
      CASE
      WHEN meeting_rec.friday_ind IS NOT NULL THEN ret_row.friday_ind := 1;
      ELSE ret_row.friday_ind := 0;
      END CASE;
      CASE
      WHEN meeting_rec.saturday_ind IS NOT NULL THEN ret_row.saturday_ind := 1;
      ELSE ret_row.saturday_ind := 0;
      END CASE;
      CASE
      WHEN meeting_rec.sunday_ind IS NOT NULL THEN ret_row.sunday_ind := 1;
      ELSE ret_row.sunday_ind := 0;
      END CASE;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.mtim_user_attribute_01 := NULL;
      ret_row.mtim_user_attribute_01 := ret_row.multi_source;
      ret_row.mtim_user_attribute_02 := NULL;
      ret_row.mtim_user_attribute_03 := NULL;
      ret_row.mtim_user_attribute_04 := NULL;
      ret_row.mtim_user_attribute_05 := NULL;
-- Course Reference Number
      ret_row.course_reference_number := meeting_rec.course_reference_number;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.crnb_user_attribute_01 := NULL;
      ret_row.crnb_user_attribute_01 := ret_row.multi_source;
      ret_row.crnb_user_attribute_02 := NULL;
      ret_row.crnb_user_attribute_03 := NULL;
      ret_row.crnb_user_attribute_04 := NULL;
      ret_row.crnb_user_attribute_05 := NULL;
-- measures
      ret_row.start_date := TRUNC(NVL(meeting_rec.start_date,'31-DEC-2099'));
      ret_row.end_date := TRUNC(NVL(meeting_rec.end_date,'31-DEC-2099'));
      ret_row.user_measure_01 := NULL;
      ret_row.user_measure_02 := NULL;
      ret_row.user_measure_03 := NULL;
      ret_row.user_measure_04 := NULL;
      ret_row.user_measure_05 := NULL;
      ret_row.system_load_process := 'MEETING_TIME';
--
      PIPE ROW(ret_row);
--
      ret_row := ret_row_init;
      acad_time_rec := acad_time_rec_init;
      course_off_rec := course_off_rec_init;
      course_catalog_rec := course_catalog_rec_init;
--
    END LOOP; -- meeting_rec
--
    RETURN;
--
  END f_get_meeting_time;
/******************************************************************************/
function f_get_grade_change(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_grade_change_extr PIPELINED IS
--
    ret_row                     WTT_GRADE_CHANGE_INPUT%ROWTYPE;
    ret_row_init                WTT_GRADE_CHANGE_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE grade_change_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          ACADEMIC_PERIOD_DESC                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_YEAR_DESC                      VARCHAR2(255),
          SUB_ACADEMIC_PERIOD                     VARCHAR2(63),
          SUB_ACADEMIC_PERIOD_DESC                VARCHAR2(255),
          COURSE_IDENTIFICATION                   VARCHAR2(63),
          COURSE_NUMBER                           VARCHAR2(63),
          COURSE_REFERENCE_NUMBER                 VARCHAR2(63),
          GRADE_CHANGE_REASON                     VARCHAR2(63),
          GRADE_CHANGE_REASON_DESC                VARCHAR2(255),
          GRADE_COMMENT                           VARCHAR2(63),
          GRADE_COMMENT_DESC                      VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          GRADE_SEQUENCE_NUMBER                   NUMBER,
          GRADE                                   VARCHAR2(63),
          GRADE_CHANGE_DATE                       DATE,
          CREDITS_ATTEMPTED                       NUMBER,
          CREDITS_PASSED                          NUMBER,
          CREDITS_FOR_GPA                         NUMBER,
          CREDITS_EARNED                          NUMBER,
          QUALITY_POINTS                          NUMBER,
          INCOMPLETE_EXT_DATE                     DATE,
          FINAL_GRADE_IND                         NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          AC_ACADEMIC_PERIOD                      VARCHAR2(63),
          AC_START_DATE                           DATE,
          AC_END_DATE                             DATE,
          AC_YEAR_CODE                            VARCHAR2(63)
    );
    TYPE refCurType     IS REF CURSOR;
    grade_change_info_cur       refCurType;
    grade_change_info_rec        grade_change_info_rec_type;
    TYPE tab_grade_change_info_rec_type   IS TABLE OF grade_change_info_rec_type INDEX BY PLS_INTEGER;
    grade_change_info_recs        tab_grade_change_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)        multi_source,
                 A.ZONE_VALUE                                 process_group,
                 A.DOMAIN_VALUE                               administrative_group,
                 A.ACADEMIC_PERIOD                            academic_period,
                 A.ACADEMIC_PERIOD_DESC                       academic_period_desc,
                 A.ACADEMIC_YEAR                              academic_year,
                 A.ACADEMIC_YEAR_DESC                         academic_year_desc,
                 A.SUB_ACADEMIC_PERIOD                        sub_academic_period,
                 A.SUB_ACADEMIC_PERIOD_DESC                   sub_academic_period_desc,
                 A.COURSE_IDENTIFICATION                      course_identification,
                 A.COURSE_NUMBER                              course_number,
                 A.COURSE_REFERENCE_NUMBER                    course_reference_number,
                 A.GRADE_CHANGE_REASON                        grade_change_reason,
                 A.GRADE_CHANGE_REASON_DESC                   grade_change_reason_desc,
                 A.GRADE_COMMENT                              grade_comment,
                 A.GRADE_COMMENT_DESC                         grade_comment_desc,
                 A.PERSON_UID                                 person_uid,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)               warehouse_entity_uid,
                 A.FINAL_GRADE_SEQUENCE_NUMBER                grade_sequence_number,
                 A.FINAL_GRADE                                grade,
                 A.GRADE_CHANGE_DATE                          grade_change_date,
                 A.CREDITS_ATTEMPTED                          credits_attempted,
                 A.CREDITS_PASSED                             credits_passed,
                 A.CREDITS_FOR_GPA                            credits_for_GPA,
                 A.CREDITS_EARNED                             credits_earned,
                 A.QUALITY_POINTS                             quality_points,
                 A.INCOMPLETE_EXT_DATE                        incomplete_ext_date,
                 DECODE( RANK() OVER (PARTITION BY A.PERSON_UID,A.COURSE_REFERENCE_NUMBER ORDER BY A.FINAL_GRADE_SEQUENCE_NUMBER DESC), 1, 1, 0) final_grade_ind,
                 PD.*,
                 AC.ACADEMIC_PERIOD                           ac_academic_period,
                 AC.START_DATE                                ac_start_date,
                 AC.END_DATE                                  ac_end_date,
                 AC.YEAR_CODE                                 ac_year_code
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_STUDENT_COURSE_GRADE_CHG A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                                                      FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                                                     WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                                                        AND YTD.YEAR_TYPE = 'ACYR'
                                                                                        AND YTD.YEAR_CODE = academic_year_in
                                                                                        AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)  ;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)        multi_source,
                 A.ZONE_VALUE                                 process_group,
                 A.DOMAIN_VALUE                               administrative_group,
                 A.ACADEMIC_PERIOD                            academic_period,
                 A.ACADEMIC_PERIOD_DESC                       academic_period_desc,
                 A.ACADEMIC_YEAR                              academic_year,
                 A.ACADEMIC_YEAR_DESC                         academic_year_desc,
                 A.SUB_ACADEMIC_PERIOD                        sub_academic_period,
                 A.SUB_ACADEMIC_PERIOD_DESC                   sub_academic_period_desc,
                 A.COURSE_IDENTIFICATION                      course_identification,
                 A.COURSE_NUMBER                              course_number,
                 A.COURSE_REFERENCE_NUMBER                    course_reference_number,
                 A.GRADE_CHANGE_REASON                        grade_change_reason,
                 A.GRADE_CHANGE_REASON_DESC                   grade_change_reason_desc,
                 A.GRADE_COMMENT                              grade_comment,
                 A.GRADE_COMMENT_DESC                         grade_comment_desc,
                 A.PERSON_UID                                 person_uid,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)               warehouse_entity_uid,
                 A.FINAL_GRADE_SEQUENCE_NUMBER                grade_sequence_number,
                 A.FINAL_GRADE                                grade,
                 A.GRADE_CHANGE_DATE                          grade_change_date,
                 A.CREDITS_ATTEMPTED                          credits_attempted,
                 A.CREDITS_PASSED                             credits_passed,
                 A.CREDITS_FOR_GPA                            credits_for_GPA,
                 A.CREDITS_EARNED                             credits_earned,
                 A.QUALITY_POINTS                             quality_points,
                 A.INCOMPLETE_EXT_DATE                        incomplete_ext_date,
                 DECODE( RANK() OVER (PARTITION BY A.PERSON_UID,A.COURSE_REFERENCE_NUMBER ORDER BY A.FINAL_GRADE_SEQUENCE_NUMBER DESC), 1, 1, 0) final_grade_ind,
                 PD.*,
                 AC.ACADEMIC_PERIOD                           ac_academic_period,
                 AC.START_DATE                                ac_start_date,
                 AC.END_DATE                                  ac_end_date,
                 AC.YEAR_CODE                                 ac_year_code
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_STUDENT_COURSE_GRADE_CHG A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 CHG_GRADE_CHANGE CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)  ;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_GRADE_CHANGE', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_GRADE_CHANGE', 'WFT_GRADE_CHANGE', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        grade_change_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        grade_change_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH grade_change_info_cur BULK COLLECT INTO grade_change_info_recs LIMIT bulk_size;
       EXIT WHEN grade_change_info_recs.COUNT = 0;
--
       FOR i IN grade_change_info_recs.FIRST..grade_change_info_recs.LAST
       LOOP
--     multi source
          ret_row.multi_source := grade_change_info_recs(i).multi_source;
          ret_row.process_group := grade_change_info_recs(i).process_group;
          ret_row.administrative_group := grade_change_info_recs(i).administrative_group;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.msrc_user_attribute_01 := NULL;
          ret_row.msrc_user_attribute_01 := ret_row.multi_source;
          ret_row.msrc_user_attribute_02 := NULL;
          ret_row.msrc_user_attribute_03 := NULL;
          ret_row.msrc_user_attribute_04 := NULL;
          ret_row.msrc_user_attribute_05 := NULL;
--     academic time
          ret_row.academic_period := grade_change_info_recs(i).ac_academic_period;
          ret_row.academic_period_begin_date := grade_change_info_recs(i).ac_start_date;
          ret_row.academic_period_end_date := grade_change_info_recs(i).ac_end_date;
          ret_row.academic_year := grade_change_info_recs(i).ac_year_code;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.atim_user_attribute_01 := NULL;
          ret_row.atim_user_attribute_01 := ret_row.multi_source;
          ret_row.atim_user_attribute_02 := NULL;
          ret_row.atim_user_attribute_03 := NULL;
          ret_row.atim_user_attribute_04 := NULL;
          ret_row.atim_user_attribute_05 := NULL;
--     Grade Change
          ret_row.grade_change_reason := grade_change_info_recs(i).grade_change_reason;
          ret_row.grade_comment       := grade_change_info_recs(i).grade_comment;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.gchg_user_attribute_01 := NULL;
          ret_row.gchg_user_attribute_01 := ret_row.multi_source;
          ret_row.gchg_user_attribute_02 := NULL;
          ret_row.gchg_user_attribute_03 := NULL;
          ret_row.gchg_user_attribute_04 := NULL;
          ret_row.gchg_user_attribute_05 := NULL;
--     Sub Academic Period
          ret_row.sub_academic_period := grade_change_info_recs(i).sub_academic_period;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.sapd_user_attribute_01 := NULL;
          ret_row.sapd_user_attribute_01 := ret_row.multi_source;
          ret_row.sapd_user_attribute_02 := NULL;
          ret_row.sapd_user_attribute_03 := NULL;
          ret_row.sapd_user_attribute_04 := NULL;
          ret_row.sapd_user_attribute_05 := NULL;
--     Demographic
          ret_row.gender := grade_change_info_recs(i).gender;
          ret_row.ethnicity_category := grade_change_info_recs(i).ethnicity_category;
          ret_row.hispanic_latino_ethn_ind := grade_change_info_recs(i).hispanic_latino_ethnicity_ind;
          ret_row.asian_ind := grade_change_info_recs(i).asian_ind;
          ret_row.native_amer_or_alaskan_ind := grade_change_info_recs(i).native_american_or_alaskan_ind;
          ret_row.black_or_african_ind := grade_change_info_recs(i).black_or_african_ind;
          ret_row.pacific_islander_ind := grade_change_info_recs(i).pacific_islander_ind;
          ret_row.white_ind := grade_change_info_recs(i).white_ind;
          IF grade_change_info_recs(i).number_of_races = 0 and grade_change_info_recs(i).resident_alien_visa_count > 0 THEN
             ret_row.non_resident_ind := 'Y';
          ELSE
             ret_row.non_resident_ind := 'N';
          END IF;
          IF NVL(grade_change_info_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND grade_change_info_recs(i).number_of_races = 0 AND grade_change_info_recs(i).resident_alien_visa_count  = 0THEN
             ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
          ELSE
             ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
          END IF;
          ret_row.two_or_more_ind := grade_change_info_recs(i).two_or_more_ind;
          ret_row.race_ethnicity_confirm_ind := grade_change_info_recs(i).race_ethnicity_confirm_ind;
          ret_row.minority_ind := grade_change_info_recs(i).minority_ind;
          ret_row.ethnicity := grade_change_info_recs(i).ethnicity;
          ret_row.deceased_ind := grade_change_info_recs(i).deceased_ind;
          ret_row.citizenship_ind := grade_change_info_recs(i).citizenship_ind;
          ret_row.citizenship_type := grade_change_info_recs(i).citizenship_type;
          ret_row.visa_type := grade_change_info_recs(i).visa_type;
          ret_row.nation_of_citizenship := grade_change_info_recs(i).nation_of_citizenship;
          ret_row.nation_of_birth := grade_change_info_recs(i).nation_of_birth;
          ret_row.primary_disability := grade_change_info_recs(i).primary_disability;
          ret_row.legacy := grade_change_info_recs(i).legacy;
          ret_row.marital_status := grade_change_info_recs(i).marital_status;
          ret_row.religion := grade_change_info_recs(i).religion;
          ret_row.veteran_type := grade_change_info_recs(i).veteran_type;
          ret_row.veteran_category := grade_change_info_recs(i).veteran_category;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.demo_user_attribute_01 := NULL;
          ret_row.demo_user_attribute_01 := ret_row.multi_source;
          ret_row.demo_user_attribute_02 := NULL;
          ret_row.demo_user_attribute_03 := NULL;
          ret_row.demo_user_attribute_04 := NULL;
          ret_row.demo_user_attribute_05 := NULL;
--     person
          ret_row.person_uid := grade_change_info_recs(i).warehouse_entity_uid;
          ret_row.id := grade_change_info_recs(i).id;
          ret_row.full_name_lfmi := grade_change_info_recs(i).full_name_lfmi;
          ret_row.birth_date := grade_change_info_recs(i).birth_date;
          ret_row.deceased_date := grade_change_info_recs(i).deceased_date;
          ret_row.email_address := grade_change_info_recs(i).email_address;
          ret_row.phone_number_combined := grade_change_info_recs(i).phone_number_combined;
          ret_row.confidentiality_ind := grade_change_info_recs(i).confidentiality_ind;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.pers_user_attribute_01 := NULL;
          ret_row.pers_user_attribute_01 := ret_row.multi_source;
          ret_row.pers_user_attribute_02 := NULL;
          ret_row.pers_user_attribute_03 := NULL;
          ret_row.pers_user_attribute_04 := NULL;
          ret_row.pers_user_attribute_05 := NULL;
--     Course Reference Number
          ret_row.course_reference_number := grade_change_info_recs(i).course_reference_number;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.crnb_user_attribute_01 := NULL;
          ret_row.crnb_user_attribute_01 := ret_row.multi_source;
          ret_row.crnb_user_attribute_02 := NULL;
          ret_row.crnb_user_attribute_03 := NULL;
          ret_row.crnb_user_attribute_04 := NULL;
          ret_row.crnb_user_attribute_05 := NULL;
--     measures
          ret_row.course_identification  := grade_change_info_recs(i).course_identification;
          ret_row.grade_sequence_number  := grade_change_info_recs(i).grade_sequence_number;
          ret_row.grade                  := grade_change_info_recs(i).grade;
          ret_row.grade_change_date      := TRUNC(NVL(grade_change_info_recs(i).grade_change_date,'31-DEC-2099'));
          ret_row.credits_attempted      := grade_change_info_recs(i).credits_attempted;
          ret_row.credits_passed         := grade_change_info_recs(i).credits_passed;
          ret_row.credits_for_gpa        := grade_change_info_recs(i).credits_for_gpa;
          ret_row.credits_earned         := grade_change_info_recs(i).credits_earned;
          ret_row.quality_points         := grade_change_info_recs(i).quality_points;
          ret_row.incomplete_ext_date    := TRUNC(NVL(grade_change_info_recs(i).incomplete_ext_date,'31-DEC-2099'));
          ret_row.final_grade_ind        := grade_change_info_recs(i).final_grade_ind;
          ret_row.user_measure_01 := NULL;
          ret_row.user_measure_02 := NULL;
          ret_row.user_measure_03 := NULL;
          ret_row.user_measure_04 := NULL;
          ret_row.user_measure_05 := NULL;
          ret_row.system_load_process := 'GRADE_CHANGE';
--
          PIPE ROW(ret_row);
--
          ret_row := ret_row_init;
--
       END LOOP; -- Grade Change
--
    END LOOP;
--
    CLOSE grade_change_info_cur;
--
    RETURN;

  END f_get_grade_change;
/******************************************************************************/
function f_get_academic_outcome_hnr(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_academic_outcome_hnr_extr PIPELINED IS
--
    ret_row                     WTT_ACADEMIC_OUTCOME_HNR_INPUT%ROWTYPE;
    ret_row_init                WTT_ACADEMIC_OUTCOME_HNR_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE academic_o_hnr_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          ACADEMIC_OUTCOME_HONOR_TYPE             VARCHAR2(1),
          ACADEMIC_OUTCOME_HONOR                  VARCHAR2(63),
          OUTCOME_NUMBER                          NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    academic_outcome_hnr_info_cur       refCurType;
    academic_outcome_hnr_info_rec        academic_o_hnr_info_rec_type;
    TYPE tab_a_o_hnr_info_rec_type   IS TABLE OF academic_o_hnr_info_rec_type INDEX BY PLS_INTEGER;
    academic_outcome_hnr_info_recs        tab_a_o_hnr_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)        multi_source,
                 A.ZONE_VALUE                                 process_group,
                 A.DOMAIN_VALUE                               administrative_group,
                 A.PERSON_UID                                 person_uid,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)               warehouse_entity_uid,
                 A.HONOR_IND                                  academic_outcome_honor_type,
                 A.HONOR                                      academic_outcome_honor,
                 a.outcome_number                             outcome_number,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_OUTCOME_HONOR A,
                 WCV_EXTR_PERSON_DETAILS PD
           WHERE (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID;
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--             AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)        multi_source,
                 A.ZONE_VALUE                                 process_group,
                 A.DOMAIN_VALUE                               administrative_group,
                 A.PERSON_UID                                 person_uid,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)               warehouse_entity_uid,
                 A.HONOR_IND                                  academic_outcome_honor_type,
                 A.HONOR                                      academic_outcome_honor,
                 a.outcome_number                             outcome_number,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_OUTCOME_HONOR A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 CHG_ACADEMIC_OUTCOME_HNR CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID;
                          --JOS Update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--             AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_ACADEMIC_OUTCOME_HONOR');
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_ACADEMIC_OUTCOME_HNR', 'WFT_ACADEMIC_OUTCOME_HONOR', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        academic_outcome_hnr_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        academic_outcome_hnr_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH academic_outcome_hnr_info_cur BULK COLLECT INTO academic_outcome_hnr_info_recs LIMIT bulk_size;
       EXIT WHEN academic_outcome_hnr_info_recs.COUNT = 0;
--
       FOR i IN academic_outcome_hnr_info_recs.FIRST..academic_outcome_hnr_info_recs.LAST
       LOOP
--     multi source
          ret_row.multi_source := academic_outcome_hnr_info_recs(i).multi_source;
          ret_row.process_group := academic_outcome_hnr_info_recs(i).process_group;
          ret_row.administrative_group := academic_outcome_hnr_info_recs(i).administrative_group;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.msrc_user_attribute_01 := NULL;
          ret_row.msrc_user_attribute_01 := ret_row.multi_source;
          ret_row.msrc_user_attribute_02 := NULL;
          ret_row.msrc_user_attribute_03 := NULL;
          ret_row.msrc_user_attribute_04 := NULL;
          ret_row.msrc_user_attribute_05 := NULL;
--     person
          ret_row.person_uid := academic_outcome_hnr_info_recs(i).warehouse_entity_uid;
          ret_row.id := academic_outcome_hnr_info_recs(i).id;
          ret_row.full_name_lfmi := academic_outcome_hnr_info_recs(i).full_name_lfmi;
          ret_row.birth_date := academic_outcome_hnr_info_recs(i).birth_date;
          ret_row.deceased_date := academic_outcome_hnr_info_recs(i).deceased_date;
          ret_row.email_address := academic_outcome_hnr_info_recs(i).email_address;
          ret_row.phone_number_combined := academic_outcome_hnr_info_recs(i).phone_number_combined;
          ret_row.confidentiality_ind := academic_outcome_hnr_info_recs(i).confidentiality_ind;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.pers_user_attribute_01 := NULL;
          ret_row.pers_user_attribute_01 := ret_row.multi_source;
          ret_row.pers_user_attribute_02 := NULL;
          ret_row.pers_user_attribute_03 := NULL;
          ret_row.pers_user_attribute_04 := NULL;
          ret_row.pers_user_attribute_05 := NULL;
--     academic outcome honor
          ret_row.academic_outcome_honor_type := academic_outcome_hnr_info_recs(i).academic_outcome_honor_type;
          ret_row.academic_outcome_honor := academic_outcome_hnr_info_recs(i).academic_outcome_honor;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.aohr_user_attribute_01 := NULL;
          ret_row.aohr_user_attribute_01 := ret_row.multi_source;
          ret_row.aohr_user_attribute_02 := NULL;
          ret_row.aohr_user_attribute_03 := NULL;
          ret_row.aohr_user_attribute_04 := NULL;
          ret_row.aohr_user_attribute_05 := NULL;
--     measures
          ret_row.outcome_number  := academic_outcome_hnr_info_recs(i).outcome_number;
          ret_row.user_measure_01 := NULL;
          ret_row.user_measure_02 := NULL;
          ret_row.user_measure_03 := NULL;
          ret_row.user_measure_04 := NULL;
          ret_row.user_measure_05 := NULL;
          ret_row.system_load_process := 'ACADEMIC_OUTCOME_HONOR';
--
          PIPE ROW(ret_row);
--
          ret_row := ret_row_init;
--
       END LOOP; -- Academic Outcome honor
--
   END LOOP;
--
   CLOSE academic_outcome_hnr_info_cur;
--
   RETURN;

  END f_get_academic_outcome_hnr;
/******************************************************************************/
function f_get_course_section(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_course_section_extr PIPELINED IS
--
    ret_row                     WTT_COURSE_SECTION_INPUT%ROWTYPE;
    ret_row_init                WTT_COURSE_SECTION_INPUT%ROWTYPE;
    acad_time_rec               EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_rec_init          EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    course_suppl_rec            EDW_STUDENT_EXTR.GET_COURSE_SUPPL%ROWTYPE;
    course_suppl_rec_init       EDW_STUDENT_EXTR.GET_COURSE_SUPPL%ROWTYPE;
    meeting_time_rec            EDW_STUDENT_EXTR.GET_MEETING_TIME%ROWTYPE;
    meeting_time_rec_init       EDW_STUDENT_EXTR.GET_MEETING_TIME%ROWTYPE;
--
--
        TYPE course_section_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          ACADEMIC_PERIOD_DESC                    VARCHAR2(255),
          ACADEMIC_YEAR                           VARCHAR2(63),
          ACADEMIC_YEAR_DESC                      VARCHAR2(255),
          SUB_ACADEMIC_PERIOD                     VARCHAR2(63),
          SUB_ACADEMIC_PERIOD_DESC                VARCHAR2(255),
          COURSE_IDENTIFICATION                   VARCHAR2(500),
          COURSE_TITLE_SHORT                      VARCHAR2(500),
          COURSE_TITLE_LONG                       VARCHAR2(500),
          COURSE_NUMBER                           VARCHAR2(63),
          COURSE_REFERENCE_NUMBER                 VARCHAR2(5),
          SUBJECT                                 VARCHAR2(63),
          CAMPUS                                  VARCHAR2(63),
          COLLEGE                                 VARCHAR2(63),
          DIVISION                                VARCHAR2(63),
          DEPARTMENT                              VARCHAR2(63),
          SCHEDULE                                VARCHAR2(63),
          SESSION_TYPE                            VARCHAR2(63),
          GRADABLE_IND                            VARCHAR2(1),
          CENSUS_ENROLLMENT_DATE1                 DATE,
          CENSUS_ENROLLMENT_DATE2                 DATE,
          START_DATE                              DATE,
          END_DATE                                DATE,
          COURSE_SECTION                          VARCHAR2(63),
          SECTION_CROSS_LIST                      VARCHAR2(63),
          INSTRUCTION_DELIVERY_MODE               VARCHAR2(5),
          PROGRAM_CLASSIFICATION                  VARCHAR2(63),
          CONTINUING_EDUCATION_IND                VARCHAR2(1)
    );
    TYPE refCurType     IS REF CURSOR;
    course_section_info_cur       refCurType;
    crse_sec_rec        course_section_info_rec_type;
    TYPE tab_c_section_info_rec_type   IS TABLE OF course_section_info_rec_type INDEX BY PLS_INTEGER;
    course_section_info_recs        tab_c_section_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(CO.MIF_VALUE,def_multi_source_in)     multi_source,
                 CO.ZONE_VALUE                                       process_group,
                 CO.DOMAIN_VALUE                                     administrative_group,
                 CO.ACADEMIC_PERIOD                                  academic_period,
                 CO.ACADEMIC_PERIOD_DESC                             academic_period_desc,
                 CO.ACADEMIC_YEAR                                    academic_year,
                 CO.ACADEMIC_YEAR_DESC                               academic_year_desc,
                 CO.SUB_ACADEMIC_PERIOD                              sub_academic_period,
                 CO.SUB_ACADEMIC_PERIOD_DESC                         sub_academic_period_desc,
                 NVL(CO.COURSE_IDENTIFICATION, default_rec.null_cleanse_value)                      course_identification,
                 NVL(NVL(CO.TITLE_SHORT_DESC, CC.TITLE_SHORT_DESC), default_rec.null_cleanse_value) course_title_short,
                 NVL(NVL(CO.TITLE_LONG_DESC,  CC.TITLE_LONG_DESC) , default_rec.null_cleanse_value) course_title_long,
                 CO.COURSE_NUMBER                                    course_number,
                 CO.COURSE_REFERENCE_NUMBER                          course_reference_number,
                 CO.SUBJECT                                          subject,
                 CO.CAMPUS                                           campus,
                 NVL(CO.COLLEGE, CC.COLLEGE)                         college,
                 NVL(CO.DIVISION, CC.DIVISION)                       division,
                 NVL(CO.DEPARTMENT, CC.DEPARTMENT)                   department,
                 CO.SCHEDULE                                         schedule,
                 CO.STUDENT_MEETING_TIME                             session_type,
                 CO.GRADABLE_IND                                     gradable_ind,
                 CO.CENSUS_ENROLLMENT_DATE1                          census_enrollment_date1,
                 CO.CENSUS_ENROLLMENT_DATE2                          census_enrollment_date2,
                 CO.START_DATE                                       start_date,
                 CO.END_DATE                                         end_date,
                 CO.OFFERING_NUMBER                                  course_section,
                 CO.SECTION_CROSS_LIST                               section_cross_list,
                 CS.INSTRUCTIONAL_METHOD                             instruction_delivery_mode,
                 CC.PROGRAM_CLASSIFICATION                           program_classification,
                 CC.CONTINUING_EDUCATION_IND                         continuing_education_ind
            FROM MST_COURSE_OFFERING CO,
                 MST_COURSE_CATALOG  CC,
                 MST_COURSE_SCHEDULE CS
           WHERE CC.SUBJECT         = CO.SUBJECT
             AND CC.COURSE_NUMBER   = CO.COURSE_NUMBER
             AND CO.ACADEMIC_PERIOD BETWEEN CC.ACADEMIC_PERIOD_START AND CC.ACADEMIC_PERIOD_END
             AND CO.SUBJECT         = CS.SUBJECT (+)
             AND CO.COURSE_NUMBER   = CS.COURSE_NUMBER (+)
             AND CO.ACADEMIC_PERIOD BETWEEN CS.ACADEMIC_PERIOD_START (+) AND CS.ACADEMIC_PERIOD_END (+)
             AND CO.SCHEDULE        = CS.SCHEDULE (+)
             AND ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                                                      FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                                                     WHERE YTD.ACADEMIC_PERIOD = CO.ACADEMIC_PERIOD
                                                                                        AND YTD.YEAR_TYPE = 'ACYR'
                                                                                        AND YTD.YEAR_CODE = academic_year_in
                                                                                        AND NVL(CO.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR CO.COURSE_REFERENCE_NUMBER LIKE debug_var_in);
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(CO.MIF_VALUE,def_multi_source_in)     multi_source,
                 CO.ZONE_VALUE                                       process_group,
                 CO.DOMAIN_VALUE                                     administrative_group,
                 CO.ACADEMIC_PERIOD                                  academic_period,
                 CO.ACADEMIC_PERIOD_DESC                             academic_period_desc,
                 CO.ACADEMIC_YEAR                                    academic_year,
                 CO.ACADEMIC_YEAR_DESC                               academic_year_desc,
                 CO.SUB_ACADEMIC_PERIOD                              sub_academic_period,
                 CO.SUB_ACADEMIC_PERIOD_DESC                         sub_academic_period_desc,
                 NVL(CO.COURSE_IDENTIFICATION, default_rec.null_cleanse_value)                      course_identification,
                 NVL(NVL(CO.TITLE_SHORT_DESC, CC.TITLE_SHORT_DESC), default_rec.null_cleanse_value) course_title_short,
                 NVL(NVL(CO.TITLE_LONG_DESC,  CC.TITLE_LONG_DESC) , default_rec.null_cleanse_value) course_title_long,
                 CO.COURSE_NUMBER                                    course_number,
                 CO.COURSE_REFERENCE_NUMBER                          course_reference_number,
                 CO.SUBJECT                                          subject,
                 CO.CAMPUS                                           campus,
                 NVL(CO.COLLEGE, CC.COLLEGE)                         college,
                 NVL(CO.DIVISION, CC.DIVISION)                       division,
                 NVL(CO.DEPARTMENT, CC.DEPARTMENT)                   department,
                 CO.SCHEDULE                                         schedule,
                 CO.STUDENT_MEETING_TIME                             session_type,
                 CO.GRADABLE_IND                                     gradable_ind,
                 CO.CENSUS_ENROLLMENT_DATE1                          census_enrollment_date1,
                 CO.CENSUS_ENROLLMENT_DATE2                          census_enrollment_date2,
                 CO.START_DATE                                       start_date,
                 CO.END_DATE                                         end_date,
                 CO.OFFERING_NUMBER                                  course_section,
                 CO.SECTION_CROSS_LIST                               section_cross_list,
                 CS.INSTRUCTIONAL_METHOD                             instruction_delivery_mode,
                 CC.PROGRAM_CLASSIFICATION                           program_classification,
                 CC.CONTINUING_EDUCATION_IND                         continuing_education_ind
            FROM MST_COURSE_OFFERING CO,
                 MST_COURSE_CATALOG  CC,
                 MST_COURSE_SCHEDULE CS,
                 CHG_COURSE_SECTION CHG
           WHERE CHG.COURSE_REFERENCE_NUMBER = CO.COURSE_REFERENCE_NUMBER
             AND CC.SUBJECT         = CO.SUBJECT
             AND CC.COURSE_NUMBER   = CO.COURSE_NUMBER
             AND CO.ACADEMIC_PERIOD BETWEEN CC.ACADEMIC_PERIOD_START AND CC.ACADEMIC_PERIOD_END
             AND CO.SUBJECT         = CS.SUBJECT (+)
             AND CO.COURSE_NUMBER   = CS.COURSE_NUMBER (+)
             AND CO.ACADEMIC_PERIOD BETWEEN CS.ACADEMIC_PERIOD_START (+) AND CS.ACADEMIC_PERIOD_END (+)
             AND CO.SCHEDULE        = CS.SCHEDULE (+)
             AND (debug_var_in IS NULL OR CO.COURSE_REFERENCE_NUMBER LIKE debug_var_in);
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_COURSE_SECTION', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_COURSE_SECTION', 'WFT_COURSE_SECTION', 'COURSE_REFERENCE_NUMBER','WDT_COURSE_REFERENCE_NUMBER',NULL);
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    IF process_ind_in = 'L' THEN
        course_section_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        course_section_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
        FETCH course_section_info_cur INTO crse_sec_rec;
        EXIT WHEN course_section_info_cur%NOTFOUND;
--
      OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, crse_sec_rec.multi_source, crse_sec_rec.academic_period, 'ACYR');
      FETCH edw_general_extr.get_year_type INTO acad_time_rec;
      CLOSE edw_general_extr.get_year_type;
--
      OPEN get_course_suppl(default_rec.multi_source_cleanse_value,crse_sec_rec.multi_source,crse_sec_rec.subject,crse_sec_rec.course_number,crse_sec_rec.academic_period);
      FETCH get_course_suppl INTO course_suppl_rec;
      CLOSE get_course_suppl;
--
      OPEN get_meeting_time(default_rec.multi_source_cleanse_value,crse_sec_rec.multi_source,crse_sec_rec.course_reference_number,crse_sec_rec.academic_period);
      FETCH get_meeting_time INTO meeting_time_rec;
      CLOSE get_meeting_time;

-- multi source
      ret_row.multi_source := crse_sec_rec.multi_source;
      ret_row.process_group := crse_sec_rec.process_group;
      ret_row.administrative_group := crse_sec_rec.administrative_group;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.msrc_user_attribute_01 := NULL;
      ret_row.msrc_user_attribute_01 := ret_row.multi_source;
      ret_row.msrc_user_attribute_02 := NULL;
      ret_row.msrc_user_attribute_03 := NULL;
      ret_row.msrc_user_attribute_04 := NULL;
      ret_row.msrc_user_attribute_05 := NULL;
-- academic time
      ret_row.academic_period := acad_time_rec.academic_period;
      ret_row.academic_period_begin_date := acad_time_rec.start_date;
      ret_row.academic_period_end_date := acad_time_rec.end_date;
      ret_row.academic_year := acad_time_rec.year_code;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.atim_user_attribute_01 := NULL;
      ret_row.atim_user_attribute_01 := ret_row.multi_source;
      ret_row.atim_user_attribute_02 := NULL;
      ret_row.atim_user_attribute_03 := NULL;
      ret_row.atim_user_attribute_04 := NULL;
      ret_row.atim_user_attribute_05 := NULL;
-- Sub Academic Period
      ret_row.sub_academic_period := crse_sec_rec.sub_academic_period;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.sapd_user_attribute_01 := NULL;
      ret_row.sapd_user_attribute_01 := ret_row.multi_source;
      ret_row.sapd_user_attribute_02 := NULL;
      ret_row.sapd_user_attribute_03 := NULL;
      ret_row.sapd_user_attribute_04 := NULL;
      ret_row.sapd_user_attribute_05 := NULL;
-- Course
      ret_row.course_identification := crse_sec_rec.course_identification;
      ret_row.course_title_short := crse_sec_rec.course_title_short;
      ret_row.course_title_long := crse_sec_rec.course_title_long;
      ret_row.course_number := crse_sec_rec.course_number;
      ret_row.program_classification := crse_sec_rec.program_classification;
      ret_row.subject := crse_sec_rec.subject;
      ret_row.course_level := NULL;  -- leave NULL since course section does not include student course data
      ret_row.course_campus := crse_sec_rec.campus;
      ret_row.course_college := crse_sec_rec.college;
      ret_row.course_division := crse_sec_rec.division;
      ret_row.course_department := crse_sec_rec.department;
      ret_row.schedule := crse_sec_rec.schedule;
      ret_row.session_type := crse_sec_rec.session_type;
      CASE
      WHEN crse_sec_rec.continuing_education_ind = 'Y' THEN ret_row.continuing_education_ind := 1;
      ELSE ret_row.continuing_education_ind := 0;
      END CASE;
      CASE
      WHEN course_suppl_rec.cooperative_education_ind = 'Y' THEN ret_row.cooperative_education_ind := 1;
      ELSE ret_row.cooperative_education_ind := 0;
      END CASE;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.crse_user_attribute_01 := NULL;
      ret_row.crse_user_attribute_01 := ret_row.multi_source;
      ret_row.crse_user_attribute_02 := NULL;
      ret_row.crse_user_attribute_03 := NULL;
      ret_row.crse_user_attribute_04 := NULL;
      ret_row.crse_user_attribute_05 := NULL;
-- Course Section
      ret_row.course_section            :=  crse_sec_rec.course_section;
      ret_row.instruction_delivery_mode :=  crse_sec_rec.instruction_delivery_mode;
      ret_row.gradable_ind             := case when crse_sec_rec.gradable_ind = 'Y' then 1 else 0 end;
      ret_row.section_cross_list       := crse_sec_rec.section_cross_list;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.crsn_user_attribute_01   := NULL;
      ret_row.crsn_user_attribute_01   := ret_row.multi_source;
      ret_row.crsn_user_attribute_02   := NULL;
      ret_row.crsn_user_attribute_03   := NULL;
      ret_row.crsn_user_attribute_04   := NULL;
      ret_row.crsn_user_attribute_05   := NULL;
-- Course Reference Number
      ret_row.course_reference_number := crse_sec_rec.course_reference_number;
      --BLM mepped 6/2/14 for security reasons
      --ret_row.crnb_user_attribute_01 := NULL;
      ret_row.crnb_user_attribute_01 := ret_row.multi_source;
      ret_row.crnb_user_attribute_02 := NULL;
      ret_row.crnb_user_attribute_03 := NULL;
      ret_row.crnb_user_attribute_04 := NULL;
      ret_row.crnb_user_attribute_05 := NULL;
-- measures
      ret_row.meeting_days :=
         NVL(CASE WHEN meeting_time_rec.MONDAY_IND IS NOT NULL THEN IA_ADMIN.G$_DATE_PKG.nls_abv_day('M') END||CASE WHEN (meeting_time_rec.MONDAY_IND IS NOT NULL) AND (meeting_time_rec.TUESDAY_IND IS NOT NULL OR meeting_time_rec.WEDNESDAY_IND IS NOT NULL OR meeting_time_rec.THURSDAY_IND IS NOT NULL OR meeting_time_rec.FRIDAY_IND IS NOT NULL OR meeting_time_rec.SATURDAY_IND IS NOT NULL OR meeting_time_rec.SUNDAY_IND IS NOT NULL) THEN ' ' END||
             CASE WHEN meeting_time_rec.TUESDAY_IND IS NOT NULL THEN IA_ADMIN.G$_DATE_PKG.nls_abv_day('T') END||CASE WHEN (meeting_time_rec.TUESDAY_IND IS NOT NULL) AND (meeting_time_rec.WEDNESDAY_IND IS NOT NULL OR meeting_time_rec.THURSDAY_IND IS NOT NULL OR meeting_time_rec.FRIDAY_IND IS NOT NULL OR meeting_time_rec.SATURDAY_IND IS NOT NULL OR meeting_time_rec.SUNDAY_IND IS NOT NULL) THEN ' ' END||
             CASE WHEN meeting_time_rec.WEDNESDAY_IND IS NOT NULL THEN IA_ADMIN.G$_DATE_PKG.nls_abv_day('W') END ||CASE WHEN (meeting_time_rec.WEDNESDAY_IND IS NOT NULL) AND (meeting_time_rec.THURSDAY_IND IS NOT NULL OR meeting_time_rec.FRIDAY_IND IS NOT NULL OR meeting_time_rec.SATURDAY_IND IS NOT NULL OR meeting_time_rec.SUNDAY_IND IS NOT NULL) THEN ' ' END||
             CASE WHEN meeting_time_rec.THURSDAY_IND IS NOT NULL THEN IA_ADMIN.G$_DATE_PKG.nls_abv_day('R') END||CASE WHEN (meeting_time_rec.THURSDAY_IND IS NOT NULL) AND (meeting_time_rec.FRIDAY_IND IS NOT NULL OR meeting_time_rec.SATURDAY_IND IS NOT NULL OR meeting_time_rec.SUNDAY_IND IS NOT NULL) THEN ' ' END||
             CASE WHEN meeting_time_rec.FRIDAY_IND IS NOT NULL THEN IA_ADMIN.G$_DATE_PKG.nls_abv_day('F') END||CASE WHEN (meeting_time_rec.FRIDAY_IND IS NOT NULL) AND (meeting_time_rec.SATURDAY_IND IS NOT NULL OR meeting_time_rec.SUNDAY_IND IS NOT NULL) THEN ' ' END||
             CASE WHEN meeting_time_rec.SATURDAY_IND IS NOT NULL THEN IA_ADMIN.G$_DATE_PKG.nls_abv_day('S') END||CASE WHEN meeting_time_rec.SATURDAY_IND IS NOT NULL AND meeting_time_rec.SUNDAY_IND IS NOT NULL THEN ' ' END||
             CASE WHEN meeting_time_rec.SUNDAY_IND IS NOT NULL THEN  IA_ADMIN.G$_DATE_PKG.nls_abv_day('U') END,
             0) ;
      --ret_row.meeting_days := crse_sec_rec.meeting_days;
      ret_row.start_date := TRUNC(NVL(crse_sec_rec.start_date,'31-DEC-2099'));
      ret_row.end_date := TRUNC(NVL(crse_sec_rec.end_date,'31-DEC-2099'));
      ret_row.census_enrollment_date1 := TRUNC(NVL(crse_sec_rec.census_enrollment_date1,'31-DEC-2099'));
      ret_row.census_enrollment_date2 := TRUNC(NVL(crse_sec_rec.census_enrollment_date2,'31-DEC-2099'));
      ret_row.user_measure_01 := NULL;
      ret_row.user_measure_02 := NULL;
      ret_row.user_measure_03 := NULL;
      ret_row.user_measure_04 := NULL;
      ret_row.user_measure_05 := NULL;
      ret_row.system_load_process := 'COURSE_SECTION';
--
      PIPE ROW(ret_row);
--
      ret_row := ret_row_init;
      acad_time_rec := acad_time_rec_init;
      course_suppl_rec := course_suppl_rec_init;
      meeting_time_rec := meeting_time_rec_init;
--
    END LOOP; -- crse_sec_rec
--
    RETURN;
  END f_get_course_section;
/******************************************************************************/
function f_get_student_course(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_student_course_extr PIPELINED IS
--
    ret_row                     WTT_STUDENT_COURSE_INPUT%ROWTYPE;
    ret_row_init                WTT_STUDENT_COURSE_INPUT%ROWTYPE;
    course_off_rec              EDW_STUDENT_EXTR.GET_COURSE_OFFERING%ROWTYPE;
    course_off_rec_init         EDW_STUDENT_EXTR.GET_COURSE_OFFERING%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    course_catalog_rec          EDW_STUDENT_EXTR.GET_COURSE_CATALOG%ROWTYPE;
    course_catalog_rec_init     EDW_STUDENT_EXTR.GET_COURSE_CATALOG%ROWTYPE;
    course_suppl_rec            EDW_STUDENT_EXTR.GET_COURSE_SUPPL%ROWTYPE;
    course_suppl_rec_init       EDW_STUDENT_EXTR.GET_COURSE_SUPPL%ROWTYPE;
    inst_rec                    EDW_STUDENT_EXTR.GET_INSTRUCTOR%ROWTYPE;
    inst_rec_init               EDW_STUDENT_EXTR.GET_INSTRUCTOR%ROWTYPE;
    fact_dpt_clg_rec            EDW_STUDENT_EXTR.GET_FACT_DEPT_COLLEGE%ROWTYPE;
    fact_dpt_clg_rec_init       EDW_STUDENT_EXTR.GET_FACT_DEPT_COLLEGE%ROWTYPE;
    grd_chg_cnt_rec             EDW_STUDENT_EXTR.GET_GRADE_CHANGE_CNT%ROWTYPE;
    grd_chg_cnt_rec_init        EDW_STUDENT_EXTR.GET_GRADE_CHANGE_CNT%ROWTYPE;
    grd_chg_rec                 EDW_STUDENT_EXTR.GET_GRADE_CHANGE%ROWTYPE;
    grd_chg_rec_init            EDW_STUDENT_EXTR.GET_GRADE_CHANGE%ROWTYPE;
    devl_course_ind             PLS_INTEGER := 0;
    lv_registration             VARCHAR2(20) := G$_NLS.GET ('X', 'SQL', 'Registration');
    lv_history                  VARCHAR2(20) := G$_NLS.GET ('X', 'SQL', 'History');
    lv_transfer                 VARCHAR2(20) := G$_NLS.GET ('X', 'SQL', 'Transfer');
    parm_rec                    MTVPARM%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
    --
    get_student_course_info         SYS_REFCURSOR;
    sqlStmt         CLOB;
    mep_enabled                  MTVPARM%ROWTYPE;
     --
   TYPE student_course_info IS RECORD (
      MULTI_SOURCE                                       VARCHAR2(63 CHAR),
      PROCESS_GROUP                                      VARCHAR2(255 CHAR),
      ADMINISTRATIVE_GROUP                               VARCHAR2(255 CHAR),
      ACADEMIC_PERIOD                                    VARCHAR2(63 CHAR),
      SUB_ACADEMIC_PERIOD                                VARCHAR2(63 CHAR),
      COURSE_IDENTIFICATION                              VARCHAR2(63 CHAR),
      COURSE_TITLE_SHORT                                 VARCHAR2(63 CHAR),
      COURSE_TITLE_LONG                                  VARCHAR2(255 CHAR),
      COURSE_NUMBER                                      VARCHAR2(63 CHAR),
      SUBJECT                                            VARCHAR2(63 CHAR),
      COURSE_LEVEL                                       VARCHAR2(63 CHAR),
      COURSE_CAMPUS                                      VARCHAR2(63 CHAR),
      COURSE_COLLEGE                                     VARCHAR2(63 CHAR),
      COURSE_DIVISION                                    VARCHAR2(255 CHAR),
      COURSE_DEPARTMENT                                  VARCHAR2(63 CHAR),
      SCHEDULE                                           VARCHAR2(63 CHAR),
      COURSE_REFERENCE_NUMBER                            VARCHAR2(63 CHAR),
      WAREHOUSE_ENTITY_UID                               NUMBER,
      PERSON_UID                                         NUMBER,
      INSTRUCTION_DELIVERY_MODE                          VARCHAR2(63 CHAR),
      GRADE_TYPE                                         VARCHAR2(63 CHAR),
      REGISTRATION_STATUS                                VARCHAR2(63 CHAR),
      SECTION_ADD_DATE                                   DATE,
      FINAL_GRADE                                        VARCHAR2(63 CHAR),
      COURSE_CREDITS                                     NUMBER,
      COURSE_CREDITS_ATTEMPTED                           NUMBER,
      COURSE_CREDITS_EARNED                              NUMBER,
      COURSE_CREDITS_PASSED                              NUMBER,
      COURSE_CREDITS_FOR_GPA                             NUMBER,
      FINAL_GRADE_QUALITY_POINTS                         NUMBER,
      FINAL_GRADE_DATE                                   DATE,
      MID_TERM_GRADE                                     VARCHAR2(63 CHAR),
      SPECIAL_APPROVAL_IND                               NUMBER,
      IN_PROGRESS_COURSE_IND                             NUMBER,
      INSTITUTION_COURSE_IND                             NUMBER,
      TRANSFER_COURSE_IND                                NUMBER,
      REPEAT_COURSE_IND                                  NUMBER,
      REGISTRATION_STATUS_DATE                           DATE,
      INITIAL_REGISTRATION_DATE                          DATE,
      REGISTRATION_OVERRIDE_IND                          VARCHAR2(1 CHAR),
      COURSE_REGISTER_IND                                VARCHAR2(1 CHAR),
      REGISTER_CENSUS_DATE1_IND                          VARCHAR2(1 CHAR),
      REGISTER_CENSUS_DATE2_IND                          VARCHAR2(1 CHAR),
      COURSE_ATTEMPTED_IND                               VARCHAR2(1 CHAR),
      COURSE_PASSED_IND                                  VARCHAR2(1 CHAR),
      COURSE_FAILED_IND                                  VARCHAR2(1 CHAR),
      COURSE_WITHDRAWN_IND                               VARCHAR2(1 CHAR),
      PERSON_ID                                          NUMBER,
      MULTI_SRC                                          VARCHAR2(63 CHAR),
      ID                                                 VARCHAR2(63 CHAR),
      FULL_NAME_LFMI                                     VARCHAR2(255 CHAR),
      BIRTH_DATE                                         DATE,
      DECEASED_DATE                                      DATE,
      EMAIL_ADDRESS                                      VARCHAR2(255 CHAR),
      CONFIDENTIALITY_IND                                VARCHAR2(1 CHAR),
      GENDER                                             VARCHAR2(63 CHAR),
      ETHNICITY_CATEGORY                                 VARCHAR2(63 CHAR),
      HISPANIC_LATINO_ETHNICITY_IND                      VARCHAR2(1 CHAR),
      ETHNICITY                                          VARCHAR2(63 CHAR),
      DECEASED_IND                                       VARCHAR2(1 CHAR),
      CITIZENSHIP_IND                                    VARCHAR2(1 CHAR),
      CITIZENSHIP_TYPE                                   VARCHAR2(63 CHAR),
      NATION_OF_CITIZENSHIP                              VARCHAR2(63 CHAR),
      NATION_OF_BIRTH                                    VARCHAR2(63 CHAR),
      PRIMARY_DISABILITY                                 VARCHAR2(63 CHAR),
      LEGACY                                             VARCHAR2(63 CHAR),
      MARITAL_STATUS                                     VARCHAR2(63 CHAR),
      RELIGION                                           VARCHAR2(63 CHAR),
      VETERAN_CATEGORY                                   VARCHAR2(1 CHAR),
      RACE_ETHNICITY_CONFIRM_IND                         VARCHAR2(1 CHAR),
      RACE_ETHNICITY_CONFIRM_DATE                        DATE,
      PHONE_NUMBER_COMBINED                              VARCHAR2(63 CHAR),
      VISA_TYPE                                          VARCHAR2(63 CHAR),
      NATIVE_AMERICAN_OR_ALASKAN_IND                     VARCHAR2(1 CHAR),
      ASIAN_IND                                          VARCHAR2(1 CHAR),
      BLACK_OR_AFRICAN_IND                               VARCHAR2(1 CHAR),
      PACIFIC_ISLANDER_IND                               VARCHAR2(1 CHAR),
      WHITE_IND                                          VARCHAR2(1 CHAR),
      TWO_OR_MORE_IND                                    VARCHAR2(1 CHAR),
      NUMBER_OF_RACES                                    NUMBER,
      MINORITY_IND                                       NUMBER,
      RESIDENT_ALIEN_VISA_COUNT                          NUMBER,
      VETERAN_TYPE                                       VARCHAR2(1 CHAR),
      MAX_ACAD_PER                                       VARCHAR2(63 CHAR),
      ADDRESS_TYPE                                       VARCHAR2(63 CHAR),
      ADDRESS_SEQ_NO                                     NUMBER,
      POSTAL_CODE                                        VARCHAR2(63 CHAR),
      CITY                                               VARCHAR2(63 CHAR),
      COUNTY_CODE                                        VARCHAR2(63 CHAR),
      STATE_PROVINCE                                     VARCHAR2(63 CHAR),
      NATION                                             VARCHAR2(63 CHAR),
      STREET_LINE1                                       VARCHAR2(255 CHAR),
      STREET_LINE2                                       VARCHAR2(255 CHAR),
      STREET_LINE3                                       VARCHAR2(255 CHAR),
      STREET_LINE4                                       VARCHAR2(255 CHAR),
      AC_ACADEMIC_PERIOD                                 VARCHAR2(63 CHAR),
      AC_START_DATE                                      DATE,
      AC_END_DATE                                        DATE,
      AC_YEAR_CODE                                       VARCHAR2(63 CHAR),
      DEVL_COURSE_IND                                    NUMBER
   );

   TYPE tab_student_course_info  IS TABLE OF  student_course_info INDEX BY PLS_INTEGER;
   student_course_info_recs  tab_student_course_info;

function f_getSQL return CLOB is
            retStr  CLOB;
        begin
            retStr := '
          SELECT <REFRESH_IND> NVL(A.MIF_VALUE, <DEF_MULTI_SOURCE_IN>)                       multi_source,
                 A.ZONE_VALUE                                                  process_group,
                 A.DOMAIN_VALUE                                                administrative_group,
                 A.ACADEMIC_PERIOD                                             academic_period,
                 A.SUB_ACADEMIC_PERIOD                                         sub_academic_period,
                 NVL(A.COURSE_IDENTIFICATION, <DEFAULT_NULL_CLEANSE_VALUE>)    course_identification,
                 NVL(A.COURSE_TITLE_SHORT, <DEFAULT_NULL_CLEANSE_VALUE>)       course_title_short,
                 NVL(NVL(A.COURSE_TITLE_LONG,A.COURSE_TITLE_SHORT),
                     <DEFAULT_NULL_CLEANSE_VALUE>)                             course_title_long,
                 A.COURSE_NUMBER                                               course_number,
                 A.SUBJECT                                                     subject,
                 A.COURSE_LEVEL                                                course_level,
                 A.COURSE_CAMPUS                                               course_campus,
                 A.COURSE_COLLEGE                                              course_college,
                 A.COURSE_DIVISION                                             course_division,
                 A.COURSE_DEPARTMENT                                           course_department,
                 A.SCHEDULE_TYPE                                               schedule,
                 A.COURSE_REFERENCE_NUMBER                                     course_reference_number,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                                warehouse_entity_uid,
                 A.PERSON_UID                                                  person_uid,
                 A.INSTRUCTION_METHOD                                          instruction_delivery_mode,
                 NVL(A.GRADE_TYPE,<DEFAULT_NULL_CLEANSE_VALUE>)                grade_type,
                 A.REGISTRATION_STATUS                                         registration_status,
                 A.SECTION_ADD_DATE                                            section_add_date,
                 NVL(A.FINAL_GRADE,<DEFAULT_NULL_CLEANSE_VALUE>)               final_grade,
                 NVL(A.COURSE_CREDITS,0)                                       course_credits,
                 NVL(A.CREDITS_ATTEMPTED,0)                                    course_credits_attempted,
                 NVL(A.CREDITS_EARNED,0)                                       course_credits_earned,
                 NVL(A.CREDITS_PASSED,0)                                       course_credits_passed,
                 NVL(A.CREDITS_FOR_GPA,0)                                      course_credits_for_gpa,
                 NVL(A.QUALITY_POINTS,0)                                       final_grade_quality_points,
                 A.FINAL_GRADE_DATE                                            final_grade_date,
                 NVL(A.MID_TERM_GRADE,<DEFAULT_NULL_CLEANSE_VALUE>)            mid_term_grade,
                 DECODE(A.SPECIAL_APPROVAL_IND, ''Y'',1,0)                       special_approval_ind,
                 DECODE(A.IN_PROGRESS_COURSE_IND, ''Y'',1,0)                     in_progress_course_ind,
                 DECODE(A.INSTITUTION_COURSE_IND, ''Y'',1,0)                     institution_course_ind,
                 DECODE(A.TRANSFER_COURSE_IND, ''Y'',1,0)                        transfer_course_ind,
                 DECODE (A.REPEAT_COURSE_IND,''A'', 1,''E'',1,''I'',1,0)             repeat_course_ind,
                 A.REGISTRATION_STATUS_DATE                                    registration_status_date,
                 A.SECTION_ADD_DATE                                            initial_registration_date,
                 A.REGISTRATION_OVERRIDE_IND                                   registration_override_ind,
                 A.COURSE_REGISTER_IND                                         course_register_ind,
                 A.REGISTER_CENSUS_DATE1_IND                                   register_census_date1_ind,
                 A.REGISTER_CENSUS_DATE2_IND                                   register_census_date2_ind,
                 A.COURSE_ATTEMPTED_IND                                        course_attempted_ind,
                 A.COURSE_PASSED_IND                                           course_passed_ind,
                 A.COURSE_FAILED_IND                                           course_failed_ind,
                 A.WITHDRAWN_IND                                               course_withdrawn_ind,
                 PD.*,
                 AC.ACADEMIC_PERIOD                                            ac_academic_period,
                 AC.START_DATE                                                 ac_start_date,
                 AC.END_DATE                                                   ac_end_date,
                 AC.YEAR_CODE                                                  ac_year_code,
                 NVL(
                 (select 1 from mst_student_course_attribute ca
                          where exists (select ''x''
                                          from MTVPARM M
                                         where M.mtvparm_internal_code_group = ''EDW EXTRACT PARAMETERS''
                                           and M.mtvparm_internal_code = ''DEV_COURSE_ATTRIBUTE''
                                           and M.mtvparm_internal_code_2 = ''DEV_COURSE_ATTRIBUTE''
                                           and M.mtvparm_external_code = ca.course_attribute)
                            and ca.person_uid = a.person_uid
                            and ca.academic_period = a.academic_period
                            /* EB and BLM hard-coded mep below, the dynamic mep join wasnt working */
                            and ca.mif_value = a.mif_value
                            and ca.course_reference_number = a.course_reference_number <MEP_CONDITION_4>)
                     ,0)                                                       devl_course_ind
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_STUDENT_COURSE A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC   <CHANGE_TABLE>
           WHERE <CHANGE_TABLE_CONDITION>
                 (<ACADEMIC_YEAR_IN> = ''ALL''
                 OR (EXISTS (SELECT ''x''
                               FROM MGT_YEAR_TYPE_DEFINITION YTD
                              WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                AND YTD.YEAR_TYPE = ''ACYR''
                                /* EB and BLM hard-coded mep below, the dynamic mep join wasnt working */
                                and ytd.mif_value = a.mif_value
                                AND YTD.YEAR_CODE = <ACADEMIC_YEAR_IN> <MEP_CONDITION_3>
                                )))
             <DEBUG_VAR_LOGIC> AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
             <MEP_CONDITION_1>
             AND AC.YEAR_TYPE(+) = ''ACYR''
             /* EB and BLM hard-coded mep below, the dynamic mep join wasnt working */
             and ac.mif_value(+) = a.mif_value
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+) <MEP_CONDITION_2>
             ';

            retStr := REPLACE(retStr, '<DEFAULT_NULL_CLEANSE_VALUE>', '''' || default_rec.null_cleanse_value || '''' );
            retStr := REPLACE(retStr, '<DEF_MULTI_SOURCE_IN>', '''' || default_rec.multi_source_cleanse_value || '''');
            retStr := REPLACE(retStr, '<DEBUG_VAR_IN>','''' || debug_var_in || '''');
            retStr := REPLACE(retStr, '<ACADEMIC_YEAR_IN>','''' || academic_year_in || '''');

--          Replacing the Debug_Variable related conditional logic
           IF debug_var_in IS NOT NULL THEN
               retStr := REPLACE(retStr, '<DEBUG_VAR_LOGIC>', ' AND (<DEBUG_VAR_IN> IS NULL OR A.PERSON_UID LIKE <DEBUG_VAR_IN>) ');
            ELSE
               retStr := REPLACE(retStr, '<DEBUG_VAR_LOGIC>', NULL );
            END IF;

--          Replacing the MEP related default values and conditional logic
            IF NVL(mep_enabled.MTVPARM_DESC, NULL) = 'Y' THEN
                             retStr := REPLACE(retStr, '<MEP_CONDITION_1>', ' AND NVL(A.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) =  PD.MULTI_SRC ');
              --BLM commented out next line, put in above line -- to fix student course, look into this later
              -- retStr := REPLACE(retStr, '<MEP_CONDITION_1>', ' AND 1 = 1; --EAB and BMACK to correct issue with WCV_EXTR_PERSON_DETAIL ');
               retStr := REPLACE(retStr, '<MEP_CONDITION_2>', ' AND NVL(A.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = NVL(AC.MIF_VALUE(+), <DEF_MULTI_SOURCE_IN>)  ');
               retStr := REPLACE(retStr, '<MEP_CONDITION_3>', ' AND NVL(A.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = NVL(YTD.MIF_VALUE, <DEF_MULTI_SOURCE_IN>)  ');
               retStr := REPLACE(retStr, '<MEP_CONDITION_4>', ' AND nvl(ca.mif_value, '' '') = nvl(a.mif_value,'' '')  ');
            ELSE
               retStr := REPLACE(retStr, '<MEP_CONDITION_1>', NULL );
               retStr := REPLACE(retStr, '<MEP_CONDITION_2>', NULL );
               retStr := REPLACE(retStr, '<MEP_CONDITION_3>', NULL );
               retStr := REPLACE(retStr, '<MEP_CONDITION_4>', NULL );
            END IF;
            retStr := REPLACE(retStr, '<DEF_MULTI_SOURCE_IN>', '''' || default_rec.multi_source_cleanse_value || '''' );

--         Populating the change table related logic based on the LOAD or REFRESH process
            IF process_ind_in = 'L' THEN
               retStr := REPLACE(retStr, '<REFRESH_IND>',NULL);
               retStr := REPLACE(retStr, '<CHANGE_TABLE>',NULL);
               retStr := REPLACE(retStr, '<CHANGE_TABLE_CONDITION>',NULL);
            ELSE
               retStr := REPLACE(retStr, '<REFRESH_IND>', ' DISTINCT ');
               retStr := REPLACE(retStr, '<CHANGE_TABLE>',', CHG_STUDENT_COURSE CHG');
               retStr := REPLACE(retStr, '<CHANGE_TABLE_CONDITION>',
                                           ' (  (CHG.PERSON_UID = A.PERSON_UID AND CHG.COURSE_REFERENCE_NUMBER IS NULL)
                                                OR (CHG.PERSON_UID IS NULL AND CHG.COURSE_REFERENCE_NUMBER = A.COURSE_REFERENCE_NUMBER)
                                                OR (CHG.PERSON_UID = A.PERSON_UID AND CHG.COURSE_REFERENCE_NUMBER = A.COURSE_REFERENCE_NUMBER))
                                             AND ');
            END IF;
            retStr := REPLACE(retStr, '<DEFAULT_NULL_CLEANSE_VALUE>', '''' || default_rec.null_cleanse_value || '''' );
            retStr := REPLACE(retStr, '<DEF_MULTI_SOURCE_IN>', '''' || default_rec.multi_source_cleanse_value || '''');
            retStr := REPLACE(retStr, '<DEBUG_VAR_IN>','''' || debug_var_in || '''');
            retStr := REPLACE(retStr, '<ACADEMIC_YEAR_IN>','''' || academic_year_in || '''');
            return retStr;
    end f_getSQL;

--
--
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_STUDENT_COURSE', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_STUDENT_COURSE', 'WFT_STUDENT_COURSE', 'PERSON_UID');
          edw_general_extr.p_delete_fact_records('CHG_STUDENT_COURSE', 'WFT_STUDENT_COURSE', 'COURSE_REFERENCE_NUMBER', 'WDT_COURSE_REFERENCE_NUMBER', NULL);
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','MEP_ENABLED','MEP_ENABLED');
    FETCH edw_general_extr.get_mtvparm INTO mep_enabled;
    CLOSE edw_general_extr.get_mtvparm;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','NULL_SECTION','NULL_SECTION_VALUE');
    FETCH edw_general_extr.get_mtvparm INTO parm_rec;
    CLOSE edw_general_extr.get_mtvparm;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--

    sqlStmt := f_getSQL( );
--    f_insert(sqlstmt);

    OPEN get_student_course_info FOR sqlStmt;
--    c_ := DBMS_SQL.to_cursor_number(get_student_course_info);
--    OPEN get_student_course_info(default_rec.multi_source_cleanse_value, process_ind_in, process_date);
    LOOP
       FETCH get_student_course_info BULK COLLECT INTO student_course_info_recs LIMIT bulk_size;
       EXIT WHEN student_course_info_recs.COUNT = 0;
--
       FOR i IN student_course_info_recs.FIRST..student_course_info_recs.LAST
       LOOP
--
          OPEN get_course_offering(default_rec.multi_source_cleanse_value, student_course_info_recs(i).multi_source, student_course_info_recs(i).course_reference_number, student_course_info_recs(i).academic_period);
          FETCH get_course_offering INTO course_off_rec;
          CLOSE get_course_offering;
--
          OPEN get_course_catalog(default_rec.multi_source_cleanse_value, student_course_info_recs(i).multi_source, student_course_info_recs(i).subject, student_course_info_recs(i).course_number, student_course_info_recs(i).academic_period);
          FETCH get_course_catalog INTO course_catalog_rec;
          CLOSE get_course_catalog;
--
          OPEN get_course_suppl(default_rec.multi_source_cleanse_value, student_course_info_recs(i).multi_source, student_course_info_recs(i).subject, student_course_info_recs(i).course_number, student_course_info_recs(i).academic_period);
          FETCH get_course_suppl INTO course_suppl_rec;
          CLOSE get_course_suppl;
--
          OPEN get_instructor(default_rec.multi_source_cleanse_value, student_course_info_recs(i).multi_source, student_course_info_recs(i).course_reference_number, student_course_info_recs(i).academic_period, 'Y');
          FETCH get_instructor INTO inst_rec;
          CLOSE get_instructor;
--
          OPEN get_fact_dept_college(default_rec.multi_source_cleanse_value, student_course_info_recs(i).multi_source, inst_rec.instructor_uid, student_course_info_recs(i).academic_period);
          FETCH get_fact_dept_college INTO fact_dpt_clg_rec;
          CLOSE get_fact_dept_college;
--
          OPEN GET_GRADE_CHANGE_CNT(default_rec.multi_source_cleanse_value, student_course_info_recs(i).multi_source, student_course_info_recs(i).person_uid, student_course_info_recs(i).academic_period, student_course_info_recs(i).course_reference_number);
          FETCH GET_GRADE_CHANGE_CNT INTO grd_chg_cnt_rec;
          CLOSE GET_GRADE_CHANGE_CNT;
--
          OPEN GET_GRADE_CHANGE(default_rec.multi_source_cleanse_value, student_course_info_recs(i).multi_source, student_course_info_recs(i).person_uid, student_course_info_recs(i).academic_period, student_course_info_recs(i).course_reference_number);
          FETCH GET_GRADE_CHANGE INTO grd_chg_rec;
          CLOSE GET_GRADE_CHANGE;
--
          OPEN get_devl_course_attr_ind(default_rec.multi_source_cleanse_value, student_course_info_recs(i).multi_source, student_course_info_recs(i).person_uid, student_course_info_recs(i).academic_period, student_course_info_recs(i).course_reference_number);
          FETCH get_devl_course_attr_ind INTO devl_course_ind;
          CLOSE get_devl_course_attr_ind;
--
--     multi source
          ret_row.multi_source := student_course_info_recs(i).multi_source;
          ret_row.process_group := student_course_info_recs(i).process_group;
          ret_row.administrative_group := student_course_info_recs(i).administrative_group;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.msrc_user_attribute_01 := NULL;
          ret_row.msrc_user_attribute_01 := ret_row.multi_source;
          ret_row.msrc_user_attribute_02 := NULL;
          ret_row.msrc_user_attribute_03 := NULL;
          ret_row.msrc_user_attribute_04 := NULL;
          ret_row.msrc_user_attribute_05 := NULL;
--     academic time
          ret_row.academic_period := student_course_info_recs(i).ac_academic_period;
          ret_row.academic_period_begin_date := student_course_info_recs(i).ac_start_date;
          ret_row.academic_period_end_date := student_course_info_recs(i).ac_end_date;
          ret_row.academic_year := student_course_info_recs(i).ac_year_code;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.atim_user_attribute_01 := NULL;
          ret_row.atim_user_attribute_01 := ret_row.multi_source;
          ret_row.atim_user_attribute_02 := NULL;
          ret_row.atim_user_attribute_03 := NULL;
          ret_row.atim_user_attribute_04 := NULL;
          ret_row.atim_user_attribute_05 := NULL;
--     Sub Academic Period
          ret_row.sub_academic_period := student_course_info_recs(i).sub_academic_period;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.sapd_user_attribute_01 := NULL;
          ret_row.sapd_user_attribute_01 := ret_row.multi_source;
          ret_row.sapd_user_attribute_02 := NULL;
          ret_row.sapd_user_attribute_03 := NULL;
          ret_row.sapd_user_attribute_04 := NULL;
          ret_row.sapd_user_attribute_05 := NULL;
--     Course
          ret_row.course_identification := student_course_info_recs(i).course_identification;
          ret_row.course_title_short := student_course_info_recs(i).course_title_short;
          ret_row.course_title_long := student_course_info_recs(i).course_title_long;
          ret_row.course_number := student_course_info_recs(i).course_number;
          ret_row.program_classification := course_catalog_rec.program_classification;
          ret_row.subject := student_course_info_recs(i).subject;
          ret_row.course_level := student_course_info_recs(i).course_level;
          ret_row.course_campus := student_course_info_recs(i).course_campus;
          ret_row.course_college := student_course_info_recs(i).course_college;
          ret_row.course_division := student_course_info_recs(i).course_division;
          ret_row.course_department := student_course_info_recs(i).course_department;
          ret_row.session_type := course_off_rec.student_meeting_time;
          CASE
          WHEN course_catalog_rec.continuing_education_ind = 'Y' THEN ret_row.continuing_education_ind := 1;
          ELSE ret_row.continuing_education_ind := 0;
          END CASE;
          CASE
          WHEN course_suppl_rec.cooperative_education_ind = 'Y' THEN ret_row.cooperative_education_ind := 1;
          ELSE ret_row.cooperative_education_ind := 0;
          END CASE;
          ret_row.schedule := student_course_info_recs(i).schedule;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.crse_user_attribute_01 := NULL;
          ret_row.crse_user_attribute_01 := ret_row.multi_source;
          ret_row.crse_user_attribute_02 := NULL;
          ret_row.crse_user_attribute_03 := NULL;
          ret_row.crse_user_attribute_04 := NULL;
          ret_row.crse_user_attribute_05 := NULL;
--     Course Reference Number
          ret_row.course_reference_number := student_course_info_recs(i).course_reference_number;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.crnb_user_attribute_01 := NULL;
          ret_row.crnb_user_attribute_01 := ret_row.multi_source;
          ret_row.crnb_user_attribute_02 := NULL;
          ret_row.crnb_user_attribute_03 := NULL;
          ret_row.crnb_user_attribute_04 := NULL;
          ret_row.crnb_user_attribute_05 := NULL;
--     Demographic
          ret_row.gender := student_course_info_recs(i).gender;
          ret_row.ethnicity_category := student_course_info_recs(i).ethnicity_category;
          ret_row.hispanic_latino_ethn_ind := student_course_info_recs(i).hispanic_latino_ethnicity_ind;
          ret_row.asian_ind := student_course_info_recs(i).asian_ind;
          ret_row.native_amer_or_alaskan_ind := student_course_info_recs(i).native_american_or_alaskan_ind;
          ret_row.black_or_african_ind := student_course_info_recs(i).black_or_african_ind;
          ret_row.pacific_islander_ind := student_course_info_recs(i).pacific_islander_ind;
          ret_row.white_ind := student_course_info_recs(i).white_ind;
          IF student_course_info_recs(i).number_of_races = 0 and student_course_info_recs(i).resident_alien_visa_count > 0 THEN
             ret_row.non_resident_ind := 'Y';
          ELSE
             ret_row.non_resident_ind := 'N';
          END IF;
          IF NVL(student_course_info_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND
             student_course_info_recs(i).number_of_races = 0 AND
             student_course_info_recs(i).resident_alien_visa_count = 0 THEN
             ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
          ELSE
             ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
          END IF;
          ret_row.two_or_more_ind := student_course_info_recs(i).two_or_more_ind;
          ret_row.race_ethnicity_confirm_ind := student_course_info_recs(i).race_ethnicity_confirm_ind;
          ret_row.minority_ind := student_course_info_recs(i).minority_ind;
          ret_row.ethnicity := student_course_info_recs(i).ethnicity;
          ret_row.deceased_ind := student_course_info_recs(i).deceased_ind;
          ret_row.citizenship_ind := student_course_info_recs(i).citizenship_ind;
          ret_row.citizenship_type := student_course_info_recs(i).citizenship_type;
          ret_row.visa_type := student_course_info_recs(i).visa_type;
          ret_row.nation_of_citizenship := student_course_info_recs(i).nation_of_citizenship;
          ret_row.nation_of_birth := student_course_info_recs(i).nation_of_birth;
          ret_row.primary_disability := student_course_info_recs(i).primary_disability;
          ret_row.legacy := student_course_info_recs(i).legacy;
          ret_row.marital_status := student_course_info_recs(i).marital_status;
          ret_row.religion := student_course_info_recs(i).religion;
          ret_row.veteran_type := student_course_info_recs(i).veteran_type;
          ret_row.veteran_category := student_course_info_recs(i).veteran_category;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.demo_user_attribute_01 := NULL;
          ret_row.demo_user_attribute_01 := ret_row.multi_source;
          ret_row.demo_user_attribute_02 := NULL;
          ret_row.demo_user_attribute_03 := NULL;
          ret_row.demo_user_attribute_04 := NULL;
          ret_row.demo_user_attribute_05 := NULL;
--     person
          ret_row.person_uid := student_course_info_recs(i).warehouse_entity_uid;
          ret_row.id := student_course_info_recs(i).id;
          ret_row.full_name_lfmi := student_course_info_recs(i).full_name_lfmi;
          ret_row.birth_date := student_course_info_recs(i).birth_date;
          ret_row.deceased_date := student_course_info_recs(i).deceased_date;
          ret_row.email_address := student_course_info_recs(i).email_address;
          ret_row.phone_number_combined := student_course_info_recs(i).phone_number_combined;
          ret_row.confidentiality_ind := student_course_info_recs(i).confidentiality_ind;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.pers_user_attribute_01 := NULL;
          ret_row.pers_user_attribute_01 := ret_row.multi_source;
          ret_row.pers_user_attribute_02 := NULL;
          ret_row.pers_user_attribute_03 := NULL;
          ret_row.pers_user_attribute_04 := NULL;
          ret_row.pers_user_attribute_05 := NULL;
--     course_section
          ret_row.course_section := course_off_rec.offering_number;
          ret_row.instruction_delivery_mode := student_course_info_recs(i).instruction_delivery_mode;
          ret_row.gradable_ind := case when course_off_rec.gradable_ind = 'Y' then 1 else 0 end;
          ret_row.section_cross_list := course_off_rec.section_cross_list;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.crsn_user_attribute_01   := NULL;
          ret_row.crsn_user_attribute_01   := ret_row.multi_source;
          ret_row.crsn_user_attribute_02   := NULL;
          ret_row.crsn_user_attribute_03   := NULL;
          ret_row.crsn_user_attribute_04   := NULL;
          ret_row.crsn_user_attribute_05   := NULL;
--     instructor
          ret_row.instructor_uid := NVL(inst_rec.warehouse_entity_uid, 0);
          ret_row.instructor_name :=NVL(inst_rec.instructor_name, default_rec.null_cleanse_value);
          ret_row.home_college := fact_dpt_clg_rec.home_college;
          ret_row.home_department := fact_dpt_clg_rec.home_department;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.inst_user_attribute_01 := NULL;
          ret_row.inst_user_attribute_01 := ret_row.multi_source;
          ret_row.inst_user_attribute_02 := NULL;
          ret_row.inst_user_attribute_03 := NULL;
          ret_row.inst_user_attribute_04 := NULL;
          ret_row.inst_user_attribute_05 := NULL;
--     registration
          ret_row.GRADE_TYPE := student_course_info_recs(i).GRADE_TYPE;
          ret_row.REGISTRATION_STATUS := student_course_info_recs(i).REGISTRATION_STATUS;
          CASE WHEN student_course_info_recs(i).registration_override_ind = 'Y' THEN
             ret_row.registration_override_ind := 1;
          ELSE
             ret_row.registration_override_ind := 0;
          END CASE;
          CASE WHEN student_course_info_recs(i).transfer_course_ind = 1 THEN
             ret_row.course_register_ind := 0;
             ret_row.course_dropped_ind := 0;
          ELSE  -- current registration or academic history course
             CASE WHEN student_course_info_recs(i).course_register_ind = 'Y' THEN
                ret_row.course_register_ind := 1;
                ret_row.course_dropped_ind := 0;
             ELSE
                ret_row.course_register_ind := 0;
                ret_row.course_dropped_ind := 1;
             END CASE;
          END CASE;
          CASE WHEN student_course_info_recs(i).register_census_date1_ind = 'Y' THEN
             ret_row.register_census_date1_ind := 1;
          WHEN student_course_info_recs(i).register_census_date1_ind = 'N' THEN
             ret_row.register_census_date1_ind := 0;
          ELSE
             ret_row.register_census_date1_ind := -1;
          END CASE;
          CASE WHEN student_course_info_recs(i).register_census_date2_ind = 'Y' THEN
             ret_row.register_census_date2_ind := 1;
          WHEN student_course_info_recs(i).register_census_date2_ind = 'N' THEN
             ret_row.register_census_date2_ind := 0;
          ELSE
             ret_row.register_census_date2_ind := -1;
          END CASE;
          CASE WHEN student_course_info_recs(i).course_attempted_ind = 'Y' THEN
             ret_row.course_attempted_ind := 1;
          ELSE
             ret_row.course_attempted_ind := 0;
          END CASE;
          CASE WHEN student_course_info_recs(i).course_passed_ind = 'Y' THEN
             ret_row.course_passed_ind := 1;
          ELSE
             ret_row.course_passed_ind := 0;
          END CASE;
          CASE WHEN student_course_info_recs(i).course_withdrawn_ind = 'Y' THEN
             ret_row.course_withdrawn_ind := 1;
          ELSE
             ret_row.course_withdrawn_ind := 0;
          END CASE;
          CASE WHEN student_course_info_recs(i).course_failed_ind = 'Y' THEN
             ret_row.course_failed_ind := 1;
          ELSE
             ret_row.course_failed_ind := 0;
          END CASE;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.regi_user_attribute_01 := NULL;
          ret_row.regi_user_attribute_01 := ret_row.multi_source;
          ret_row.regi_user_attribute_02 := NULL;
          ret_row.regi_user_attribute_03 := NULL;
          ret_row.regi_user_attribute_04 := NULL;
          ret_row.regi_user_attribute_05 := NULL;
--     Grade Change
          ret_row.grade_change_reason := grd_chg_rec.grade_change_reason;
          ret_row.grade_comment       := grd_chg_rec.grade_comment;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.gchg_user_attribute_01 := NULL;
          ret_row.gchg_user_attribute_01 := ret_row.multi_source;
          ret_row.gchg_user_attribute_02 := NULL;
          ret_row.gchg_user_attribute_03 := NULL;
          ret_row.gchg_user_attribute_04 := NULL;
          ret_row.gchg_user_attribute_05 := NULL;
--     measures
          IF student_course_info_recs(i).course_attempted_ind = 'Y' THEN
            ret_row.course_attempted_headcount := student_course_info_recs(i).warehouse_entity_uid;
          END IF;
          IF student_course_info_recs(i).course_register_ind = 'Y' THEN
             ret_row.course_registered_headcount := student_course_info_recs(i).warehouse_entity_uid;
          ELSIF (student_course_info_recs(i).course_register_ind = 'N' AND student_course_info_recs(i).transfer_course_ind = 0) THEN
             ret_row.course_dropped_headcount := student_course_info_recs(i).warehouse_entity_uid;
          END IF;
--
          CASE WHEN student_course_info_recs(i).IN_PROGRESS_COURSE_IND = 1 THEN ret_row.course_intregistered_headcount := student_course_info_recs(i).warehouse_entity_uid;
               WHEN student_course_info_recs(i).INSTITUTION_COURSE_IND = 1 THEN ret_row.course_intregistered_headcount := student_course_info_recs(i).warehouse_entity_uid;
               ELSE NULL;
          END CASE;
--
          IF student_course_info_recs(i).course_passed_ind = 'Y' THEN
             ret_row.course_passed_headcount := student_course_info_recs(i).warehouse_entity_uid;
          END IF;
          IF student_course_info_recs(i).course_withdrawn_ind = 'Y' THEN
             ret_row.course_withdrawn_headcount := student_course_info_recs(i).warehouse_entity_uid;
          END IF;
          IF student_course_info_recs(i).course_failed_ind = 'Y' THEN
             ret_row.COURSE_FAILED_HEADCOUNT := student_course_info_recs(i).warehouse_entity_uid;
          END IF;
          ret_row.COURSE_CREDITS := student_course_info_recs(i).COURSE_CREDITS;
          ret_row.COURSE_CREDITS_ATTEMPTED := student_course_info_recs(i).COURSE_CREDITS_ATTEMPTED;
          ret_row.COURSE_CREDITS_EARNED := student_course_info_recs(i).COURSE_CREDITS_EARNED;
          ret_row.COURSE_CREDITS_PASSED := student_course_info_recs(i).COURSE_CREDITS_PASSED ;
          ret_row.COURSE_CREDITS_FOR_GPA := student_course_info_recs(i).COURSE_CREDITS_FOR_GPA;
          ret_row.FINAL_GRADE_QUALITY_POINTS := student_course_info_recs(i).FINAL_GRADE_QUALITY_POINTS;
          ret_row.FINAL_GRADE := student_course_info_recs(i).FINAL_GRADE;
          ret_row.FINAL_GRADE_DATE := trunc(nvl(student_course_info_recs(i).FINAL_GRADE_DATE, '31-DEC-2099')) ;
          ret_row.GRADE_CHANGE_COUNT :=grd_chg_cnt_rec.count_no;
          ret_row.MID_TERM_GRADE := student_course_info_recs(i).MID_TERM_GRADE;
          ret_row.SPECIAL_APPROVAL_IND := student_course_info_recs(i).SPECIAL_APPROVAL_IND;
          ret_row.IN_PROGRESS_COURSE_IND := student_course_info_recs(i).IN_PROGRESS_COURSE_IND;
          ret_row.INSTITUTION_COURSE_IND := student_course_info_recs(i).INSTITUTION_COURSE_IND;
          ret_row.TRANSFER_COURSE_IND := student_course_info_recs(i).TRANSFER_COURSE_IND;
          CASE WHEN student_course_info_recs(i).IN_PROGRESS_COURSE_IND = 1 THEN ret_row.SOURCE_TYPE := lv_registration;
              WHEN student_course_info_recs(i).INSTITUTION_COURSE_IND = 1 THEN ret_row.SOURCE_TYPE := lv_history;
              WHEN student_course_info_recs(i).TRANSFER_COURSE_IND = 1 THEN ret_row.SOURCE_TYPE := lv_transfer;
              ELSE NULL;
          END CASE;
          ret_row.REPEAT_COURSE_IND := student_course_info_recs(i).REPEAT_COURSE_IND;
          ret_row.developmental_course_ind := NVL(student_course_info_recs(i).devl_course_ind, 0);
          ret_row.REGISTRATION_STATUS_DATE := TRUNC(NVL(student_course_info_recs(i).REGISTRATION_STATUS_DATE, '31-DEC-2099'));
          ret_row.INITIAL_REGISTRATION_DATE := TRUNC(NVL(student_course_info_recs(i).INITIAL_REGISTRATION_DATE, '31-DEC-2099'));
          ret_row.course_identification_section := student_course_info_recs(i).course_identification || '_' || NVL(course_off_rec.offering_number, parm_rec.mtvparm_external_code);
          ret_row.user_measure_01 := NULL;
          ret_row.user_measure_02 := NULL;
          ret_row.user_measure_03 := NULL;
          ret_row.user_measure_04 := NULL;
          ret_row.user_measure_05 := NULL;
          ret_row.system_load_process := 'STUDENT_COURSE';
--
          PIPE ROW(ret_row);
--
          ret_row := ret_row_init;
          course_off_rec := course_off_rec_init;
          course_catalog_rec := course_catalog_rec_init;
          course_suppl_rec := course_suppl_rec_init;
          inst_rec := inst_rec_init;
          fact_dpt_clg_rec := fact_dpt_clg_rec_init;
          grd_chg_cnt_rec := grd_chg_cnt_rec_init;
          grd_chg_rec := grd_chg_rec_init;
          devl_course_ind := 0;
          --
      END LOOP; -- student_course_rec
--
   END LOOP;
--
   CLOSE get_student_course_info;
--
   RETURN;

  END f_get_student_course;
/******************************************************************************/
procedure p_get_student(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL, start_id NUMBER, end_id NUMBER,
                                        jobNumber  IN BINARY_INTEGER DEFAULT NULL, jobUser VARCHAR2  DEFAULT NULL) IS
--
    ret_row                             WTT_STUDENT_INPUT%ROWTYPE;
    ret_row_init                        WTT_STUDENT_INPUT%ROWTYPE;
    default_rec                         WCV_DEFAULT_VALUES%ROWTYPE;
    georegion_rec                       MGT_GEOGRAPHIC_REGION%ROWTYPE;
    georegion_rec_init                  MGT_GEOGRAPHIC_REGION%ROWTYPE;
    fa_year_rec                         MGT_STUDENT_PERIOD_DEFINITION%ROWTYPE;
    fa_year_rec_init                    MGT_STUDENT_PERIOD_DEFINITION%ROWTYPE;
    admins_appl_rec                     MST_ADMISSIONS_APPLICATION%ROWTYPE;
    admins_appl_rec_init                MST_ADMISSIONS_APPLICATION%ROWTYPE;
    finaid_appl_amt_rec                 EDW_FINAID_EXTR.GET_FINAID_APPL_AMT%ROWTYPE;
    finaid_appl_amt_rec_init            EDW_FINAID_EXTR.GET_FINAID_APPL_AMT%ROWTYPE;
    finaid_appl_need_rec                EDW_FINAID_EXTR.GET_FINAID_APPL_NEEDS%ROWTYPE;
    finaid_appl_need_rec_init           EDW_FINAID_EXTR.GET_FINAID_APPL_NEEDS%ROWTYPE;
    offer_composition_amt_rec           EDW_FINAID_EXTR.GET_TOTAL_OFFER_AMTS_ACAD_PDS%ROWTYPE;
    offer_composition_amt_rec_init      EDW_FINAID_EXTR.GET_TOTAL_OFFER_AMTS_ACAD_PDS%ROWTYPE;
    application_ind_rec                 EDW_FINAID_EXTR.GET_APPLICATION_IND%ROWTYPE;
    application_ind_rec_init            EDW_FINAID_EXTR.GET_APPLICATION_IND%ROWTYPE;
    gpa_by_term_rec                     GET_GPA_BY_TERM%ROWTYPE;
    gpa_by_term_rec_init                GET_GPA_BY_TERM%ROWTYPE;
    prev_acad_period_gpa_rec            GET_PREV_ACAD_PERIOD_GPA%ROWTYPE;
    prev_acad_period_gpa_rec_init       GET_PREV_ACAD_PERIOD_GPA%ROWTYPE;
    stud_crse_info_rec                  GET_STUD_CRSE_INFO%ROWTYPE;
    stud_crse_info_rec_init             GET_STUD_CRSE_INFO%ROWTYPE;
    ret_seq_rec                         GET_RET_SEQ%ROWTYPE;
    ret_seq_rec_init                    GET_RET_SEQ%ROWTYPE;
    ret_seq_acad_period_rec             MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    ret_seq_acad_period_rec_init        MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    ret_like_acad_period_rec            MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    ret_like_acad_period_rec_init       MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    acad_per_first_last_rec             GET_ACD_PER_FIRST_LAST%ROWTYPE;
    acad_per_first_last_rec_init        GET_ACD_PER_FIRST_LAST%ROWTYPE;
    acad_period_count_rec               GET_ACAD_PERIOD_COUNT%ROWTYPE;
    acad_period_count_rec_init          GET_ACAD_PERIOD_COUNT%ROWTYPE;
    acad_period_tot_count_rec           GET_ACAD_PERIOD_COUNT%ROWTYPE;
    acad_period_tot_count_rec_init      GET_ACAD_PERIOD_COUNT%ROWTYPE;
    major_count_rec                     GET_MAJOR_COUNTS%ROWTYPE;
    major_count_init_rec                GET_MAJOR_COUNTS%ROWTYPE;
    ret_seq_ind_rec                     REC_RET_IND;
    ret_seq_ind_rec_init                REC_RET_IND;
    ret_like_ind_rec                    REC_RET_IND;
    ret_like_ind_rec_init               REC_RET_IND;
    acad_time_first_per_rec             EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_first_per_rec_init        EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_last_per_rec              EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_time_last_per_rec_init         EDW_GENERAL_EXTR.GET_YEAR_TYPE%ROWTYPE;
    acad_outcome_rec                    GET_ACAD_OUTCOME%ROWTYPE;
    acad_outcome_rec_init               GET_ACAD_OUTCOME%ROWTYPE;
    null_nation_rec                     MTVPARM%ROWTYPE;
    region_rec                          MTVPARM%ROWTYPE;
    addend_rec                          MTVPARM%ROWTYPE;
    pattern_rec                         MTVPARM%ROWTYPE;
    addend_val                          MTVPARM.MTVPARM_EXTERNAL_CODE%TYPE;
    academic_period_like                MGT_YEAR_TYPE_DEFINITION.ACADEMIC_PERIOD%TYPE;
--
    get_student_info             SYS_REFCURSOR;
    sqlStmt                          CLOB;
    mep_enabled                  MTVPARM%ROWTYPE;
--
    jobDate         DATE;
--
    TYPE student IS RECORD (
        MULTI_SOURCE                                        VARCHAR2(63 CHAR),
        PROCESS_GROUP                                       VARCHAR2(255 CHAR),
        ADMINISTRATIVE_GROUP                                VARCHAR2(255 CHAR),
        ACADEMIC_PERIOD_START                               VARCHAR2(63 CHAR),
        academic_period_end                                 VARCHAR2(63 CHAR),
        student_population                                  VARCHAR2(63 CHAR),
        admissions_population                               VARCHAR2(63 CHAR),
        intended_time_status                                VARCHAR2(1 CHAR),
        education_goal                                      VARCHAR2(63 CHAR),
        education_level                                     VARCHAR2(63 CHAR),
        residency                                           VARCHAR2(63 CHAR),
        residency_ind                                       VARCHAR2(1 CHAR),
        site                                                VARCHAR2(63 CHAR),
        rate                                                VARCHAR2(63 CHAR),
        person_uid                                          NUMBER,
        student_status                                      VARCHAR2(63 CHAR),
        leave_reason                                        VARCHAR2(63 CHAR),
        degree_award_category                               VARCHAR2(63 CHAR),
        program_level                                       VARCHAR2(63 CHAR),
        program                                             VARCHAR2(63 CHAR),
        campus                                              VARCHAR2(63 CHAR),
        college                                             VARCHAR2(63 CHAR),
        degree                                              VARCHAR2(63 CHAR),
        major                                               VARCHAR2(63 CHAR),
        program_classification                              VARCHAR2(63 CHAR),
        department                                          VARCHAR2(63 CHAR),
        second_major                                        VARCHAR2(63 CHAR),
        second_prog_classification                          VARCHAR2(63 CHAR),
        second_department                                   VARCHAR2(63 CHAR),
        student_level                                       VARCHAR2(63 CHAR),
        permit_registration                                 VARCHAR2(1 CHAR),
        matriculated_ind                                    VARCHAR2(1 CHAR),
        award_category                                      VARCHAR2(63 CHAR),
        graduate_credit_elig_ind                            VARCHAR2(1 CHAR),
        program_number                                      VARCHAR2(3 CHAR),
        curriculum_priority                                 NUMBER,
        student_fte                                         NUMBER,
        fte_divisor                                         NUMBER,
        age_admitted                                        NUMBER,
        leave_date_from                                     DATE,
        leave_date_to                                       DATE,
        start_date_matriculated                             DATE,
        start_date_admitted                                 DATE,
        start_date                                          DATE,
        expected_graduation_date                            DATE,
        acad_study_registered_in_count                      NUMBER,
        outcome_number                                      NUMBER,
        academic_period_admitted                            VARCHAR2(63 CHAR),
        warehouse_entity_uid                                NUMBER,
        max_enrl_period                                     VARCHAR2(63 CHAR),
        PERSON_ID                                           NUMBER,
        MULTI_SRC                                           VARCHAR2(63 CHAR),
        ID                                                  VARCHAR2(63 CHAR),
        FULL_NAME_LFMI                                      VARCHAR2(255 CHAR),
        BIRTH_DATE                                          DATE,
        DECEASED_DATE                                       DATE,
        EMAIL_ADDRESS                                       VARCHAR2(255 CHAR),
        CONFIDENTIALITY_IND                                 VARCHAR2(1 CHAR),
        GENDER                                              VARCHAR2(63 CHAR),
        ETHNICITY_CATEGORY                                  VARCHAR2(63 CHAR),
        HISPANIC_LATINO_ETHNICITY_IND                       VARCHAR2(1 CHAR),
        ETHNICITY                                           VARCHAR2(63 CHAR),
        DECEASED_IND                                        VARCHAR2(1 CHAR),
        CITIZENSHIP_IND                                     VARCHAR2(1 CHAR),
        CITIZENSHIP_TYPE                                    VARCHAR2(63 CHAR),
        NATION_OF_CITIZENSHIP                               VARCHAR2(63 CHAR),
        NATION_OF_BIRTH                                     VARCHAR2(63 CHAR),
        PRIMARY_DISABILITY                                  VARCHAR2(63 CHAR),
        LEGACY                                              VARCHAR2(63 CHAR),
        MARITAL_STATUS                                      VARCHAR2(63 CHAR),
        RELIGION                                            VARCHAR2(63 CHAR),
        VETERAN_CATEGORY                                    VARCHAR2(1 CHAR),
        RACE_ETHNICITY_CONFIRM_IND                          VARCHAR2(1 CHAR),
        RACE_ETHNICITY_CONFIRM_DATE                         DATE,
        PHONE_NUMBER_COMBINED                               VARCHAR2(63 CHAR),
        VISA_TYPE                                           VARCHAR2(63 CHAR),
        NATIVE_AMERICAN_OR_ALASKAN_IND                      VARCHAR2(1 CHAR),
        ASIAN_IND                                           VARCHAR2(1 CHAR),
        BLACK_OR_AFRICAN_IND                                VARCHAR2(1 CHAR),
        PACIFIC_ISLANDER_IND                                VARCHAR2(1 CHAR),
        WHITE_IND                                           VARCHAR2(1 CHAR),
        TWO_OR_MORE_IND                                     VARCHAR2(1 CHAR),
        NUMBER_OF_RACES                                     NUMBER,
        MINORITY_IND                                        NUMBER,
        RESIDENT_ALIEN_VISA_COUNT                           NUMBER,
        VETERAN_TYPE                                        VARCHAR2(1 CHAR),
        MAX_ACAD_PER                                        VARCHAR2(63 CHAR),
        ADDRESS_TYPE                                        VARCHAR2(63 CHAR),
        ADDRESS_SEQ_NO                                      NUMBER,
        POSTAL_CODE                                         VARCHAR2(63 CHAR),
        CITY                                                VARCHAR2(63 CHAR),
        COUNTY_CODE                                         VARCHAR2(63 CHAR),
        STATE_PROVINCE                                      VARCHAR2(63 CHAR),
        NATION                                              VARCHAR2(63 CHAR),
        STREET_LINE1                                        VARCHAR2(255 CHAR),
        STREET_LINE2                                        VARCHAR2(255 CHAR),
        STREET_LINE3                                        VARCHAR2(255 CHAR),
        STREET_LINE4                                        VARCHAR2(255 CHAR) );

    student_rec  student;
    student_rec_init  student;
--
    CURSOR fill_academic_periods(def_multi_source_in VARCHAR2,
                                 multi_source_in     VARCHAR2,
                                 person_in           NUMBER,
                                 level_in            VARCHAR2,
                                 college_in          VARCHAR2,
                                 program_in          VARCHAR2,
                                 campus_in           VARCHAR2,
                                 acad_prd_start_in   VARCHAR2,
                                 acad_prd_end_in     VARCHAR2,
                                 acad_prd_admit_in   VARCHAR2,
                                 max_enrl_prd_in     VARCHAR2) IS
SELECT * FROM (
         SELECT Y.ACADEMIC_PERIOD                         academic_period,
                Y.YEAR_CODE                               year_code,
                Y.START_DATE                              start_date,
                Y.END_DATE                                end_date,
                Y.ACADEMIC_PERIOD_DESC                    academic_period_desc,
                E.HOUSING_IND                             housing_ind,
                E.DEANS_LIST_VALUE                        deans_list_value,
                NVL(E.ENROLLED_IND, 'N')                  enrolled_ind,
                NVL(E.REGISTERED_IND,'N')                 registered_ind,
                E.WITHDRAWAL_REASON                       withdrawal_reason,
                E.WITHDRAWN_IND                           withdrawn_ind,
                E.EXTERNAL_WITHDRAWN_IND                  external_withdrawn_ind,
                E.CURRENT_TIME_STATUS                     current_time_status,
                E.CURRENT_TIME_STATUS_DATE                current_time_status_date,
                E.ENROLLMENT_STATUS                       enrollment_status,
                E.TRANSFER_TO_INSTITUTION                 transfer_to_institution,
                E.REGISTRATION_REASON                     registration_reason,
                E.TOTAL_CREDITS                           total_credits,
                E.ACADEMIC_HISTORY_EXISTS_IND             academic_history_exists_ind,
                E.ENROLLMENT_STATUS_DATE                  enrollment_status_date,
                E.ENROLLMENT_ADD_DATE                     enrollment_add_date,
                E.ENROLL_CENSUS_DATE1_IND                 enroll_census_date1_ind,
                E.ENROLL_CENSUS_DATE2_IND                 enroll_census_date2_ind,
                DECODE(acad_prd_admit_in, Y.ACADEMIC_PERIOD, 'Y', 'N') new_student_ind,
                NVL((SELECT 'Y' FROM MST_STUDENT_WORK_EXPERIENCE WE WHERE WE.PERSON_UID = person_in AND WE.ACADEMIC_PERIOD = y.ACADEMIC_PERIOD AND WE.STUDENT_LEVEL = level_in AND ROWNUM = 1), 'N') cooperative_education_ind,
                STUD_CLASS.student_classification     student_classification,
                CASE WHEN acad_stand.academic_period = y.academic_period
                  THEN NVL(ACAD_STAND.COMB_ACAD_STAND_OVERRIDE, ACAD_STAND.COMBINED_ACAD_STANDING)
                ELSE
                  ACAD_STAND.COMBINED_ACAD_STANDING
                END combined_acad_standing,
                CASE WHEN acad_stand.academic_period = y.academic_period
                  THEN NVL(acad_stand.PROGRESS_EVAL_OVERRIDE, acad_stand.PROGRESS_EVALUATION)
                ELSE
                  acad_stand.PROGRESS_EVALUATION
                END progress_evaluation,
                CASE WHEN acad_stand.academic_period = y.academic_period
                  THEN NVL(ACAD_STAND.ACADEMIC_STAND_OVERRIDE, ACAD_STAND.ACADEMIC_STANDING)
                ELSE
                  NVL(ACAD_STAND.ACADEMIC_STANDING_END, ACAD_STAND.ACADEMIC_STANDING)
                END academic_standing,
                CASE WHEN acad_stand.academic_period = y.academic_period
                  THEN ACAD_STAND.ACADEMIC_STANDING_END
                ELSE
                  NULL
                END academic_standing_end,
                CASE WHEN acad_stand.academic_period = y.academic_period
                  THEN ACAD_STAND.ACADEMIC_STAND_OVERRIDE
                ELSE
                  NULL
                END academic_stand_override,
                CASE WHEN acad_stand.academic_period = y.academic_period
                  THEN TRUNC(ACAD_STAND.ACADEMIC_STANDING_END_DT)
                ELSE
                  NULL
                END academic_standing_end_date,
                ROW_NUMBER() OVER (PARTITION BY ACAD_STAND.PERSON_UID, ACAD_STAND.STUDENT_LEVEL, Y.ACADEMIC_PERIOD ORDER BY ACAD_STAND.ACADEMIC_PERIOD DESC) acad_stand_row,
                stud_class.academic_period stud_class_period,
                ROW_NUMBER() OVER (PARTITION BY STUD_CLASS.PERSON_UID, STUD_CLASS.STUDENT_LEVEL, Y.ACADEMIC_PERIOD ORDER BY STUD_CLASS.ACADEMIC_PERIOD DESC, ACAD_STAND.ACADEMIC_PERIOD DESC) stud_class_row,
                NVL((SELECT 'Y'
                      FROM MTT_AR_DEPOSIT AR
                     WHERE AR.ACCOUNT_UID = person_in
                       AND AR.ACADEMIC_PERIOD = y.academic_period
                       AND NVL(AR.MIF_VALUE, def_multi_source_in) = multi_source_in
                       AND ROWNUM = 1)
                       , 'N') tuition_deposited_ind   -- SPC
           FROM MST_ENROLLMENT E,
                MST_ACADEMIC_STANDING ACAD_STAND,
                MST_STUDENT_CLASSIFICATION STUD_CLASS,
                MTVPARM M,
                MGT_YEAR_TYPE_DEFINITION Y
          WHERE (academic_year_in = 'ALL' or Y.YEAR_CODE = academic_year_in)
            AND Y.YEAR_TYPE = 'ACYR'
            AND Y.ACADEMIC_PERIOD NOT IN ('000000','999999')
            AND Y.ACADEMIC_PERIOD BETWEEN acad_prd_start_in AND acad_prd_end_in
            --blm 05/01/2014 added next 3 lines, the one with a Y alias was already there
            AND NVL(e.MIF_VALUE, def_multi_source_in) = multi_source_in
            AND NVL(ACAD_STAND.MIF_VALUE, def_multi_source_in) = multi_source_in
            AND NVL(STUD_CLASS.MIF_VALUE, def_multi_source_in) = multi_source_in
            AND NVL(Y.MIF_VALUE, def_multi_source_in) = multi_source_in
            -- Close any open-ended general student records based on the re-admit academic period
            AND (acad_prd_end_in != '999999'
                 OR (acad_prd_end_in = '999999'
                     AND (NVL(Y.READMIT_ACADEMIC_PERIOD, Y.ACADEMIC_PERIOD) <= max_enrl_prd_in
                          OR Y.ACADEMIC_PERIOD = acad_prd_admit_in)))
            -- Filter based on academic period patterns
            AND M.MTVPARM_INTERNAL_CODE_GROUP = 'EDW EXTRACT PARAMETERS'
            AND M.MTVPARM_INTERNAL_CODE       = 'ACADEMIC_PERIOD_PATTERN'
            AND (  (pattern_rec.mtvparm_external_code = 'ALL'
                    AND M.MTVPARM_INTERNAL_CODE_2 = 'PATTERN_CONTROL'
                    AND M.MTVPARM_EXTERNAL_CODE = 'ALL')
                OR (pattern_rec.mtvparm_external_code = 'LEVEL'
                    AND M.MTVPARM_INTERNAL_CODE_2 = level_in
                    AND Y.ACADEMIC_PERIOD LIKE M.MTVPARM_EXTERNAL_CODE)
                OR (pattern_rec.mtvparm_external_code = 'COLLEGE'
                    AND M.MTVPARM_INTERNAL_CODE_2 = college_in
                    AND Y.ACADEMIC_PERIOD LIKE M.MTVPARM_EXTERNAL_CODE)
                OR (pattern_rec.mtvparm_external_code = 'PROGRAM'
                    AND M.MTVPARM_INTERNAL_CODE_2 = program_in
                    AND Y.ACADEMIC_PERIOD LIKE M.MTVPARM_EXTERNAL_CODE)
                OR (pattern_rec.mtvparm_external_code = 'CAMPUS'
                    AND M.MTVPARM_INTERNAL_CODE_2 = campus_in
                    AND Y.ACADEMIC_PERIOD LIKE M.MTVPARM_EXTERNAL_CODE)
                OR (pattern_rec.mtvparm_external_code = 'MULTI_SOURCE'
                    AND M.MTVPARM_INTERNAL_CODE_2 = multi_source_in
                    AND Y.ACADEMIC_PERIOD LIKE M.MTVPARM_EXTERNAL_CODE))
            AND ACAD_STAND.PERSON_UID(+) = person_in
            AND ACAD_STAND.STUDENT_LEVEL(+) = level_in
            AND ACAD_STAND.ACADEMIC_PERIOD(+) <= Y.ACADEMIC_PERIOD
            AND STUD_CLASS.PERSON_UID(+) = person_in
            AND STUD_CLASS.STUDENT_LEVEL(+) = level_in
            AND STUD_CLASS.ACADEMIC_PERIOD(+) <= Y.ACADEMIC_PERIOD
            AND E.PERSON_UID (+) = person_in
            AND E.ACADEMIC_PERIOD (+) = Y.ACADEMIC_PERIOD
) WHERE ACAD_STAND_ROW = 1;
--
    TYPE tab_wtt_student_input  IS TABLE OF  wtt_student_input%ROWTYPE INDEX BY PLS_INTEGER;
    recs_wtt_student_input  tab_wtt_student_input;
    l_rec_count number;
    l_total_rec_count number;
--
    function f_getSQL return CLOB is
        retStr  CLOB;
    begin
        retStr := '  SELECT <REFRESH_IND> NVL(S.MIF_VALUE, <DEF_MULTI_SOURCE_IN>)     multi_source,
                S.ZONE_VALUE                              process_group,
                S.DOMAIN_VALUE                            administrative_group,
                S.ACADEMIC_PERIOD_START                   academic_period_start,
                S.ACADEMIC_PERIOD_END                     academic_period_end,
                S.STUDENT_POPULATION                      student_population,
                S.ADMISSIONS_POPULATION                   admissions_population,
                S.INTENDED_TIME_STATUS                    intended_time_status,
                S.EDUCATIONAL_GOAL                        education_goal,
                S.EDUCATION_LEVEL                         education_level,
                S.STUDENT_RESIDENCY                       residency,
                S.RESIDENCY_IND                           residency_ind,
                S.SITE                                    site,
                S.STUDENT_RATE                            rate,
                S.PERSON_UID                              person_uid,
                S.STUDENT_STATUS                          student_status,
                S.LEAVE_REASON                            leave_reason,
                S.DEGREE_AWARD_CATEGORY                   degree_award_category,
                S.PROGRAM_LEVEL                           program_level,
                S.PROGRAM                                 program,
                S.CAMPUS                                  campus,
                S.COLLEGE                                 college,
                S.DEGREE                                  degree,
                S.MAJOR                                   major,
                S.PROGRAM_CLASSIFICATION                  program_classification,
                S.DEPARTMENT                              department,
                S.SECOND_MAJOR                            second_major,
                S.SECOND_PROGRAM_CLASSIFICATION           second_prog_classification,
                S.SECOND_DEPARTMENT                       second_department,
                S.PROGRAM_LEVEL                           student_level,
                S.PERMIT_REGISTRATION                     permit_registration,
                S.MATRICULATED_IND                        matriculated_ind,
                S.DEGREE_AWARD_CATEGORY                   award_category,
                S.GRADUATE_CREDIT_ELIG_IND                graduate_credit_elig_ind,
                S.PROGRAM_NUMBER                          program_number, -- RPE 1-1DF52FH
                S.CURRICULUM_PRIORITY                     curriculum_priority,
                S.STUDENT_FTE                             student_fte,
                S.FTE_DIVISOR                             fte_divisor,
                S.AGE_ADMITTED                            age_admitted,
                S.LEAVE_DATE_FROM                         leave_date_from,
                S.LEAVE_DATE_TO                           leave_date_to,
                S.START_DATE_MATRICULATED                 start_date_matriculated,
                S.START_DATE_ADMITTED                     start_date_admitted,
                S.START_DATE                              start_date,
                S.EXPECTED_GRADUATION_DATE                expected_graduation_date,
                S.ACAD_STUDY_REGISTERED_IN_COUNT          acad_study_registered_in_count,
                S.OUTCOME_NUMBER                          outcome_number,
                S.ACADEMIC_PERIOD_ADMITTED                academic_period_admitted,
                NVL(WE.WAREHOUSE_ENTITY_UID,0)            warehouse_entity_uid,
                CASE
                   WHEN ACADEMIC_PERIOD_END = ''999999'' THEN
                      NVL((SELECT MAX(ACADEMIC_PERIOD)
                             FROM MST_ENROLLMENT E   -- RPE 1-1DF52FH  removed registered_ind = 1 requirement, now just checking for existance of SFBETRM record
                            --blm added next line 5/01/14
                            WHERE e.mif_value = s.mif_value
                              and E.PERSON_UID = S.PERSON_UID),-1)
                   ELSE NULL
                END                                       max_enrl_period,
                PD.*
           FROM WDT_WAREHOUSE_ENTITY WE,
                WCV_EXTR_PERSON_DETAILS PD,
                MST_BASE_STUDENT S <CHANGE_TABLE>
          WHERE <CHANGE_TABLE_CONDITION> (((<ACADEMIC_YEAR_IN> = ''ALL'' or (EXISTS (SELECT ''x''
                                                                                     FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                                                    WHERE YTD.ACADEMIC_PERIOD BETWEEN S.ACADEMIC_PERIOD_START AND S.ACADEMIC_PERIOD_END
                                                                                      AND YTD.YEAR_TYPE = ''ACYR''
                                                                                      --blm added next line 5/01/14 instead of <mep condition 1>, that was not working
                                                                                      and ytd.mif_value = s.mif_value
                                                                                      AND YTD.YEAR_CODE = <ACADEMIC_YEAR_IN>   ))))
                )
            <DEBUG_VAR_LOGIC>  AND S.PRIMARY_PROGRAM_IND = ''Y''
            AND WE.BANNER_PIDM = S.PERSON_UID
            --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
            and we.user_attribute_01 = s.mif_value
            AND PD.PERSON_ID = S.PERSON_UID
            AND S.PERSON_UID BETWEEN ' || start_id || ' AND ' || end_id;

        retStr := REPLACE(retStr, '<DEFAULT_NULL_CLEANSE_VALUE>', '''' || default_rec.null_cleanse_value || '''' );
        retStr := REPLACE(retStr, '<DEF_MULTI_SOURCE_IN>', '''' || default_rec.multi_source_cleanse_value || '''');
        retStr := REPLACE(retStr, '<DEBUG_VAR_IN>','''' || debug_var_in || '''');
        retStr := REPLACE(retStr, '<ACADEMIC_YEAR_IN>','''' || academic_year_in || '''');

--      Replacing the Debug_Variable related conditional logic
        IF debug_var_in IS NOT NULL THEN
            retStr := REPLACE(retStr, '<DEBUG_VAR_LOGIC>', ' AND (<DEBUG_VAR_IN> IS NULL OR S.PERSON_UID LIKE <DEBUG_VAR_IN>) ');
        ELSE
            retStr := REPLACE(retStr, '<DEBUG_VAR_LOGIC>', NULL );
        END IF;

--      Replacing the MEP related default values and conditional logic
        IF NVL(mep_enabled.MTVPARM_DESC, NULL) = 'Y' THEN
            retStr := REPLACE(retStr, '<MEP_CONDITION_1>', ' AND NVL(S.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = NVL(YTD.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) ');
        ELSE
            retStr := REPLACE(retStr, '<MEP_CONDITION_1>', NULL );
        END IF;
        retStr := REPLACE(retStr, '<DEF_MULTI_SOURCE_IN>', '''' || default_rec.multi_source_cleanse_value || '''' );

--      Populating the change table related logic based on the LOAD or REFRESH process
        IF process_ind_in = 'L' THEN
            retStr := REPLACE(retStr, '<REFRESH_IND>',NULL);
            retStr := REPLACE(retStr, '<CHANGE_TABLE>',NULL);
            retStr := REPLACE(retStr, '<CHANGE_TABLE_CONDITION>',NULL);
        ELSE
            retStr := REPLACE(retStr, '<REFRESH_IND>', ' DISTINCT ');
            retStr := REPLACE(retStr, '<CHANGE_TABLE>',', CHG_STUDENT CHG');
            retStr := REPLACE(retStr, '<CHANGE_TABLE_CONDITION>',' CHG.PERSON_UID = S.PERSON_UID AND ');
        END IF;
        retStr := REPLACE(retStr, '<DEFAULT_NULL_CLEANSE_VALUE>', '''' || default_rec.null_cleanse_value || '''' );
        retStr := REPLACE(retStr, '<DEF_MULTI_SOURCE_IN>', '''' || default_rec.multi_source_cleanse_value || '''');
        retStr := REPLACE(retStr, '<DEBUG_VAR_IN>','''' || debug_var_in || '''');
        retStr := REPLACE(retStr, '<ACADEMIC_YEAR_IN>','''' || academic_year_in || '''');
        RETURN retStr;
    END f_getSQL;
--
BEGIN
--
    mgkolib.mdrlogd_row.mdrlogd_jobno         := jobNumber;
    jobDate := to_date(mgkolib.F_GetDateAndTime,G$_DATE.GET_NLS_DATE_FORMAT||' HH24:MI:SS');
    mgkolib.mdrlogd_row.mdrlogd_run_date      := jobDate;
    mgkolib.mdrlogd_row.mdrlogd_process       := SUBSTR('EDW_STUDENT_INPUT' || '_' || SUBSTR(jobNumber, -2), 1, 30) ;
    mgkolib.mdrlogd_row.mdrlogd_procedure     := NULL;
    mgkolib.userid     := jobUser;
    mgkolib.mdrlogd_row.mdrlogd_sequence      := 0;
    mgkolib.mdrlogd_row.mdrlogd_message       :=  G$_NLS.Get('STUD-0111', 'SQL', 'Start of Parallel Thread Process at %01%', mgkolib.F_GetDateAndTime);
    mgkolib.P_WriteMdrlogd;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','NULL_NATION','NULL_NATION_VALUE');
    FETCH edw_general_extr.get_mtvparm INTO null_nation_rec;
    CLOSE edw_general_extr.get_mtvparm;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','MEP_ENABLED','MEP_ENABLED');
    FETCH edw_general_extr.get_mtvparm INTO mep_enabled;
    CLOSE edw_general_extr.get_mtvparm;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','STUDENT_GEOGRAPHIC_DIVISION','STUDENT');
    FETCH edw_general_extr.get_mtvparm INTO region_rec;
    CLOSE edw_general_extr.get_mtvparm;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','ACADEMIC_PERIOD_LIKE','ADDEND');
    FETCH edw_general_extr.get_mtvparm INTO addend_rec;
    CLOSE edw_general_extr.get_mtvparm;
    addend_val := NVL(addend_rec.mtvparm_external_code, 100);
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','ACADEMIC_PERIOD_PATTERN','PATTERN_CONTROL');
    FETCH edw_general_extr.get_mtvparm INTO pattern_rec;
    CLOSE edw_general_extr.get_mtvparm;
--
    l_rec_count := 0;
    l_total_rec_count := 0;
    sqlStmt := f_getSQL( );
--  FOR student_rec IN get_student_info(default_rec.multi_source_cleanse_value, process_ind_in, process_date) LOOP
    OPEN get_student_info FOR sqlStmt;
--    c_ := DBMS_SQL.to_cursor_number(get_student_course_info);
--    OPEN get_student_course_info(default_rec.multi_source_cleanse_value, process_ind_in, process_date);
    LOOP
        FETCH get_student_info INTO student_rec;
        EXIT WHEN get_student_info%NOTFOUND;
--
        OPEN edw_general_extr.get_georegion(default_rec.multi_source_cleanse_value, student_rec.multi_source, student_rec.person_uid, student_rec.address_type, student_rec.address_seq_no, region_rec.mtvparm_external_code);
        FETCH edw_general_extr.get_georegion INTO georegion_rec;
        CLOSE edw_general_extr.get_georegion;
--
-- ACADEMIC_STUDY has multi-source information; pass in multi-source and default multi-source
-- OPEN get_acad_period_count(student_rec.person_uid,NULL,student_rec.student_level);
OPEN get_acad_period_count(default_rec.multi_source_cleanse_value, student_rec.multi_source,student_rec.person_uid,NULL,student_rec.student_level);
        FETCH get_acad_period_count INTO acad_period_tot_count_rec;
        CLOSE get_acad_period_count;
--

--BLM and EB fixed to MEP
        OPEN get_major_counts(default_rec.multi_source_cleanse_value, student_rec.multi_source,student_rec.person_uid,student_rec.student_level);
        FETCH get_major_counts INTO major_count_rec;
        CLOSE get_major_counts;
--
--BLM and EB replaced this with a mep version (adding JOS for searching reasons)
	-- ACADEMIC_STUDY has multi-source information; pass in multi-source and default multi-source
	-- OPEN get_acd_per_first_last(student_rec.person_uid,student_rec.student_level);
	OPEN get_acd_per_first_last(default_rec.multi_source_cleanse_value, student_rec.multi_source, student_rec.person_uid,student_rec.student_level);
	FETCH get_acd_per_first_last INTO acad_per_first_last_rec;
	CLOSE get_acd_per_first_last;
--
        OPEN get_acad_outcome(default_rec.multi_source_cleanse_value, student_rec.multi_source, student_rec.person_uid,student_rec.curriculum_priority,student_rec.outcome_number);
        FETCH get_acad_outcome INTO acad_outcome_rec;
        CLOSE get_acad_outcome;
--
        OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, student_rec.multi_source, acad_per_first_last_rec.acad_per_first, 'ACYR');
        FETCH edw_general_extr.get_year_type INTO acad_time_first_per_rec;
        CLOSE edw_general_extr.get_year_type;
--
        OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, student_rec.multi_source, acad_per_first_last_rec.acad_per_last, 'ACYR');
        FETCH edw_general_extr.get_year_type INTO acad_time_last_per_rec;
        CLOSE edw_general_extr.get_year_type;
-- multi source
        ret_row.multi_source := student_rec.multi_source;
        ret_row.process_group := student_rec.process_group;
        ret_row.administrative_group := student_rec.administrative_group;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.msrc_user_attribute_01 := NULL;
        ret_row.msrc_user_attribute_01 := ret_row.multi_source;
        ret_row.msrc_user_attribute_02 := NULL;
        ret_row.msrc_user_attribute_03 := NULL;
        ret_row.msrc_user_attribute_04 := NULL;
        ret_row.msrc_user_attribute_05 := NULL;
-- person
        ret_row.person_uid := student_rec.warehouse_entity_uid;
        ret_row.id := student_rec.id;
        ret_row.full_name_lfmi := student_rec.full_name_lfmi;
        ret_row.birth_date := student_rec.birth_date;
        ret_row.deceased_date := student_rec.deceased_date;
        ret_row.email_address := student_rec.email_address;
        ret_row.phone_number_combined := student_rec.phone_number_combined;
        ret_row.confidentiality_ind := student_rec.confidentiality_ind;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.pers_user_attribute_01 := NULL;
        ret_row.pers_user_attribute_01 := ret_row.multi_source;
        ret_row.pers_user_attribute_02 := NULL;
        ret_row.pers_user_attribute_03 := NULL;
        ret_row.pers_user_attribute_04 := NULL;
        ret_row.pers_user_attribute_05 := NULL;
-- demographic
        ret_row.gender := student_rec.gender;
        ret_row.ethnicity_category := student_rec.ethnicity_category;
        ret_row.hispanic_latino_ethn_ind := student_rec.hispanic_latino_ethnicity_ind;
        ret_row.asian_ind := student_rec.asian_ind;
        ret_row.native_amer_or_alaskan_ind := student_rec.native_american_or_alaskan_ind;
        ret_row.black_or_african_ind := student_rec.black_or_african_ind;
        ret_row.pacific_islander_ind := student_rec.pacific_islander_ind;
        ret_row.white_ind := student_rec.white_ind;
        IF student_rec.number_of_races = 0 and student_rec.resident_alien_visa_count > 0 THEN
           ret_row.non_resident_ind := 'Y';
        ELSE
           ret_row.non_resident_ind := 'N';
        END IF;
        IF NVL(student_rec.hispanic_latino_ethnicity_ind,'N') = 'N' AND
           student_rec.number_of_races = 0 AND
           student_rec.resident_alien_visa_count = 0 THEN
           ret_row.race_ethnicity_unknown_ind := 'Y';
        ELSE
           ret_row.race_ethnicity_unknown_ind := 'N';
        END IF;
        ret_row.two_or_more_ind := student_rec.two_or_more_ind;
        ret_row.race_ethnicity_confirm_ind := student_rec.race_ethnicity_confirm_ind;
        ret_row.minority_ind := student_rec.minority_ind;
        ret_row.ethnicity := student_rec.ethnicity;
        ret_row.deceased_ind := student_rec.deceased_ind;
        ret_row.citizenship_ind := student_rec.citizenship_ind;
        ret_row.citizenship_type := student_rec.citizenship_type;
        ret_row.visa_type := student_rec.visa_type;
        ret_row.nation_of_citizenship := student_rec.nation_of_citizenship;
        ret_row.nation_of_birth := student_rec.nation_of_birth;
        ret_row.primary_disability := student_rec.primary_disability;
        ret_row.legacy := student_rec.legacy;
        ret_row.marital_status := student_rec.marital_status;
        ret_row.religion := student_rec.religion;
        ret_row.veteran_type := student_rec.veteran_type;
        ret_row.veteran_category := student_rec.veteran_category;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.demo_user_attribute_01 := NULL;
        ret_row.demo_user_attribute_01 := ret_row.multi_source;
        ret_row.demo_user_attribute_02 := NULL;
        ret_row.demo_user_attribute_03 := NULL;
        ret_row.demo_user_attribute_04 := NULL;
        ret_row.demo_user_attribute_05 := NULL;
-- geographic region
        ret_row.geographic_region := georegion_rec.geographic_region;
        ret_row.geographic_division := georegion_rec.geographic_division;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.geor_user_attribute_01 := NULL;
        ret_row.geor_user_attribute_01 := ret_row.multi_source;
        ret_row.geor_user_attribute_02 := NULL;
        ret_row.geor_user_attribute_03 := NULL;
        ret_row.geor_user_attribute_04 := NULL;
        ret_row.geor_user_attribute_05 := NULL;
-- postal
        ret_row.postal_code := nvl(student_rec.postal_code, default_rec.null_cleanse_value);
        ret_row.city := nvl(student_rec.city, default_rec.null_cleanse_value);
        ret_row.county := student_rec.county_code;
        ret_row.state_province := student_rec.state_province;
        IF student_rec.state_province IS NOT NULL THEN
            ret_row.nation := NVL(student_rec.nation, null_nation_rec.mtvparm_external_code);
        ELSE
            ret_row.nation := NULL;
        END IF;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.post_user_attribute_01 := NULL;
        ret_row.post_user_attribute_01 := ret_row.multi_source;
        ret_row.post_user_attribute_02 := NULL;
        ret_row.post_user_attribute_03 := NULL;
        ret_row.post_user_attribute_04 := NULL;
        ret_row.post_user_attribute_05 := NULL;
-- street line
        ret_row.street_line1 := nvl(student_rec.street_line1, default_rec.null_cleanse_value);
        ret_row.street_line2 := nvl(student_rec.street_line2, default_rec.null_cleanse_value);
        ret_row.street_line3 := nvl(student_rec.street_line3, default_rec.null_cleanse_value);
        ret_row.street_line4 := nvl(student_rec.street_line4, default_rec.null_cleanse_value);
        --BLM mepped 6/2/14 for security reasons
        --ret_row.stad_user_attribute_01 := NULL;
        ret_row.stad_user_attribute_01 := ret_row.multi_source;
        ret_row.stad_user_attribute_02 := NULL;
        ret_row.stad_user_attribute_03 := NULL;
        ret_row.stad_user_attribute_04 := NULL;
        ret_row.stad_user_attribute_05 := NULL;
-- academic study
        ret_row.student_level := student_rec.program_level;
        ret_row.program := student_rec.program;
        ret_row.campus := student_rec.campus;
        ret_row.college := student_rec.college;
        ret_row.award_category := student_rec.degree_award_category;
        ret_row.degree := student_rec.degree;
        ret_row.major := student_rec.major;
        ret_row.program_classification := student_rec.program_classification;
        ret_row.department := student_rec.department;
        ret_row.second_major := student_rec.second_major;
        ret_row.second_prog_classification := student_rec.second_prog_classification;
        ret_row.second_department := student_rec.second_department;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.astd_user_attribute_01 := NULL;
        ret_row.astd_user_attribute_01 := ret_row.multi_source;
        ret_row.astd_user_attribute_02 := NULL;
        ret_row.astd_user_attribute_03 := NULL;
        ret_row.astd_user_attribute_04 := NULL;
        ret_row.astd_user_attribute_05 := NULL;
-- Academic Period First Attended
        ret_row.apfa_academic_period := acad_time_first_per_rec.academic_period;
        ret_row.apfa_acad_period_begin_date := acad_time_first_per_rec.start_date;
        ret_row.apfa_acad_period_end_date := acad_time_first_per_rec.end_date;
        ret_row.apfa_academic_year := acad_time_first_per_rec.year_code;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.apfa_user_attribute_01 := NULL;
        ret_row.apfa_user_attribute_01 := ret_row.multi_source;
        ret_row.apfa_user_attribute_02 := NULL;
        ret_row.apfa_user_attribute_03 := NULL;
        ret_row.apfa_user_attribute_04 := NULL;
        ret_row.apfa_user_attribute_05 := NULL;
-- Academic Period Last Attended
        ret_row.apla_academic_period := acad_time_last_per_rec.academic_period;
        ret_row.apla_acad_period_begin_date := acad_time_last_per_rec.start_date;
        ret_row.apla_acad_period_end_date := acad_time_last_per_rec.end_date;
        ret_row.apla_academic_year := acad_time_last_per_rec.year_code;
        --BLM mepped 6/2/14 for security reasons
        --ret_row.apla_user_attribute_01 := NULL;
        ret_row.apla_user_attribute_01 := ret_row.multi_source;
        ret_row.apla_user_attribute_02 := NULL;
        ret_row.apla_user_attribute_03 := NULL;
        ret_row.apla_user_attribute_04 := NULL;
        ret_row.apla_user_attribute_05 := NULL;

--      fill in academic periods that fall between academic_period_start and academic_period_end
        FOR term_rec IN fill_academic_periods(
            default_rec.multi_source_cleanse_value,
            student_rec.multi_source,
            student_rec.person_uid,
            student_rec.student_level,
            student_rec.college,
            student_rec.program,
            student_rec.campus,
            student_rec.academic_period_start,
            student_rec.academic_period_end,
            student_rec.academic_period_admitted,
            student_rec.max_enrl_period) LOOP
--
            OPEN get_admins_appl_info(default_rec.multi_source_cleanse_value, student_rec.multi_source, student_rec.person_uid, term_rec.academic_period);
            FETCH get_admins_appl_info INTO admins_appl_rec;
            CLOSE get_admins_appl_info;
--
            OPEN edw_general_extr.get_student_year_type(default_rec.multi_source_cleanse_value, student_rec.multi_source, term_rec.academic_period, student_rec.person_uid);
            FETCH edw_general_extr.get_student_year_type INTO fa_year_rec;
            CLOSE edw_general_extr.get_student_year_type;
--
            OPEN edw_finaid_extr.get_finaid_appl_amt(default_rec.multi_source_cleanse_value, student_rec.multi_source, student_rec.person_uid, fa_year_rec.aid_year);
            FETCH edw_finaid_extr.get_finaid_appl_amt INTO finaid_appl_amt_rec;
            CLOSE edw_finaid_extr.get_finaid_appl_amt;
--
            OPEN edw_finaid_extr.get_finaid_appl_needs(default_rec.multi_source_cleanse_value, student_rec.multi_source, student_rec.person_uid, fa_year_rec.aid_year);
            FETCH edw_finaid_extr.get_finaid_appl_needs INTO finaid_appl_need_rec;
            CLOSE edw_finaid_extr.get_finaid_appl_needs;
--
            OPEN edw_finaid_extr.get_total_offer_amts_acad_pds(default_rec.multi_source_cleanse_value, student_rec.multi_source, student_rec.person_uid, term_rec.academic_period);
            FETCH edw_finaid_extr.get_total_offer_amts_acad_pds INTO offer_composition_amt_rec;
            CLOSE edw_finaid_extr.get_total_offer_amts_acad_pds;
--
            OPEN edw_finaid_extr.get_application_ind(default_rec.multi_source_cleanse_value, student_rec.multi_source, student_rec.person_uid, fa_year_rec.aid_year);
            FETCH edw_finaid_extr.get_application_ind INTO application_ind_rec;
            CLOSE edw_finaid_extr.get_application_ind;
--
            OPEN get_stud_crse_info( student_rec.multi_source, term_rec.academic_period, student_rec.warehouse_entity_uid);
            FETCH get_stud_crse_info INTO stud_crse_info_rec;
            CLOSE get_stud_crse_info;
--
-- BLM modified below, added 2 MEP values as this cursor was not mepped
            OPEN get_gpa_by_term(default_rec.multi_source_cleanse_value, student_rec.multi_source,  student_rec.person_uid,term_rec.academic_period,student_rec.student_level);
            FETCH get_gpa_by_term INTO gpa_by_term_rec;
            CLOSE get_gpa_by_term;
--
--BLM and EB modified below as the cursor was not mepped
            OPEN get_prev_acad_period_gpa(default_rec.multi_source_cleanse_value, student_rec.multi_source,  student_rec.person_uid,term_rec.academic_period,student_rec.student_level);
            FETCH get_prev_acad_period_gpa INTO prev_acad_period_gpa_rec;
            CLOSE get_prev_acad_period_gpa;
--
-- ACADEMIC_STUDY has multi-source information; pass in multi-source and default multi-source
-- OPEN get_acad_period_count(student_rec.person_uid,term_rec.academic_period,student_rec.student_level);
OPEN get_acad_period_count(default_rec.multi_source_cleanse_value, student_rec.multi_source,student_rec.person_uid,term_rec.academic_period,student_rec.student_level);
            FETCH get_acad_period_count INTO acad_period_count_rec;
            CLOSE get_acad_period_count;

--          Calculate the retention academic period sequential and like values for numeric academic periods only
            IF edw_general_extr.f_safe_to_number(term_rec.academic_period) IS NOT NULL THEN
--
                OPEN get_ret_seq(term_rec.academic_period);
                FETCH get_ret_seq INTO ret_seq_rec;
                CLOSE get_ret_seq;
--
                OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, student_rec.multi_source, ret_seq_rec.ret_sequential, 'ACYR');
                FETCH edw_general_extr.get_year_type INTO ret_seq_acad_period_rec;
                CLOSE edw_general_extr.get_year_type;
--
--CCCS Customization.  2/13/14 - BLM
--The addend of 100 will not work for both normal terms and continuing ed terms
--So 201430 vs 820143
--Need to add 100 to normal terms and 10 to continuing ed terms
                --delievered version
                --academic_period_like := term_rec.academic_period + addend_val;

                --our version
                academic_period_like := case
                                        when substr(term_rec.academic_period,1,1) = 8
                                        then term_rec.academic_period + 10
                                        else term_rec.academic_period + addend_val
                                        end;
--END OF CCCS CUSTOMIZATION

                OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, student_rec.multi_source, academic_period_like, 'ACYR');
                FETCH edw_general_extr.get_year_type INTO ret_like_acad_period_rec;
                CLOSE edw_general_extr.get_year_type;

--              Calculate retention values only if the student is registered
                IF term_rec.registered_ind = 'Y' THEN
--
                    ret_seq_ind_rec := f_get_ret_ind(student_rec.person_uid,
                                                     ret_seq_acad_period_rec.academic_period,
                                                     student_rec.student_level,
                                                     student_rec.college,
                                                     student_rec.program,
                                                     default_rec.multi_source_cleanse_value,
                                                     student_rec.multi_source,
                                                     term_rec.year_code,
                                                     student_rec.deceased_date,
                                                     term_rec.end_date);
                    ret_like_ind_rec := f_get_ret_ind(student_rec.person_uid,
                                                      ret_like_acad_period_rec.academic_period,
                                                      student_rec.student_level,
                                                      student_rec.college,
                                                      student_rec.program,
                                                      default_rec.multi_source_cleanse_value,
                                                      student_rec.multi_source,
                                                      term_rec.year_code,
                                                      student_rec.deceased_date,
                                                      term_rec.end_date);
--              retention time like
                    ret_row.l_retained_overall_ind := ret_like_ind_rec.overall_ret_ind ;
                    ret_row.l_not_retained_overall_ind := ret_like_ind_rec.overall_not_ret_ind;
                    ret_row.l_retention_status_overall := ret_like_ind_rec.overall_ret_status;
                    ret_row.l_retained_stdlevl_ind := ret_like_ind_rec.std_lvl_ret_ind;
                    ret_row.l_not_retained_stdlevl_ind := ret_like_ind_rec.std_lvl_not_ret_ind;
                    ret_row.l_retention_status_stdlevl := ret_like_ind_rec.std_lvl_ret_status;
                    ret_row.l_retained_college_ind := ret_like_ind_rec.college_ret_ind;
                    ret_row.l_not_retained_college_ind := ret_like_ind_rec.college_not_ret_ind;
                    ret_row.l_retention_status_college := ret_like_ind_rec.college_ret_status;
                    ret_row.l_retained_program_ind := ret_like_ind_rec.program_ret_ind;
                    ret_row.l_not_retained_program_ind := ret_like_ind_rec.program_not_ret_ind;
                    ret_row.l_retention_status_program := ret_like_ind_rec.program_ret_status;
                    ret_row.l_retained_exclude_ind := ret_like_ind_rec.excluded_ind;
                    --BLM mepped 6/2/14 for security reasons
                    --ret_row.lrtim_user_attribute_01 := NULL;
                    ret_row.lrtim_user_attribute_01 := ret_row.multi_source;
                    ret_row.lrtim_user_attribute_02 := NULL;
                    ret_row.lrtim_user_attribute_03 := NULL;
                    ret_row.lrtim_user_attribute_04 := NULL;
                    ret_row.lrtim_user_attribute_05 := NULL;
--              retention time sequential
                    ret_row.S_RETAINED_OVERALL_IND := ret_seq_ind_rec.overall_ret_ind ;
                    ret_row.S_NOT_RETAINED_OVERALL_IND := ret_seq_ind_rec.overall_not_ret_ind;
                    ret_row.S_RETENTION_STATUS_OVERALL := ret_seq_ind_rec.overall_ret_status;
                    ret_row.S_RETAINED_STDLEVL_IND := ret_seq_ind_rec.std_lvl_ret_ind;
                    ret_row.S_NOT_RETAINED_STDLEVL_IND := ret_seq_ind_rec.std_lvl_not_ret_ind;
                    ret_row.S_RETENTION_STATUS_STDLEVL := ret_seq_ind_rec.std_lvl_ret_status;
                    ret_row.S_RETAINED_COLLEGE_IND := ret_seq_ind_rec.college_ret_ind;
                    ret_row.S_NOT_RETAINED_COLLEGE_IND := ret_seq_ind_rec.college_not_ret_ind;
                    ret_row.S_RETENTION_STATUS_COLLEGE := ret_seq_ind_rec.college_ret_status;
                    ret_row.S_RETAINED_PROGRAM_IND := ret_seq_ind_rec.program_ret_ind;
                    ret_row.S_NOT_RETAINED_PROGRAM_IND := ret_seq_ind_rec.program_not_ret_ind;
                    ret_row.S_RETENTION_STATUS_PROGRAM := ret_seq_ind_rec.program_ret_status;
                    ret_row.S_RETAINED_EXCLUDE_IND := ret_seq_ind_rec.excluded_ind;
                    --BLM mepped 6/2/14 for security reasons
                    --ret_row.SRTIM_USER_ATTRIBUTE_01 := NULL;
                    ret_row.SRTIM_USER_ATTRIBUTE_01 := ret_row.multi_source;
                    ret_row.SRTIM_USER_ATTRIBUTE_02 := NULL;
                    ret_row.SRTIM_USER_ATTRIBUTE_03 := NULL;
                    ret_row.SRTIM_USER_ATTRIBUTE_04 := NULL;
                    ret_row.SRTIM_USER_ATTRIBUTE_05 := NULL;
                ELSE -- student is not registered
--              retention time like
                    ret_row.l_retained_overall_ind     := NULL;
                    ret_row.l_not_retained_overall_ind := NULL;
                    ret_row.l_retention_status_overall := NULL;
                    ret_row.l_retained_stdlevl_ind     := NULL;
                    ret_row.l_not_retained_stdlevl_ind := NULL;
                    ret_row.l_retention_status_stdlevl := NULL;
                    ret_row.l_retained_college_ind     := NULL;
                    ret_row.l_not_retained_college_ind := NULL;
                    ret_row.l_retention_status_college := NULL;
                    ret_row.l_retained_program_ind     := NULL;
                    ret_row.l_not_retained_program_ind := NULL;
                    ret_row.l_retention_status_program := NULL;
                    ret_row.l_retained_exclude_ind     := NULL;
                    --BLM mepped 6/2/14 for security reasons
                    --ret_row.lrtim_user_attribute_01 := NULL;
                    ret_row.lrtim_user_attribute_01 := ret_row.multi_source;
                    ret_row.lrtim_user_attribute_02 := NULL;
                    ret_row.lrtim_user_attribute_03 := NULL;
                    ret_row.lrtim_user_attribute_04 := NULL;
                    ret_row.lrtim_user_attribute_05 := NULL;
--              retention time sequential
                    ret_row.S_RETAINED_OVERALL_IND     := NULL;
                    ret_row.S_NOT_RETAINED_OVERALL_IND := NULL;
                    ret_row.S_RETENTION_STATUS_OVERALL := NULL;
                    ret_row.S_RETAINED_STDLEVL_IND     := NULL;
                    ret_row.S_NOT_RETAINED_STDLEVL_IND := NULL;
                    ret_row.S_RETENTION_STATUS_STDLEVL := NULL;
                    ret_row.S_RETAINED_COLLEGE_IND     := NULL;
                    ret_row.S_NOT_RETAINED_COLLEGE_IND := NULL;
                    ret_row.S_RETENTION_STATUS_COLLEGE := NULL;
                    ret_row.S_RETAINED_PROGRAM_IND     := NULL;
                    ret_row.S_NOT_RETAINED_PROGRAM_IND := NULL;
                    ret_row.S_RETENTION_STATUS_PROGRAM := NULL;
                    ret_row.S_RETAINED_EXCLUDE_IND     := NULL;
                    --BLM mepped 6/2/14 for security reasons
                    --ret_row.SRTIM_USER_ATTRIBUTE_01 := NULL;
                    ret_row.SRTIM_USER_ATTRIBUTE_01 := ret_row.multi_source;
                    ret_row.SRTIM_USER_ATTRIBUTE_02 := NULL;
                    ret_row.SRTIM_USER_ATTRIBUTE_03 := NULL;
                    ret_row.SRTIM_USER_ATTRIBUTE_04 := NULL;
                    ret_row.SRTIM_USER_ATTRIBUTE_05 := NULL;
                END IF;
            END IF;
--    retention time
            ret_row.rtim_academic_period := term_rec.academic_period;
            CASE WHEN ret_seq_acad_period_rec.academic_period IS NULL THEN
                ret_row.retention_period_sequential:=default_rec.null_cleanse_value;
            ELSE
                ret_row.retention_period_sequential:= term_rec.academic_period_desc || ' to ' || ret_seq_acad_period_rec.academic_period_desc ;
            END CASE;
            CASE WHEN ret_like_acad_period_rec.academic_period IS NULL THEN
                ret_row.retention_period_like:=default_rec.null_cleanse_value;
            ELSE
                ret_row.retention_period_like:= term_rec.academic_period_desc || ' to ' || ret_like_acad_period_rec.academic_period_desc;
            END CASE;
            --BLM mepped 6/2/14 for security reasons
            --ret_row.rtim_user_attribute_01 := NULL;
            ret_row.rtim_user_attribute_01 := ret_row.multi_source;
            ret_row.rtim_user_attribute_02 := NULL;
            ret_row.rtim_user_attribute_03 := NULL;
            ret_row.rtim_user_attribute_04 := NULL;
            ret_row.rtim_user_attribute_05 := NULL;
--    academic time
            ret_row.academic_period := term_rec.academic_period;
            ret_row.academic_period_begin_date := term_rec.start_date;
            ret_row.academic_period_end_date := term_rec.end_date;
            ret_row.academic_year := term_rec.year_code;
            --BLM mepped 6/2/14 for security reasons
            --ret_row.atim_user_attribute_01 := NULL;
            ret_row.atim_user_attribute_01 := ret_row.multi_source;
            ret_row.atim_user_attribute_02 := NULL;
            ret_row.atim_user_attribute_03 := NULL;
            ret_row.atim_user_attribute_04 := NULL;
            ret_row.atim_user_attribute_05 := NULL;
--    financial aid year
            ret_row.financial_aid_year := fa_year_rec.aid_year;
            -- JOS 10/11/2012; mod for MEP
	    -- Set user attribute 01 to MEP code value for aid year
            -- ret_row.fayr_user_attribute_01 := NULL;
	    ret_row.fayr_user_attribute_01 := ret_row.multi_source;
            ret_row.fayr_user_attribute_02 := NULL;
            ret_row.fayr_user_attribute_03 := NULL;
            ret_row.fayr_user_attribute_04 := NULL;
            ret_row.fayr_user_attribute_05 := NULL;
--    pre student status
	    -- JOS update
	    -- Updated f_get_inquirer_ind includes mep
            --ret_row.inquired_ind := NVL(mskfunc.f_get_inquirer_ind(admins_appl_rec.person_uid, admins_appl_rec.academic_period), 'N');
            ret_row.inquired_ind := NVL(mskfunc.f_get_inquirer_ind(student_rec.multi_source, admins_appl_rec.person_uid, admins_appl_rec.academic_period), 'N');
            ret_row.applied_ind := 'Y';
            ret_row.admitted_ind := NVL(admins_appl_rec.inst_admit_any_time_ind, 'N') ;
            ret_row.accepted_ind := NVL(admins_appl_rec.appl_accept_any_time_ind, 'N');
            ret_row.tuition_deposited_ind := NVL(term_rec.tuition_deposited_ind, 'N');
            CASE WHEN NVL(admins_appl_rec.inst_admit_any_time_ind,'N') = 'N' THEN
                ret_row.enrolled_ind := 'N';
            ELSE
                ret_row.enrolled_ind := term_rec.enrolled_ind;
            END CASE;
            --BLM mepped 6/2/14 for security reasons
            --ret_row.pstd_user_attribute_01 := NULL;
            ret_row.pstd_user_attribute_01 := ret_row.multi_source;
            ret_row.pstd_user_attribute_02 := NULL;
            ret_row.pstd_user_attribute_03 := NULL;
            ret_row.pstd_user_attribute_04 := NULL;
            ret_row.pstd_user_attribute_05 := NULL;
--    finaid status
            -- Function f_finaid_applicant_ind requires MEP code
            --ret_row.financial_aid_applicant_ind := mrkfunc.f_finaid_applicant_ind(student_rec.person_uid, term_rec.academic_period);
            ret_row.financial_aid_applicant_ind := mrkfunc.f_finaid_applicant_ind(student_rec.multi_source, student_rec.person_uid, term_rec.academic_period);
            ret_row.finaid_application_ind := NVL(finaid_appl_amt_rec.application_ind,'N');
            ret_row.fm_application_ind := NVL(application_ind_rec.fm_application_ind,'N');
            ret_row.im_application_ind := NVL(application_ind_rec.im_application_ind,'N');
            ret_row.award_offered_ind := offer_composition_amt_rec.award_offered_ind;
            ret_row.award_accepted_ind := offer_composition_amt_rec.award_accepted_ind;
            ret_row.award_declined_ind := offer_composition_amt_rec.award_declined_ind;
            ret_row.award_canceled_ind := offer_composition_amt_rec.award_canceled_ind;
            ret_row.award_paid_ind := offer_composition_amt_rec.award_paid_ind;
            ret_row.fm_need_eligible_ind := finaid_appl_need_rec.fm_need_eligible_ind;
            ret_row.fm_fully_met_need_ind := finaid_appl_need_rec.fm_fully_met_need_ind;
            ret_row.im_need_eligible_ind := finaid_appl_need_rec.im_need_eligible_ind;
            ret_row.im_fully_met_need_ind := finaid_appl_need_rec.im_fully_met_need_ind;
            ret_row.dependent_ind := finaid_appl_amt_rec.dependency_ind;
            --BLM mepped 6/2/14 for security reasons
            --ret_row.fast_user_attribute_01 := NULL;
            ret_row.fast_user_attribute_01 := ret_row.multi_source;
            ret_row.fast_user_attribute_02 := NULL;
            ret_row.fast_user_attribute_03 := NULL;
            ret_row.fast_user_attribute_04 := NULL;
            ret_row.fast_user_attribute_05 := NULL;
--    student
            ret_row.student_population := student_rec.student_population;
            ret_row.admissions_population := student_rec.admissions_population;
            ret_row.intended_time_status := student_rec.intended_time_status;
            ret_row.student_classification := term_rec.student_classification;
            ret_row.education_goal := student_rec.education_goal;
            ret_row.education_level := student_rec.education_level;
            ret_row.residency := student_rec.residency;
            ret_row.residency_ind := student_rec.residency_ind;
            ret_row.housing_ind := term_rec.housing_ind;
            ret_row.site := student_rec.site;
            ret_row.rate := student_rec.rate;
            --BLM mepped 6/2/14 for security reasons
            --ret_row.stud_user_attribute_01 := NULL;
            ret_row.stud_user_attribute_01 := ret_row.multi_source;
            ret_row.stud_user_attribute_02 := NULL;
            ret_row.stud_user_attribute_03 := NULL;
            ret_row.stud_user_attribute_04 := NULL;
            ret_row.stud_user_attribute_05 := NULL;
--    enrollment status
            ret_row.enrollment_status := term_rec.enrollment_status;
            ret_row.student_status := student_rec.student_status;
            ret_row.enst_intended_time_status := student_rec.intended_time_status;
            ret_row.current_time_status := term_rec.current_time_status;
            ret_row.withdrawal_reason := term_rec.withdrawal_reason;
            ret_row.institution_attending := term_rec.transfer_to_institution;
            ret_row.leave_reason := student_rec.leave_reason;
            ret_row.registration_reason := term_rec.registration_reason;
            ret_row.enst_enrolled_ind := term_rec.enrolled_ind;
            ret_row.registered_ind := term_rec.registered_ind;
            CASE WHEN (student_rec.degree_award_category IS NOT NULL
                       AND SIGN(term_rec.total_credits) = 1
                       AND term_rec.enrolled_ind = 'Y') THEN
                ret_row.acad_outcome_enrolled_ind := 'Y';
            ELSE
                ret_row.acad_outcome_enrolled_ind := 'N';
            END CASE;
            --BLM mepped 6/2/14 for security reasons
            --ret_row.enst_user_attribute_01 := NULL;
            ret_row.enst_user_attribute_01 := ret_row.multi_source;
            ret_row.enst_user_attribute_02 := NULL;
            ret_row.enst_user_attribute_03 := NULL;
            ret_row.enst_user_attribute_04 := NULL;
            ret_row.enst_user_attribute_05 := NULL;

--    student performance
            ret_row.academic_standing := term_rec.academic_standing;
            ret_row.academic_standing_end := term_rec.academic_standing_end;
            CASE WHEN term_rec.academic_stand_override IS NOT NULL THEN
                ret_row.acad_standing_override_ind  := 1;
            ELSE
                ret_row.acad_standing_override_ind  := 0;
            END CASE;
            ret_row.combined_academic_standing := term_rec.combined_acad_standing;
            ret_row.deans_list := term_rec.deans_list_value;
            ret_row.progress_evaluation := term_rec.progress_evaluation;
            ret_row.acad_period_gpa_range := gpa_by_term_rec.gpa;
            CASE WHEN stud_crse_info_rec.cumulative_credits_for_gpa = 0 THEN
                ret_row.cumulative_gpa_range:= 0 ;
            ELSE
                ret_row.cumulative_gpa_range:= round((stud_crse_info_rec.cumulative_quality_points)/(stud_crse_info_rec.cumulative_credits_for_gpa),9);
            END CASE;
            ret_row.cumulative_gpa_threshold := ret_row.cumulative_gpa_range;
            --BLM mepped 6/2/14 for security reasons
            --ret_row.sprf_user_attribute_01 := NULL;
            ret_row.sprf_user_attribute_01 := ret_row.multi_source;
            ret_row.sprf_user_attribute_02 := NULL;
            ret_row.sprf_user_attribute_03 := NULL;
            ret_row.sprf_user_attribute_04 := NULL;
            ret_row.sprf_user_attribute_05 := NULL;
--    student status
            CASE WHEN term_rec.enrolled_ind = 'Y' THEN
                ret_row.ss_enrolled_ind := 1;
            ELSE
                ret_row.ss_enrolled_ind := 0;
            END CASE;
            CASE WHEN term_rec.enroll_census_date1_ind = 'Y' THEN
                ret_row.enroll_by_census_date1_ind := 1;
            WHEN term_rec.enroll_census_date1_ind = 'N' THEN
                ret_row.enroll_by_census_date1_ind := 0;
            ELSE
                ret_row.enroll_by_census_date1_ind := -1;
            END CASE;
            CASE WHEN term_rec.enroll_census_date2_ind = 'Y' THEN
                ret_row.enroll_by_census_date2_ind := 1;
            WHEN term_rec.enroll_census_date2_ind = 'N' THEN
                ret_row.enroll_by_census_date2_ind := 0;
            ELSE
                ret_row.enroll_by_census_date2_ind := -1;
            END CASE;
            CASE WHEN student_rec.permit_registration = 'Y' THEN
                ret_row.permit_registration_ind := 1;
            ELSE
                ret_row.permit_registration_ind := 0;
            END CASE;
            CASE WHEN term_rec.registered_ind = 'Y' THEN
                ret_row.ss_registered_ind := 1;
            ELSE
                ret_row.ss_registered_ind := 0;
            END CASE;
            CASE WHEN (term_rec.withdrawn_ind = 'Y' OR term_rec.external_withdrawn_ind = 'Y') THEN
                ret_row.withdrawn_ind := 1;
            ELSE
                ret_row.withdrawn_ind := 0;
            END CASE;
            CASE WHEN student_rec.matriculated_ind = 'Y' THEN
                ret_row.matriculated_ind := 1;
            ELSE
                ret_row.matriculated_ind := 0;
            END CASE;
            CASE WHEN term_rec.new_student_ind = 'Y' THEN
                ret_row.new_student_ind := 1;
            ELSE
                ret_row.new_student_ind := 0;
            END CASE;
            CASE WHEN term_rec.academic_history_exists_ind = 'Y' THEN
                ret_row.acad_history_exists_ind := 1;
            ELSE
                ret_row.acad_history_exists_ind := 0;
            END CASE;
            ret_row.ss_acad_outcome_enroll_ind := NVL(CASE WHEN  ((LENGTH(student_rec.AWARD_CATEGORY) > 0) AND (SIGN(term_rec.total_credits) = 1) AND term_rec.enrolled_ind ='Y')
                                                      THEN 1
                                                      ELSE 0
                                                      END,0);
            CASE WHEN student_rec.graduate_credit_elig_ind = 'Y' THEN
                ret_row.graduate_credit_elig_ind := 1;
            ELSE
                ret_row.graduate_credit_elig_ind := 0;
            END CASE;
            CASE WHEN term_rec.cooperative_education_ind = 'Y' THEN
                ret_row.coop_ed_participant_ind := 1;
            ELSE
                ret_row.coop_ed_participant_ind := 0;
            END CASE;
            --BLM mepped 6/2/14 for security reasons
            --ret_row.stst_user_attribute_01 := NULL;
            ret_row.stst_user_attribute_01 := ret_row.multi_source;
            ret_row.stst_user_attribute_02 := NULL;
            ret_row.stst_user_attribute_03 := NULL;
            ret_row.stst_user_attribute_04 := NULL;
            ret_row.stst_user_attribute_05 := NULL;
--    measures
            ret_row.academic_outcome_seq_num := student_rec.outcome_number;
            ret_row.curriculum_order := 1;
            ret_row.curriculum_priority := student_rec.curriculum_priority;
            ret_row.enrollment_status_date := TRUNC(NVL(term_rec.enrollment_status_date,'31-DEC-2099'));
            ret_row.INITIAL_ENROLL_STATUS_DATE := TRUNC(NVL(term_rec.enrollment_add_date,'31-DEC-2099'));
            ret_row.current_time_status_date := TRUNC(NVL(term_rec.current_time_status_date,'31-DEC-2099'));
            ret_row.cumulative_gpa := ret_row.cumulative_gpa_range ;
            ret_row.academic_period_gpa := gpa_by_term_rec.gpa;
            CASE WHEN stud_crse_info_rec.yr_tot_cred_gpa = 0 THEN
                ret_row.academic_year_gpa := 0;
            ELSE
                ret_row.academic_year_gpa := round((stud_crse_info_rec.yr_final_grd_qlty_pnts)/(stud_crse_info_rec.yr_tot_cred_gpa),9);
            END CASE;
            ret_row.previous_academic_period_gpa := prev_acad_period_gpa_rec.gpa;
            ret_row.acad_period_attend_count := acad_period_count_rec.period_count;
            ret_row.total_acad_period_attend_count := acad_period_tot_count_rec.period_count;
            ret_row.changed_major_count := major_count_rec.changed_major_count;
            ret_row.undeclared_major_count := major_count_rec.undeclared_major_count;
            ret_row.acad_study_registered_in_count := student_rec.acad_study_registered_in_count ;
            ret_row.student_fte := student_rec.student_fte;
            ret_row.fte_divisor := student_rec.fte_divisor;
            ret_row.admit_age := student_rec.age_admitted;
            ret_row.leave_from_date := TRUNC(NVL(student_rec.leave_date_from, '31-DEC-2099')) ;
            ret_row.leave_to_date := TRUNC(NVL(student_rec.leave_date_to, '31-DEC-2099')) ;
            ret_row.academic_standing_end_date := TRUNC(NVL(term_rec.academic_standing_end_date, '31-DEC-2099')) ;
            ret_row.start_date_matriculated := TRUNC(NVL(student_rec.start_date_matriculated, '31-DEC-2099')) ;
            ret_row.start_date_admitted := TRUNC(NVL(student_rec.start_date_admitted, '31-DEC-2099')) ;
            ret_row.start_date := TRUNC(NVL(student_rec.start_date, '31-DEC-2099'));
            ret_row.end_date := TRUNC(TO_DATE('31-DEC-2099'));
            ret_row.expected_grad_date := TRUNC(NVL(student_rec.expected_graduation_date, '31-DEC-2099')) ;
            ret_row.outcome_application_date := TRUNC(NVL(acad_outcome_rec.outcome_application_date, '31-DEC-2099'));
            ret_row.outcome_graduation_date := TRUNC(NVL(acad_outcome_rec.outcome_graduation_date, '31-DEC-2099')) ;
            ret_row.student_course_group_key := stud_crse_info_rec.stud_course_grp_key;
            ret_row.course_in_progress_count := stud_crse_info_rec.course_in_progress_count;
            ret_row.total_credits            := stud_crse_info_rec.total_credits;
            ret_row.total_credits_earned     := stud_crse_info_rec.total_credits_earn;
            ret_row.total_credits_passed     := stud_crse_info_rec.total_credits_pass;
            ret_row.total_credits_attempted  := stud_crse_info_rec.total_credits_attm;
            ret_row.total_quality_points     := stud_crse_info_rec.final_grd_qlty_pnts;
            ret_row.total_credits_for_gpa    := stud_crse_info_rec.tot_cred_gpa;
            ret_row.cumulative_credits_earned := stud_crse_info_rec.cumulative_credits_earned;
            ret_row.cumulative_credits_passed := stud_crse_info_rec.cumulative_credits_passed;
            ret_row.cumulative_credits_attempted:= stud_crse_info_rec.cumulative_credits_attempted;
            ret_row.cumulative_quality_points   := stud_crse_info_rec.cumulative_quality_points;
            ret_row.cumulative_credits_for_gpa  := stud_crse_info_rec.cumulative_credits_for_gpa;
            ret_row.developmental_course_ind    := stud_crse_info_rec.developmental_course_ind;
            ret_row.course_attempted_count      := stud_crse_info_rec.course_attempted_headcount;
            ret_row.course_passed_count         := stud_crse_info_rec.course_passed_headcount;
            ret_row.course_failed_count         := stud_crse_info_rec.course_failed_headcount;
            ret_row.course_drop_count           := stud_crse_info_rec.course_dropped_headcount;
            ret_row.course_withdrawn_count      := stud_crse_info_rec.course_withdrawn_headcount;
            ret_row.user_measure_01 := NULL;
            ret_row.user_measure_02 := NULL;
            ret_row.user_measure_03 := NULL;
            ret_row.user_measure_04 := NULL;
            ret_row.user_measure_05 := NULL;
            ret_row.system_load_process := 'STUDENT';
            ret_row.system_load_tmstmp := SYSDATE;
--
            recs_wtt_student_input(l_rec_count) := ret_row;
            l_rec_count := l_rec_count +1;
            l_total_rec_count := l_total_rec_count +1;

--    these rowtypes are related to the academic period being processed
            admins_appl_rec := admins_appl_rec_init;
            fa_year_rec := fa_year_rec_init;
            finaid_appl_amt_rec  := finaid_appl_amt_rec_init;
            finaid_appl_need_rec := finaid_appl_need_rec_init;
            offer_composition_amt_rec := offer_composition_amt_rec_init;
            application_ind_rec := application_ind_rec_init;
            stud_crse_info_rec := stud_crse_info_rec_init;
            gpa_by_term_rec := gpa_by_term_rec_init;
            prev_acad_period_gpa_rec := prev_acad_period_gpa_rec_init;
            acad_period_count_rec := acad_period_count_rec_init;
            ret_seq_rec := ret_seq_rec_init;
            ret_seq_acad_period_rec := ret_seq_acad_period_rec_init;
            ret_like_acad_period_rec := ret_like_acad_period_rec_init;
            ret_seq_ind_rec := ret_seq_ind_rec_init;
            ret_like_ind_rec := ret_like_ind_rec_init;
            academic_period_like := NULL;
        END LOOP; -- term_rec

        IF l_rec_count >= 25000 THEN
            FORALL i in recs_wtt_student_input.FIRST..recs_wtt_student_input.LAST
            INSERT INTO WTT_STUDENT_INPUT VALUES recs_wtt_student_input(i);
            recs_wtt_student_input.delete;
            l_rec_count := 0;
        END IF;
--
-- these rowtypes are NOT related to a specific academic period
        ret_row := ret_row_init;
        georegion_rec := georegion_rec_init;
        acad_period_tot_count_rec := acad_period_tot_count_rec_init;
        major_count_rec := major_count_init_rec;
        acad_per_first_last_rec := acad_per_first_last_rec_init;
        acad_outcome_rec := acad_outcome_rec_init;
        acad_time_first_per_rec := acad_time_first_per_rec_init;
        acad_time_last_per_rec := acad_time_last_per_rec_init;
        student_rec := student_rec_init;
--
    END LOOP; -- student_rec
--
    FORALL i in recs_wtt_student_input.FIRST..recs_wtt_student_input.LAST
        INSERT INTO WTT_STUDENT_INPUT VALUES recs_wtt_student_input(i);
    recs_wtt_student_input.delete;
--
    mgkolib.mdrlogd_row.mdrlogd_procedure     := NULL;
    mgkolib.P_WritemdrlogdMsg('Loaded ' || NVL(l_total_rec_count, 0) || ' rows in the WTT_STUDENT_INPUT table.');
    mgkolib.mdrlogd_row.mdrlogd_message :=  G$_NLS.Get('EDW_STUDENT_EXTR-0000', 'SQL','Parallel Thread Process completed successfully at %01%', mgkolib.F_GetDateAndTime);
    mgkolib.P_WriteMdrlogd('N');
    DBMS_ALERT.SIGNAL('EDW_STUDENT_INPUT' || '_' || jobNumber , 'OK');
    COMMIT;
--
    EXCEPTION WHEN OTHERS THEN
        mgkolib.P_WritemdrlogdMsg(G$_NLS.Get('EDW_STUDENT_EXTR-0000', 'SQL','Parallel Thread Process completed with errors at %01%', mgkolib.F_GetDateAndTime));
        mgkolib.mdrlogd_row.mdrlogd_message := 'ERROR: ' || SQLERRM;
        mgkolib.P_WriteMdrlogd('N');
        DBMS_ALERT.SIGNAL('EDW_STUDENT_INPUT' || '_' || jobNumber , SQLERRM);
        COMMIT;
END p_get_student;
--
/******************************************************************************/
function f_get_student_course_attrib(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_student_course_attrib_extr PIPELINED IS
--
    ret_row                     WTT_STUDENT_COURSE_ATTR_INPUT%ROWTYPE;
    ret_row_init                WTT_STUDENT_COURSE_ATTR_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE student_course_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          COURSE_ATTRIBUTE                        VARCHAR2(63),
          COURSE_REFERENCE_NUMBER                 VARCHAR2(63),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          AC_ACADEMIC_PERIOD                      VARCHAR2(63),
          AC_START_DATE                           DATE,
          AC_END_DATE                             DATE,
          AC_YEAR_CODE                            VARCHAR2(63),
          C_PERSON_UID                            NUMBER,
          C_MIF_VALUE                             VARCHAR2(63),
          C_ACADEMIC_PERIOD                       VARCHAR2(63),
          COURSE_IDENTIFICATION                   VARCHAR2(63),
          COURSE_TITLE_SHORT                      VARCHAR2(63),
          COURSE_TITLE_LONG                       VARCHAR2(255),
          COURSE_NUMBER                           VARCHAR2(63),
          C_COURSE_REFERENCE_NUMBER               VARCHAR2(63),
          SUBJECT                                 VARCHAR2(63),
          COURSE_LEVEL                            VARCHAR2(63),
          COURSE_CAMPUS                           VARCHAR2(63),
          COURSE_COLLEGE                          VARCHAR2(63),
          COURSE_DIVISION                         VARCHAR2(255),
          COURSE_DEPARTMENT                       VARCHAR2(63),
          SCHEDULE_TYPE                           VARCHAR2(63),
          STUDENT_MEETING_TIME                    VARCHAR2(63),
          PROGRAM_CLASSIFICATION                  VARCHAR2(63),
          CONTINUING_EDUCATION_IND                VARCHAR2(1),
          COOPERATIVE_EDUCATION_IND               VARCHAR2(1)
    );
    TYPE refCurType     IS REF CURSOR;
    student_course_info_cur       refCurType;
    student_course_info_rec        student_course_info_rec_type;
    TYPE tab_s_course_info_rec_type   IS TABLE OF student_course_info_rec_type INDEX BY PLS_INTEGER;
    student_course_info_recs        tab_s_course_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)                         MULTI_SOURCE,
                 A.ZONE_VALUE                                                  PROCESS_GROUP,
                 A.DOMAIN_VALUE                                                ADMINISTRATIVE_GROUP,
                 A.ACADEMIC_PERIOD                                             ACADEMIC_PERIOD,
                 A.PERSON_UID                                                  person_uid,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                                warehouse_entity_uid,
                 A.COURSE_ATTRIBUTE                                            COURSE_ATTRIBUTE,
                 A.COURSE_REFERENCE_NUMBER                                     COURSE_REFERENCE_NUMBER,
                 PD.*,
                 AC.ACADEMIC_PERIOD                                            ac_academic_period,
                 AC.START_DATE                                                 ac_start_date,
                 AC.END_DATE                                                   ac_end_date,
                 AC.YEAR_CODE                                                  ac_year_code,
                 CD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_STUDENT_COURSE_ATTRIBUTE A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 WCV_EXTR_COURSE_DETAILS  CD
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                                                      FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                                                     WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                                                       AND YTD.YEAR_TYPE = 'ACYR'
                                                                                       AND YTD.YEAR_CODE = academic_year_in
                                                                                       AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value
             AND A.PERSON_UID =  PD.PERSON_ID
             --JOS update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)
             AND A.PERSON_UID =  CD.C_PERSON_UID(+)
             AND A.ACADEMIC_PERIOD = CD.C_ACADEMIC_PERIOD(+)
             AND A.COURSE_REFERENCE_NUMBER = CD.C_COURSE_REFERENCE_NUMBER(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) =  NVL(CD.C_MIF_VALUE, def_multi_source_in);
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)                         MULTI_SOURCE,
                 A.ZONE_VALUE                                                  PROCESS_GROUP,
                 A.DOMAIN_VALUE                                                ADMINISTRATIVE_GROUP,
                 A.ACADEMIC_PERIOD                                             ACADEMIC_PERIOD,
                 A.PERSON_UID                                                  person_uid,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                                warehouse_entity_uid,
                 A.COURSE_ATTRIBUTE                                            COURSE_ATTRIBUTE,
                 A.COURSE_REFERENCE_NUMBER                                     COURSE_REFERENCE_NUMBER,
                 PD.*,
                 AC.ACADEMIC_PERIOD                                            ac_academic_period,
                 AC.START_DATE                                                 ac_start_date,
                 AC.END_DATE                                                   ac_end_date,
                 AC.YEAR_CODE                                                  ac_year_code,
                 CD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_STUDENT_COURSE_ATTRIBUTE A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 WCV_EXTR_COURSE_DETAILS  CD,
                 CHG_STUDENT_COURSE_ATTR CHG
           WHERE ((CHG.PERSON_UID = A.PERSON_UID AND CHG.COURSE_REFERENCE_NUMBER IS NULL) OR
                   (CHG.PERSON_UID IS NULL AND CHG.COURSE_REFERENCE_NUMBER = A.COURSE_REFERENCE_NUMBER) OR
                 (CHG.PERSON_UID = A.PERSON_UID AND CHG.COURSE_REFERENCE_NUMBER = A.COURSE_REFERENCE_NUMBER))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value             
             AND A.PERSON_UID =  PD.PERSON_ID
             --JOS update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)
             AND A.PERSON_UID =  CD.C_PERSON_UID(+)
             AND A.ACADEMIC_PERIOD = CD.C_ACADEMIC_PERIOD(+)
             AND A.COURSE_REFERENCE_NUMBER = CD.C_COURSE_REFERENCE_NUMBER(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) =  NVL(CD.C_MIF_VALUE, def_multi_source_in);
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_STUDENT_COURSE_ATTRIBUTE', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_STUDENT_COURSE_ATTR', 'WFT_STUDENT_COURSE_ATTRIBUTE', 'PERSON_UID');
          edw_general_extr.p_delete_fact_records('CHG_STUDENT_COURSE_ATTR', 'WFT_STUDENT_COURSE_ATTRIBUTE', 'COURSE_REFERENCE_NUMBER', 'WDT_COURSE_REFERENCE_NUMBER', NULL);
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        student_course_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        student_course_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH student_course_info_cur BULK COLLECT INTO student_course_info_recs LIMIT bulk_size;
       EXIT WHEN student_course_info_recs.COUNT = 0;
--
       FOR i IN student_course_info_recs.FIRST..student_course_info_recs.LAST
       LOOP
--     multi source
          ret_row.multi_source := student_course_info_recs(i).multi_source;
          ret_row.process_group := student_course_info_recs(i).process_group;
          ret_row.administrative_group := student_course_info_recs(i).administrative_group;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.msrc_user_attribute_01 := NULL;
          ret_row.msrc_user_attribute_01 := ret_row.multi_source;
          ret_row.msrc_user_attribute_02 := NULL;
          ret_row.msrc_user_attribute_03 := NULL;
          ret_row.msrc_user_attribute_04 := NULL;
          ret_row.msrc_user_attribute_05 := NULL;
--     academic time
          ret_row.academic_period := student_course_info_recs(i).ac_academic_period;
          ret_row.academic_period_begin_date := student_course_info_recs(i).ac_start_date;
          ret_row.academic_period_end_date := student_course_info_recs(i).ac_end_date;
          ret_row.academic_year := student_course_info_recs(i).ac_year_code;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.atim_user_attribute_01 := NULL;
          ret_row.atim_user_attribute_01 := ret_row.multi_source;
          ret_row.atim_user_attribute_02 := NULL;
          ret_row.atim_user_attribute_03 := NULL;
          ret_row.atim_user_attribute_04 := NULL;
          ret_row.atim_user_attribute_05 := NULL;
--     Course
          ret_row.course_identification :=  NVL(student_course_info_recs(i).course_identification, default_rec.null_cleanse_value);
          ret_row.course_title_short :=  NVL(student_course_info_recs(i).COURSE_TITLE_SHORT, default_rec.null_cleanse_value);
          ret_row.course_title_long := NVL(student_course_info_recs(i).COURSE_TITLE_LONG, default_rec.null_cleanse_value) ;
          ret_row.course_number := NVL(student_course_info_recs(i).course_number, default_rec.null_cleanse_value) ;
          ret_row.program_classification := student_course_info_recs(i).program_classification;
          ret_row.subject := student_course_info_recs(i).subject;
          ret_row.course_level := student_course_info_recs(i).course_level;
          ret_row.course_campus := student_course_info_recs(i).COURSE_CAMPUS;
          ret_row.course_college := student_course_info_recs(i).COURSE_COLLEGE;
          ret_row.course_division := student_course_info_recs(i).COURSE_DIVISION;
          ret_row.course_department := student_course_info_recs(i).COURSE_DEPARTMENT;
          ret_row.session_type := student_course_info_recs(i).student_meeting_time;
          CASE
          WHEN student_course_info_recs(i).c_person_uid IS NULL THEN ret_row.continuing_education_ind := NULL;
          WHEN student_course_info_recs(i).continuing_education_ind = 'Y' THEN ret_row.continuing_education_ind := 1;
          ELSE ret_row.continuing_education_ind := 0;
          END CASE;
          CASE
          WHEN student_course_info_recs(i).c_person_uid IS NULL THEN ret_row.cooperative_education_ind := NULL;
          WHEN student_course_info_recs(i).cooperative_education_ind = 'Y' THEN ret_row.cooperative_education_ind := 1;
          ELSE ret_row.cooperative_education_ind := 0;
          END CASE;
          ret_row.schedule := student_course_info_recs(i).schedule_type;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.crse_user_attribute_01 := NULL;
          ret_row.crse_user_attribute_01 := ret_row.multi_source;
          ret_row.crse_user_attribute_02 := NULL;
          ret_row.crse_user_attribute_03 := NULL;
          ret_row.crse_user_attribute_04 := NULL;
          ret_row.crse_user_attribute_05 := NULL;
--     Course Reference Number
          ret_row.course_reference_number := student_course_info_recs(i).course_reference_number;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.crnb_user_attribute_01 := NULL;
          ret_row.crnb_user_attribute_01 := ret_row.multi_source;
          ret_row.crnb_user_attribute_02 := NULL;
          ret_row.crnb_user_attribute_03 := NULL;
          ret_row.crnb_user_attribute_04 := NULL;
          ret_row.crnb_user_attribute_05 := NULL;
--     person
          ret_row.person_uid := student_course_info_recs(i).warehouse_entity_uid;
          ret_row.id := student_course_info_recs(i).id;
          ret_row.full_name_lfmi := student_course_info_recs(i).full_name_lfmi;
          ret_row.birth_date := student_course_info_recs(i).birth_date;
          ret_row.deceased_date := student_course_info_recs(i).deceased_date;
          ret_row.email_address := student_course_info_recs(i).email_address;
          ret_row.phone_number_combined := student_course_info_recs(i).phone_number_combined;
          ret_row.confidentiality_ind := student_course_info_recs(i).confidentiality_ind;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.pers_user_attribute_01 := NULL;
          ret_row.pers_user_attribute_01 := ret_row.multi_source;
          ret_row.pers_user_attribute_02 := NULL;
          ret_row.pers_user_attribute_03 := NULL;
          ret_row.pers_user_attribute_04 := NULL;
          ret_row.pers_user_attribute_05 := NULL;
--a    ttribute
          ret_row.attribute := student_course_info_recs(i).course_attribute;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.satt_user_attribute_01 := NULL;
          ret_row.satt_user_attribute_01 := ret_row.multi_source;
          ret_row.satt_user_attribute_02 := NULL;
          ret_row.satt_user_attribute_03 := NULL;
          ret_row.satt_user_attribute_04 := NULL;
          ret_row.satt_user_attribute_05 := NULL;
--m    easures
          ret_row.user_measure_01 := NULL;
          ret_row.user_measure_02 := NULL;
          ret_row.user_measure_03 := NULL;
          ret_row.user_measure_04 := NULL;
          ret_row.user_measure_05 := NULL;
          ret_row.system_load_process := 'STUDENT_COURSE_ATTRIBUTE';
--

          PIPE ROW(ret_row);
--
          ret_row := ret_row_init;
--
       END LOOP; -- student_course_attrib_rec
--
   END LOOP;
--
   CLOSE student_course_info_cur;
--
   RETURN;
--
  END f_get_student_course_attrib;
/******************************************************************************/
function f_get_acad_outcome(academic_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_acad_outcome_extr PIPELINED IS
--
    ret_row                     WTT_ACADEMIC_OUTCOME_INPUT%ROWTYPE;
    ret_row_init                WTT_ACADEMIC_OUTCOME_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
--
--

--
        TYPE acad_outcome_info_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          ACADEMIC_GRAD_PERIOD                    VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          ACADEMIC_OUTCOME_STATUS                 VARCHAR2(500),
          BULLETIN_YEAR                           VARCHAR2(63),
          GRADUATION_STATUS                       VARCHAR2(3),
          APPLIED_FOR_OUTCOME_IND                 NUMBER,
          OUTCOME_AWARDED_IND                     NUMBER,
          OUTCOME_REQ_COMPLETED_IND               NUMBER,
          TRANSFER_WORK_EXISTS_IND                NUMBER,
          STUDENT_LEVEL                           VARCHAR2(500),
          PROGRAM                                 VARCHAR2(63),
          CAMPUS                                  VARCHAR2(63),
          COLLEGE                                 VARCHAR2(500),
          AWARD_CATEGORY                          VARCHAR2(63),
          DEGREE                                  VARCHAR2(500),
          MAJOR                                   VARCHAR2(63),
          PROGRAM_CLASSIFICATION                  VARCHAR2(63),
          DEPARTMENT                              VARCHAR2(63),
          SECOND_MAJOR                            VARCHAR2(63),
          SECOND_PROG_CLASSIFICATION              VARCHAR2(63),
          SECOND_DEPARTMENT                       VARCHAR2(63),
          OUTCOME_NUMBER                          NUMBER,
          CURRICULUM_ORDER                        NUMBER,
          CURRICULUM_PRIORITY                     NUMBER,
          OUTCOME_APPLICATION_DATE                DATE,
          OUTCOME_GRADUATION_DATE                 DATE,
          CREDITS_ATTEMPTED                       NUMBER,
          CREDITS_EARNED                          NUMBER,
          GPA_CREDITS                             NUMBER,
          QUALITY_POINTS                          NUMBER,
          GPA                                     NUMBER,
          CREDITS_PASSED                          NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255),
          AC_ACADEMIC_PERIOD                      VARCHAR2(63),
          AC_START_DATE                           DATE,
          AC_END_DATE                             DATE,
          AC_YEAR_CODE                            VARCHAR2(63),
          GT_ACADEMIC_PERIOD                      VARCHAR2(63),
          GT_START_DATE                           DATE,
          GT_END_DATE                             DATE,
          GT_YEAR_CODE                            VARCHAR2(63)
    );
    TYPE refCurType     IS REF CURSOR;
    acad_outcome_info_cur       refCurType;
    acad_outcome_info_rec        acad_outcome_info_rec_type;
    TYPE tab_acad_outcome_info_rec_type   IS TABLE OF acad_outcome_info_rec_type INDEX BY PLS_INTEGER;
    acad_outcome_info_recs        tab_acad_outcome_info_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(A.MIF_VALUE, def_multi_source_in)                    multi_source,
                 A.ZONE_VALUE                                             process_group,
                 A.DOMAIN_VALUE                                           administrative_group,
                 A.STUDENT_TERM                                           academic_period,
                 A.ACADEMIC_PERIOD_GRADUATION                             academic_grad_period,
                 A.PERSON_UID                                             person_uid,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                           warehouse_entity_uid,
                 NVL(A.STATUS, DEFAULT_REC.NULL_CLEANSE_VALUE)            academic_outcome_status,
                 A.BULLETIN_YEAR                                          bulletin_year,
                 A.GRADUATION_STATUS                                      graduation_status,
                 DECODE(A.APPLIED_FOR_OUTCOME_IND,'Y', 1, 0)              applied_for_outcome_ind,
                 DECODE(A.OUTCOME_AWARDED_IND,'A', 1, 0)                  outcome_awarded_ind,
                 DECODE(A.GRAD_REQ_COMPLETED_TERM, NULL, 0, 1)            outcome_req_completed_ind,
                 DECODE(A.TRANSFER_WORK_EXISTS_IND,'Y', 1, 0)             transfer_work_exists_ind,
                 NVL(A.STUDENT_LEVEL, DEFAULT_REC.NULL_CLEANSE_VALUE)     student_level,
                 A.program                                                program,
                 A.campus                                                 campus,
                 NVL(A.college, DEFAULT_REC.NULL_CLEANSE_VALUE)           college,
                 A.category                                               award_category,
                 NVL(A.outcome, DEFAULT_REC.NULL_CLEANSE_VALUE)           degree,
                 A.major                                                  major,
                 A.program_classification                                 program_classification,
                 A.department                                             department,
                 A.SEC_MAJOR                                              second_major,
                 A.SEC_PROGRAM_CLASSIFICATION                             second_prog_classification,
                 A.SEC_DEPARTMENT                                         second_department,
                 A.OUTCOME_NUMBER                                         outcome_number,
                 A.CURRICULUM_ORDER                                       curriculum_order,
                 A.CURRICULUM_PRIORITY                                    curriculum_priority,
                 TRUNC(NVL(A.OUTCOME_APPLICATION_DATE, '31-DEC-2099'))    outcome_application_date,
                 TRUNC(NVL(A.OUTCOME_GRADUATION_DATE, '31-DEC-2099'))     outcome_graduation_date,
                 A.CREDITS_ATTEMPTED                                      credits_attempted,
                 A.CREDITS_EARNED                                         credits_earned,
                 A.GPA_CREDITS                                            gpa_credits,
                 A.QUALITY_POINTS                                         quality_points,
                 A.GPA                                                    gpa,
                 A.CREDITS_PASSED                                         credits_passed,
                 PD.*,
                 AC.ACADEMIC_PERIOD                                       ac_academic_period,
                 AC.START_DATE                                            ac_start_date,
                 AC.END_DATE                                              ac_end_date,
                 AC.YEAR_CODE                                             ac_year_code,
                 GT.ACADEMIC_PERIOD                                       gt_academic_period,
                 GT.START_DATE                                            gt_start_date,
                 GT.END_DATE                                              gt_end_date,
                 GT.YEAR_CODE                                             gt_year_code
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_ACADEMIC_OUTCOME A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 MGT_YEAR_TYPE_DEFINITION GT
           WHERE ((academic_year_in = 'ALL' or (EXISTS (SELECT 'x'
                                                                                      FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                                                     WHERE YTD.ACADEMIC_PERIOD = A.STUDENT_TERM
                                                                                        AND YTD.YEAR_TYPE = 'ACYR'
                                                                                        AND YTD.YEAR_CODE = academic_year_in
                                                                                        AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(YTD.MIF_VALUE, def_multi_source_in)))))
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND A.CURRICULUM_ORDER = 1
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value             
             AND A.PERSON_UID =  PD.PERSON_ID
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
--             AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.STUDENT_TERM = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)
             AND GT.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD_GRADUATION = GT.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(GT.MIF_VALUE(+), def_multi_source_in);
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(A.MIF_VALUE, def_multi_source_in)                    multi_source,
                 A.ZONE_VALUE                                             process_group,
                 A.DOMAIN_VALUE                                           administrative_group,
                 A.STUDENT_TERM                                           academic_period,
                 A.ACADEMIC_PERIOD_GRADUATION                             academic_grad_period,
                 A.PERSON_UID                                             person_uid,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)                           warehouse_entity_uid,
                 NVL(A.STATUS, DEFAULT_REC.NULL_CLEANSE_VALUE)            academic_outcome_status,
                 A.BULLETIN_YEAR                                          bulletin_year,
                 A.GRADUATION_STATUS                                      graduation_status,
                 DECODE(A.APPLIED_FOR_OUTCOME_IND,'Y', 1, 0)              applied_for_outcome_ind,
                 DECODE(A.OUTCOME_AWARDED_IND,'A', 1, 0)                  outcome_awarded_ind,
                 DECODE(A.GRAD_REQ_COMPLETED_TERM, NULL, 0, 1)            outcome_req_completed_ind,
                 DECODE(A.TRANSFER_WORK_EXISTS_IND,'Y', 1, 0)             transfer_work_exists_ind,
                 NVL(A.STUDENT_LEVEL, DEFAULT_REC.NULL_CLEANSE_VALUE)     student_level,
                 A.program                                                program,
                 A.campus                                                 campus,
                 NVL(A.college, DEFAULT_REC.NULL_CLEANSE_VALUE)           college,
                 A.category                                               award_category,
                 NVL(A.outcome, DEFAULT_REC.NULL_CLEANSE_VALUE)           degree,
                 A.major                                                  major,
                 A.program_classification                                 program_classification,
                 A.department                                             department,
                 A.SEC_MAJOR                                              second_major,
                 A.SEC_PROGRAM_CLASSIFICATION                             second_prog_classification,
                 A.SEC_DEPARTMENT                                         second_department,
                 A.OUTCOME_NUMBER                                         outcome_number,
                 A.CURRICULUM_ORDER                                       curriculum_order,
                 A.CURRICULUM_PRIORITY                                    curriculum_priority,
                 TRUNC(NVL(A.OUTCOME_APPLICATION_DATE, '31-DEC-2099'))    outcome_application_date,
                 TRUNC(NVL(A.OUTCOME_GRADUATION_DATE, '31-DEC-2099'))     outcome_graduation_date,
                 A.CREDITS_ATTEMPTED                                      credits_attempted,
                 A.CREDITS_EARNED                                         credits_earned,
                 A.GPA_CREDITS                                            gpa_credits,
                 A.QUALITY_POINTS                                         quality_points,
                 A.GPA                                                    gpa,
                 A.CREDITS_PASSED                                         credits_passed,
                 PD.*,
                 AC.ACADEMIC_PERIOD                                       ac_academic_period,
                 AC.START_DATE                                            ac_start_date,
                 AC.END_DATE                                              ac_end_date,
                 AC.YEAR_CODE                                             ac_year_code,
                 GT.ACADEMIC_PERIOD                                       gt_academic_period,
                 GT.START_DATE                                            gt_start_date,
                 GT.END_DATE                                              gt_end_date,
                 GT.YEAR_CODE                                             gt_year_code
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MST_ACADEMIC_OUTCOME A,
                 WCV_EXTR_PERSON_DETAILS PD,
                 MGT_YEAR_TYPE_DEFINITION AC,
                 MGT_YEAR_TYPE_DEFINITION GT,
                 CHG_ACADEMIC_OUTCOME CHG
           WHERE CHG.PERSON_UID = A.PERSON_UID
             AND (debug_var_in IS NULL OR A.PERSON_UID LIKE debug_var_in)
             AND A.CURRICULUM_ORDER = 1
             AND WE.BANNER_PIDM = A.PERSON_UID
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = a.mif_value             
             AND A.PERSON_UID =  PD.PERSON_ID
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.STUDENT_TERM = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(AC.MIF_VALUE(+), def_multi_source_in)
             AND GT.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD_GRADUATION = GT.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, def_multi_source_in) = NVL(GT.MIF_VALUE(+), def_multi_source_in);
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_ACADEMIC_OUTCOME', academic_year_in);
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_ACADEMIC_OUTCOME', 'WFT_ACADEMIC_OUTCOME', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        acad_outcome_info_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        acad_outcome_info_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH acad_outcome_info_cur BULK COLLECT INTO acad_outcome_info_recs LIMIT bulk_size;
       EXIT WHEN acad_outcome_info_recs.COUNT = 0;
--
       FOR i IN acad_outcome_info_recs.FIRST..acad_outcome_info_recs.LAST
       LOOP
--     multi source
          ret_row.multi_source := acad_outcome_info_recs(i).multi_source;
          ret_row.process_group := acad_outcome_info_recs(i).process_group;
          ret_row.administrative_group := acad_outcome_info_recs(i).administrative_group;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.msrc_user_attribute_01 := NULL;
          ret_row.msrc_user_attribute_01 := ret_row.multi_source;
          ret_row.msrc_user_attribute_02 := NULL;
          ret_row.msrc_user_attribute_03 := NULL;
          ret_row.msrc_user_attribute_04 := NULL;
          ret_row.msrc_user_attribute_05 := NULL;
--     academic time
          ret_row.academic_period := acad_outcome_info_recs(i).ac_academic_period;
          ret_row.academic_period_begin_date := acad_outcome_info_recs(i).ac_start_date;
          ret_row.academic_period_end_date := acad_outcome_info_recs(i).ac_end_date;
          ret_row.academic_year := acad_outcome_info_recs(i).ac_year_code;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.atim_user_attribute_01 := NULL;
          ret_row.atim_user_attribute_01 := ret_row.multi_source;
          ret_row.atim_user_attribute_02 := NULL;
          ret_row.atim_user_attribute_03 := NULL;
          ret_row.atim_user_attribute_04 := NULL;
          ret_row.atim_user_attribute_05 := NULL;
--     graduation academic time
          ret_row.g_academic_period := acad_outcome_info_recs(i).gt_academic_period;
          ret_row.g_academic_period_begin_date := acad_outcome_info_recs(i).gt_start_date;
          ret_row.g_academic_period_end_date := acad_outcome_info_recs(i).gt_end_date;
          ret_row.g_academic_year := acad_outcome_info_recs(i).gt_year_code;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.gtim_user_attribute_01 := NULL;
          ret_row.gtim_user_attribute_01 := ret_row.multi_source;
          ret_row.gtim_user_attribute_02 := NULL;
          ret_row.gtim_user_attribute_03 := NULL;
          ret_row.gtim_user_attribute_04 := NULL;
          ret_row.gtim_user_attribute_05 := NULL;
--     Demographic
          ret_row.gender := acad_outcome_info_recs(i).gender;
          ret_row.ethnicity_category := acad_outcome_info_recs(i).ethnicity_category;
          ret_row.hispanic_latino_ethn_ind := acad_outcome_info_recs(i).hispanic_latino_ethnicity_ind;
          ret_row.asian_ind := acad_outcome_info_recs(i).asian_ind;
          ret_row.native_amer_or_alaskan_ind := acad_outcome_info_recs(i).native_american_or_alaskan_ind;
          ret_row.black_or_african_ind := acad_outcome_info_recs(i).black_or_african_ind;
          ret_row.pacific_islander_ind := acad_outcome_info_recs(i).pacific_islander_ind;
          ret_row.white_ind := acad_outcome_info_recs(i).white_ind;
          IF acad_outcome_info_recs(i).number_of_races = 0 and acad_outcome_info_recs(i).resident_alien_visa_count > 0 THEN
             ret_row.non_resident_ind := 'Y';
          ELSE
             ret_row.non_resident_ind := 'N';
          END IF;
          IF NVL(acad_outcome_info_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N' AND
             acad_outcome_info_recs(i).number_of_races = 0 AND
             acad_outcome_info_recs(i).resident_alien_visa_count = 0 THEN
             ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
          ELSE
             ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
          END IF;
          ret_row.two_or_more_ind := acad_outcome_info_recs(i).two_or_more_ind;
          ret_row.race_ethnicity_confirm_ind := acad_outcome_info_recs(i).race_ethnicity_confirm_ind;
          ret_row.minority_ind := acad_outcome_info_recs(i).minority_ind;
          ret_row.ethnicity := acad_outcome_info_recs(i).ethnicity;
          ret_row.deceased_ind := acad_outcome_info_recs(i).deceased_ind;
          ret_row.citizenship_ind := acad_outcome_info_recs(i).citizenship_ind;
          ret_row.citizenship_type := acad_outcome_info_recs(i).citizenship_type;
          ret_row.visa_type := acad_outcome_info_recs(i).visa_type;
          ret_row.nation_of_citizenship := acad_outcome_info_recs(i).nation_of_citizenship;
          ret_row.nation_of_birth := acad_outcome_info_recs(i).nation_of_birth;
          ret_row.primary_disability := acad_outcome_info_recs(i).primary_disability;
          ret_row.legacy := acad_outcome_info_recs(i).legacy;
          ret_row.marital_status := acad_outcome_info_recs(i).marital_status;
          ret_row.religion := acad_outcome_info_recs(i).religion;
          ret_row.veteran_type := acad_outcome_info_recs(i).veteran_type;
          ret_row.veteran_category := acad_outcome_info_recs(i).veteran_category;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.demo_user_attribute_01 := NULL;
          ret_row.demo_user_attribute_01 := ret_row.multi_source;
          ret_row.demo_user_attribute_02 := NULL;
          ret_row.demo_user_attribute_03 := NULL;
          ret_row.demo_user_attribute_04 := NULL;
          ret_row.demo_user_attribute_05 := NULL;
--     person
          ret_row.person_uid := acad_outcome_info_recs(i).warehouse_entity_uid;
          ret_row.id := acad_outcome_info_recs(i).id;
          ret_row.full_name_lfmi := acad_outcome_info_recs(i).full_name_lfmi;
          ret_row.birth_date := acad_outcome_info_recs(i).birth_date;
          ret_row.deceased_date := acad_outcome_info_recs(i).deceased_date;
          ret_row.email_address := acad_outcome_info_recs(i).email_address;
          ret_row.phone_number_combined := acad_outcome_info_recs(i).phone_number_combined;
          ret_row.confidentiality_ind := acad_outcome_info_recs(i).confidentiality_ind;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.pers_user_attribute_01 := NULL;
          ret_row.pers_user_attribute_01 := ret_row.multi_source;
          ret_row.pers_user_attribute_02 := NULL;
          ret_row.pers_user_attribute_03 := NULL;
          ret_row.pers_user_attribute_04 := NULL;
          ret_row.pers_user_attribute_05 := NULL;
--     Academic Outcome
          ret_row.academic_outcome_status := acad_outcome_info_recs(i).academic_outcome_status;
          ret_row.bulletin_year := acad_outcome_info_recs(i).bulletin_year;
          ret_row.graduation_status := acad_outcome_info_recs(i).graduation_status;
          ret_row.applied_for_outcome_ind := acad_outcome_info_recs(i).applied_for_outcome_ind;
          ret_row.outcome_awarded_ind := acad_outcome_info_recs(i).outcome_awarded_ind;
          ret_row.outcome_req_completed_ind := acad_outcome_info_recs(i).outcome_req_completed_ind;
          ret_row.transfer_work_exists_ind := acad_outcome_info_recs(i).transfer_work_exists_ind;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.aout_user_attribute_01 := NULL;
          ret_row.aout_user_attribute_01 := ret_row.multi_source;
          ret_row.aout_user_attribute_02 := NULL;
          ret_row.aout_user_attribute_03 := NULL;
          ret_row.aout_user_attribute_04 := NULL;
          ret_row.aout_user_attribute_05 := NULL;
--     Academic Study
          ret_row.student_level := acad_outcome_info_recs(i).student_level;
          ret_row.program := acad_outcome_info_recs(i).program;
          ret_row.campus := acad_outcome_info_recs(i).campus;
          ret_row.college := acad_outcome_info_recs(i).college;
          ret_row.award_category := acad_outcome_info_recs(i).award_category;
          ret_row.degree := acad_outcome_info_recs(i).degree;
          ret_row.major := acad_outcome_info_recs(i).major;
          ret_row.program_classification := acad_outcome_info_recs(i).program_classification;
          ret_row.department := acad_outcome_info_recs(i).department;
          ret_row.second_major := acad_outcome_info_recs(i).second_major;
          ret_row.second_prog_classification := acad_outcome_info_recs(i).second_prog_classification;
          ret_row.second_department := acad_outcome_info_recs(i).second_department;
          --BLM mepped 6/2/14 for security reasons
          --ret_row.astd_user_attribute_01 := NULL;
          ret_row.astd_user_attribute_01 := ret_row.multi_source;
          ret_row.astd_user_attribute_02 := NULL;
          ret_row.astd_user_attribute_03 := NULL;
          ret_row.astd_user_attribute_04 := NULL;
          ret_row.astd_user_attribute_05 := NULL;
--     measures
          ret_row.outcome_number := acad_outcome_info_recs(i).outcome_number;
          ret_row.curriculum_order := acad_outcome_info_recs(i).curriculum_order;
          ret_row.curriculum_priority := acad_outcome_info_recs(i).curriculum_priority;
          ret_row.outcome_application_date := TRUNC(NVL(acad_outcome_info_recs(i).outcome_application_date,'31-DEC-2099'));
          ret_row.outcome_graduation_date := TRUNC(NVL(acad_outcome_info_recs(i).outcome_graduation_date,'31-DEC-2099'));
          ret_row.credits_attempted := acad_outcome_info_recs(i).credits_attempted;
          ret_row.credits_earned := acad_outcome_info_recs(i).credits_earned;
          ret_row.gpa_credits := acad_outcome_info_recs(i).gpa_credits;
          ret_row.quality_points := acad_outcome_info_recs(i).quality_points;
          ret_row.gpa := acad_outcome_info_recs(i).gpa;
          ret_row.credits_passed := acad_outcome_info_recs(i).credits_passed;
          ret_row.user_measure_01 := NULL;
          ret_row.user_measure_02 := NULL;
          ret_row.user_measure_03 := NULL;
          ret_row.user_measure_04 := NULL;
          ret_row.user_measure_05 := NULL;
          ret_row.system_load_process := 'ACADEMIC_OUTCOME';

          PIPE ROW(ret_row);
--
          ret_row := ret_row_init;
--
       END LOOP; -- Academic Outcome
--
   END LOOP;
--
   CLOSE acad_outcome_info_cur;
--
   RETURN;
--
  END f_get_acad_outcome;
/******************************************************************************/
function f_get_retention_multi_year(process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_retention_multi_year_extr PIPELINED IS
--
    ret_row                     WTT_RETENTION_MULTI_YEAR_INPUT%ROWTYPE;
    ret_row_init                WTT_RETENTION_MULTI_YEAR_INPUT%ROWTYPE;
    default_rec                 WCV_DEFAULT_VALUES%ROWTYPE;
    addend_rec                  MTVPARM%ROWTYPE;
    bulk_limit                  MTVPARM%ROWTYPE;
    bulk_size                   NUMBER;
    g_graduated                 PLS_INTEGER;
    r_not_retained              PLS_INTEGER;
    retention_my_cur            SYS_REFCURSOR;
    sqlStmt                     CLOB;
--
    TYPE retention_my_rec_type IS RECORD (
        MULTI_SOURCE_KEY                       NUMBER,
        MULTI_SOURCE                           VARCHAR2(63),
        PERSON_UID                             NUMBER,
        BANNER_PIDM                            NUMBER,
        DEMOGRAPHIC_KEY                        NUMBER,
        STUDENT_LEVEL                          VARCHAR2(63),
        ACADEMIC_PERIOD_FRSTATTEND_KEY         NUMBER,
        DECEASED_DATE                          DATE,
        ACADEMIC_PERIOD1                       VARCHAR2(40),
        YEAR_END_DATE1                         DATE,
        GRADUATED_IND1                         NUMBER,
        EXCLUDE_STUDENT_STATUS_IND1            NUMBER,
        EXCLUDE_ENROLL_STATUS_IND1             NUMBER,
        ACADEMIC_PERIOD2                       VARCHAR2(40),
        R_REGISTERED2                          NUMBER,
        YEAR_END_DATE2                         DATE,
        GRADUATED_IND2                         NUMBER,
        EXCLUDE_STUDENT_STATUS_IND2            NUMBER,
        EXCLUDE_ENROLL_STATUS_IND2             NUMBER,
        ACADEMIC_PERIOD3                       VARCHAR2(40),
        R_REGISTERED3                          NUMBER,
        YEAR_END_DATE3                         DATE,
        GRADUATED_IND3                         NUMBER,
        EXCLUDE_STUDENT_STATUS_IND3            NUMBER,
        EXCLUDE_ENROLL_STATUS_IND3             NUMBER,
        ACADEMIC_PERIOD4                       VARCHAR2(40),
        R_REGISTERED4                          NUMBER,
        YEAR_END_DATE4                         DATE,
        GRADUATED_IND4                         NUMBER,
        EXCLUDE_STUDENT_STATUS_IND4            NUMBER,
        EXCLUDE_ENROLL_STATUS_IND4             NUMBER,
        ACADEMIC_PERIOD5                       VARCHAR2(40),
        R_REGISTERED5                          NUMBER,
        YEAR_END_DATE5                         DATE,
        GRADUATED_IND5                         NUMBER,
        EXCLUDE_STUDENT_STATUS_IND5            NUMBER,
        EXCLUDE_ENROLL_STATUS_IND5             NUMBER,
        ACADEMIC_PERIOD6                       VARCHAR2(40),
        R_REGISTERED6                          NUMBER,
        YEAR_END_DATE6                         DATE,
        GRADUATED_IND6                         NUMBER,
        EXCLUDE_STUDENT_STATUS_IND6            NUMBER,
        EXCLUDE_ENROLL_STATUS_IND6             NUMBER,
        ACADEMIC_PERIOD7                       VARCHAR2(40),
        R_REGISTERED7                          NUMBER,
        YEAR_END_DATE7                         DATE,
        GRADUATED_IND7                         NUMBER,
        EXCLUDE_STUDENT_STATUS_IND7            NUMBER,
        EXCLUDE_ENROLL_STATUS_IND7             NUMBER,
        ACADEMIC_PERIOD8                       VARCHAR2(40),
        R_REGISTERED8                          NUMBER,
        YEAR_END_DATE8                         DATE,
        GRADUATED_IND8                         NUMBER,
        EXCLUDE_STUDENT_STATUS_IND8            NUMBER,
        EXCLUDE_ENROLL_STATUS_IND8             NUMBER
    );
--
    TYPE tab_retention_my_rec_type IS TABLE OF retention_my_rec_type INDEX BY PLS_INTEGER;
    retention_my_recs           tab_retention_my_rec_type;
--
    FUNCTION f_getSQL(def_multi_source_in wcv_default_values.multi_source_cleanse_value%TYPE, addend_in mtvparm.mtvparm_external_code%TYPE)
        RETURN CLOB IS
            retStr  CLOB;
    BEGIN
        retStr :=
        'SELECT DRIVER.MULTI_SOURCE_KEY,
                DRIVER.MULTI_SOURCE,
                DRIVER.PERSON_UID,
                DRIVER.BANNER_PIDM,
                DRIVER.DEMOGRAPHIC_KEY,
                DRIVER.STUDENT_LEVEL,
                DRIVER.ACADEMIC_PERIOD_FRSTATTEND_KEY,
                DRIVER.DECEASED_DATE,
                --
                -- Year 1 Info
                --
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        TO_CHAR(DRIVER.ACADEMIC_PERIOD)
                    ELSE NULL
                END ACADEMIC_PERIOD1,
               CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT END_DATE
                           FROM MGT_YEAR_TYPE_DEFINITION X
                          WHERE X.YEAR_TYPE = ''ACYR''
                            AND X.ACADEMIC_PERIOD = DRIVER.ACADEMIC_PERIOD
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END  YEAR_END_DATE1,
               CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT DISTINCT 1
                           FROM MST_ACADEMIC_OUTCOME Y
                          WHERE Y.PERSON_UID = DRIVER.BANNER_PIDM
                            AND Y.ACADEMIC_YEAR_GRADUATION <=
                                (SELECT YEAR_CODE
                                   FROM MGT_YEAR_TYPE_DEFINITION X
                                  WHERE X.YEAR_TYPE = ''ACYR''
                                    AND X.ACADEMIC_PERIOD = DRIVER.ACADEMIC_PERIOD
                                    AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                            AND STUDENT_LEVEL = DRIVER.STUDENT_LEVEL
                            AND GRADUATED_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END   GRADUATED_IND1,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_GENERAL_STUDENT GS
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = DRIVER.ACADEMIC_PERIOD
                            AND PRIMARY_PROGRAM_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVSTST''
                                    AND M.MTVPARM_EXTERNAL_CODE = GS.STUDENT_STATUS))
                    ELSE NULL
                END EXCLUDE_STUDENT_STATUS_IND1,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT E
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = DRIVER.ACADEMIC_PERIOD
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVESTS''
                                    AND M.MTVPARM_EXTERNAL_CODE = E.ENROLLMENT_STATUS))
                    ELSE NULL
                END EXCLUDE_ENROLL_STATUS_IND1,
                --
                -- Year 2 Info
                --
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        TO_CHAR(DRIVER.ACADEMIC_PERIOD + NVL(<ADDEND_VAR>,100))
                    ELSE NULL
                END ACADEMIC_PERIOD2,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT X
                          WHERE X.PERSON_UID = DRIVER.BANNER_PIDM
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + NVL(<ADDEND_VAR>,100))
                            AND X.REGISTERED_IND = ''Y''
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END R_REGISTERED2,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT END_DATE
                           FROM MGT_YEAR_TYPE_DEFINITION X
                          WHERE X.YEAR_TYPE = ''ACYR''
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + NVL(<ADDEND_VAR>,100))
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END YEAR_END_DATE2,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT DISTINCT 1
                           FROM MST_ACADEMIC_OUTCOME Y
                          WHERE Y.PERSON_UID = DRIVER.BANNER_PIDM
                            AND Y.ACADEMIC_YEAR_GRADUATION <=
                                (SELECT YEAR_CODE
                                   FROM MGT_YEAR_TYPE_DEFINITION X
                                  WHERE X.YEAR_TYPE = ''ACYR''
                                    AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + NVL(<ADDEND_VAR>,100))
                                    AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                            AND STUDENT_LEVEL = DRIVER.STUDENT_LEVEL
                            AND GRADUATED_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END GRADUATED_IND2,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_GENERAL_STUDENT GS
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + NVL(<ADDEND_VAR>,100))
                            AND PRIMARY_PROGRAM_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVSTST''
                                    AND M.MTVPARM_EXTERNAL_CODE = GS.STUDENT_STATUS))
                    ELSE NULL
                END EXCLUDE_STUDENT_STATUS_IND2,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT E
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + NVL(<ADDEND_VAR>,100))
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVESTS''
                                    AND M.MTVPARM_EXTERNAL_CODE = E.ENROLLMENT_STATUS))
                    ELSE NULL
                END EXCLUDE_ENROLL_STATUS_IND2,
                --
                -- Year 3 Info
                --
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*2))
                    ELSE NULL
                END ACADEMIC_PERIOD3,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT X
                          WHERE X.PERSON_UID = DRIVER.BANNER_PIDM
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*2))
                            AND X.REGISTERED_IND = ''Y''
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END R_REGISTERED3,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT END_DATE
                           FROM MGT_YEAR_TYPE_DEFINITION X
                          WHERE X.YEAR_TYPE = ''ACYR''
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*2))
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END YEAR_END_DATE3,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT DISTINCT 1
                           FROM MST_ACADEMIC_OUTCOME Y
                          WHERE Y.PERSON_UID = DRIVER.BANNER_PIDM
                            AND Y.ACADEMIC_YEAR_GRADUATION <=
                                (SELECT YEAR_CODE
                                   FROM MGT_YEAR_TYPE_DEFINITION X
                                  WHERE X.YEAR_TYPE = ''ACYR''
                                    AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*2))
                                    AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                            AND STUDENT_LEVEL = DRIVER.STUDENT_LEVEL
                            AND GRADUATED_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END GRADUATED_IND3,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_GENERAL_STUDENT GS
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*2))
                            AND PRIMARY_PROGRAM_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVSTST''
                                    AND M.MTVPARM_EXTERNAL_CODE = GS.STUDENT_STATUS))
                    ELSE NULL
                END EXCLUDE_STUDENT_STATUS_IND3,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT E
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*2))
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVESTS''
                                    AND M.MTVPARM_EXTERNAL_CODE = E.ENROLLMENT_STATUS))
                    ELSE NULL
                END EXCLUDE_ENROLL_STATUS_IND3,
                --
                -- Year 4 Info
                --
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*3))
                    ELSE NULL
                END ACADEMIC_PERIOD4,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT X
                          WHERE X.PERSON_UID = DRIVER.BANNER_PIDM
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*3))
                            AND X.REGISTERED_IND = ''Y''
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END R_REGISTERED4,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT END_DATE
                           FROM MGT_YEAR_TYPE_DEFINITION X
                          WHERE X.YEAR_TYPE = ''ACYR''
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*3))
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END YEAR_END_DATE4,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT DISTINCT 1
                           FROM MST_ACADEMIC_OUTCOME Y
                          WHERE Y.PERSON_UID = DRIVER.BANNER_PIDM
                            AND Y.ACADEMIC_YEAR_GRADUATION <=
                                (SELECT YEAR_CODE
                                   FROM MGT_YEAR_TYPE_DEFINITION X
                                  WHERE X.YEAR_TYPE = ''ACYR''
                                    AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*3))
                                    AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                            AND STUDENT_LEVEL = DRIVER.STUDENT_LEVEL
                            AND GRADUATED_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END GRADUATED_IND4,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_GENERAL_STUDENT GS
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*3))
                            AND PRIMARY_PROGRAM_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVSTST''
                                    AND M.MTVPARM_EXTERNAL_CODE = GS.STUDENT_STATUS))
                    ELSE NULL
                END EXCLUDE_STUDENT_STATUS_IND4,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT E
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*3))
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVESTS''
                                    AND M.MTVPARM_EXTERNAL_CODE = E.ENROLLMENT_STATUS))
                    ELSE NULL
                END EXCLUDE_ENROLL_STATUS_IND4, ';

        retStr := retStr ||
               '--
                -- Year 5 Info
                --
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*4))
                    ELSE NULL
                END ACADEMIC_PERIOD5,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT X
                          WHERE X.PERSON_UID = DRIVER.BANNER_PIDM
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*4))
                            AND X.REGISTERED_IND = ''Y''
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END R_REGISTERED5,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT END_DATE
                           FROM MGT_YEAR_TYPE_DEFINITION X
                          WHERE X.YEAR_TYPE = ''ACYR''
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*4))
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END YEAR_END_DATE5,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT DISTINCT 1
                           FROM MST_ACADEMIC_OUTCOME Y
                          WHERE Y.PERSON_UID = DRIVER.BANNER_PIDM
                            AND Y.ACADEMIC_YEAR_GRADUATION <=
                                (SELECT YEAR_CODE
                                   FROM MGT_YEAR_TYPE_DEFINITION X
                                  WHERE X.YEAR_TYPE = ''ACYR''
                                    AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*4))
                                    AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                            AND STUDENT_LEVEL = DRIVER.STUDENT_LEVEL
                            AND GRADUATED_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END GRADUATED_IND5,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_GENERAL_STUDENT GS
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*4))
                            AND PRIMARY_PROGRAM_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVSTST''
                                    AND M.MTVPARM_EXTERNAL_CODE = GS.STUDENT_STATUS))
                    ELSE NULL
                END EXCLUDE_STUDENT_STATUS_IND5,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT E
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*4))
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVESTS''
                                    AND M.MTVPARM_EXTERNAL_CODE = E.ENROLLMENT_STATUS))
                    ELSE NULL
                END EXCLUDE_ENROLL_STATUS_IND5,
                --
                -- Year 6 Info
                --
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*5))
                    ELSE NULL
                END ACADEMIC_PERIOD6,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT X
                          WHERE X.PERSON_UID = DRIVER.BANNER_PIDM
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*5))
                            AND X.REGISTERED_IND = ''Y''
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END R_REGISTERED6,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT END_DATE
                           FROM MGT_YEAR_TYPE_DEFINITION X
                          WHERE X.YEAR_TYPE = ''ACYR''
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*5))
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END YEAR_END_DATE6,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT DISTINCT 1
                           FROM MST_ACADEMIC_OUTCOME Y
                          WHERE Y.PERSON_UID = DRIVER.BANNER_PIDM
                            AND Y.ACADEMIC_YEAR_GRADUATION <=
                                (SELECT YEAR_CODE
                                   FROM MGT_YEAR_TYPE_DEFINITION X
                                  WHERE X.YEAR_TYPE = ''ACYR''
                                    AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*5))
                                    AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                            AND STUDENT_LEVEL = DRIVER.STUDENT_LEVEL
                            AND GRADUATED_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END GRADUATED_IND6,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_GENERAL_STUDENT GS
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*5))
                            AND PRIMARY_PROGRAM_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVSTST''
                                    AND M.MTVPARM_EXTERNAL_CODE = GS.STUDENT_STATUS))
                    ELSE NULL
                END EXCLUDE_STUDENT_STATUS_IND6,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT E
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*5))
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVESTS''
                                    AND M.MTVPARM_EXTERNAL_CODE = E.ENROLLMENT_STATUS))
                    ELSE NULL
                END EXCLUDE_ENROLL_STATUS_IND6,
                --
                -- Year 7 Info
                --
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*6))
                    ELSE NULL
                END ACADEMIC_PERIOD7,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT X
                          WHERE X.PERSON_UID = DRIVER.BANNER_PIDM
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*6))
                            AND X.REGISTERED_IND = ''Y''
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END R_REGISTERED7,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT END_DATE
                           FROM MGT_YEAR_TYPE_DEFINITION X
                          WHERE X.YEAR_TYPE = ''ACYR''
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*6))
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END YEAR_END_DATE7,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT DISTINCT 1
                           FROM MST_ACADEMIC_OUTCOME Y
                          WHERE Y.PERSON_UID = DRIVER.BANNER_PIDM
                            AND Y.ACADEMIC_YEAR_GRADUATION <=
                                (SELECT YEAR_CODE
                                   FROM MGT_YEAR_TYPE_DEFINITION X
                                  WHERE X.YEAR_TYPE = ''ACYR''
                                    AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*6))
                                    AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                            AND STUDENT_LEVEL = DRIVER.STUDENT_LEVEL
                            AND GRADUATED_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END GRADUATED_IND7,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_GENERAL_STUDENT GS
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*6))
                            AND PRIMARY_PROGRAM_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVSTST''
                                    AND M.MTVPARM_EXTERNAL_CODE = GS.STUDENT_STATUS))
                    ELSE NULL
                END EXCLUDE_STUDENT_STATUS_IND7,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT E
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*6))
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVESTS''
                                    AND M.MTVPARM_EXTERNAL_CODE = E.ENROLLMENT_STATUS))
                    ELSE NULL
                END EXCLUDE_ENROLL_STATUS_IND7,
                --
                -- Year 8 Info
                --
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*7))
                    ELSE NULL
                END ACADEMIC_PERIOD8,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT X
                          WHERE X.PERSON_UID = DRIVER.BANNER_PIDM
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*7))
                            AND X.REGISTERED_IND = ''Y''
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END R_REGISTERED8,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT END_DATE
                           FROM MGT_YEAR_TYPE_DEFINITION X
                          WHERE X.YEAR_TYPE = ''ACYR''
                            AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*7))
                            AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END YEAR_END_DATE8,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT DISTINCT 1
                           FROM MST_ACADEMIC_OUTCOME Y
                          WHERE Y.PERSON_UID = DRIVER.BANNER_PIDM
                            AND Y.ACADEMIC_YEAR_GRADUATION <=
                                (SELECT YEAR_CODE
                                   FROM MGT_YEAR_TYPE_DEFINITION X
                                  WHERE X.YEAR_TYPE = ''ACYR''
                                    AND X.ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*7))
                                    AND NVL(X.MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                            AND STUDENT_LEVEL = DRIVER.STUDENT_LEVEL
                            AND GRADUATED_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE)
                    ELSE NULL
                END GRADUATED_IND8,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_GENERAL_STUDENT GS
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*7))
                            AND PRIMARY_PROGRAM_IND = ''Y''
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVSTST''
                                    AND M.MTVPARM_EXTERNAL_CODE = GS.STUDENT_STATUS))
                    ELSE NULL
                END EXCLUDE_STUDENT_STATUS_IND8,
                CASE
                    WHEN REPLACE(TRANSLATE(DRIVER.ACADEMIC_PERIOD, ''1234567890'', ''0000000000''), ''0'', '''') IS NULL THEN
                        (SELECT 1
                           FROM MST_ENROLLMENT E
                          WHERE PERSON_UID = DRIVER.BANNER_PIDM
                            AND ACADEMIC_PERIOD = TO_CHAR(DRIVER.ACADEMIC_PERIOD + (NVL(<ADDEND_VAR>,100)*7))
                            AND NVL(MIF_VALUE, <DEF_MULTI_SOURCE_IN>) = DRIVER.MULTI_SOURCE
                            AND EXISTS
                                (SELECT NULL
                                   FROM MTVPARM M
                                  WHERE M.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                                    AND M.MTVPARM_INTERNAL_CODE = ''EXCLUSION_STATUS_CODE''
                                    AND M.MTVPARM_INTERNAL_CODE_2 = ''STVESTS''
                                    AND M.MTVPARM_EXTERNAL_CODE = E.ENROLLMENT_STATUS))
                    ELSE NULL
                END EXCLUDE_ENROLL_STATUS_IND8
           FROM (SELECT DISTINCT S.MULTI_SOURCE_KEY,
                        MS.MULTI_SOURCE,
                        S.PERSON_UID,
                        WE.BANNER_PIDM,
                        S.DEMOGRAPHIC_KEY,
                        AST.STUDENT_LEVEL,
                        S.ACADEMIC_PERIOD_FRSTATTEND_KEY,
                        T.ACADEMIC_PERIOD,
                        NVL(P.DECEASED_DATE, TO_DATE(''31-DEC-2099'',''DD-MON-YYYY'')) DECEASED_DATE
                   FROM WDT_ACADEMIC_TIME T,
                        WDT_PERSON P,
                        WDT_MULTI_SOURCE MS,
                        WDT_WAREHOUSE_ENTITY WE,
                        WDT_ACADEMIC_STUDY AST,
                        WFT_STUDENT S <CHANGE_TABLE>
                  WHERE <DEBUG_VAR_LOGIC>
                        <CHANGE_TABLE_CONDITION>
                        EXISTS
                        (SELECT NULL
                           FROM MTVPARM X
                          WHERE X.MTVPARM_INTERNAL_CODE_GROUP = ''EDW EXTRACT PARAMETERS''
                            AND X.MTVPARM_INTERNAL_CODE = ''ACADEMIC_PERIOD_MULTI_YEAR''
                            AND X.MTVPARM_INTERNAL_CODE_2 = ''RETENTION/GRADUATION RATES''
                            AND X.MTVPARM_EXTERNAL_CODE = SUBSTR(T.ACADEMIC_PERIOD,5,2))
                    AND AST.ACADEMIC_STUDY_KEY = S.ACADEMIC_STUDY_KEY
                    --BLM modified for mep effort 7/29/14, added next 5 joins
                    and we.user_attribute_01 = ms.user_attribute_01
                    and we.user_attribute_01 = p.user_attribute_01
                    and we.user_attribute_01 = ms.user_attribute_01
                    and we.user_attribute_01 = ast.user_attribute_01
                    and we.user_attribute_01 = s.mif_value_vc
                    AND WE.WAREHOUSE_ENTITY_UID = S.PERSON_UID
                    AND MS.MULTI_SOURCE_KEY = S.MULTI_SOURCE_KEY
                    AND P.PERSON_UID = S.PERSON_UID
                    AND T.ACADEMIC_TIME_KEY = S.ACADEMIC_PERIOD_FRSTATTEND_KEY) DRIVER';

        -- Replace the Debug parameter logic
        CASE
        WHEN debug_var_in IS NULL THEN
            retStr := REPLACE(retStr, '<DEBUG_VAR_LOGIC>', NULL );
        ELSE
            retStr := REPLACE(retStr, '<DEBUG_VAR_LOGIC>', ' S.PERSON_UID LIKE '''|| debug_var_in ||''' AND ');
        END CASE;

        -- Replace the change table logic based on a [L]oad or [R]efresh of the data
        CASE process_ind_in
        WHEN 'L' THEN
            retStr := REPLACE(retStr, '<CHANGE_TABLE>', NULL);
            retStr := REPLACE(retStr, '<CHANGE_TABLE_CONDITION>', NULL);
        ELSE
            retStr := REPLACE(retStr, '<CHANGE_TABLE>',' , CHG_RETENTION_MULTI_YEAR CHG ');
            retStr := REPLACE(retStr, '<CHANGE_TABLE_CONDITION>',' WE.BANNER_PIDM = CHG.PERSON_UID AND ');
        END CASE;

        -- Replace the Default Multi-Source and Academic Period Addend values
        retStr := REPLACE(retStr, '<DEF_MULTI_SOURCE_IN>', '''' || def_multi_source_in || '''');
--CCCS Customization.  7/8/14 - BLM for Patch 9
--The addend of 100 will not work for both normal terms and continuing ed terms
--So 201430 vs 820143
--Need to add 100 to normal terms and 10 to continuing ed terms
        retStr := REPLACE(retStr, '<ADDEND_VAR>', ''''|| 'CASE WHEN substr(driver.academic_period,1,1) = 8 then 10 else 100 end '||'''');

        RETURN retStr;
    END f_getSQL;
--
  BEGIN
    -- Truncate the fact table during a load or delete specific fact rows during a refresh
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_RETENTION_MULTI_YEAR');
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_RETENTION_MULTI_YEAR', 'WFT_RETENTION_MULTI_YEAR', 'PERSON_UID');
       END IF;
    END IF;

    -- Fetch the default data cleansing values
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;

    -- Fetch the addend used to calculate future academic periods
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','ACADEMIC_PERIOD_LIKE','ADDEND');
    FETCH edw_general_extr.get_mtvparm INTO addend_rec;
    CLOSE edw_general_extr.get_mtvparm;

    -- Fetch the maximum number of rows to process at a time to limit context switching
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    sqlStmt := f_getSQL(default_rec.multi_source_cleanse_value, addend_rec.mtvparm_external_code);
    OPEN retention_my_cur FOR sqlStmt;
    LOOP
        FETCH retention_my_cur BULK COLLECT INTO retention_my_recs LIMIT bulk_size;
        EXIT WHEN retention_my_recs.COUNT =  0;

        FOR i IN retention_my_recs.FIRST..retention_my_recs.LAST
        LOOP

-- key fields
            ret_row.multi_source_key := retention_my_recs(i).multi_source_key;
            ret_row.multi_source := retention_my_recs(i).multi_source;
            ret_row.person_uid := retention_my_recs(i).person_uid;
            ret_row.demographic_key := retention_my_recs(i).demographic_key;
            ret_row.academic_period_frstattend_key := retention_my_recs(i).academic_period_frstattend_key;
-- student
            ret_row.student_level := retention_my_recs(i).student_level;
            --BLM mepped 7/8/14 for security reasons
            --ret_row.levl_user_attribute_01 := NULL;
            ret_row.levl_user_attribute_01 := ret_row.multi_source;
            ret_row.levl_user_attribute_02 := NULL;
            ret_row.levl_user_attribute_03 := NULL;
            ret_row.levl_user_attribute_04 := NULL;
            ret_row.levl_user_attribute_05 := NULL;

/*
*  Calculate retention and graduation multi-year values
*
*  If a student has graduated in an academic year then they are marked as so for
*  that academic year and subsequent ones.  If they did not graduate, and the
*  student has either a) passed away, or b) an enrollment or student status that
*  excludes them then they will be excluded from graduation for that academic year.
*
*  If a student was retained in the previous academic year and is registered in
*  a like academic period then they are retained for that academic year.  If not
*  registered, and the student either a) graduated b) passed away, or c) had an
*  enrollment or student status that excludes them then they will be excluded
*  from retention for that academic year.  If they are not enrolled and not
*  excluded, they are considered not retained for that academic year and
*  subsequent ones.
*
*  Once a student has graduated, they will be excluded from retention counts in
*  all subsequent years.
*/
            CASE WHEN retention_my_recs(i).academic_period1 IS NOT NULL THEN

                -- reset local variables
                g_graduated := 0;
                r_not_retained := 0;

                -- Year 1 Graduation
                ret_row.year1_graduation_ind := 0;
                ret_row.g_year1_exclude_ind := 0;
                IF retention_my_recs(i).graduated_ind1 = 1 THEN
                    ret_row.year1_graduation_ind := 1;
                    g_graduated := 1;
                ELSIF (   retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date1
                       OR retention_my_recs(i).exclude_student_status_ind1 = 1
                       OR retention_my_recs(i).exclude_enroll_status_ind1 = 1 ) THEN
                    ret_row.g_year1_exclude_ind := 1;
                END IF;

                -- Year 2 Retention (must be processed before Year 2 Graduation)
                ret_row.year2_not_retained_ind := 0;
                ret_row.year2_retained_ind := 0;
                ret_row.year2_exclude_ind := 0;
                IF g_graduated = 1 THEN
                    ret_row.year2_exclude_ind := 1;
                ELSE
                    IF retention_my_recs(i).r_registered2 = 1 THEN
                        ret_row.year2_retained_ind := 1;
                    ELSIF (   retention_my_recs(i).graduated_ind2 = 1
                           OR retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date2
                           OR retention_my_recs(i).exclude_student_status_ind2 = 1
                           OR retention_my_recs(i).exclude_enroll_status_ind2 = 1) THEN
                        ret_row.year2_exclude_ind := 1;
                    ELSE
                        ret_row.year2_not_retained_ind := 1;
                        r_not_retained := 1;
                    END IF;
                END IF;

                -- Year 2 Graduation
                ret_row.year2_graduation_ind := g_graduated;
                ret_row.g_year2_exclude_ind := 0;
                IF (g_graduated = 1 OR retention_my_recs(i).graduated_ind2 = 1) THEN
                    ret_row.year2_graduation_ind := 1;
                    g_graduated := 1;
                ELSIF (   retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date2
                       OR retention_my_recs(i).exclude_student_status_ind2 = 1
                       OR retention_my_recs(i).exclude_enroll_status_ind2 = 1 ) THEN
                    ret_row.g_year2_exclude_ind := 1;
                END IF;

                -- Year 3 Retention (must be processed before Year 3 Graduation)
                ret_row.year3_not_retained_ind := r_not_retained;
                ret_row.year3_retained_ind := 0;
                ret_row.year3_exclude_ind := 0;
                IF g_graduated = 1 THEN
                    ret_row.year3_exclude_ind := 1;
                    ret_row.year3_not_retained_ind := 0;
                ELSIF r_not_retained = 0 THEN
                    IF retention_my_recs(i).r_registered3 = 1 THEN
                        ret_row.year3_retained_ind := 1;
                    ELSIF (   retention_my_recs(i).graduated_ind3 = 1
                           OR retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date3
                           OR retention_my_recs(i).exclude_student_status_ind3 = 1
                           OR retention_my_recs(i).exclude_enroll_status_ind3 = 1) THEN
                        ret_row.year3_exclude_ind := 1;
                    ELSE
                        ret_row.year3_not_retained_ind := 1;
                        r_not_retained := 1;
                    END IF;
                END IF;

                -- Year 3 Graduation
                ret_row.year3_graduation_ind := g_graduated;
                ret_row.g_year3_exclude_ind := 0;
                IF (g_graduated = 1 OR retention_my_recs(i).graduated_ind3 = 1) THEN
                    ret_row.year3_graduation_ind := 1;
                    g_graduated := 1;
                ELSIF (   retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date3
                       OR retention_my_recs(i).exclude_student_status_ind3 = 1
                       OR retention_my_recs(i).exclude_enroll_status_ind3 = 1 ) THEN
                    ret_row.g_year3_exclude_ind := 1;
                END IF;

                -- Year 4 Retention (must be processed before Year 4 Graduation)
                ret_row.year4_not_retained_ind := r_not_retained;
                ret_row.year4_retained_ind := 0;
                ret_row.year4_exclude_ind := 0;
                IF g_graduated = 1 THEN
                    ret_row.year4_exclude_ind := 1;
                    ret_row.year4_not_retained_ind := 0;
                ELSIF r_not_retained = 0 THEN
                    IF retention_my_recs(i).r_registered4 = 1 THEN
                        ret_row.year4_retained_ind := 1;
                    ELSIF (   retention_my_recs(i).graduated_ind4 = 1
                           OR retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date4
                           OR retention_my_recs(i).exclude_student_status_ind4 = 1
                           OR retention_my_recs(i).exclude_enroll_status_ind4 = 1) THEN
                        ret_row.year4_exclude_ind := 1;
                    ELSE
                        ret_row.year4_not_retained_ind := 1;
                        r_not_retained := 1;
                    END IF;
                END IF;

                -- Year 4 Graduation
                ret_row.year4_graduation_ind := g_graduated;
                ret_row.g_year4_exclude_ind := 0;
                IF (g_graduated = 1 OR retention_my_recs(i).graduated_ind4 = 1) THEN
                    ret_row.year4_graduation_ind := 1;
                    g_graduated := 1;
                ELSIF (   retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date4
                       OR retention_my_recs(i).exclude_student_status_ind4 = 1
                       OR retention_my_recs(i).exclude_enroll_status_ind4 = 1 ) THEN
                    ret_row.g_year4_exclude_ind := 1;
                END IF;

                -- Year 5 Retention (must be processed before Year 5 Graduation)
                ret_row.year5_not_retained_ind := r_not_retained;
                ret_row.year5_retained_ind := 0;
                ret_row.year5_exclude_ind := 0;
                IF g_graduated = 1 THEN
                    ret_row.year5_exclude_ind := 1;
                    ret_row.year5_not_retained_ind := 0;
                ELSIF r_not_retained = 0 THEN
                    IF retention_my_recs(i).r_registered5 = 1 THEN
                        ret_row.year5_retained_ind := 1;
                    ELSIF (   retention_my_recs(i).graduated_ind5 = 1
                           OR retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date5
                           OR retention_my_recs(i).exclude_student_status_ind5 = 1
                           OR retention_my_recs(i).exclude_enroll_status_ind5 = 1) THEN
                        ret_row.year5_exclude_ind := 1;
                    ELSE
                        ret_row.year5_not_retained_ind := 1;
                        r_not_retained := 1;
                    END IF;
                END IF;

                -- Year 5 Graduation
                ret_row.year5_graduation_ind := g_graduated;
                ret_row.g_year5_exclude_ind := 0;
                IF (g_graduated = 1 OR retention_my_recs(i).graduated_ind5 = 1) THEN
                    ret_row.year5_graduation_ind := 1;
                    g_graduated := 1;
                ELSIF (   retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date5
                       OR retention_my_recs(i).exclude_student_status_ind5 = 1
                       OR retention_my_recs(i).exclude_enroll_status_ind5 = 1 ) THEN
                    ret_row.g_year5_exclude_ind := 1;
                END IF;

                -- Year 6 Retention (must be processed before Year 6 Graduation)
                ret_row.year6_not_retained_ind := r_not_retained;
                ret_row.year6_retained_ind := 0;
                ret_row.year6_exclude_ind := 0;
                IF g_graduated = 1 THEN
                    ret_row.year6_exclude_ind := 1;
                    ret_row.year6_not_retained_ind := 0;
                ELSIF r_not_retained = 0 THEN
                    IF retention_my_recs(i).r_registered6 = 1 THEN
                        ret_row.year6_retained_ind := 1;
                    ELSIF (   retention_my_recs(i).graduated_ind6 = 1
                           OR retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date6
                           OR retention_my_recs(i).exclude_student_status_ind6 = 1
                           OR retention_my_recs(i).exclude_enroll_status_ind6 = 1) THEN
                        ret_row.year6_exclude_ind := 1;
                    ELSE
                        ret_row.year6_not_retained_ind := 1;
                        r_not_retained := 1;
                    END IF;
                END IF;

                -- Year 6 Graduation
                ret_row.year6_graduation_ind := g_graduated;
                ret_row.g_year6_exclude_ind := 0;
                IF (g_graduated = 1 OR retention_my_recs(i).graduated_ind6 = 1) THEN
                    ret_row.year6_graduation_ind := 1;
                    g_graduated := 1;
                ELSIF (   retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date6
                       OR retention_my_recs(i).exclude_student_status_ind6 = 1
                       OR retention_my_recs(i).exclude_enroll_status_ind6 = 1 ) THEN
                    ret_row.g_year6_exclude_ind := 1;
                END IF;

                -- Year 7 Retention (must be processed before Year 6 Graduation)
                ret_row.year7_not_retained_ind := r_not_retained;
                ret_row.year7_retained_ind := 0;
                ret_row.year7_exclude_ind := 0;
                IF g_graduated = 1 THEN
                    ret_row.year7_exclude_ind := 1;
                    ret_row.year7_not_retained_ind := 0;
                ELSIF r_not_retained = 0 THEN
                    IF retention_my_recs(i).r_registered7 = 1 THEN
                        ret_row.year7_retained_ind := 1;
                    ELSIF (   retention_my_recs(i).graduated_ind7 = 1
                           OR retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date7
                           OR retention_my_recs(i).exclude_student_status_ind7 = 1
                           OR retention_my_recs(i).exclude_enroll_status_ind7 = 1) THEN
                        ret_row.year7_exclude_ind := 1;
                    ELSE
                        ret_row.year7_not_retained_ind := 1;
                        r_not_retained := 1;
                    END IF;
                END IF;

                -- Year 7 Graduation
                ret_row.year7_graduation_ind := g_graduated;
                ret_row.g_year7_exclude_ind := 0;
                IF (g_graduated = 1 OR retention_my_recs(i).graduated_ind7 = 1) THEN
                    ret_row.year7_graduation_ind := 1;
                    g_graduated := 1;
                ELSIF (   retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date7
                       OR retention_my_recs(i).exclude_student_status_ind7 = 1
                       OR retention_my_recs(i).exclude_enroll_status_ind7 = 1 ) THEN
                    ret_row.g_year7_exclude_ind := 1;
                END IF;

                -- Year 8 Retention (must be processed before Year 8 Graduation)
                ret_row.year8_not_retained_ind := r_not_retained;
                ret_row.year8_retained_ind := 0;
                ret_row.year8_exclude_ind := 0;
                IF g_graduated = 1 THEN
                    ret_row.year8_exclude_ind := 1;
                    ret_row.year8_not_retained_ind := 0;
                ELSIF r_not_retained = 0 THEN
                    IF retention_my_recs(i).r_registered8 = 1 THEN
                        ret_row.year8_retained_ind := 1;
                    ELSIF (   retention_my_recs(i).graduated_ind8 = 1
                           OR retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date8
                           OR retention_my_recs(i).exclude_student_status_ind8 = 1
                           OR retention_my_recs(i).exclude_enroll_status_ind8 = 1) THEN
                        ret_row.year8_exclude_ind := 1;
                    ELSE
                        ret_row.year8_not_retained_ind := 1;
                        r_not_retained := 1;
                    END IF;
                END IF;

                -- Year 8 Graduation
                ret_row.year8_graduation_ind := g_graduated;
                ret_row.g_year8_exclude_ind := 0;
                IF (g_graduated = 1 OR retention_my_recs(i).graduated_ind8 = 1) THEN
                    ret_row.year8_graduation_ind := 1;
                    g_graduated := 1;
                ELSIF (   retention_my_recs(i).deceased_date <= retention_my_recs(i).year_end_date8
                       OR retention_my_recs(i).exclude_student_status_ind8 = 1
                       OR retention_my_recs(i).exclude_enroll_status_ind8 = 1 ) THEN
                    ret_row.g_year8_exclude_ind := 1;
                END IF;

            ELSE  -- Academic period first attended is non-numeric
               ret_row.year1_graduation_ind := NULL;
               ret_row.g_year1_exclude_ind := NULL;
               ret_row.year2_graduation_ind := NULL;
               ret_row.g_year2_exclude_ind := NULL;
               ret_row.year2_retained_ind := NULL;
               ret_row.year2_exclude_ind := NULL;
               ret_row.year2_not_retained_ind := NULL;
               ret_row.year3_graduation_ind := NULL;
               ret_row.g_year3_exclude_ind := NULL;
               ret_row.year3_retained_ind := NULL;
               ret_row.year3_exclude_ind := NULL;
               ret_row.year3_not_retained_ind := NULL;
               ret_row.year4_graduation_ind := NULL;
               ret_row.g_year4_exclude_ind := NULL;
               ret_row.year4_retained_ind := NULL;
               ret_row.year4_exclude_ind := NULL;
               ret_row.year4_not_retained_ind := NULL;
               ret_row.year5_graduation_ind := NULL;
               ret_row.g_year5_exclude_ind := NULL;
               ret_row.year5_retained_ind := NULL;
               ret_row.year5_exclude_ind := NULL;
               ret_row.year5_not_retained_ind := NULL;
               ret_row.year6_graduation_ind := NULL;
               ret_row.g_year6_exclude_ind := NULL;
               ret_row.year6_retained_ind := NULL;
               ret_row.year6_exclude_ind := NULL;
               ret_row.year6_not_retained_ind := NULL;
               ret_row.year7_graduation_ind := NULL;
               ret_row.g_year7_exclude_ind := NULL;
               ret_row.year7_retained_ind := NULL;
               ret_row.year7_exclude_ind := NULL;
               ret_row.year7_not_retained_ind := NULL;
               ret_row.year8_graduation_ind := NULL;
               ret_row.g_year8_exclude_ind := NULL;
               ret_row.year8_retained_ind := NULL;
               ret_row.year8_exclude_ind := NULL;
               ret_row.year8_not_retained_ind := NULL;
            END CASE;

-- graduation/retention multi year user attributes
      --BLM mepped 7/8/14 for security reasons - Patch 9
      --ret_row.RETN_USER_ATTRIBUTE_01 := NULL;
            ret_row.RETN_USER_ATTRIBUTE_01 := ret_row.multi_source;
            ret_row.retn_user_attribute_02 := NULL;
            ret_row.retn_user_attribute_03 := NULL;
            ret_row.retn_user_attribute_04 := NULL;
            ret_row.retn_user_attribute_05 := NULL;
      --BLM mepped 7/8/14 for security reasons - Patch 9
      --ret_row.GRAD_USER_ATTRIBUTE_01 := NULL;
      ret_row.GRAD_USER_ATTRIBUTE_01 := ret_row.multi_source;
            ret_row.grad_user_attribute_02 := NULL;
            ret_row.grad_user_attribute_03 := NULL;
            ret_row.grad_user_attribute_04 := NULL;
            ret_row.grad_user_attribute_05 := NULL;
-- measures
            ret_row.user_measure_01 := NULL;
            ret_row.user_measure_02 := NULL;
            ret_row.user_measure_03 := NULL;
            ret_row.user_measure_04 := NULL;
            ret_row.user_measure_05 := NULL;
            ret_row.system_load_process := 'RETENTION_MULTI_YEAR';
--
            PIPE ROW(ret_row);
--
            ret_row := ret_row_init;
        END LOOP;  -- bulk collect
--
    END LOOP; -- student_rec
--
    RETURN;

  END f_get_retention_multi_year;
/******************************************************************************/
   FUNCTION f_get_ret_ind (person_in NUMBER,acad_period_in VARCHAR2,student_level_in  VARCHAR2, college_in  VARCHAR2,program_in VARCHAR2,multi_source_in varchar2,def_multi_source_in varchar2,acad_year_in varchar2,deceased_date_in date,acad_end_date_in date) RETURN rec_ret_ind IS
 --
   graduated_ind PLS_INTEGER ;
   exclude_student_status_ind PLS_INTEGER ;
   exclude_enroll_status_ind PLS_INTEGER ;
   get_ret_seq_ind_rec  GET_RETENTION_SEQ_LIKE_IND%ROWTYPE;
   ret_rec rec_ret_ind;
 --
   begin
-- Cursor get_retention_seq_like_ind was modified to accept multi_source
-- OPEN get_retention_seq_like_ind( person_in, acad_period_in,student_level_in,college_in,program_in);
OPEN get_retention_seq_like_ind( def_multi_source_in, multi_source_in, person_in, acad_period_in,student_level_in,college_in,program_in);
FETCH get_retention_seq_like_ind INTO get_ret_seq_ind_rec;
CLOSE get_retention_seq_like_ind;
--
      IF get_ret_seq_ind_rec.retained_overall_ind = 1 THEN
         ret_rec.overall_ret_ind := 1;
         ret_rec.overall_not_ret_ind := 0;
         ret_rec.excluded_ind := 0;
         ret_rec.overall_ret_status := 'R';
      ELSE
         ret_rec.overall_ret_ind := 0;
         --Checking for all cases of exclusion
         -- check for graduation
               OPEN get_graduated_ind(def_multi_source_in,multi_source_in, person_in, acad_year_in, student_level_in);
               FETCH get_graduated_ind INTO graduated_ind;
               CLOSE get_graduated_ind;
               --
               IF graduated_ind = 1 THEN
                  ret_rec.excluded_ind := 1;
               ELSE
                  -- check if student is deceased
                  IF (deceased_date_in <= acad_end_date_in) THEN
                     ret_rec.excluded_ind := 1;
                  ELSE
                     -- check for exclusion of the student status
                     OPEN get_exclude_student_status_ind(def_multi_source_in, multi_source_in, person_in,acad_period_in);
                     FETCH get_exclude_student_status_ind INTO exclude_student_status_ind;
                     CLOSE get_exclude_student_status_ind;
                     --
                     IF exclude_student_status_ind = 1 THEN
                       ret_rec.excluded_ind:= 1;
                     ELSE
                        -- check for exclusion of the enrollment status
                        OPEN get_exclude_enroll_status_ind(def_multi_source_in,multi_source_in, person_in, acad_period_in);
                        FETCH get_exclude_enroll_status_ind INTO exclude_enroll_status_ind;
                        CLOSE get_exclude_enroll_status_ind;
                        --
                        IF exclude_enroll_status_ind = 1 THEN
                           ret_rec.excluded_ind := 1;
                        END IF;
                     END IF;
                  END IF;
               END IF;

               --
               IF ret_rec.excluded_ind = 1 THEN
                  ret_rec.overall_not_ret_ind := 0 ;
                  ret_rec.overall_ret_status := 'E';
               ELSE
                  ret_rec.excluded_ind := 0;
                  ret_rec.overall_not_ret_ind := 1;
                  ret_rec.overall_ret_status := 'NR';
               END IF;
      END IF;

      IF ret_rec.overall_not_ret_ind = 1 THEN
         --Student Level
         ret_rec.std_lvl_not_ret_ind := 1;
         ret_rec.std_lvl_ret_ind := 0;
         ret_rec.std_lvl_ret_status := 'NR';

         --College
         ret_rec.college_not_ret_ind :=1;
         ret_rec.college_ret_ind :=0;
         ret_rec.college_ret_status := 'NR';

         --Program
         ret_rec.program_not_ret_ind :=1;
         ret_rec.program_ret_ind :=0;
         ret_rec.program_ret_status := 'NR';
      ELSE
         IF ret_rec.excluded_ind = 1 THEN

            ret_rec.std_lvl_not_ret_ind :=0;
            ret_rec.std_lvl_ret_ind := 0;
            ret_rec.std_lvl_ret_status := 'E';

            ret_rec.college_not_ret_ind :=0;
            ret_rec.college_ret_ind :=0;
            ret_rec.college_ret_status := 'E';

            ret_rec.program_not_ret_ind :=0;
            ret_rec.program_ret_ind :=0;
            ret_rec.program_ret_status := 'E';

         ELSE

            IF get_ret_seq_ind_rec.retained_stdlevl_ind = 1 THEN
               ret_rec.std_lvl_ret_ind := 1;
               ret_rec.std_lvl_not_ret_ind := 0;
               ret_rec.std_lvl_ret_status := 'R';
            ELSE
               ret_rec.std_lvl_ret_ind :=0;
               ret_rec.std_lvl_not_ret_ind := 1;
               ret_rec.std_lvl_ret_status := 'NR';
            END IF;

            IF get_ret_seq_ind_rec.retained_college_ind = 1 THEN
               ret_rec.college_ret_ind := 1;
               ret_rec.college_not_ret_ind := 0;
               ret_rec.college_ret_status := 'R';
            ELSE
               ret_rec.college_ret_ind :=0;
               ret_rec.college_not_ret_ind := 1;
               ret_rec.college_ret_status := 'NR';
            END IF;

            IF get_ret_seq_ind_rec.retained_program_ind = 1 THEN
               ret_rec.program_ret_ind := 1;
               ret_rec.program_not_ret_ind := 0;
               ret_rec.program_ret_status := 'R';
            ELSE
               ret_rec.program_ret_ind :=0;
               ret_rec.program_not_ret_ind := 1;
               ret_rec.program_ret_status := 'NR';
            END IF;
         END IF;
      END IF;
--
      RETURN ret_rec;

   END f_get_ret_ind;
/******************************************************************************/
FUNCTION f_get_range (process_ind_in VARCHAR2, p_table_name VARCHAR2, p_key_column VARCHAR2, p_slots NUMBER DEFAULT 0,  p_chg_table VARCHAR2 DEFAULT NULL ) RETURN NUMBER IS
 l_range         NUMBER;
 l_rec_count   NUMBER;
 l_stmt           VARCHAR2(4000);
--
BEGIN
--
   l_stmt := 'SELECT COUNT(DISTINCT ' || p_key_column || ') FROM ' || p_table_name ;
   IF p_chg_table IS NOT NULL THEN
    l_stmt := l_stmt ||   ' S WHERE (EXISTS (SELECT ''x''
                                                   FROM ' || p_chg_table || ' CHG
                                                  WHERE CHG.PERSON_UID = S.PERSON_UID)) ';
   END IF;
  EXECUTE IMMEDIATE l_stmt INTO l_rec_count ;

--
  IF p_slots <> 0 THEN
     IF  MOD (l_rec_count , p_slots) = 0 THEN
        l_range := l_rec_count / p_slots ;
     ELSE
       l_range :=   (  l_rec_count + (p_slots - MOD (l_rec_count,p_slots)) ) / p_slots;
     END IF;
  ELSE
     l_range := l_rec_count;
  END IF;

--
  RETURN l_range;
--
END f_get_range;
--
PROCEDURE p_load_inputTable(process_ind_in VARCHAR2, academic_year_in VARCHAR2, process_date DATE DEFAULT SYSDATE,  p_process_name IN VARCHAR2 DEFAULT 'EDW_STUDENT_INPUT', debug_var_in VARCHAR2 DEFAULT NULL, jobNumber IN binary_integer DEFAULT NULL) IS
    l_start                   PLS_INTEGER;
    l_end                     PLS_INTEGER;
    l_count                   PLS_INTEGER;
    l_range                   PLS_INTEGER;
    l_set                     PLS_INTEGER;
    l_job_count               PLS_INTEGER;
    l_start_date              DATE;
    l_end_date                DATE;
    curr_time                 VARCHAR2(20);
    l_table                   VARCHAR2(2000);
    l_input_table             VARCHAR2(2000);
    l_key_column              VARCHAR2(2000);
    l_sql_stmt                VARCHAR2(2000);
    l_change_table            VARCHAR2(2000);
    l_numSecs                 NUMBER;

    l_complete                BOOLEAN := FALSE;
    job_limit_rec             MTVPARM%ROWTYPE;
--
    jobStatus       VARCHAR2(100);
    paraJobCount    NUMBER := 0;
    errFlag         BOOLEAN;  -- Error flag for specific jobs
    jobNumStr       VARCHAR2(1000);
    jobNum2         NUMBER;
    baseJobNum2     NUMBER;
    jobName         VARCHAR2(10000);
    alertName       VARCHAR2(100);
    alertedName     VARCHAR2(100);
    alertedMsg      VARCHAR2(2000);
    alertedStatus   VARCHAR2(2000);
    msg             VARCHAR2(2000);
    jNum            VARCHAR2(100);
    crLineNum       NUMBER;
    newcrLineNum    NUMBER;
    crLineCtr       NUMBER;
    paraJobProc     MDRLOGD.MDRLOGD_PROCEDURE%TYPE;
    currJobCount    NUMBER := 0;
    jobList         DBMS_SQL.VARCHAR2_TABLE;
--
BEGIN
--
    curr_time := mgkolib.F_GetDateAndTime;
--
    --mgkolib.mdrlogd_row.mdrlogd_jobno      := jobNumber;
    mgkolib.mdrlogd_row.mdrlogd_procedure  := p_process_name;
    l_start_date := SYSDATE;
--
-- Extract the Oracle Jobs Count that needs could be executed parallely from MTVPARM table
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','JOB_COUNT','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO job_limit_rec;
    CLOSE edw_general_extr.get_mtvparm;
--
-- If there are no job limits specified, then by default the job count is set to 4
    l_job_count := NVL(job_limit_rec.mtvparm_desc, 4);
--
--
-- Set the Base Table Name associated with the LOAD process
--
    IF p_process_name = 'EDW_STUDENT_INPUT' THEN
        l_table := 'MST_BASE_STUDENT';
        l_key_column := 'PERSON_UID';
        l_input_table := 'WTT_STUDENT_INPUT';
        l_change_table := 'CHG_STUDENT';

        IF process_ind_in = 'L' THEN
            edw_general_extr.p_delete_fact_table('WFT_STUDENT', academic_year_in);
        ELSE
            edw_general_extr.p_delete_fact_records('CHG_STUDENT', 'WFT_STUDENT', 'PERSON_UID');
        END IF;
--
    END IF;
    l_sql_stmt := 'TRUNCATE TABLE EDWSTG.' || l_input_table || ' DROP STORAGE';
    EXECUTE IMMEDIATE l_sql_stmt;
--
    mgkolib.P_WritemdrlogdMsg('Starting Data Extraction in Parallel Mode at: ' || mgkolib.F_GetDateAndTime);
    mgkolib.P_WritemdrlogdMsg('Number of Parallel Threads: ' ||  l_job_count);
--
-- Identifying the number of records to be processed for each of the Job based on Table Records Count
    IF process_ind_in ='L' THEN
        l_range := f_get_range(process_ind_in, l_table, l_key_column, l_job_count);
    ELSE
        l_range := f_get_range(process_ind_in, l_table, l_key_column, l_job_count, l_change_table);
    END IF;
--
    IF l_range = 0 THEN
        mgkolib.P_WritemdrlogdMsg('Loaded ' || l_range || ' rows in the ' || l_input_table || ' table.');
        l_count := l_job_count ;
    ELSE
        currJobCount := 0;
        FOR l_set in 1..l_job_count LOOP
    --
            l_sql_stmt := 'SELECT MIN(' || l_key_column || ') , MAX( ' || l_key_column || ') FROM ( SELECT ' || l_key_column || ' , ROWNUM r FROM ';
            l_sql_stmt := l_sql_stmt || ' ( SELECT DISTINCT ' || l_key_column || ' FROM  ' || l_table ;
            IF process_ind_in = 'R' THEN
                l_sql_stmt := l_sql_stmt || ' S WHERE EXISTS (SELECT ''x''  FROM ' || l_change_table  || ' CHG WHERE CHG.PERSON_UID = S.PERSON_UID) ';
            END IF;
            l_sql_stmt := l_sql_stmt || ' ORDER BY ' || l_key_column || ' ASC ) ) ';
            l_sql_stmt := l_sql_stmt || ' WHERE r BETWEEN ' || ((l_range * ( l_set - 1) ) + 1 ) || ' AND ' || (l_range *  l_set ) ;
    --
            EXECUTE IMMEDIATE l_sql_stmt INTO l_start, l_end;
    --
            l_sql_stmt := '';
-- mgkolib.P_WritemdrlogdMsg('BEGIN edw_student_extr.p_get_student(''' || academic_year_in || ''', ''' || process_ind_in || ''' ,SYSDATE, ''' || debug_var_in || ''', ' || l_start  || ' , ' || l_end || '); END;');

            IF (l_start IS NOT NULL AND l_end IS NOT NULL) THEN
               paraJobCount := paraJobCount + 1;
               jobList(paraJobCount) := 'BEGIN edw_student_extr.p_get_student(''' || academic_year_in || ''', ''' || process_ind_in || ''' ,SYSDATE, ''' || debug_var_in || ''', ' || l_start  || ' , ' || l_end || ',<JOBNUM>,' || mgkolib.userid ||   '); END;';
            END IF;
   --
        END LOOP;
        baseJobNum2 := jobNumber * 100;
        mgkmap.P_RunChildJobs(jobList, p_process_name, baseJobNum2);
    --
    -- Checking the records loaded into Input Table
        l_sql_stmt := 'SELECT COUNT(*) FROM ' || l_input_table;
        EXECUTE IMMEDIATE l_sql_stmt INTO l_count;
        mgkolib.P_WritemdrlogdMsg('Loaded ' || l_count || ' rows in the ' || l_input_table || ' table.');
    --
        l_end_date := SYSDATE;
--        mgkolib.P_WritemdrlogdMsg('Records: ' || l_count || ' Seconds: ' || (l_end_date - l_start_date) *60*60*24 );
        l_numSecs := ROUND((l_end_date - l_start_date)*60*60*24);
        IF l_numSecs < 60 THEN
            mgkolib.P_WriteMdrlogdMsg(G$_NLS.Get('EDW_STUDENT_EXTR-0000', 'SQL', 'Elapsed time: %01% seconds', to_char(l_numSecs)));
        ELSE
            mgkolib.P_WriteMdrlogdMsg(G$_NLS.Get('EDW_STUDENT_EXTR-0000', 'SQL', 'Elapsed time: %01% seconds (%02%)',
                                      to_char(l_numSecs), mgkutil.f_FormatSeconds(l_numSecs)));
        END IF;

--        mgkolib.mdrlogd_row.mdrlogd_procedure := G$_NLS.Get('EDW_STUDENT_EXTR-0000', 'SQL', '(P)> END (' || cGroup || ')');
        mgkolib.P_WriteMdrlogdMsg(G$_NLS.Get('EDW_STUDENT_EXTR-0000', 'SQL', 'Data Extraction in Parallel Mode completed at: %01%', mgkolib.F_GetDateAndTime));
        mgkolib.mdrlogd_row.mdrlogd_procedure := '';
    --
    END IF;
--
    EXCEPTION WHEN OTHERS THEN
        RAISE;
END p_load_inputTable;
--
END edw_student_extr;
/