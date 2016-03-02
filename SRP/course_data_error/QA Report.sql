/*** NOTE!  For all of these, "credits_earned" COULD be set to 0, which makes no sense as these degrees have been
obtained.  Not sure what's up with that.  It appears to be a data error as this data comes directly from BANNER (via
the function at the very, very bottom of this script.  Data hasn't been properly entered to SHRTCKG */
select * from person_detail where id = 'S00486890'; --586890
select * from person_detail where id = 'S01111329'; --1211329
select * from person_detail where id = 'S01015458';
/* Issue #1 - 2 CCCS classes, although different CRN, duplicate entries for a coure */
with driver as
(select shrtckn_pidm, shrtckn_term_code, shrtckn_subj_code, shrtckn_crse_numb, shrtckn_seq_numb, shrtckn_vpdi_code
  from shrtckn
group by shrtckn_pidm, shrtckn_term_code, shrtckn_subj_code, shrtckn_crse_numb, shrtckn_seq_numb, shrtckn_vpdi_code
having count(*) > 1),
     ao as
      (select person_uid, mif_value, sum(credits_earned) as credits_earned, 
              min(outcome_graduation_date) as min_grad_date, max(outcome_graduation_date) as max_grad_date
         from mst_academic_outcome
        where status = 'AW'
        group by person_uid, mif_value)
select pd.id, s.shrtckn_pidm, s.shrtckn_term_code, s.shrtckn_crn, s.shrtckn_subj_code, s.shrtckn_crse_numb, s.shrtckn_crse_title,
       s.shrtckn_vpdi_code, ao.min_grad_date, ao.max_grad_date, ao.credits_earned
  from shrtckn s, driver, ao, person_detail pd
 where s.shrtckn_pidm        = pd.person_uid
   and s.shrtckn_pidm        = driver.shrtckn_pidm
   and s.shrtckn_pidm        = ao.person_uid(+)
   and s.shrtckn_term_code   = driver.shrtckn_term_code
   and s.shrtckn_subj_code   = driver.shrtckn_subj_code
   and s.shrtckn_crse_numb   = driver.shrtckn_crse_numb
   and s.shrtckn_vpdi_code   = driver.shrtckn_vpdi_code
   and s.shrtckn_vpdi_code   = ao.mif_value(+)
   and s.shrtckn_seq_numb    = driver.shrtckn_seq_numb
order by s.shrtckn_vpdi_code, s.shrtckn_term_code, s.shrtckn_pidm, s.shrtckn_subj_code, s.shrtckn_crse_numb, s.shrtckn_seq_numb;




/* Issue #2 - 2 Transfer - example pidm S01111329, 199620, BUS 115*/
/*** Also covers issue #3
/*** Also covers issue #6*/ 
with driver as
(select shrtrce_pidm, shrtrce_term_code_eff, shrtrce_subj_code, shrtrce_crse_numb, shrtrce_vpdi_code
  from shrtrce
group by shrtrce_pidm, shrtrce_term_code_eff, shrtrce_subj_code, shrtrce_crse_numb, shrtrce_vpdi_code
having count(*) > 1),
     ao as
      (select person_uid, mif_value, sum(credits_earned) as credits_earned, 
              min(outcome_graduation_date) as min_grad_date, max(outcome_graduation_date) as max_grad_date
         from mst_academic_outcome
        where status = 'AW'
        group by person_uid, mif_value)
select pd.id, s.shrtrce_pidm, s.shrtrce_term_code_eff, s.shrtrce_subj_code, s.shrtrce_crse_numb, s.shrtrce_crse_title,
       s.shrtrce_vpdi_code, ao.min_grad_date, ao.max_grad_date, ao.credits_earned
  from shrtrce  s,
       driver   d,
       ao,
       person_detail pd
 where s.shrtrce_pidm = pd.person_uid
   and s.shrtrce_pidm = ao.person_uid(+)
   and s.shrtrce_vpdi_code = ao.mif_value(+)
   and s.shrtrce_pidm = d.shrtrce_pidm
   and s.shrtrce_term_code_eff = d.shrtrce_term_code_eff
   and s.shrtrce_subj_code = d.shrtrce_subj_code
   and s.shrtrce_crse_numb = d.shrtrce_crse_numb
   and s.shrtrce_vpdi_code = d.shrtrce_vpdi_code  
order by s.shrtrce_vpdi_code, s.shrtrce_term_code_eff, s.shrtrce_pidm, s.shrtrce_subj_code, s.shrtrce_crse_numb;

/* Issue #4 - No idea how to tell what the error is */

/* Issue #5 - This code shows the different shrtrcr_trans_course_name values */
/* No clue how to tell which are "bad" */
select shrtrcr_trans_course_name, shrtrcr_vpdi_code, count(*) 
from shrtrcr 
where shrtrcr_trans_course_name is not null
--and shrtrcr_pidm = 1115458 --S01015458
group by shrtrcr_trans_course_name, shrtrcr_vpdi_code 
order by length(shrtrcr_trans_course_name) desc;

/* Issue #7 - Transfer course equivalent to 2 CCCS courses */
--don't know how to code 


/* Issue #8 - manual grades on SHRTCKN that were not rolled */
--waiting ot hear back from Nancy M -- where are these rolled indicators???
--S01010357, 2013330, MAR 158: P60


/* Issue #9 - grades rolled, course dropped, re-enrolled, then graded again.  New grade didn't roll correctly: */
--S01609607, 201130, SOC 101


