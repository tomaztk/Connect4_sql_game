# Connect 4 game written in  T-SQL

This GitHub repository contains code samples that demonstrate how to create and use the procedures for Connect-4 game using SQL Server Transact SQL (T-SQL) in your favorite editor.

# What is Connect 4 game?
This is the classical puzzle game, that is easy and fun to play. The objective of the game is to assemble the line of four tokens on the board that are either vertical, horizontal, or diagonal.


<div style="text-align:center"><img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Connect_four_game.svg" alt="Connect 4" style="width:300px;"/></div>
Source: Wikipedia

# SQL Procedures

Game consists of several procedures that make the game work.
In order for the game to start, you will need to run all the procedures and use the main 'Play_game' procedure.

Two groups of procedure are available to start and play the game:
  1. Procedures to create and initialize matrix (helper procedures)
  2. Procedures to make moves (helper procedures)
  3. Procedure to play and find a solution (main procedure)




## Create initialized table (matrix)

The SQL Procedure: _dbo.Init_  describes and creates an empty board for a given default dimension (7x6).

Run the code:
```(sql)
-- Initialize the game
EXEC dbo.Init
```

## Displaying the results

The SQL Procedure: _dbo.display_results_  prettifies the board game (7x6) and shows the tokens as X (for player 1) and O (for player 2).

Run the code:
```(sql)
-- Check the board 
EXEC dbo.display_results
```

![Prettify board](/img/game_board.png)


## Procedures to check for win (finding the solution)

The SQL procedure: _dbo.CheckWin_ describes four ways to check if either of players won a game. It searches  in VERTICAL, HORIZONTAL, DIAGONAL UP and DIAGONAL DOWN way through the board, accordingly.


## Procedures to add tokens

Run the code:

```(sql)
-- Add token to 5th column for player 1
EXEC dbo.AddToken 1, 5

-- Add token to 4th column for player 2
EXEC dbo.AddToken 2, 4
```



# Generic code for playing:

```EXEC dbo.AddToken {column}, {player}```

Sample code:
```(sql)
EXEC dbo.Init
EXEC dbo.AddToken 1, 5
EXEC dbo.AddToken 2, 4
```


## Forking or cloning the repository
To work in GitHub, go to https://github.com/tomaztk/Connect4_sql_game and fork the repository. Work in your own fork and when you are ready to submit to make a change or publish your sample for the first time, submit a pull request into the master branch of this repository. 

You can also clone the repository. Note: further changes should be fetched manually.


```
git clone -n https://github.com/tomaztk/Connect4_sql_game
```

## Code of Conduct
Collaboration on this code is welcome and so are any additional questions or comments.


## License
Code is licensed under the MIT license.
