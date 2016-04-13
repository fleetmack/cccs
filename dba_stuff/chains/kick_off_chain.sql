BEGIN
sys.dbms_scheduler.create_job(
job_name => '"RELOAD_SRP_JOB_2"',
job_type => 'CHAIN',
job_action => '"IA_ADMIN"."LOAD_SRP_CCCS"', start_date => systimestamp at time zone 'America/Denver', job_class => '"DEFAULT_JOB_CLASS"', auto_drop => FALSE, enabled => TRUE); END;
