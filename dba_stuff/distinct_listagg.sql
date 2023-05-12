create or replace function distinct_listagg
  (listagg_in varchar2, --this is your entire original listagg function call ex: ('listagg(salary,', ') within group (order by salary) 
   delimiter_in varchar2)  --this is your delimiter, ex: ', '
   
   return varchar2
   as
   hold_result varchar2(4000);
   begin
   
   select rtrim( regexp_replace( (listagg_in)
          , '([^'||delimiter_in||']*)('||
          delimiter_in||'\1)+($|'||delimiter_in||')', '\1\3'), ',')
          into hold_result
          from dual;
          
    return hold_result;
    
end;
