LOAD DATA
INFILE '/dw01/temp/sqlldr/everyone.csv'
BADFILE '/dw01/temp/sqlldr/everyone.bad'
DISCARDFILE '/dw01/temp/sqlldr/everyone.dsc'
INSERT INTO TABLE a_temp_mack_compare
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(person_uid, academic_period, instructor_id, instructor_last_name, instructor_first_name, sum_nvl_wkld_adj, weekly_contact_hrs)