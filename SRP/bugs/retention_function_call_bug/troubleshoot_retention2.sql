/*
(
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
            student_rec.max_enrl_period)
            */
--('CCCS','FRCC','367040','UG','F','F_AA_AA','200910','201520','200630',NULL)            
    SELECT *
      FROM MTVPARM
     WHERE MTVPARM_INTERNAL_CODE_GROUP = 'EDW EXTRACT PARAMETERS'
       AND MTVPARM_INTERNAL_CODE = 'ACADEMIC_PERIOD_PATTERN'
       AND (MTVPARM_INTERNAL_CODE_2 = 'PATTERN_CONTROL' or 'PATTERN_CONTROL' = 'ALL');


--MTVPARM_SEQNO	MTVPARM_EXTERNAL_CODE	MTVPARM_INTERNAL_CODE	  MTVPARM_INTERNAL_CODE_2	MTVPARM_INTERNAL_CODE_SEQNO	MTVPARM_INTERNAL_CODE_GROUP	MTVPARM_DESC	                                                                                                                MTVPARM_SYS_REQ_IND	MTVPARM_ACTIVITY_DATE	MTVPARM_USER
--9640	        ALL	                  ACADEMIC_PERIOD_PATTERN	PATTERN_CONTROL		                                  EDW EXTRACT PARAMETERS	    Pattern Control which determines which academic periods will be loaded in the Student Progress and Student Engagement stars.	Y	                  21-JAN-14	            IA_ADMIN
--19367	        LEVEL	                ACADEMIC_PERIOD_PATTERN	PATTERN_CONTROL		                                  EDW EXTRACT PARAMETERS	    Undergraduate	                                                                                                                N	                  03-FEB-14	            8       


SELECT * FROM (
         SELECT  Y.ACADEMIC_PERIOD                         academic_period,
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
                DECODE('200630', Y.ACADEMIC_PERIOD, 'Y', 'N') new_student_ind,
                NVL((SELECT 'Y' FROM MST_STUDENT_WORK_EXPERIENCE WE WHERE WE.PERSON_UID = 367040 AND WE.ACADEMIC_PERIOD = y.ACADEMIC_PERIOD AND WE.STUDENT_LEVEL = 'UG' and y.academic_period >= '200910' AND ROWNUM = 1), 'N') cooperative_education_ind,
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
                     WHERE AR.ACCOUNT_UID = 367040
                       AND AR.ACADEMIC_PERIOD = y.academic_period
                       --CCCS Customization
                       and ar.academic_year >= '2009'
                       AND NVL(AR.MIF_VALUE, 'CCCS') = 'FRCC'
                       AND ROWNUM = 1)
                       , 'N') tuition_deposited_ind   -- SPC
           FROM MST_ENROLLMENT E,
                MST_ACADEMIC_STANDING ACAD_STAND,
                MST_STUDENT_CLASSIFICATION STUD_CLASS,
                MTVPARM M,
                MGT_YEAR_TYPE_DEFINITION Y
          WHERE ('2012' = 'ALL' or Y.YEAR_CODE = '2012')
            AND Y.YEAR_TYPE = 'ACYR'
            AND Y.ACADEMIC_PERIOD NOT IN ('000000','999999')
            AND Y.ACADEMIC_PERIOD BETWEEN '200910' AND '201520'
            --blm 05/01/2014 added next 3 lines, the one with a Y alias was already there
            AND NVL(e.MIF_VALUE, 'CCCS') = 'FRCC'
            AND NVL(ACAD_STAND.MIF_VALUE,  'CCCS') = 'FRCC'
            AND NVL(STUD_CLASS.MIF_VALUE,  'CCCS') = 'FRCC'
            AND NVL(Y.MIF_VALUE,  'CCCS') = 'FRCC'
            -- Close any open-ended general student records based on the re-admit academic period
            AND ('201520' != '999999'
                 OR ('201520' = '999999'
                     AND (NVL(Y.READMIT_ACADEMIC_PERIOD, Y.ACADEMIC_PERIOD) <= NULL
                          OR Y.ACADEMIC_PERIOD = '200630')))
            -- Filter based on academic period patterns
            AND M.MTVPARM_INTERNAL_CODE_GROUP = 'EDW EXTRACT PARAMETERS'
            AND M.MTVPARM_INTERNAL_CODE       = 'ACADEMIC_PERIOD_PATTERN'
  --walk through this with each of your two pattern_rec records
  --if returns stuff, then figure out why there are two rows
  --if doesnt return stuff, likely that mtvparm isnt set up right
            AND (  ('LEVEL' = 'ALL'
                    AND M.MTVPARM_INTERNAL_CODE_2 = 'PATTERN_CONTROL'
                    AND M.MTVPARM_EXTERNAL_CODE = 'ALL')
                OR ('LEVEL' = 'LEVEL'
                    AND M.MTVPARM_INTERNAL_CODE_2 = 'UG'
                    AND Y.ACADEMIC_PERIOD LIKE M.MTVPARM_EXTERNAL_CODE)
                OR ('LEVEL' = 'COLLEGE'
                    AND M.MTVPARM_INTERNAL_CODE_2 = 'F'
                    AND Y.ACADEMIC_PERIOD LIKE M.MTVPARM_EXTERNAL_CODE)
                OR ('LEVEL' = 'PROGRAM'
                    AND M.MTVPARM_INTERNAL_CODE_2 = 'F_AA_AA'
                    AND Y.ACADEMIC_PERIOD LIKE M.MTVPARM_EXTERNAL_CODE)
                OR ('LEVEL' = 'CAMPUS'
                    AND M.MTVPARM_INTERNAL_CODE_2 = NULL
                    AND Y.ACADEMIC_PERIOD LIKE M.MTVPARM_EXTERNAL_CODE)
                OR ('LEVEL' = 'MULTI_SOURCE'
                    AND M.MTVPARM_INTERNAL_CODE_2 = 'FRCC'
                    AND Y.ACADEMIC_PERIOD LIKE M.MTVPARM_EXTERNAL_CODE)) 
                    
                    
            AND ACAD_STAND.PERSON_UID(+) = 367040
            AND ACAD_STAND.STUDENT_LEVEL(+) = 'UG'
            AND ACAD_STAND.ACADEMIC_PERIOD(+) <= Y.ACADEMIC_PERIOD
            AND STUD_CLASS.PERSON_UID(+) = 367040
            AND STUD_CLASS.STUDENT_LEVEL(+) = 'UG'
            AND STUD_CLASS.ACADEMIC_PERIOD(+) <= Y.ACADEMIC_PERIOD
            AND E.PERSON_UID (+) = 367040
            AND E.ACADEMIC_PERIOD (+) = Y.ACADEMIC_PERIOD
            and y.academic_period >= '200910'
) WHERE ACAD_STAND_ROW = 1;






