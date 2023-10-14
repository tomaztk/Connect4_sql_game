
DRop table dbo.diagonalTAble

-- Create the DiagonalTable
CREATE  TABLE DiagonalTable (
    RowIndex INT,
    ColIndex INT,
    Value INT
);

-- Populate the DiagonalTable with random values
DECLARE @RowIndex INT;
DECLARE @ColIndex INT;
DECLARE @Value INT;

SET @RowIndex = 1;

WHILE @RowIndex <= 7
BEGIN
    SET @ColIndex = 1;

    WHILE @ColIndex <= 6
    BEGIN

        SET @Value = CAST(RAND() * 100 + 1 AS INT);

        INSERT INTO DiagonalTable (RowIndex, ColIndex, Value)
        VALUES (@RowIndex, @ColIndex, @Value);

        SET @ColIndex = @ColIndex + 1;
    END

    SET @RowIndex = @RowIndex + 1;
END;

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

    -- Return the diagonal sum
    SELECT @DiagonalSum AS DiagonalSum;
END;

select * from [dbo].[DiagonalTable]

EXEC CalculateDiagonalSum @StartRow = 3, @StartCol = 2;
