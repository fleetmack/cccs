This star is odd, either that or the way we store data is odd.

mst_student_cohort records have academic_period_start and academic_period_end

most of the academic_period_end dates are 999999 (end of time)

The way this star works, is if an academic period within mgt_year_type_definition is between those start & end dates,
the start puts in a record.

So if a student enrolled only in 201430... and their cohort has a start date of 201430 and an end date of 999999....
if the student is not enrolled in 201510, but we load 2015 data to the student cohort star, this person will get a record
saying they are in that cohort in 201510 since 201510 is between 201430 and 999999.

Make sense? Didn't think so.