-- get_ret_seq(term_rec.academic_period)
 SELECT CASE WHEN (MTVPARM_EXTERNAL_CODE > MTVPARM_INTERNAL_CODE_2) THEN
               (SUBSTR('201220', 1,
                  LENGTH('201220')-LENGTH(MTVPARM_EXTERNAL_CODE)) ||
                  MTVPARM_EXTERNAL_CODE)
            ELSE
               ((SUBSTR('201220', 1,
                  LENGTH('201220')-LENGTH(MTVPARM_EXTERNAL_CODE))+1) ||
                  MTVPARM_EXTERNAL_CODE)
            END                             ret_sequential
       FROM MTVPARM
      WHERE MTVPARM_INTERNAL_CODE_GROUP = 'EDW EXTRACT PARAMETERS'
        AND MTVPARM_INTERNAL_CODE = 'ACADEMIC_PERIOD_SEQUENTIAL'
        AND MTVPARM_INTERNAL_CODE_2 =
               SUBSTR('201220',
                      (LENGTH('201220')-LENGTH(MTVPARM_EXTERNAL_CODE)+1),
                      LENGTH(MTVPARM_EXTERNAL_CODE));
                      
--get_year_type:
-- CURSOR get_year_type(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, acad_period_in VARCHAR2, year_type_in VARCHAR2) 
--OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, student_rec.multi_source, ret_seq_rec.ret_sequential, 'ACYR');
      SELECT *
        FROM MGT_YEAR_TYPE_DEFINITION
       WHERE YEAR_TYPE = 'ACYR'
         AND ACADEMIC_PERIOD = '201230'
         AND NVL(MIF_VALUE, 'CCCS') = 'FRCC';
         
-- YEAR_TYPE	YEAR_TYPE_DESC	YEAR_CODE	YEAR_CODE_DESC	AID_PERIOD	AID_PERIOD_DESC	ACADEMIC_PERIOD	ACADEMIC_PERIOD_DESC	START_DATE	END_DATE	READMIT_ACADEMIC_PERIOD	READMIT_ACADEMIC_PERIOD_DESC	START_YEAR	END_YEAR	MIF_VALUE	MIF_DESC	                    ZONE_VALUE	DOMAIN_VALUE	LAST_ACTIVITY_DATE	LAST_DML_DATE	LAST_ACTIVITY_DML
-- ACYR	    Academic Year	  2012	    2011-2012			                              201230	        Spring 2012	          01-JAN-12	  15-MAY-12			                                                  2012	      2012	    FRCC	    Front Range Community College			                      25-AUG-15		         



