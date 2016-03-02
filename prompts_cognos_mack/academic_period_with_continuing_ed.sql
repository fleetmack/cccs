SELECT value, value||' - '||value_description value_description, substr(value,1,5) as sort_value
FROM odslov.lov_academic_period
WHERE VALUE BETWEEN to_char(SYSDATE,'YYYY') - 5||'00'
               AND to_char(SYSDATE,'YYYY')+1||'99'
UNION ALL
SELECT VALUE, VALUE||' - '||value_description value_description, substr(value,2,5) as sort_value
FROM odslov.lov_academic_period
WHERE substr(VALUE,1,1) = '8'
  AND substr(VALUE,2,4) BETWEEN to_char(SYSDATE,'YYYY') - 5
                                AND
                                to_char(SYSDATE,'YYYY') + 1                            