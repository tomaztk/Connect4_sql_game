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

    SELECT board FROM dbo.con4t

END;
GO


-- check for game stop
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
dia1A as
(
-- diagonal 1 A
      SELECT
      DISTINCT
        CASE 
            when diag like '%1111' or diag like '%1111%' or diag like '1111%' then 'Winner 1'
            when diag like '%5555' or diag like '%5555%' or diag like '5555%' then 'Winner 2'
            else NULL end as res
          FROM
          (
            select 
            concat(t1.col1, t2.col2, t3.col3, t4.col4, t5.col5, t6.col6, t7.col7) as diag
            from dbo.con4temp as t1
            left join dbo.con4temp as t2
            on t1.r = t2.r-1
            left join dbo.con4temp as t3
            on t2.r = t3.r-1
            left join dbo.con4temp as t4
            on t3.r = t4.r-1
            left join dbo.con4temp as t5
            on t4.r = t5.r-1
            left join dbo.con4temp as t6
            on t5.r = t6.r-1
            left join dbo.con4temp as t7
            on t6.r = t7.r-1
          ) AS x
), 
dia1b as (
-- diagonal 1 B 
      SELECT
      DISTINCT
        CASE 
            when diag like '%1111' or diag like '%1111%' or diag like '1111%' then 'Winner 1'
            when diag like '%5555' or diag like '%5555%' or diag like '5555%' then 'Winner 2'
            else NULL end as res
          FROM
          (
            select 
            concat(t2.col2, t3.col3, t4.col4, t5.col5, t6.col6) as diag
            from dbo.con4temp as t2
            left join dbo.con4temp as t3
            on t2.r = t3.r-1
            left join dbo.con4temp as t4
            on t3.r = t4.r-1
            left join dbo.con4temp as t5
            on t4.r = t5.r-1
            left join dbo.con4temp as t6
            on t5.r = t6.r-1
            left join dbo.con4temp as t7
            on t6.r = t7.r-1

          ) AS x
),
dia2A AS (
-- Diagonal 2 A
    SELECT
    DISTINCT
      CASE 
          when diag like '%1111' or diag like '%1111%' or diag like '1111%' then 'Winner 1'
          when diag like '%5555' or diag like '%5555%' or diag like '5555%' then 'Winner 2'
          else NULL end as res
        FROM
        (
          select 
          concat(t1.col1, t2.col2, t3.col3, t4.col4, t5.col5, t6.col6) as diag
          from dbo.con4temp as t1
          left join dbo.con4temp as t2
          on t1.r = t2.r+1
          left join dbo.con4temp as t3
          on t2.r = t3.r+1
          left join dbo.con4temp as t4
          on t3.r = t4.r+1
          left join dbo.con4temp as t5
          on t4.r = t5.r+1
          left join dbo.con4temp as t6
          on t5.r = t6.r+1
          left join dbo.con4temp as t7
          on t6.r = t7.r+1
        ) AS x
)
, together as (
select distinct res from dia2A  union all
select res from dia1A  union all
select res from dia1B  union all
select res from ver  union all
select res from hor
)
select distinct res
into dbo.temp123 
  from together
where len(res) > 1

  SET @winner = (select res from dbo.temp123)

END;




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


  DECLARE @OutputParameter varchar(100)
  exec dbo.CheckWin @OutputParameter OUTPUT
  IF (@OutputParameter IS NOT NULL)
    BEGIN
      SELECT @OutputParameter
    END
END;
GO