f_get_ret_ind(student_rec.person_uid,
                                                     ret_seq_acad_period_rec.academic_period,
                                                     student_rec.student_level,
                                                     student_rec.college,
                                                     student_rec.program,
                                                     default_rec.multi_source_cleanse_value,
                                                     student_rec.multi_source,
                                                     term_rec.year_code,
                                                     student_rec.deceased_date,
                                                     term_rec.end_date);
                                                     
                                                     
                                                     
                                                     
/**********************************************************************************************/
--get_retention_seq_like_ind
--CURSOR get_retention_seq_like_ind(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_in NUMBER,academic_period_in VARCHAR2,p_student_level VARCHAR2,p_college VARCHAR2,p_program VARCHAR2)

SELECT NVL((SELECT DECODE (NVL(E.REGISTERED_IND,'N'), 'Y', 1, 0)                
FROM MST_ACADEMIC_STANDING A,
MST_ADVISOR ADV,
MST_ENROLLMENT E,
MST_GENERAL_STUDENT Y
WHERE Y.PERSON_UID = person_in
--1/22/15 BLM changing again to full mep the join, never NULL in mst_general_student
--AND NVL(Y.mif_value,def_multi_source_in) = multi_src_in
AND Y.mif_value = multi_src_in
--next line was not in delievered version
--AND Y.PROGRAM_LEVEL = student_level_in
AND Y.ACADEMIC_PERIOD = academic_period_in
AND a.mif_value(+) = Y.MIF_VALUE
AND E.REGISTERED_IND = 'Y'
AND Y.PRIMARY_PROGRAM_IND = 'Y'
AND adv.mif_value(+) = Y.MIF_VALUE
AND e.mif_value(+) = y.mif_value
AND E.PERSON_UID(+) = Y.PERSON_UID
AND E.ACADEMIC_PERIOD(+) = Y.ACADEMIC_PERIOD
AND ADV.PERSON_UID(+) = Y.PERSON_UID
AND Y.ACADEMIC_PERIOD BETWEEN ADV.ACADEMIC_PERIOD_START(+)AND ADV.ACADEMIC_PERIOD_END(+)
AND ADV.PRIMARY_ADVISOR_IND(+) = 'Y'
AND A.PERSON_UID(+) = Y.PERSON_UID
AND A.ACADEMIC_PERIOD(+) = Y.ACADEMIC_PERIOD
AND A.STUDENT_LEVEL(+) = Y.PROGRAM_LEVEL),0) retained_overall_ind,   
          /* NVL((SELECT DECODE (REGISTERED_IND, 'Y', 1, 0)
                  FROM ACADEMIC_STUDY E
                 WHERE E.PERSON_UID = person_in
                 AND NVL(E.MULTI_SOURCE, def_multi_source_in) = multi_src_in
                   AND E.ACADEMIC_PERIOD = academic_period_in
                   AND E.PRIMARY_PROGRAM_IND = 'Y'
                   AND E.REGISTERED_IND = 'Y'
                   AND NVL(E.STUDENT_LEVEL, 'NULL') =
                       NVL(p_student_level, 'NULL')),0)           retained_stdlevl_ind,*/
   NVL((SELECT DECODE (NVL(E.REGISTERED_IND,'N'), 'Y', 1, 0) 
   FROM MST_ACADEMIC_STANDING A,
MST_ADVISOR ADV,
MST_ENROLLMENT E,
MST_GENERAL_STUDENT Y
WHERE Y.PERSON_UID = person_in
--1/22/15 BLM changing again to full mep the join, never NULL in mst_general_student
--AND NVL(Y.mif_value,def_multi_source_in) = multi_src_in
AND Y.mif_value = multi_src_in
AND nvl(y.program_LEVEL,'NULL') = nvl(p_student_level,'NULL')
AND Y.ACADEMIC_PERIOD = academic_period_in
AND a.mif_value(+) = Y.MIF_VALUE
AND E.REGISTERED_IND = 'Y'
AND Y.PRIMARY_PROGRAM_IND = 'Y'
AND adv.mif_value(+) = Y.MIF_VALUE
AND e.mif_value(+) = y.mif_value
AND E.PERSON_UID(+) = Y.PERSON_UID
AND E.ACADEMIC_PERIOD(+) = Y.ACADEMIC_PERIOD
AND ADV.PERSON_UID(+) = Y.PERSON_UID
AND Y.ACADEMIC_PERIOD BETWEEN ADV.ACADEMIC_PERIOD_START(+)AND ADV.ACADEMIC_PERIOD_END(+)
AND ADV.PRIMARY_ADVISOR_IND(+) = 'Y'
AND A.PERSON_UID(+) = Y.PERSON_UID
AND A.ACADEMIC_PERIOD(+) = Y.ACADEMIC_PERIOD
AND A.STUDENT_LEVEL(+) = Y.PROGRAM_LEVEL),0)  retained_stdlevl_ind,
/*      
           NVL((SELECT DECODE (REGISTERED_IND, 'Y', 1, 0)
                  FROM ACADEMIC_STUDY E
                 WHERE E.PERSON_UID = person_in
                 AND NVL(E.MULTI_SOURCE, def_multi_source_in) = multi_src_in
                   AND E.ACADEMIC_PERIOD = academic_period_in
                   AND E.PRIMARY_PROGRAM_IND = 'Y'
                   AND E.REGISTERED_IND = 'Y'
                   AND NVL(E.COLLEGE, 'NULL') =
                       NVL(p_college, 'NULL')),0)                 retained_college_ind, */
