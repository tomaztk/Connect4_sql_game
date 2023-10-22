USE SQL_Games;
GO

drop table if exists con4t;
go

create table con4t
(r int identity(6,-1) not null 
,board char(7) default('0000000')
);
go

-- populate the game
INSERT INTO dbo.con4t (board)
SELECT '0000000'
GO 6


CREATE OR ALTER PROCEDURE dbo.AddToken(
     @user tinyint -- 1, 2 ; player 1 = 1; player 2 = 5
    ,@col tinyint -- 1,2,3,4,5,6,7
) AS
BEGIN
  declare @token int
  if @user = 1  set @token = 1 
  else set @token = 5

  declare @max_r int = 1

  WHILE @max_r <= 6
  BEGIN
      DECLARE @board char(7)
      SET @board = (SELECT board from con4t where r = @max_r)
      PRINT @board
      IF substring(@board,@col,1) = 0
        BEGIN

          UPDATE con4t
            set board = STUFF(board,@col,1,@token)

            WHERE
              r = @max_r
          set @max_r = 100 -- to exit the while loop immediatelly
        END
      SET @max_r = @max_r + 1
  END
  SELECT board from dbo.con4t
END;
GO

-- testing
exec dbo.AddToken @user = 2, @col = 5


-- check for game stop
CREATE OR ALTER PROCEDURE dbo.CheckWin
AS
BEGIN
-- create temp table
  DROP TABLE IF EXISTS dbo.con4temp;

    SELECT
       SUBSTRING(board, 1, 1) AS Col1
      ,SUBSTRING(board, 2, 1) AS Col2
      ,SUBSTRING(board, 3, 1) AS Col3
      ,SUBSTRING(board, 4, 1) AS Col4
      ,SUBSTRING(board, 5, 1) AS Col5
      ,SUBSTRING(board, 6, 1) AS Col6
      ,SUBSTRING(board, 7, 1) AS Col7
  into dbo.con4temp
  FROM dbo.con4t

   -- vertical
     DECLARE @max_r int = 1
     WHILE @max_r <= 6
     BEGIN
        SELECT board from dbo.con4t
        SET @max_r = @max_r + 1
      END

  -- horizontal
  
END;


