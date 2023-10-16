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



## Create and initialize matrix

The SQL file: _01_Initialize.sql_  describes an empty board for a given default dimension (7x6).

Run the code:
```(sql)
-- Create board 
EXEC dbo.CREATE_board

```

## Procedures to make moves

The SQL file: _02_Play_game.sql_ describes four procedures that imitate a VERTICAL, HORIZONTAL, DIAGONAL UP and DIAGONAL DOWN solution search  in board accordingly.

Run the code:

```(sql)
-- Add token to 5th column for player 1
EXEC dbo.Play 5, 1

-- Add token to 4th column for player 2
EXEC dbo.Play 4, 2



## Finding the solution

The last file _03_Find_solution.sql_ holds the procedure that calculate and find the solution, ending the game when there are four tokens in a row. This procedure is called internally by the `dbo.Play`procedure.



# Generic code for playing:

```EXEC dbo.PLAY {column}, {player}```


And for ....


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
