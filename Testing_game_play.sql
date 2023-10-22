
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



