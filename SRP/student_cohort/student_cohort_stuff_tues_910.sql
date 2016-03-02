--New way (Eliminating continuing ed terms: 
select count(*) from table(edw_student_extr.f_get_student_cohort('2015','L',sysdate,null));
--2015 Input Before: 320K
--2015 Input Now:    152K

--2014 Input Then: 286K
--2014 Input Now:  119K
--2014 Fact then:  284K

--2013 Input Before: 237K
--2013 Input Now:    75K

--2012 Input Before: 206K
--2012 Input Now:    47K

--2011 Input Before: 192K
--2011 Input Now:    33K

--2010 Input Before: 180K
--2010 Input Now:    21K

--2009 Input Before: 170K
--2009 Input Now:    11K

truncate table wft_student_cohort;