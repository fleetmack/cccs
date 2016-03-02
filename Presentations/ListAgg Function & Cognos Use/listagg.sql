SELECT person_uid,
       program_desc
  FROM academic_study
WHERE multi_source = 'LCC'
  AND academic_period = '201310'
  AND person_uid IN
                  ('1401392',
                  '1674233',
                  '608019',
                  '1596639')
order by person_uid;   

SELECT person_uid,
       MAX(decode(seq,1,program_desc,NULL))||
       ', '||
       MAX(decode(seq,2,program_desc,NULL)) programs       
  FROM (SELECT person_uid,
               academic_period,
               multi_source,
               program_desc,
               row_number() OVER
                (PARTITION BY person_uid
                  ORDER BY academic_period, multi_source, program_desc NULLS LAST) seq
          FROM academic_study
         WHERE multi_source = 'LCC'
           AND academic_period = '201310'
           AND person_uid IN
                 ('1401392',
                  '1674233',
                  '608019',
                  '1596639')) 
group by person_uid;             


/*** new way ***/
SELECT person_uid,
       --REQUIRED AREAS INCLUDE:
          --Column to be aggregated (program_desc)
          --the WITHIN GROUP keywords
          --the ORDER BY clause within the grouping
       listagg(program_desc,', ') WITHIN GROUP (ORDER BY person_uid) programs
FROM academic_study
WHERE multi_source = 'LCC'
  AND academic_period = '201310'
  AND person_uid IN 
  ('1401392',
   '1674233',
  '608019',
   '1596639')
/*** Now you need a group by here for listagg to work ***/
group by person_uid;


----EX:  Faculty Load Report -- ECLS Code
