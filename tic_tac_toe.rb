# tic_tac_toe.rb
require 'pry-byebug'

class TicTacToe

  lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

  game_board = '
     |     |     
 1   |  2  |  3  
_____|_____|_____
     |     |     
 4   |  5  |  6  
_____|_____|_____
     |     |     
 7   |  8  |  9  
     |     |     
  '
  puts "Input player 1 name:"
  player1 = gets.chomp
  puts "Input player 2 name:"
  player2 = gets.chomp
  puts "\n"

  puts "#{player1} input the numbered square you would wish to place an x"

end

class Player
end

class HumanPlayer < Player
end