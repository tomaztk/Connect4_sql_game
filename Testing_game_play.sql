
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

-- ToDO: correct!