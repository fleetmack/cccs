create table wtt_student_input_mack12_2 as (select * from wtt_student_input);
create table wtt_student_clean_mack12 as (select * from wtt_student_clean)
create table wtt_student_wkeys_mack12 as (select * from wtt_student_wkeys);

select * from wtt_student_input_mack12_2; --temp table of input for 2012 star
select * from wtt_student_clean_mack12; --temp table of clean for 2012 star
select * from wtt_student_wkeys_mack12; --temp table of wkeys for 2012 star


--pick an entry:  FRCC, 201220, 2012 academic year, S00267040, prog: F_AA_AA, UG
--was enrolled every term  
--select * from MST_BASE_STUDENT where primary_program_ind = 'Y' and mif_value = 'FRCC' and person_uid = odsmgr.f_get_pidm('S00267040');
--select * from mst_general_student where person_uid = odsmgr.f_get_pidm('S00267040') and mif_value = 'FRCC'
--select * from wtt_student_input_mack12 where id = 'S00267040';

--default_rec
    SELECT *
      FROM WCV_DEFAULT_VALUES;
--BAD_CLEANSE_LONG	                    BAD_CLEANSE_SHORT	BAD_CLEANSE_VALUE	MULTI_SOURCE_CLEANSE_LONG	        MULTI_SOURCE_CLEANSE_SHORT	      MULTI_SOURCE_CLEANSE_VALUE	NULL_CLEANSE_LONG	        NULL_CLEANSE_SHORT	NULL_CLEANSE_VALUE
--***Warehouse Description Undefined***	Desc Undefined	  ###############	  Colorado Community College System	Colorado Community College System	CCCS	                      ***Data Not Available***	Data Not Avail	    No Data

--student_rec
--MULTI_SOURCE	ACADEMIC_PERIOD_START	ACADEMIC_PERIOD_END	EDUCATION_LEVEL	RESIDENCY	RESIDENCY_IND	PERSON_UID	STUDENT_STATUS	PROGRAM_LEVEL	PROGRAM	  CAMPUS	COLLEGE	DEGREE	MAJOR	  PROGRAM_CLASSIFICATION	STUDENT_LEVEL	PERMIT_REGISTRATION	MATRICULATED_IND	AWARD_CATEGORY	PROGRAM_NUMBER	CURRICULUM_PRIORITY	AGE_ADMITTED	START_DATE_MATRICULATED	START_DATE_ADMITTED	START_DATE	EXPECTED_GRADUATION_DATE	OUTCOME_NUMBER	ACADEMIC_PERIOD_ADMITTED	WAREHOUSE_ENTITY_UID	MAX_ENRL_PERIOD
--FRCC	        200910	              201520	            HS	            R	        Y	            367040	    AS	            UG	          F_AA_AA		        F	      AA	    AA	    240101	                UG	          Y	                  Y	                23	            1	              1	                  25	          01-JAN-06	              01-JAN-06		                    15-MAY-17	                1	              200630	                  19060306	

--pattern_rec
--  OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','ACADEMIC_PERIOD_PATTERN','PATTERN_CONTROL');
    /*
    SELECT *
      FROM MTVPARM
     WHERE MTVPARM_INTERNAL_CODE_GROUP = 'EDW EXTRACT PARAMETERS'
       AND MTVPARM_INTERNAL_CODE = 'ACADEMIC_PERIOD_PATTERN'
       AND (MTVPARM_INTERNAL_CODE_2 = 'PATTERN_CONTROL' or 'PATTERN_CONTROL' = 'ALL');
       */
--MTVPARM_SEQNO	MTVPARM_EXTERNAL_CODE	MTVPARM_INTERNAL_CODE	  MTVPARM_INTERNAL_CODE_2	MTVPARM_INTERNAL_CODE_SEQNO	MTVPARM_INTERNAL_CODE_GROUP	MTVPARM_DESC	                                                                                                                MTVPARM_SYS_REQ_IND	MTVPARM_ACTIVITY_DATE	MTVPARM_USER
--9640	        ALL	                  ACADEMIC_PERIOD_PATTERN	PATTERN_CONTROL		                                  EDW EXTRACT PARAMETERS	    Pattern Control which determines which academic periods will be loaded in the Student Progress and Student Engagement stars.	Y	                  21-JAN-14	            IA_ADMIN
--19367	        LEVEL	                ACADEMIC_PERIOD_PATTERN	PATTERN_CONTROL		                                  EDW EXTRACT PARAMETERS	    Undergraduate	                                                                                                                N	                  03-FEB-14	            8       


