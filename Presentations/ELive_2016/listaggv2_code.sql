drop table listagg_example;

create table listagg_example as
(select 1 as seq, 'Bryan L. Mack' as name, '$43000000.00' as salary
  from dual
  union all
select 2 as seq, 'Bryan L. Mack' as name, '$43000000.12' as salary
  from dual
  );
  
  select * from listagg_example;

/* Demo SYS_CONNECT_BY_PATH */
select name,
       sys_connect_by_path(salary, ', ') salaries
  from 
    (select name,
            salary,
            row_number() over(partition by name order by name) rnum,
            count(*) over (partition by name) total
       from listagg_example)
 where rnum = total
 start with rnum = 1
 connect by prior rnum = rnum -1 and prior name = name;
  
/* Demo PIVOT keyword */


  
  select name, 
         listagg(salary,', ') within group (order by name) as salaries
    from listagg_example
  group by name;
  
  
  with records as
  (select distinct name, salary from listagg_example)
  
  select name, 
         listagg(salary,', ') within group (order by name) as salaries
    from records
  group by name;
  
  select name,
         regexp_replace(
            listagg(salary,', ') within group (order by name),
            '([^, ]*)(, \1)+($|, )', 
           '\1\3')
         as salaries
      from listagg_example
    group by name;
  