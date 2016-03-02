/* Step 1 - Verify that all with NULL user_attribte_01 have only that one record*/
select user_attribute_01, count(*) from wdt_warehouse_entity group by user_attribute_01 order by user_attribute_01; --74820 PROD


with records as (select banner_pidm from wdt_warehouse_entity where user_attribute_01 is null)
select r.banner_pidm 
from records r, wdt_warehouse_entity we
where r.banner_pidm = we.banner_pidm
group by r.banner_pidm
having count(*) > 1;
--If this returns 0, you are good to go

/* Step 2 - Populate Change Table */
insert into chg_person
  (select banner_pidm, 'SPRPCHG', sysdate from wdt_warehouse_entity where user_attribute_01 is null);
--should insert the same # from null row of step 1, 74820  
select count(*) from chg_person;

/* Backup change table */
--drop table chg_person_mack;
create table chg_person_mack as (select * from chg_person);
commit;

select count(*) from chg_person_mack; --74820 (our 36k + those which existed in chg_person already)

/* Step 3 - update WE table to set user_attribute_01 for an arbitrary school for the NULLs */
update wdt_warehouse_entity
set user_attribute_01 = 'ACC'
where user_attribute_01 is null; --74820 updated
commit;

/* Step 4 - run WE mapping in admin UI as refresh */
/* Step 5 - Verify Counts - each pidm should have 13 rows */
select banner_pidm, count(*)
  from wdt_warehouse_entity
 --where banner_pidm in (select person_uid from chg_person_mack)
 group by banner_pidm
 having count(*) <> 13;
 --they all have 13 rows, sweet.


/* Step 6 - delete from hold, race, and fact tables */
delete from wft_hold where mif_value_vc = 'CCCS';
delete from wft_race where mif_value_vc = 'CCCS';
delete from wft_test where mif_value_vc = 'CCCS';


/* Step 7 - modify change tables for all stars */
insert into CHG_ACADEMIC_OUTCOME_HNR    (select person_uid, 'SPRPCHG', sysdate from chg_person_mack);
insert into CHG_ATHLETIC                (select person_uid, 'SGRSCHG', sysdate from chg_person_mack);
insert into CHG_CONTACT                 (select person_uid, 'SPRPCHG', sysdate from chg_person_mack);
insert into CHG_RACE                    (select person_uid, 'SPRPCHG', sysdate from chg_person_mack);
insert into CHG_STUDENT                 (select person_uid, 'SPRPCHG', sysdate from chg_person_mack);
insert into CHG_POST_SECONDARY_SCHOOL   (select person_uid, 'SPRPCHG', sysdate from chg_person_mack);
insert into CHG_INTEREST                (select person_uid, 'SPRPCHG', sysdate from chg_person_mack);
insert into CHG_STUDENT_COHORT          (select person_uid, 'SGRPCHG', sysdate from chg_person_mack);
insert into CHG_TEST                    (select person_uid, 'SPRPCHG', sysdate from chg_person_mack);
insert into CHG_HOLD                    (select person_uid, 'SPRPCHG', sysdate from chg_person_mack);
insert into CHG_PROSPECTIVE_STUDENT     (select person_uid, 'SRRICHG', sysdate from chg_person_mack);
insert into CHG_STUDENT_ACTIVITY        (select person_uid, 'SPRPCHG', sysdate from chg_person_mack);
insert into CHG_STUDENT_ATTRIBUTE       (select person_uid, 'SGRPCHG', sysdate from chg_person_mack);
insert into CHG_ADVISOR                 (select person_uid, 'SGRPCHG', sysdate from chg_person_mack);
insert into CHG_FINAID_APPLICATION      (select person_uid, 'RORNCHG', sysdate from chg_person_mack);
insert into CHG_GRADE_CHANGE            (select person_uid, 'SPRPCHG', sysdate from chg_person_mack);
insert into CHG_MEETING_TIME            (select person_uid, 'SSROCHG', sysdate from chg_person_mack);
insert into CHG_COURSE_INSTRUCTOR       (select person_uid, 'SIRFCHG', sysdate from chg_person_mack);
insert into CHG_COURSE_SECTION          (select person_uid, 'SSROCHG', sysdate from chg_person_mack);
insert into CHG_RETENTION_MULTI_YEAR    (select person_uid, 'CHG_STUDENT', sysdate from chg_person_mack);
insert into CHG_BANNER_COMMUNICATION    (select person_uid, 'GURMCHG', sysdate from chg_person_mack);
insert into CHG_ADMISSIONS_APPLICATION  (select person_uid, 'SPRPCHG', sysdate from chg_person_mack);
insert into CHG_FINAID_AWARD_AID_YEAR   (select person_uid, 'RORNCHG', sysdate from chg_person_mack);
insert into CHG_FINAID_AWARD_ACAD_PERIOD (select person_uid, 'RORNCHG', sysdate from chg_person_mack);
insert into CHG_STUDENT_COURSE_ATTR      (select person_uid, NULL, 'SPRPCHG', sysdate from chg_person_mack);
insert into chg_academic_outcome         (select person_uid, 'SPRPCHG', sysdate from chg_person_mack);
commit;
/* Step 8 - reload student course star for all years */

/* Step 9 - refresh SRP */