--term_rec
--('CCCS','FRCC','367040','UG','F','F_AA_AA','200910','201520','200630',NULL)
--ACADEMIC_PERIOD	YEAR_CODE	START_DATE	END_DATE	ACADEMIC_PERIOD_DESC	HOUSING_IND	DEANS_LIST_VALUE	ENROLLED_IND	REGISTERED_IND	WITHDRAWAL_REASON	WITHDRAWN_IND	EXTERNAL_WITHDRAWN_IND	CURRENT_TIME_STATUS	CURRENT_TIME_STATUS_DATE	ENROLLMENT_STATUS	TRANSFER_TO_INSTITUTION	REGISTRATION_REASON	TOTAL_CREDITS	ACADEMIC_HISTORY_EXISTS_IND	ENROLLMENT_STATUS_DATE	ENROLLMENT_ADD_DATE	ENROLL_CENSUS_DATE1_IND	ENROLL_CENSUS_DATE2_IND	NEW_STUDENT_IND	COOPERATIVE_EDUCATION_IND	STUDENT_CLASSIFICATION	COMBINED_ACAD_STANDING	PROGRESS_EVALUATION	ACADEMIC_STANDING	ACADEMIC_STANDING_END	ACADEMIC_STAND_OVERRIDE	ACADEMIC_STANDING_END_DATE	ACAD_STAND_ROW	STUD_CLASS_PERIOD	STUD_CLASS_ROW	TUITION_DEPOSITED_IND
--201210	        2012	    16-MAY-11	  15-AUG-11	Summer 2011	          N		                          Y	            Y		                              N	            Y	                      LH	                15-JUN-11	                TW		                                                        4	            Y	                          08-JUL-11	              04-MAY-11	          Y	                      Y	                      N	              N	                        U2	                    00	                    00	                G	                G		                                          15-AUG-11	                  1	              201210	          1	              N
--201220	        2012	    16-AUG-11	  31-DEC-11	Fall 2011	            N		                          Y	            N		                              N	            N	                      ZE	                08-SEP-11	                EL			                                                      0	            N	                          17-AUG-11	17-AUG-11			N	N	U2	00	00	G				1	201210	1	N
--201230	        2012	    01-JAN-12	  15-MAY-12	Spring 2012	          N		                          Y	            Y		                              N	            N	                      HT	                20-FEB-12	                EL			                                                      8	            Y	                          29-DEC-11	29-DEC-11	Y	Y	N	N	U2	00	00	G	G		15-MAY-12	1	201230	1	N


--ret_seq_rec
--get_ret_seq(term_rec.academic_period)
--result: 201230

--ret_seq_acad_period_rec
-- CURSOR get_year_type(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, acad_period_in VARCHAR2, year_type_in VARCHAR2) 
-- OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, student_rec.multi_source, ret_seq_rec.ret_sequential, 'ACYR');
-- YEAR_TYPE	YEAR_TYPE_DESC	YEAR_CODE	YEAR_CODE_DESC	AID_PERIOD	AID_PERIOD_DESC	ACADEMIC_PERIOD	ACADEMIC_PERIOD_DESC	START_DATE	END_DATE	READMIT_ACADEMIC_PERIOD	READMIT_ACADEMIC_PERIOD_DESC	START_YEAR	END_YEAR	MIF_VALUE	MIF_DESC	                    ZONE_VALUE	DOMAIN_VALUE	LAST_ACTIVITY_DATE	LAST_DML_DATE	LAST_ACTIVITY_DML
-- ACYR	    Academic Year	  2012	    2011-2012			                              201230	        Spring 2012	          01-JAN-12	  15-MAY-12			                                                  2012	      2012	    FRCC	    Front Range Community College			                      25-AUG-15		         
	
  
--f_get_ret_ind  
--FUNCTION f_get_ret_ind (person_in NUMBER,acad_period_in VARCHAR2,student_level_in  VARCHAR2, 
                    --    college_in  VARCHAR2,program_in VARCHAR2,multi_source_in varchar2,def_multi_source_in varchar2,acad_year_in varchar2,
                    --    deceased_date_in date,acad_end_date_in date) RETURN rec_ret_ind IS  
--f_get_ret_ind(367040, '201230', 'UG', 'F', 'F_AA_AA', 'CCCS', 'FRCC', '2012', NULL, '15-AUG-11')

  --subsequently calls:  get_retention_seq_like_ind( def_multi_source_in, multi_source_in, person_in, acad_period_in,student_level_in,college_in,program_in);
  
  
  
  
  
  
  --f_get_ret_ind  
--FUNCTION f_get_ret_ind (person_in NUMBER,acad_period_in VARCHAR2,student_level_in  VARCHAR2, 
                    --    college_in  VARCHAR2,program_in VARCHAR2,multi_source_in varchar2,def_multi_source_in varchar2,acad_year_in varchar2,
                    --    deceased_date_in date,acad_end_date_in date) RETURN rec_ret_ind IS  
--f_get_ret_ind(367040, '201230', 'UG', 'F', 'F_AA_AA', 'CCCS', 'FRCC', '2012', NULL, '15-AUG-11')

  --subsequently calls:  get_retention_seq_like_ind( def_multi_source_in, multi_source_in, person_in, acad_period_in,student_level_in,college_in,program_in);


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


select academic_period, count(*)
  from wft_student s, wdt_academic_time at
  where s.academic_time_key = at.academic_time_key
    and retention_like_key in
    (select retention_key from wdt_retention where retained_overall_ind = 1)
group by academic_period;




select * from wdt_retention;