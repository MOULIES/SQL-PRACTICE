-- Question : An organization is looking to hire employees /candidates for their junior and senior positions. 
-- They have a total quota/limit of 50000$ in all, they have to first fill up the senior positions 
-- and then fill up the junior positions, There are 3 test cases, write a SQL query to satisfy all the testcases. 
-- To check whether your SQL query is correct or wrong you can try with your own test case too . 

-- Table : Create table candidates(
-- id int primary key,
-- positions varchar(10) not null,
-- salary int not null);

-- Test Case 1: 
-- insert into candidates values(1,'junior',5000);
-- insert into candidates values(2,'junior',7000);
-- insert into candidates values(3,'junior',7000);
-- insert into candidates values(4,'senior',10000);
-- insert into candidates values(5,'senior',30000);
-- insert into candidates values(6,'senior',20000);

-- Expected o/p:
-- In the above case total salary of seniors is 30000$, so id 4 and 6 should be considered, there will be enough
-- money left to hire juniors so id 1, 2 and 3 can be considered.
-- Juniors Seniors
-- 3       2

-- Test case 2:
-- insert into candidates values(20,'junior',10000);
-- insert into candidates values(30,'senior',15000);
-- insert into candidates values(40,'senior',30000);

-- Expected O/P: In the above case id 30 and 40 totals to 45000$ so there is no enough money to hire juniors
-- hence count will be 0
-- Juniors Seniors
-- 0       2


-- test case 3:
-- insert into candidates values(1,'junior',15000);
-- insert into candidates values(2,'junior',15000);
-- insert into candidates values(3,'junior',20000);
-- insert into candidates values(4,'senior',60000);

-- Expected o/p: In the above case, id 4 is not considered since its above the total quota/limit so count is 0
-- and for juniors the salary sum up to 50000$
-- Juniors Seniors
-- 3       0


-- test case 4:( self tried not asked in the coding round)
-- insert into candidates values(10,'junior',10000);
-- insert into candidates values(40,'junior',10000);
-- insert into candidates values(20,'senior',15000);
-- insert into candidates values(30,'senior',30000);
-- insert into candidates values(50,'senior',15000);

-- Expected o/p: In the above case, ids 20 and 50 sums upto 30000$ and balance amount is 20000$ so id 10, 40 satisfies the condition.
-- and for juniors the salary sum up to 50000$
-- Juniors Seniors
-- 3       0