CREATE TABLE Connect4Game (
    GameID INT IDENTITY(1,1) PRIMARY KEY,
    Board VARCHAR(42) DEFAULT '                                         ',
    CurrentPlayer CHAR(1) DEFAULT 'X',
    Winner CHAR(1) NULL
);

CREATE TABLE Connect4Results (
    GameID INT PRIMARY KEY,
    Winner CHAR(1) NULL,
    ResultText VARCHAR(100)
);


-- Initialize a new game
CREATE PROCEDURE StartNewGame AS
BEGIN
    INSERT INTO Connect4Game (Board, CurrentPlayer, Winner)
    VALUES ('                                         ', 'X', NULL);
END;


-- Make a move
CREATE OR ALTER PROCEDURE MakeMove @GameID INT, @Column INT AS
BEGIN
    DECLARE @Board VARCHAR(42);
    DECLARE @CurrentPlayer CHAR(1);
    DECLARE @Winner CHAR(1);

    SELECT @Board = Board, @CurrentPlayer = CurrentPlayer, @Winner = Winner
    FROM Connect4Game
    WHERE GameID = @GameID;

    -- Check if the game is still active
    IF @Winner IS NULL
    BEGIN
        DECLARE @Row INT;
        SET @Row = 6;  

        WHILE @Row >= 1
        BEGIN
            DECLARE @Index INT;
            SET @Index = (@Row - 1) * 7 + @Column;

            IF SUBSTRING(@Board, @Index, 1) = ' '
            BEGIN
                SET @Board = STUFF(@Board, @Index, 1, @CurrentPlayer);
                BREAK;
            END
            ELSE
            BEGIN
                SET @Row = @Row - 1;
            END
        END

        -- Check for a win
        IF dbo.CheckForWin(@Board, @CurrentPlayer) = 1
        BEGIN
            UPDATE Connect4Game
            SET Board = @Board, Winner = @CurrentPlayer
            WHERE GameID = @GameID;

            INSERT INTO Connect4Results (GameID, Winner, ResultText)
            VALUES (@GameID, @CurrentPlayer, 'Player ' + @CurrentPlayer + ' wins!');
        END
        ELSE
        BEGIN
            -- Toggle current player
            SET @CurrentPlayer = CASE WHEN @CurrentPlayer = 'X' THEN 'O' ELSE 'X' END;
            UPDATE Connect4Game
            SET Board = @Board, CurrentPlayer = @CurrentPlayer
            WHERE GameID = @GameID;
        END
    END
END;


-- Function to check for a win
CREATE FUNCTION CheckForWin (@Board VARCHAR(42), @Player CHAR(1))
RETURNS INT
AS
BEGIN
    -- Check for horizontal win
    DECLARE @HorizontalWins TABLE (Pattern VARCHAR(7));
    INSERT INTO @HorizontalWins (Pattern) VALUES
        ('XXXX   '),
        (' XXXX  '),
        ('  XXXX '),
        ('   XXXX');

    -- Check for vertical win
    DECLARE @VerticalBoard VARCHAR(42);
    SET @VerticalBoard = REPLICATE(' ', 42);

    DECLARE @Row INT;
    SET @Row = 1;

    WHILE @Row <= 6
    BEGIN
        SET @VerticalBoard = STUFF(@VerticalBoard, @Row * 7, 1, SUBSTRING(@Board, @Row * 7, 7));
        SET @Row = @Row + 1;
    END

    -- Check for diagonal win (left to right)
    -- Add logic here for diagonal win checks

    -- Check for diagonal win (right to left)
    -- Add logic here for diagonal win checks

    IF EXISTS (SELECT 1 FROM @HorizontalWins WHERE Pattern LIKE '%' + @Player + '%')
        RETURN 1;
    ELSE IF CHARINDEX(@Player, @VerticalBoard) > 0
        RETURN 1;

    RETURN 0; -- Default to no win
END;


-- start a game
EXECUTE StartNewGame

-- Run game
EXECUTE MakeMove 2, 2
select * from Connect4Game
select * from [dbo].[Connect4Results]