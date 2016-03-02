/* PKEY
MULTI_SOURCE_KEY
ACADEMIC_TIME_KEY
PERSON_UID
COURSE_REFERENCE_NUMBER_KEY
STUDENT_COURSE_ATTRIBUTE_KEY
*/

--Bad entries for 2011 code
select we.banner_pidm, ms.multi_source, atk.academic_period, crn.course_reference_number, ca.course_attribute
  from EDWSTG.WKE_5839_140415120935  bad,
       wdt_warehouse_entity          we,
       wdt_multi_source              ms,
       wdt_academic_time             atk,
       wdt_course_reference_number   crn,
       wdt_course_attribute          ca
 where we.warehouse_entity_uid       = bad.person_uid
   and ms.multi_source_key           = bad.multi_source_key
   and atk.academic_time_key         = bad.academic_time_key
   and crn.course_reference_number_key = bad.course_reference_number_key
   and ca.course_attribute_key         = bad.student_course_attribute_key
   
   and we.banner_pidm = '107627'
   and ms.multi_source = 'NJC'
   and atk.academic_period = '201110'
   and crn.course_reference_number = '10202'
   and ca.course_attribute = 'AH1'
   
   order by we.banner_pidm, ms.multi_source, atk.academic_period, crn.course_reference_number, ca.course_attribute;
   
select *
  from mst_student_course_attribute
 where person_uid = '107627'
   and mif_value = 'NJC'
   and academic_period = '201110'
   and course_reference_number = '10202'
   and course_attribute = 'AH1';
   