/*************** FUNCTION THAT ODS USES TO CALCULATE CREDITS EARNED **********************/
SELECT SUM(NVL(SHRTCKG_HOURS_ATTEMPTED,
                     SHRTCKG_CREDIT_HOURS *
               DECODE(SHRGRDE_ATTEMPTED_IND, 'Y', 1, 'N', 0))),
             SUM(SHRTCKG_CREDIT_HOURS *
                 DECODE(SHRGRDE_PASSED_IND, 'Y', 1, 'N', 0) *
                 DECODE(NVL(SHRTCKN_REPEAT_COURSE_IND, 'N'),
           'I', 1, 'M', 1, 'E' , 0, 'N', 1, 'A', 0)),
             SUM(SHRTCKG_CREDIT_HOURS *
                 DECODE(SHRGRDE_COMPLETED_IND, 'Y', 1, 'N', 0) *
                 DECODE(NVL(SHRTCKN_REPEAT_COURSE_IND, 'N'),
           'I', 1, 'M', 1, 'E', 0, 'N', 1, 'A', 0)),
             SUM(SHRTCKG_CREDIT_HOURS *
                 DECODE(SHRGRDE_GPA_IND, 'Y', 1, 'N', 0) *
                 DECODE(NVL(SHRTCKN_REPEAT_COURSE_IND, 'N'),
           'I', 1, 'M', 1, 'E', 0, 'N', 1, 'A', 1)),
             SUM(SHRTCKG_CREDIT_HOURS * SHRGRDE_QUALITY_POINTS *
                  DECODE(SHRGRDE_GPA_IND, 'Y', 1, 'N', 0) *
                  DECODE(NVL(SHRTCKN_REPEAT_COURSE_IND, 'N'),
            'I', 1, 'M', 1, 'E', 0, 'N', 1, 'A', 1))
      FROM   SHRGRDE D, SHRTCKG B, SHRTCKL, SHRTCKN, SHRTCKD, SHRDGMR
      WHERE  SHRDGMR_VPDI_CODE = 'FRCC' AND  SHRTCKD_VPDI_CODE = SHRDGMR_VPDI_CODE AND SHRTCKN_VPDI_CODE = SHRTCKD_VPDI_CODE AND SHRTCKL_VPDI_CODE = SHRTCKN_VPDI_CODE AND SHRTCKL_VPDI_CODE = SHRDGMR_VPDI_CODE AND SHRTCKG_VPDI_CODE = SHRTCKN_VPDI_CODE AND SHRGRDE_VPDI_CODE = SHRTCKG_VPDI_CODE AND SHRGRDE_VPDI_CODE = SHRTCKL_VPDI_CODE AND  SHRDGMR_PIDM = 1438111
       --THIS NEEDS TO BE DONE FOR EACH DEGREE
       AND  SHRDGMR_SEQ_NO = 3
        AND  SHRTCKD_PIDM = SHRDGMR_PIDM
        AND  SHRTCKD_DGMR_SEQ_NO = SHRDGMR_SEQ_NO
        AND  SHRTCKD_APPLIED_IND = 'Y'
        AND  SHRTCKN_PIDM = SHRTCKD_PIDM
        AND  SHRTCKN_TERM_CODE = SHRTCKD_TERM_CODE
        AND  SHRTCKN_SEQ_NO = SHRTCKD_TCKN_SEQ_NO
        AND  SHRTCKL_PIDM = SHRTCKN_PIDM
        AND  SHRTCKL_TERM_CODE = SHRTCKN_TERM_CODE
        AND  SHRTCKL_TCKN_SEQ_NO = SHRTCKN_SEQ_NO
        AND  SHRTCKL_LEVL_CODE = SHRDGMR_LEVL_CODE
        AND  SHRTCKG_PIDM = SHRTCKN_PIDM
        AND  SHRTCKG_TERM_CODE = SHRTCKN_TERM_CODE
        AND  SHRTCKG_TCKN_SEQ_NO = SHRTCKN_SEQ_NO
        AND  SHRTCKG_SEQ_NO =
             (SELECT MAX(SHRTCKG_SEQ_NO)
              FROM   SHRTCKG C
              WHERE  SHRTCKG_VPDI_CODE = 'FRCC' AND  C.SHRTCKG_PIDM = B.SHRTCKG_PIDM
                AND  C.SHRTCKG_TERM_CODE = B.SHRTCKG_TERM_CODE
                AND  C.SHRTCKG_TCKN_SEQ_NO = B.SHRTCKG_TCKN_SEQ_NO)
        AND  SHRGRDE_CODE = SHRTCKG_GRDE_CODE_FINAL
        AND  SHRGRDE_LEVL_CODE = SHRTCKL_LEVL_CODE
        AND  SHRGRDE_TERM_CODE_EFFECTIVE =
             (SELECT MAX(SHRGRDE_TERM_CODE_EFFECTIVE)
              FROM   SHRGRDE E
              WHERE  SHRGRDE_VPDI_CODE = 'FRCC' AND  E.SHRGRDE_CODE = D.SHRGRDE_CODE
                AND  E.SHRGRDE_LEVL_CODE = D.SHRGRDE_LEVL_CODE
                AND  E.SHRGRDE_TERM_CODE_EFFECTIVE <= B.SHRTCKG_TERM_CODE
                AND  E.SHRGRDE_GRDE_STATUS_IND = D.SHRGRDE_GRDE_STATUS_IND)
        AND  SHRGRDE_GRDE_STATUS_IND = 'A'
        --FILTER TO 1 PERSON
        and  shrtckg_pidm = 270912;