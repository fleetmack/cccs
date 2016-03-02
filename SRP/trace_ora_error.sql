1st step: as odsstg or ia_admin
alter system set events '6503 trace name errorstack level 1' 
the 6503 is coming from your error there 



2nd step:  generate the error


3rd step:
ssh to tstodsdb01v
. oraenv
ODSD
cd $ORACLE_HOME/../../diag/rdbms/odsd/ODSD/trace 3:04 PM 
tail -100 alert_ODSD.log 

find the error and the trace file then look at that:

more /dw01/app/oracle/diag/rdbms/odsd/ODSD/trace/ODSD_j001_19803.trc



4th step: turn off logging
alter system set events '6503 trace name errorstack off';