select * from as_student_course_attribute  
 where person_uid = '107627'
   and mif_value = 'NJC'
   and academic_period = '201110'
   and course_reference_number = '10202'
   and course_attribute = 'AH1';
   
   select * from as_student_course_attr_trans  
 where person_uid = '107627'
   and mif_value = 'NJC'
   and academic_period = '201120'
   and course_reference_number = '10202'
   and course_attribute = 'AH1';
   
   
   
   
    SELECT NVL(A.MIF_VALUE, null)                         MULTI_SOURCE,
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
           WHERE (('ALL' = 'ALL' or (EXISTS (SELECT 'x'
                                                                                      FROM MGT_YEAR_TYPE_DEFINITION YTD
                                                                                     WHERE YTD.ACADEMIC_PERIOD = A.ACADEMIC_PERIOD
                                                                                       AND YTD.YEAR_TYPE = 'ACYR'
                                                                                       AND YTD.YEAR_CODE = '2011'
                                                                                       AND NVL(A.MIF_VALUE, null) = NVL(YTD.MIF_VALUE, null)))))
             
             AND WE.BANNER_PIDM = A.PERSON_UID
             AND A.PERSON_UID =  PD.PERSON_ID
             --JOS update
             -- Remove multi source join to non-meped object WCV_EXTR_PERSON_DETAILS (PD)
             --AND NVL(A.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
             AND AC.YEAR_TYPE(+) = 'ACYR'
             AND A.ACADEMIC_PERIOD = AC.ACADEMIC_PERIOD(+)
             AND NVL(A.MIF_VALUE, null) = NVL(AC.MIF_VALUE(+), null)
             AND A.PERSON_UID =  CD.C_PERSON_UID(+)
             AND A.ACADEMIC_PERIOD = CD.C_ACADEMIC_PERIOD(+)           
             AND A.COURSE_REFERENCE_NUMBER = CD.C_COURSE_REFERENCE_NUMBER(+)
             AND NVL(A.MIF_VALUE, null) =  NVL(CD.C_MIF_VALUE, null)
             
             and a.person_uid = '107627'
   and a.mif_value = 'NJC'
   and a.academic_period = '201110'
   and a.course_reference_number = '10202'
   and a.course_attribute = 'AH1';
   
   --Why 2 records here/?? CHeck when on break next time
   select * from WCV_EXTR_COURSE_DETAILS
   where c_academic_period = '201110'
     and c_mif_value = 'NJC'
     and c_person_uid = '107627'
     and c_course_reference_number = '10202';
     
     
     
     
     
      SELECT MSC.person_uid person_id,
       MSC.mif_value,
       MSC.academic_period,
       MSC.course_identification,
       MSC.course_title_short,
       MSC.course_title_long,
       MSC.course_number,
       MSC.course_reference_number,
       MSC.subject,
       MSC.course_level,
       MSC.course_campus,
       MSC.course_college,
       MSC.course_division,
       MSC.course_department,
       MSC.schedule_type,
       MCO.student_meeting_time,
       MCC.program_classification,
       MCC.continuing_education_ind,
       MCS.cooperative_education_ind
  FROM MST_STUDENT_COURSE MSC,
       MST_COURSE_OFFERING MCO,
       MST_COURSE_CATALOG MCC,
       MST_COURSE_SUPPLEMENTAL MCS
 WHERE MSC.ACADEMIC_PERIOD = MCO.ACADEMIC_PERIOD(+)
       AND MSC.COURSE_REFERENCE_NUMBER = MCO.COURSE_REFERENCE_NUMBER(+)
       AND NVL (MSC.MIF_VALUE, ' ') = NVL (MCO.MIF_VALUE(+), ' ')
       AND MSC.SUBJECT = MCC.SUBJECT(+)
       AND MSC.COURSE_NUMBER = MCC.COURSE_NUMBER(+)
       AND MSC.ACADEMIC_PERIOD BETWEEN MCC.ACADEMIC_PERIOD_START(+) AND MCC.ACADEMIC_PERIOD_END(+)
       AND NVL (MSC.MIF_VALUE, ' ') = NVL (MCC.MIF_VALUE(+), ' ')
       AND MSC.SUBJECT = MCS.SUBJECT(+)
       AND MSC.COURSE_NUMBER = MCS.COURSE_NUMBER(+)
       AND MSC.ACADEMIC_PERIOD BETWEEN MCS.ACADEMIC_PERIOD_START(+) AND MCS.ACADEMIC_PERIOD_END(+)
       AND NVL (MSC.MIF_VALUE, ' ') = NVL (MCS.MIF_VALUE(+), ' ')
       
       
       and msc.person_uid = '107627'
   and msc.mif_value = 'NJC'
   and msc.academic_period = '201110'
   and msc.course_reference_number = '10202';
   
   /** Break down each table **/
   --2 rows (below)
   select * from MST_STUDENT_COURSE MSC where person_uid = '107627' and academic_period = '201110' and course_reference_number = '10202' and mif_value = 'NJC';
   select * from as_student_course_history where person_uid = '107627' and academic_period = '201110' and course_reference_number = '10202' and mif_value = 'NJC';;
   select * from as_student_course_in_progress where person_uid = '107627' and academic_period = '201110' and course_reference_number = '10202' and mif_value = 'NJC';;
   
   
   select * 
     from shrtckn
    where shrtckn_pidm = '107627'
      and shrtckn_term_code = '201110'
      and shrtckn_crn = '10202'
      and shrtckn_vpdi_code = 'NJC';   
      
      
      select count(*)
        from as_student_course_history   ch,
             as_student_course_in_progress  ip
       where ch.person_uid = ip.person_uid
         and ch.academic_period = ip.academic_period
         and ch.course_reference_number = ip.course_reference_number
         and ch.mif_value = ip.mif_value;
   
   select * 
     from sfrstcr
    where sfrstcr_pidm = '107627'
      and sfrstcr_term_code = '201110'
      and sfrstcr_crn = '10202'
      and sfrstcr_vpdi_code = 'NJC';
      
select count(*) 
  from sfrstcr, shrtckn
 where sfrstcr_pidm = shrtckn_pidm
   and sfrstcr_term_code = shrtckn_term_code
   and sfrstcr_crn = shrtckn_crn
   and sfrstcr_vpdi_code = shrtckn_vpdi_code;
      
      
   
   