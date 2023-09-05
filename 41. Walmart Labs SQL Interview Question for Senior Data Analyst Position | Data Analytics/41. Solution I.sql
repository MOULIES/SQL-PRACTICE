-- Active: 1690646653992@@127.0.0.1@3306@SQL41


WITH CTE AS (
    SELECT
        Callerid,
        DATE_FORMAT(Datecalled, "%Y-%m-%d") as dt,
        min(Datecalled) as first_call,
        max(Datecalled) as last_call
    FROM
        phonelog
    GROUP BY Callerid, DATE_FORMAT(Datecalled, "%Y-%m-%d")
)
SELECT
    CTE.Callerid,
    dt,
    p1.Recipientid
FROM
    CTE
        INNER JOIN
    phonelog p1 on CTE.Callerid = p1.Callerid and CTE.first_call = p1.Datecalled
        INNER JOIN 
    phonelog p2 on CTE.Callerid = p2.Callerid and CTE.last_call = p2.Datecalled
WHERE p1.Recipientid = p2.Recipientid;