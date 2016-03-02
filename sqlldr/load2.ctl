LOAD DATA
INFILE '/dw01/temp/sqlldr/missing.csv'
BADFILE '/dw01/temp/sqlldr/missing.bad'
DISCARDFILE '/dw01/temp/sqlldr/missing.dsc'
INSERT INTO TABLE a_temp_mack_compare2
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(person_uid, academic_period, instructor_id, instructor_last_name, instructor_first_name, multi_source, sum_nvl_wwkld_adj)