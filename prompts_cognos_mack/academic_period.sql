SELECT value, value||' - '||value_description value_description
FROM odslov.lov_academic_period
WHERE VALUE BETWEEN to_char(SYSDATE,'YYYY') - 5||'00'
               and to_char(sysdate,'YYYY')+1||'99'