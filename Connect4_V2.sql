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




SELECT 
  
  for (dir in directions) {
    count <- 1
    for (i in 1:4) {
      r <- row + dir[1] * i
      c <- col + dir[2] * i
      if (r >= 1 && r <= nrow(board) && c >= 1 && c <= ncol(board) && board[r, c] == player) {
        count <- count + 1
      } else {
        break
      }
    }
    if (count >= 4) {
      return(TRUE)
    }
  }
  return(FALSE)
}




CREATE PROCEDURE CalculateDiagonalSum @StartRow INT, @StartCol INT AS
BEGIN
    DECLARE @DiagonalSum INT = 0;

    WHILE EXISTS (SELECT 1 FROM DiagonalTable WHERE RowIndex = @StartRow AND ColIndex = @StartCol)
    BEGIN
        DECLARE @CurrentValue INT;

        SELECT @CurrentValue = Value
        FROM DiagonalTable
        WHERE RowIndex = @StartRow AND ColIndex = @StartCol;

        SET @DiagonalSum = @DiagonalSum + @CurrentValue;

        -- Move to the next diagonal element (down and to the right)
        SET @StartRow = @StartRow + 1;
        SET @StartCol = @StartCol + 1;
    END;