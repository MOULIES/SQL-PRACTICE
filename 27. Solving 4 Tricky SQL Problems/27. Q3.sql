
--  Question 3:
-- Write a sql query to get second highest and second lowest marks for each subject

/*
subject   second_highest_marks  second_lowest_marks
Subject1  91                    63
Subject2  71                    60
Subject3  29                    98
*/

SELECT
    subject,
    sum(case when rnk_asc = 2 then marks end) as second_lowest_marks,
    sum(case when rnk_desc = 2 then marks end) as second_highest_marks
FROM
    (SELECT
        *,
        rank() over (PARTITION BY subject order by marks asc) rnk_asc,
        rank() over (PARTITION BY subject order by marks desc) rnk_desc
    FROM
        students) a 
GROUP BY subject;
