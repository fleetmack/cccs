--post secondary change table
select count(*) from CHG_POST_SECONDARY_SCHOOL;
--sprpchg where sprpchg_table_name IN (''PREVIOUS_EDUCATION_PCOL'',''PREVIOUS_DEGREE'',''PREVIOUS_EDUCATION_HSCH'',''PRE_STUDENT'',''ACADEMIC_OUTCOME'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'');
select count(*) from CRRSPCHG; --0, cool

--student course attribute change table
select count(*) from CHG_STUDENT_COURSE_ATTR;
select count(*) from SHRACHG
select count(*) from SHRCCHG
select count(*) from SHRDCHG
--SPRPCHG (''PREVIOUS_EDUCATION_PCOL'',''ACADEMIC_OUTCOME'',''MST_RACE'',''PERSON'',''MEDICAL_INFORMATION'',''VISA'',''GENERAL_STUDENT'')

--secondary school subject change table
select count(*) from CHG_SECONDARY_SCHOOL_SUBJECT;
select count(*) from SPRPCHG; --prod: 7366, test:  8049, dev: 0 (try again thursday)

/* 11/11/2015 - BLM - guessing SPRPCHG is just enormous due to some testing process we are running nightly */