select distinct 'PROCESS_GROUP' DATA_ELEMENT,
                NULL W_PREFIX,
                NULL_CLEANSE_VALUE W_VALUE,
                NULL_CLEANSE_SHORT SHORT_DESC,
                NULL_CLEANSE_LONG LONG_DESC
                FROM WCV_DEFAULT_VALUES
UNION ALL
SELECT distinct 'PROCESS_GROUP' DATA_ELEMENT,
                NULL W_PREFIX,
                ZONE_VALUE W_VALUE,
                ZONE_VALUE SHORT_DESC,
                ZONE_VALUE LONG_DESC                
FROM MST_PREvious_education where zone_value is not null