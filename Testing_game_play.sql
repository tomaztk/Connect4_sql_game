
-- init the game
EXEC dbo.Init


-- Test cases
-- testing -vertical
exec dbo.AddToken @user = 1, @col = 2
exec dbo.AddToken @user = 1, @col = 3
exec dbo.AddToken @user = 1, @col = 4
exec dbo.AddToken @user = 1, @col = 5

-- testing -diagonal1A
exec dbo.AddToken @user = 1, @col = 1
exec dbo.AddToken @user = 2, @col = 2
exec dbo.AddToken @user = 1, @col = 2
exec dbo.AddToken @user = 2, @col = 3  --2x
exec dbo.AddToken @user = 1, @col = 3  
exec dbo.AddToken @user = 2, @col = 4  --3x
exec dbo.AddToken @user = 1, @col = 4  


-- testing -diagonal1B
exec dbo.AddToken @user = 1, @col = 2
exec dbo.AddToken @user = 2, @col = 3
exec dbo.AddToken @user = 1, @col = 3
exec dbo.AddToken @user = 2, @col = 4  --2x
exec dbo.AddToken @user = 1, @col = 4  
exec dbo.AddToken @user = 2, @col = 5  --3x
exec dbo.AddToken @user = 1, @col = 5  

-- testing -diagonal1C
exec dbo.AddToken @user = 1, @col = 2 --2x
exec dbo.AddToken @user = 2, @col = 3 --2x
exec dbo.AddToken @user = 1, @col = 3
exec dbo.AddToken @user = 2, @col = 4  --3x
exec dbo.AddToken @user = 1, @col = 4  
exec dbo.AddToken @user = 2, @col = 5  --4x
exec dbo.AddToken @user = 1, @col = 5  

-- testing -diagonal2
exec dbo.AddToken @user = 1, @col = 6 
exec dbo.AddToken @user = 2, @col = 5 
exec dbo.AddToken @user = 1, @col = 5
exec dbo.AddToken @user = 2, @col = 4 -- 2x
exec dbo.AddToken @user = 1, @col = 4   
exec dbo.AddToken @user = 2, @col = 3  -- 3x
exec dbo.AddToken @user = 1, @col = 3
 
-- testing -vertical
exec dbo.AddToken @user = 1, @col = 2
exec dbo.AddToken @user = 1, @col = 3
exec dbo.AddToken @user = 1, @col = 4
exec dbo.AddToken @user = 1, @col = 5



-- init the game
EXEC dbo.Init

-- 1: X; 2: O
exec dbo.AddToken @user = 1, @col = 4
exec dbo.AddToken @user = 2, @col = 4
exec dbo.AddToken @user = 1, @col = 3
exec dbo.AddToken @user = 2, @col = 3
exec dbo.AddToken @user = 1, @col = 2
exec dbo.AddToken @user = 2, @col = 5
exec dbo.AddToken @user = 1, @col = 5
exec dbo.AddToken @user = 2, @col = 1
exec dbo.AddToken @user = 1, @col = 6
exec dbo.AddToken @user = 2, @col = 1
exec dbo.AddToken @user = 1, @col = 4
exec dbo.AddToken @user = 2, @col = 3
exec dbo.AddToken @user = 1, @col = 3


-- init the game
EXEC dbo.Init

-- testing -diagonal2
exec dbo.AddToken @user = 1, @col = 4 
exec dbo.AddToken @user = 2, @col = 3 
exec dbo.AddToken @user = 1, @col = 3
exec dbo.AddToken @user = 2, @col = 2 -- 2x
exec dbo.AddToken @user = 1, @col = 2   
exec dbo.AddToken @user = 2, @col = 1  -- 3x
exec dbo.AddToken @user = 1, @col = 1


