/***
DROP TABLE a_temp_mack_compare;
/

CREATE TABLE a_temp_mack_compare
(
person_uid VARCHAR2(100),
academic_period VARCHAR2(60),
instructor_id VARCHAR2(100),
instructor_last_name VARCHAR2(200),
instructor_first_name VARCHAR2(20),
sum_nvl_wkld_adj VARCHAR2(300),
weekly_contact_hrs VARCHAR2(100));
COMMIT;

drop table a_temp_mack_compare2;
/

create table a_temp_mack_compare2
(
person_uid VARCHAR2(100),
academic_period VARCHAR2(60),
instructor_id VARCHAR2(10),
instructor_last_name VARCHAR2(20),
instructor_first_name VARCHAR2(20),
multi_source VARCHAR2(40),
sum_nvl_wwkld_adj VARCHAR2(10));
COMMIT;
***/

SELECT * FROM a_temp_mack_compare;
select * from a_temp_mack_compare2;