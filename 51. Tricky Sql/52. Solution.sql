-- Active: 1690646653992@@127.0.0.1@3306@SQL51

-- solution: https://youtu.be/ACD6J1opmFs
-- Take top 2 numbers from each section
-- take section total, section MAX
-- dense rank on section_total_desc, section_max_desc, section ASC
-- filter rank <= 2

with cte as (
        SELECT
            section,
            number,
            ROW_NUMBER() over (partition by section ORDER BY number desc) as rno
        FROM 
            section_data
    ),
    sec_cte as (
        SELECT
            section,
            number,
            sum(number) over (partition by section) as sec_total,
            max(number) over (partition by section) as sec_max
        FROM
            cte
        where rno <= 2
    ),
    top_sec as (
        SELECT
            *,
            dense_rank() over (order by sec_total desc, sec_max desc, section) as rnk
        FROM
            sec_cte
        
    )

select * from top_sec where rnk <= 2;