-- testing -diagonal2
exec dbo.AddToken @user = 1, @col = 4 
exec dbo.AddToken @user = 2, @col = 3 
exec dbo.AddToken @user = 1, @col = 3
exec dbo.AddToken @user = 2, @col = 2 -- 2x
exec dbo.AddToken @user = 1, @col = 2   
exec dbo.AddToken @user = 2, @col = 1  -- 3x
exec dbo.AddToken @user = 1, @col = 1


-- Testing 2nd/3rd/+ rows
drop table dbo.con4t
create table dbo.con4t
(r int identity(6,-1) not null 
,board char(7) default('0000000')
);

INSERT INTO dbo.con4t (board) SELECT '0000000'
INSERT INTO dbo.con4t (board) SELECT '0000000'
INSERT INTO dbo.con4t (board) SELECT '0000000'
INSERT INTO dbo.con4t (board) SELECT '0000000'
INSERT INTO dbo.con4t (board) SELECT '1151511'
INSERT INTO dbo.con4t (board) SELECT '5111555'

exec display_results

exec dbo.AddToken @user = 1, @col = 6
exec dbo.AddToken @user = 2, @col = 5 
exec dbo.AddToken @user = 1, @col = 5
exec dbo.AddToken @user = 2, @col = 4 -- 2x 
exec dbo.AddToken @user = 1, @col = 4



-- Testing 2nd/3rd/+ middle rows
drop table dbo.con4t
create table dbo.con4t
(r int identity(6,-1) not null 
,board char(7) default('0000000')
);

INSERT INTO dbo.con4t (board) SELECT '0000000'
INSERT INTO dbo.con4t (board) SELECT '0000000'
INSERT INTO dbo.con4t (board) SELECT '0000000'
INSERT INTO dbo.con4t (board) SELECT '0000000'
INSERT INTO dbo.con4t (board) SELECT '1151511'
INSERT INTO dbo.con4t (board) SELECT '5111555'

exec display_results

exec dbo.AddToken @user = 1, @col = 5
exec dbo.AddToken @user = 2, @col = 6 
exec dbo.AddToken @user = 1, @col = 6
exec dbo.AddToken @user = 2, @col = 7 -- 2x 
exec dbo.AddToken @user = 1, @col = 7



-- Testing 2nd/3rd/+ middle rows
drop table dbo.con4t
create table dbo.con4t
(r int identity(6,-1) not null 
,board char(7) default('0000000')
);

INSERT INTO dbo.con4t (board) SELECT '0000000'
INSERT INTO dbo.con4t (board) SELECT '0000000'
INSERT INTO dbo.con4t (board) SELECT '0000000'
INSERT INTO dbo.con4t (board) SELECT '5515115'
INSERT INTO dbo.con4t (board) SELECT '1151511'
INSERT INTO dbo.con4t (board) SELECT '5111555'

exec display_results

exec dbo.AddToken @user = 1, @col = 4 --error



-------------------------
-------------------------
-- common solution 
-- for finding diagonals
-- for LR  and for RL
-------------------------
-------------------------


