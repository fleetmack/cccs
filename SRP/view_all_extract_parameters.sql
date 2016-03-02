select *
  from mtvparm
 where mtvparm_internal_code_group = 'EDW EXTRACT PARAMETERS'
 ORDER BY mtvparm_internal_code, mtvparm_internal_code_2, mtvparm_external_code;