
--Log into USRE and find capture rules

SELECT RULE_OWNER, RULE_NAME, SOURCE_DATABASE

FROM DBA_STREAMS_TABLE_RULES

WHERE TABLE_NAME = 'GOREMAL';

 

--DROP the rule

BEGIN

  DBMS_RULE_ADM.DROP_RULE(

    rule_name => 'ODSSTG.GOREMAL10234', 

    force     => TRUE); --This must be true as the rule will be part of a ruleset

END;

/

 

BEGIN

  DBMS_RULE_ADM.DROP_RULE(

    rule_name => 'ODSSTG.GOREMAL10233',  

    force     => TRUE);  --This must be true as the rule will be part of a ruleset

END;

/

 

--Run the ADD_STAGE_<SCHEMA> job in Admin UI for the table just removed.
