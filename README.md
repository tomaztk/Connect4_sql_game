# Connect 4 game written in  T-SQL

This GitHub repository contains code samples that demonstrate how to create and use the procedures for Connect-4 game using SQL Server Transact SQL (T-SQL) in your favorite editor.

# What is Connect 4 game?
This is the classical puzzle game, that is easy and fun to play. The objective of the game is to assemble the line of four tokens on the board that are either vertical, horizontal, or diagonal.


<div style="text-align:center"><img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Connect_four_game.svg" alt="Connect 4" style="width:300px;"/></div>
Source: Wikipedia



# Game and T-SQL Procedures  

Game consists of four T-SQL procedures that complete the game and can be played. Run the complete _Connect4.sql_ file in to install the game on your database.

The procedures for the game are:
  1. Procedure `dbo.Init` to create and initialize the game (start procedure)
  2. Procedure `dbo.DisplayResults` to preetify the board and corresponding tokens (helper procedure)
  2. Procedure `dbo.CheckWin` to check for game stop and verify the user inputs (helper procedure)
  3. Procedure `dbo.AddToken` to play the game by both users (main procedure)


## Create initialized table (matrix)

The SQL Procedure: _dbo.Init_  describes and creates an empty board for a given default dimension (7x6).

Run the code:
```(sql)
-- Initialize the game
EXEC dbo.Init
```
Procedure must be run every time, if you want to initiate the new game.

## Displaying the results

The T-SQL Procedure: _dbo.DisplayResults_  prettifies the board game (7x6) and shows the tokens as X (for player 1) and O (for player 2).

Run the code:
```(sql)
-- Check the board restults
EXEC dbo.DisplayResults
```

![Prettify board](/img/game_board.png)

This is a helper procedure and is internally run by other procedures.

## Procedures to check for win (finding the solution)

The T-SQL procedure: _dbo.CheckWin_ describes four ways to check if either of players won a game. It searches for:
 - VERTICAL
 - HORIZONTAL
 - DIAGONAL UP and 
 - DIAGONAL DOWN 
 
 solutions through the board, accordingly.


## Procedures to add tokens

The T-SQL procedure: _dbo.AddToken_ gives the users the gameplay. The input parameters are user and column:

```(sql)
-- Add token to 5th column for player 1
EXEC dbo.AddToken 1, 5

-- Add token to 4th column for player 2
EXEC dbo.AddToken 2, 4
```

This procedure also holds some of the error handling; it checks for:
- correct input (player and column)
- checks for correct order of players (each play alternatively)
- checks for number of tokens in each column and prevent column overflow 


# Generic code for playing the game

Game is started by initializing the board and players. Afther the initialization, you can start playing the gaming by alternatively adding tokens from each player. The adding of tokens is done by using the procedure
```EXEC dbo.AddToken {column}, {player}```.


Here is the starter and sample code:
```(sql)
EXEC dbo.Init
EXEC dbo.AddToken 1, 5
EXEC dbo.AddToken 2, 4
...
```


During the game, you will get board displayed every single time, when user is making a move.

![game play ](/img/game_board2.png)


# Forking or cloning the repository

To work in GitHub, go to https://github.com/tomaztk/Connect4_sql_game and fork the repository. Work in your own fork and when you are ready to submit to make a change or publish your sample for the first time, submit a pull request into the master branch of this repository. 

You can also clone the repository. Note: further changes should be fetched manually.

```
git clone -n https://github.com/tomaztk/Connect4_sql_game
```

# Code of Conduct
Collaboration on this code is welcome and so are any additional questions or comments.


# License
Code is licensed under the MIT license.


# ToDO

-  AI to play against the computer