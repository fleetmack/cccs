(SELECT f_get_pidm (entity_id)
     FROM (  SELECT multi_source,
                    entity_lkp,
                    entity_id
               FROM EDWSTG.STG_ENTITY
           GROUP BY multi_source,
                    entity_lkp,
                    entity_id
             HAVING COUNT (*) > 1)) /*EAB - BLM end*/
             
             
             insert into apbcons (select * from apbcons_mack);
             
             
delete from apbcons where apbcons_pidm in
( '24506',
'22338',
'1237497',
'1826072',
'1210528',
'776963',
'688427',
'687296',
'1232248',
'1228988',
'1232582',
'1239503',
'1266275',
'1826075',
'413788',
'1146791',
'1164312',
'1825876',
'1186297',
'1272861',
'1180289',
'159693',
'1237799',
'11554',
'1150335',
'1190648',
'1192157');
drop table apbcons_mack as
(select * from apbcons where apbcons_pidm IN ( '24506',
'22338',
'1237497',
'1826072',
'1210528',
'776963',
'688427',
'687296',
'1232248',
'1228988',
'1232582',
'1239503',
'1266275',
'1826075',
'413788',
'1146791',
'1164312',
'1825876',
'1186297',
'1272861',
'1180289',
'159693',
'1237799',
'11554',
'1150335',
'1190648',
'1192157'));

select * from apbcons_mack;