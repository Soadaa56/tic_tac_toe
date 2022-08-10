# tic_tac_toe.rb
require 'pry-byebug'

class TicTacToe

  @@lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

  @@game_board = '
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

  private 

  def get_player_names
    puts "Input player 1 name:"
    player1 = gets.chomp
    puts "Input player 2 name:"
    player2 = gets.chomp
  end
  

  # puts "#{player1} input the numbered square you would wish to place an x"
  public

  def start_game
    get_player_names
    show_game_board
  end

  def show_game_board
    puts @@game_board
  end
end

game = TicTacToe.new
game.start_game