NVL((SELECT DECODE (nvl(E.REGISTERED_IND,'N'), 'Y', 1, 0)
   FROM MST_ACADEMIC_STANDING A,
MST_ADVISOR ADV,
MST_ENROLLMENT E,
MST_GENERAL_STUDENT Y
WHERE Y.PERSON_UID = person_in
--1/22/15 BLM changing again to full mep the join, never NULL in mst_general_student
--AND NVL(Y.mif_value,def_multi_source_in) = multi_src_in
AND Y.mif_value = multi_src_in
AND nvl(y.college,'NULL') = nvl(p_college,'NULL')
AND Y.ACADEMIC_PERIOD = academic_period_in
AND a.mif_value(+) = Y.MIF_VALUE
AND E.REGISTERED_IND = 'Y'
AND Y.PRIMARY_PROGRAM_IND = 'Y'
AND adv.mif_value(+) = Y.MIF_VALUE
AND e.mif_value(+) = y.mif_value
AND E.PERSON_UID(+) = Y.PERSON_UID
AND E.ACADEMIC_PERIOD(+) = Y.ACADEMIC_PERIOD
AND ADV.PERSON_UID(+) = Y.PERSON_UID
AND Y.ACADEMIC_PERIOD BETWEEN ADV.ACADEMIC_PERIOD_START(+)AND ADV.ACADEMIC_PERIOD_END(+)
AND ADV.PRIMARY_ADVISOR_IND(+) = 'Y'
AND A.PERSON_UID(+) = Y.PERSON_UID
AND A.ACADEMIC_PERIOD(+) = Y.ACADEMIC_PERIOD
AND A.STUDENT_LEVEL(+) = Y.PROGRAM_LEVEL),0) retained_college_ind,
/*    NVL((SELECT DECODE (REGISTERED_IND, 'Y', 1, 0)
                  FROM ACADEMIC_STUDY E
                 WHERE E.PERSON_UID = person_in
                 AND NVL(E.MULTI_SOURCE, def_multi_source_in) = multi_src_in
                   AND E.ACADEMIC_PERIOD = academic_period_in
                   AND E.PRIMARY_PROGRAM_IND = 'Y'
                   AND E.REGISTERED_IND = 'Y'
                   AND NVL(E.PROGRAM, 'NULL') =
                       NVL(p_program, 'NULL')),0)                 retained_program_ind */
  NVL((SELECT DECODE (nvl(E.REGISTERED_IND,'N'), 'Y', 1, 0)                      
     FROM MST_ACADEMIC_STANDING A,
MST_ADVISOR ADV,
MST_ENROLLMENT E,
MST_GENERAL_STUDENT Y
WHERE Y.PERSON_UID = person_in
--1/22/15 BLM changing again to full mep the join, never NULL in mst_general_student
--AND NVL(Y.mif_value,def_multi_source_in) = multi_src_in
AND Y.mif_value = multi_src_in
AND nvl(y.program,'NULL') = nvl(p_program,'NULL')
AND Y.ACADEMIC_PERIOD = academic_period_in
AND a.mif_value(+) = Y.MIF_VALUE
AND E.REGISTERED_IND = 'Y'
AND Y.PRIMARY_PROGRAM_IND = 'Y'
AND adv.mif_value(+) = Y.MIF_VALUE
AND e.mif_value(+) = y.mif_value
AND E.PERSON_UID(+) = Y.PERSON_UID
AND E.ACADEMIC_PERIOD(+) = Y.ACADEMIC_PERIOD
AND ADV.PERSON_UID(+) = Y.PERSON_UID
AND Y.ACADEMIC_PERIOD BETWEEN ADV.ACADEMIC_PERIOD_START(+)AND ADV.ACADEMIC_PERIOD_END(+)
AND ADV.PRIMARY_ADVISOR_IND(+) = 'Y'
AND A.PERSON_UID(+) = Y.PERSON_UID
AND A.ACADEMIC_PERIOD(+) = Y.ACADEMIC_PERIOD
AND A.STUDENT_LEVEL(+) = Y.PROGRAM_LEVEL),0)         retained_program_ind                        
      FROM DUAL;

