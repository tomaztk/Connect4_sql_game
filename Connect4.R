# # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # 
#
# Connect4 / Four in a row game
#
# # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # 


## Helper functions
initialize_board <- function(rows, cols) {
  matrix(" ", nrow = rows, ncol = cols)
}

print_board <- function(board) {
  cat("\n")
  for (row in 1:nrow(board)) {
    cat("|", paste(board[row, ], collapse = " | "), "|\n")
  }
  cat("\n")
}

check_win <- function(board, player, row, col) {
  directions <- list(
    c(0, 1),  # Right / Left
    c(1, 0),  # Down / Up
    c(1, 1),  # Diagonal down-right
    c(1, -1)  # Diagonal down-left
  )
  
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

#############################
# Main function to play 4Row
############################

play_game <- function() {
  rows <- 6
  cols <- 7
  nof_tokens <- 42
  board <- initialize_board(rows, cols)
  player <- "X"
  
  repeat {
    print_board(board)
    cat("Player", player, "'s turn\n")
    
    
    repeat {
      col <- as.integer(readline("Enter a column (1-7) number: "))
      if (col >= 1 && col <= cols && board[1, col] == " ") {
        break
      } else {
        cat("Invalid move. Try again.\n")
      }
    }
    
    # Add token to the board
    for (row in rows:1) {
      if (board[row, col] == " ") {
        board[row, col] <- player
        break
      }
    }
    
    # Check if the player (X,O) has won
    if (check_win(board, player, row, col)) {
      print_board(board)
      cat("Player", player, "wins!\n")
      break
    }
    
    # Check for a draw
    if (" " %in% board) {
      player <- ifelse(player == "X", "O", "X")
    } else {
      print_board(board)
      cat("It's a draw!\n")
      break
    }
  }
}

#################
# Start the game
#################

play_game()
