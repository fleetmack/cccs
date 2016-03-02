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
  TYPE tab_institution_detail   IS TABLE OF   wcv_extr_institution_details%ROWTYPE INDEX BY VARCHAR2(4000);
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
          --BLM 6/17/15 getting rid of binds for a test
          --SELECT NVL(DRIVER.MULTI_SOURCE, def_multi_source_in)   MULTI_SOURCE,
          SELECT NVL(DRIVER.MULTI_SOURCE, 'CCCS')   MULTI_SOURCE,
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
                   --BLM 6/17/15 getting rid of binds for a test
                   --WHERE I.INSTITUTION = def_institution_value
                   WHERE I.INSTITUTION = '4654'
                     -- JOS 11/01/2012; mod for MEP
		     -- Removed multi-source join on MST_ACADEMIC_OUTCOME (AO)
                     --AND NVL(I.MIF_VALUE, def_multi_source_in) = NVL(AO.MIF_VALUE, def_multi_source_in)
                     AND AO.CURRICULUM_ORDER = 1
                     ) DRIVER,
                  odsmgr.cccs_extr_person_dets_no_addy PD
          --BLM 6/17/15 getting rid of binds for a test
          -- WHERE (debug_var_in IS NULL OR DRIVER.PERSON_UID LIKE debug_var_in)
           WHERE (NULL IS NULL OR DRIVER.PERSON_UID LIKE NULL)
             AND             WE.BANNER_PIDM = DRIVER.PERSON_UID
             --BLM mepped for wdt_warehouse_entity MEP effort
             and we.user_attribute_01 = driver.multi_source
             AND DRIVER.PERSON_UID =  PD.PERSON_ID;
             -- Removed multi-source join on wcv_extr_person_details (PD) per Jon Strother
             --AND NVL(DRIVER.multi_source, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getLoadResults;
    --
   /* Unnecessary for now 
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
                  odsmgr.cccs_extr_person_dets_no_addy PD,
                  CHG_POST_SECONDARY_SCHOOL CHG
            WHERE CHG.PERSON_UID = DRIVER.PERSON_UID
             AND (debug_var_in IS NULL OR DRIVER.PERSON_UID LIKE debug_var_in)
             --BLM mepped 7/29/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = driver.multi_source
             AND WE.BANNER_PIDM = DRIVER.PERSON_UID
             AND DRIVER.PERSON_UID =  PD.PERSON_ID;
             --JOS Update
             ---- Remove multi source join to non-meped object wcv_extr_person_details (PD)
--             AND NVL(DRIVER.multi_source, def_multi_source_in) =  PD.MULTI_SRC;
            RETURN localCursor;
    END f_getRefreshResults; 
     */ --End of "unnecessary for now" part
  BEGIN
--
/* Nothing really happens here for a load other than truncating the fact 
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_POST_SECONDARY_SCHOOL');
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_POST_SECONDARY_SCHOOL', 'WFT_POST_SECONDARY_SCHOOL', 'PERSON_UID');
       END IF;
    END IF;
    */
--
--
   OPEN edw_general_extr.get_default_values;
   FETCH edw_general_extr.get_default_values INTO default_rec;
   CLOSE edw_general_extr.get_default_values;
   /* Runs this
       SELECT *
      FROM WCV_DEFAULT_VALUES
      Returns this:
      BAD_CLEANSE_LONG	BAD_CLEANSE_SHORT	BAD_CLEANSE_VALUE	MULTI_SOURCE_CLEANSE_LONG	MULTI_SOURCE_CLEANSE_SHORT	MULTI_SOURCE_CLEANSE_VALUE	NULL_CLEANSE_LONG	NULL_CLEANSE_SHORT	NULL_CLEANSE_VALUE
***Warehouse Description Undefined***	Desc Undefined	###############	Colorado Community College System	Colorado Community College System	CCCS	***Data Not Available***	Data Not Avail	No Data
*/
--
   OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','INSTITUTION','HOME_INSTITUTION');
   FETCH edw_general_extr.get_mtvparm INTO parm_rec;
   CLOSE edw_general_extr.get_mtvparm;
   /* Runs this 
      SELECT *
      FROM MTVPARM
     WHERE MTVPARM_INTERNAL_CODE_GROUP = 'EDW EXTRACT PARAMETERS'
       AND MTVPARM_INTERNAL_CODE = 'INSTITUTION'
       AND (MTVPARM_INTERNAL_CODE_2 = 'HOME_INSTITUTION' or 'HOME_INSTITUTION' = 'ALL')
       Returns this:
       MTVPARM_SEQNO	MTVPARM_EXTERNAL_CODE	MTVPARM_INTERNAL_CODE	MTVPARM_INTERNAL_CODE_2	MTVPARM_INTERNAL_CODE_SEQNO	MTVPARM_INTERNAL_CODE_GROUP	MTVPARM_DESC	MTVPARM_SYS_REQ_IND	MTVPARM_ACTIVITY_DATE	MTVPARM_USER
9612	4654	INSTITUTION	HOME_INSTITUTION		EDW EXTRACT PARAMETERS	INSTITUTION value which indicates your home institution.	Y	21-JAN-14	IA_ADMIN
*/
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','STUDENT_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
    /* Runs this:
          SELECT *
      FROM MTVPARM
     WHERE MTVPARM_INTERNAL_CODE_GROUP = 'EDW EXTRACT PARAMETERS'
       AND MTVPARM_INTERNAL_CODE = 'BULK_OPERATIONS_SIZE'
       AND (MTVPARM_INTERNAL_CODE_2 = 'STUDENT_EXTRACT_PROCESS' or 'STUDENT_EXTRACT_PROCESS' = 'ALL')
       Returns this:
       MTVPARM_SEQNO	MTVPARM_EXTERNAL_CODE	MTVPARM_INTERNAL_CODE	MTVPARM_INTERNAL_CODE_2	MTVPARM_INTERNAL_CODE_SEQNO	MTVPARM_INTERNAL_CODE_GROUP	MTVPARM_DESC	MTVPARM_SYS_REQ_IND	MTVPARM_ACTIVITY_DATE	MTVPARM_USER
9708	STUDENT_EXTRACT_PROCESS	BULK_OPERATIONS_SIZE	STUDENT_EXTRACT_PROCESS	3	EDW EXTRACT PARAMETERS	500000	N	10-FEB-14	9
*/
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
    --value will be set to 500000
--
    IF process_ind_in = 'L' THEN
    --    post_secondary_cur := f_getLoadResults(default_rec.multi_source_cleanse_value, parm_rec.mtvparm_external_code);
    post_secondary_cur := f_getLoadResults(default_rec.multi_source_cleanse_value, parm_rec.mtvparm_external_code);
    --will run main script with ('CCCS','4654'), which returns values
   /*never happens
   ELSE
        post_secondary_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value, parm_rec.mtvparm_external_code);
    END IF; */
   LOOP
      FETCH post_secondary_cur BULK COLLECT INTO post_secondary_recs LIMIT bulk_size;
      EXIT WHEN post_secondary_recs.COUNT = 0;
      /* Should load into cursor */
--
     IF post_secondary_recs.COUNT > 0 AND fetch_inst_details THEN
--
    
         fetch_inst_details := FALSE;
--
         FOR institution_detail in (SELECT * FROM wcv_extr_institution_details) LOOP
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