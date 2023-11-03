
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



--- test

select 

concat(r6.col1, r5.col2, r4.col3, r3.col4) as d1
,concat(r6.col2, r5.col3, r4.col4, r3.col5) as d2
,concat(r6.col3, r5.col4, r4.col5, r3.col6) as d3
,concat(r6.col4, r5.col5, r4.col6, r3.col7) as d4

from con4temp as r6
left join con4temp as r5
on r5.r = r6.r+1
left join con4temp as r4
on r4.r = r5.r+1
left join con4temp as r3
on r3.r = r4.r+1