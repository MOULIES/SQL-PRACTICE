-- Active: 1690646653992@@127.0.0.1@3306@SQL37
SELECT
        call_number
From
    call_details
GROUP BY call_number
HAVING 
    sum(CASE 
            WHEN call_type = 'OUT' THEN call_duration
            ELSE  NULL 
        END) > 0 
    AND 
    sum(CASE 
            WHEN call_type = 'INC' THEN call_duration
            ELSE  Null
        END) > 0 
    AND
    sum(CASE 
            WHEN call_type = 'OUT' THEN call_duration
            ELSE  NULL 
        END) > sum(
            CASE 
                WHEN call_type = 'INC' THEN call_duration
                ELSE  Null
             END) ;
