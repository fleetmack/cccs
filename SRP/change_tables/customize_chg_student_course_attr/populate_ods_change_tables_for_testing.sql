--populate change table for testing
update shrattr set shrattr_vpdi_code = shrattr_vpdi_code where rownum < 2000; -- run ods delete & update of mst_student_course_attribute
update shrtckn set shrtckn_vpdi_code = shrtckn_vpdi_code where rownum < 100000; --run ods delete & update of mst_studnet_course_history

select count(*) from chg_student_course_attr;