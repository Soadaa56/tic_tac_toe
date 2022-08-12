# tic_tac_toe.rb
require 'pry-byebug'

class TicTacToe
  attr_reader :game_board, :game_board_start, :score

  @player1 = ''
  @player2 = ''
  @@lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  @@player_one_picks = []
  @@player_two_picks = []
  @@turn_timer = 1
  @@game_board_start = '
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
  @@game_board = @@game_board_start

  private 

  def set_player_names
    puts 'Input player 1 name:'
    @player1 = gets.chomp
    puts 'Input player 2 name:'
    @player2 = gets.chomp
  end
  
  def player_one_turn
    puts "#{@player1}, input the numbered square you wish to place an X."
    input = gets.chomp.to_i
    input_checker(input)
  end

  def player_two_turn
    puts "#{@player2}, input the numbered square you wish to place an O."
    input = gets.chomp.to_i
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
    begin
      if input <= 0 || input >= 10
        puts "#{input} is not a valid number, please pick between 1-9."
        redo_turn
      else
        square_checker(input)
      end
    rescue => exception
      puts exception
      puts "#{input} is not a valid input, please try again."
      redo_turn
    end
  end

  def square_checker(input)
    if @@player_one_picks.include?(input) || @@player_two_picks.include?(input)
      puts "Spot #{input} is already taken."
      redo_turn      
    elsif @@turn_timer.odd?
      @@player_one_picks.push(input)
      change_game_board_by_input(input)
    else
      @@player_two_picks.push(input)
      change_game_board_by_input(input)
    end
  end

  def change_game_board_by_input(input)
    if @@turn_timer.odd?
      @@game_board = @@game_board.sub(input.to_s, "X")
      puts @@game_board
    else
      @@game_board = @@game_board.sub(input.to_s, "O")
      puts @@game_board
    end
    check_for_game_over
  end

# #any? will not match if numbers are out of order, redo!
  def check_for_game_over
   if @@lines.any? { |line| line == @@player_one_picks }
    victory_player1
   elsif @@lines.any? { |line| line == @@player_two_picks }
    victory_player2
   elsif @@game_board.match?(/([1-9])/)
    next_turn
   else
    tied_game
   end
  end

  def victory_player1
    puts "Congratulations #{@player1}, you win!"
  end

  def victory_player2
    puts "Congratulations #{@player2}, you win!"
  end

  def tied_game
    puts "Dang, there was a tie!"
  end

  public

  def start_game
    set_player_names
    @@score['ties'] = 0
    puts @@game_board_start
    player_one_turn
  end

end

game = TicTacToe.new
game.start_game
game.score