;with diag1A AS (
select 
 concat(c1.col1,c2.col2,c3.col3, c4.col4, c5.col5, c6.col6, c7.col7) as r1_c1
,concat(c1.col2,c2.col3,c3.col4, c4.col5, c5.col6, c6.col7) as r1_c2
,concat(c1.col3,c2.col4,c3.col5, c4.col6, c5.col7) as r1_c3 
,concat(c1.col4,c2.col5,c3.col6, c4.col7) as r1_c4
from con4temp as c1
 join con4temp as c2 on c1.r+1 = c2.r
 join con4temp as c3 on c2.r+1 = c3.r
 join con4temp as c4 on c3.r+1 = c4.r
 join con4temp as c5 on c4.r+1 = c5.r
 join con4temp as c6 on c5.r+1 = c6.r
left join con4temp as c7 on c6.r+1 = c7.r 
), diag2A AS (
    select 
    concat(c1.col1,c2.col2,c3.col3, c4.col4, c5.col5) as sol
    from con4temp as c1
    left join con4temp as c2 on c1.r+1 = c2.r
    left join con4temp as c3 on c2.r+1 = c3.r
    left join con4temp as c4 on c3.r+1 = c4.r
    left join con4temp as c5 on c4.r+1 = c5.r
    left join con4temp as c6 on c5.r+1 = c6.r
    left join con4temp as c7 on c6.r+1 = c7.r -- not exists!
where 
c1.r = 2
), diag3A AS (
    select 
    concat(c1.col1,c2.col2,c3.col3, c4.col4, c5.col5, c6.col6, c7.col7) as sol
    from con4temp as c1
    left join con4temp as c2 on c1.r+1 = c2.r
    left join con4temp as c3 on c2.r+1 = c3.r
    left join con4temp as c4 on c3.r+1 = c4.r
    left join con4temp as c5 on c4.r+1 = c5.r
    left join con4temp as c6 on c5.r+1 = c6.r
    left join con4temp as c7 on c6.r+1 = c7.r -- not exists!
    where 
    c1.r = 3
)

-- diagonal RL
, diag1B AS (
    select 
    concat(c1.col7,c2.col6,c3.col5,c4.col4, c5.col3,c6.col2) r1_c7
    ,concat(c1.col6,c2.col5,c3.col4,c4.col3, c5.col2,c6.col1) r1_c6
    ,concat(c1.col5,c2.col4,c3.col3,c4.col2, c5.col1) r1_c5
    ,concat(c1.col4,c2.col3,c3.col2,c4.col1) r1_c4
    from con4temp as c1
    join con4temp as c2 on c1.r+1 = c2.r
    join con4temp as c3 on c2.r+1 = c3.r
    join con4temp as c4 on c3.r+1 = c4.r
    join con4temp as c5 on c4.r+1 = c5.r
    join con4temp as c6 on c5.r+1 = c6.r
    left join con4temp as c7 on c6.r+1 = c7.r 

), diag2B AS (

    select 
        concat(c1.col7,c2.col6,c3.col5,c4.col4, c5.col3) sol
    from con4temp as c1
        left join con4temp as c2 on c1.r+1 = c2.r
        left join con4temp as c3 on c2.r+1 = c3.r
        left join con4temp as c4 on c3.r+1 = c4.r
        left join con4temp as c5 on c4.r+1 = c5.r
        left join con4temp as c6 on c5.r+1 = c6.r
        left join con4temp as c7 on c6.r+1 = c7.r -- not exists!
    where 
    c1.r = 2
), diag3B AS (
    select 
        concat(c1.col7,c2.col6,c3.col5,c4.col4) sol
    from con4temp as c1
        left join con4temp as c2 on c1.r+1 = c2.r
        left join con4temp as c3 on c2.r+1 = c3.r
        left join con4temp as c4 on c3.r+1 = c4.r
        left join con4temp as c5 on c4.r+1 = c5.r
        left join con4temp as c6 on c5.r+1 = c6.r
        left join con4temp as c7 on c6.r+1 = c7.r -- not exists!
    where 
    c1.r = 3
)
SELECT r1_c1 AS Solution FRom diag1A UNION ALL
SELECT r1_c2 AS Solution FRom diag1A UNION ALL
SELECT r1_c3 AS Solution FRom diag1A UNION ALL
SELECT r1_c4 AS Solution FRom diag1A UNION ALL
SELECT sol FROM diag2A UNION ALL
SELECT sol FROM diag3A UNION ALL
SELECT r1_c7 AS Solution FRom diag1B UNION ALL
SELECT r1_c6 AS Solution FRom diag1B UNION ALL
SELECT r1_c5 AS Solution FRom diag1B UNION ALL
SELECT r1_c4 AS Solution FRom diag1B UNION ALL
SELECT sol FROM diag2B UNION ALL
SELECT sol FROM diag3B
