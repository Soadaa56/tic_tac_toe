# tic_tac_toe.rb
require 'pry-byebug'

class TicTacToe
  attr_reader :game_board

  @@lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  @@player_one_picks = []
  @@player_two_picks = []
  @@turn_timer = 1
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

  def set_player_names
    puts 'Input player 1 name:'
    player1 = gets.chomp
    puts 'Input player 2 name:'
    player2 = gets.chomp
  end
  
  def player_one_turn
    "#{player1}, input the numbered square you wish to place an X."
    input = gets.chomp
    input_checker(input)
  end

  def player_two_turn
    "#{player2}, input the numbered square you wish to place an O."
    input = gets.chomp
    input_checker(input)
  end

  def redo_turn
    if @@turn_timer.odd?
      player_one_turn
    else
      player_two_turn
    end
  end

  def next_turn
    @@turn_timer += 1
    if @@turn_timer.odd?
      player_one_turn
    else
      player_two_turn
    end
  end

  def input_checker(input)
   if input != Integer
    puts 'This is not a valid input, please try again'
    redo_turn
   elsif input < 0 || input > 9
    puts 'This is not a valid number, please pick between 0-9.'
    redo_turn
   else
    square_checker(input)
   end
  end

  def square_checker(input)
    if @@player_one_picks.include?(input) || @@player_two_picks.include?(input)
      puts 'This spot is already taken'
      redo_turn      
    else
      
    end
  end

  public

  def start_game
    set_player_names
    puts @@game_board
    player_one_turn
  end

end

game = TicTacToe.new
game.start_game
