select * from



(SELECT NAME,
       listagg(ecls||':'||multi_source,', ') WITHIN GROUP (ORDER BY NAME) e_classes
  FROM       

(SELECT 'BRYAN' NAME,       'FRCC'  multi_source,       '38'    ecls  FROM dual  
UNION ALL
SELECT 'BRYAN' NAME,       'ACC'   multi_source,       '10'    ecls  FROM dual
UNION ALL
SELECT 'CHIP' NAME,       'FRCC'   multi_source,       '10'    ecls  FROM dual
  UNION ALL
SELECT 'CHIP' NAME,       'ACC'   multi_source,       '38'    ecls  FROM dual
  UNION ALL
SELECT 'VENU' NAME,       'FRCC'   multi_source,       '10'    ecls  FROM dual
  union all  
  SELECT 'VENU' NAME,       'CCD'   multi_source,       '38'    ecls  FROM dual
  UNION ALL
SELECT 'KAREN' NAME,       'FRCC'   multi_source,       '38'    ecls  FROM dual 
  UNION ALL
SELECT 'KAREN' NAME,       'RRCC'   multi_source,       '10'    ecls  FROM dual 
  UNION ALL
SELECT 'ERIC' NAME,       'ACC'   multi_source,       '10'    ecls  FROM dual
  UNION ALL
SELECT 'ERIC' NAME,       'LCC'   multi_source,       '38'    ecls  FROM dual
  UNION ALL
SELECT 'BOBBY TABLES' NAME,       'ACC'   multi_source,       '40'    ecls  FROM dual )
  
group by name)




--WHERE e_classes LIKE '%38%'   --should return Bobby Tables, Bryan, Chip, Venu
where e_classes LIKE '%10%'   -- should return Bryan, Chip, Eric, Karen