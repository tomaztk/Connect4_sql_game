USE SQL_Games;
GO


CREATE OR ALTER PROCEDURE dbo.Init
AS
BEGIN

  drop table if exists con4t;

  create table dbo.con4t
  (r int identity(6,-1) not null 
  ,board char(7) default('0000000')
  );

  -- populate the game   GO 6
    INSERT INTO dbo.con4t (board) SELECT '0000000'
    INSERT INTO dbo.con4t (board) SELECT '0000000'
    INSERT INTO dbo.con4t (board) SELECT '0000000'
    INSERT INTO dbo.con4t (board) SELECT '0000000'
    INSERT INTO dbo.con4t (board) SELECT '0000000'
    INSERT INTO dbo.con4t (board) SELECT '0000000'

    -- SELECT board FROM dbo.con4t
    EXEC dbo.display_results

END;
GO


-- Showing results Procedure
CREATE OR ALTER PROCEDURE dbo.display_results
AS
BEGIN
  SELECT 'col: | 1 | 2 | 3 | 4 | 5 | 6 | 7 |' as Connect_4_Board
  union all
  SELECT 'row: | ' + substring(REPLACE(REPLACE(REPLACE(board, 1, 'X'), 5, 'O'), 0, ' '),1,1) + 
              ' | ' + substring(REPLACE(REPLACE(REPLACE(board, 1, 'X'), 5, 'O'), 0, ' '),2,1) +
              ' | ' + substring(REPLACE(REPLACE(REPLACE(board, 1, 'X'), 5, 'O'), 0, ' '),3,1) +
              ' | ' + substring(REPLACE(REPLACE(REPLACE(board, 1, 'X'), 5, 'O'), 0, ' '),4,1) +
              ' | ' + substring(REPLACE(REPLACE(REPLACE(board, 1, 'X'), 5, 'O'), 0, ' '),5,1) +
              ' | ' + substring(REPLACE(REPLACE(REPLACE(board, 1, 'X'), 5, 'O'), 0, ' '),6,1) +
              ' | ' + substring(REPLACE(REPLACE(REPLACE(board, 1, 'X'), 5, 'O'), 0, ' '),7,1) + ' |'
  
  FROM [dbo].[con4t]
END;


-- check for game stop Procedure
CREATE OR ALTER PROCEDURE dbo.CheckWin (
  @winner varchar(200) OUTPUT
)
AS
BEGIN
-- win combinations include: 1111 or 5555
-- create temp table
     DROP TABLE IF EXISTS dbo.con4temp;
     DROP TABLE IF EXISTS dbo.temp123;

      SELECT
        r
        ,CAST(SUBSTRING(board, 1, 1) AS INT) AS Col1
        ,CAST(SUBSTRING(board, 2, 1) AS INT) AS Col2
        ,CAST(SUBSTRING(board, 3, 1) AS INT) AS Col3
        ,CAST(SUBSTRING(board, 4, 1) AS INT) AS Col4
        ,CAST(SUBSTRING(board, 5, 1) AS INT) AS Col5
        ,CAST(SUBSTRING(board, 6, 1) AS INT) AS Col6
        ,CAST(SUBSTRING(board, 7, 1) AS INT) AS Col7
      into dbo.con4temp
      FROM dbo.con4t;

with ver
as (
   -- vertical
   SELECT DISTINCT
   CASE 
      when col like '%1111' or col like '%1111%' or col like '1111%' then 'Winner 1'
      when col like '%5555' or col like '%5555%' or col like '5555%' then 'Winner 2'
      else NULL end as res
    FROM
    (
        SELECT string_agg(col1, '') as col FROM  dbo.con4temp UNION ALL
        SELECT string_agg(col2, '') as col FROM  dbo.con4temp UNION ALL
        SELECT string_agg(col3, '') as col FROM  dbo.con4temp UNION ALL
        SELECT string_agg(col4, '') as col FROM  dbo.con4temp UNION ALL
        SELECT string_agg(col5, '') as col FROM  dbo.con4temp UNION ALL
        SELECT string_agg(col6, '') as col FROM  dbo.con4temp UNION ALL
        SELECT string_agg(col7, '') as col FROM  dbo.con4temp
    ) as x
),
hor as
(
  -- horizontal
  SELECT DISTINCT
  CASE 
      when board like '%1111' or board like '%1111%' or board like '1111%' then 'Winner 1'
      when board like '%5555' or board like '%5555%' or board like '5555%' then 'Winner 2'
      else NULL end as res
     from dbo.con4t
),
diag1A AS (
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
), all_diagonals AS (
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
), all_diag_sol AS (
SELECT 
    CASE 
      when Solution like '%1111' or Solution like '%1111%' or Solution like '1111%' then 'Winner 1'
      when Solution like '%5555' or Solution like '%5555%' or Solution like '5555%' then 'Winner 2'
      else NULL end as res
 FROM all_diagonals

)
, together as (
select DISTINCT res from all_diag_sol  union all
select res from ver  union all
select res from hor 
)
select distinct res
into dbo.temp123 
  from together
where len(res) > 1

  SET @winner = (select res from dbo.temp123)
  DROP TABLE IF EXISTS dbo.temp123;
  DROP TABLE IF EXISTS dbo.con4temp;
END;


-- Add Token Procedure
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
  -- SELECT board from dbo.con4t
  EXEC dbo.display_results


  DECLARE @OutputParameter varchar(100)
  exec dbo.CheckWin @OutputParameter OUTPUT
  IF (@OutputParameter IS NOT NULL)
    BEGIN
      SELECT @OutputParameter
    END
END;
GO


