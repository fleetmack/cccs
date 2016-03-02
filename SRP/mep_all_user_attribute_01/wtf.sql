select count(*) from wdt_calendar_date;

select user_attribute_01, system_load_process, to_char(system_load_tmstmp,'HH:MI:SS'), count(*)
from wdt_calendar_date
group by user_attribute_01, system_load_process, to_char(system_load_tmstmp,'HH:MI:SS') ;

--this means the stand-alone mapping put in a user_attribute_01
--but the load_edw_general did NOT.
--They are using different mappings, figure out why 