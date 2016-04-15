Db link to use for TEST: usre.cccs.edu

Db link to use for DEV:  vtrn.cccs.edu

 

If you get stage area status afterwards on triggers: Use DBMS_DDL.SET_FIRING_PROPERTY to modify these triggers:

Need to set the firing property to false. Log on as schema owner (In this case, Saturn) and set the trigger to FALSE with the following:

 

exec DBMS_DDL.SET_TRIGGER_FIRING_PROPERTY('SATURN','ST_SPRADDR_INSERT_ODS_CHANGE',FALSE);

 

May also get some errors for missing indexes, simply recreate them



To Stop Streams in ODSP/PROD:

--logged in as ODSSTG on the ODSP instance

--

exec mgkstrm.p_stop_capture('BPRA_BANNER', 'PROD.CCCS.EDU');

exec mgkstrm.p_stop_propagation('BPRA_BANNER', 'PROD.CCCS.EDU');

exec mgkstrm.p_stop_apply('BPRA_BANNER');

--

select 'capture' "PROCESS", STATUS from dba_capture@prod.cccs.edu

union all

select 'propagation', STATUS from dba_propagation@prod.cccs.edu

union all

SELECT 'apply', STATUS FROM DBA_APPLY;

--

--

 

 

To Start Streams in ODSP/PROD

select STATUS "capture" from DBA_CAPTURE@PROD.CCCS.EDU

union all

select STATUS "propagation" from DBA_PROPAGATION@PROD.CCCS.EDU

union all

SELECT status "apply" FROM DBA_APPLY;

 

EXEC MGKSTRM.P_START_APPLY('BPRA_BANNER');

exec mgkstrm.p_start_propagation('BPRA_BANNER', 'PROD.CCCS.EDU');

EXEC MGKSTRM.P_START_CAPTURE('BPRA_BANNER', 'PROD.CCCS.EDU');

--

select STATUS "capture" from DBA_CAPTURE@PROD.CCCS.EDU

union all

select STATUS "propagation" from DBA_PROPAGATION@PROD.CCCS.EDU

union all

SELECT status "apply" FROM dba_apply;
