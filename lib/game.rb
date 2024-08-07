#pseudo-code
#start the game by initiating a game class
#create a board class which has 7 columns and 6 rows
#create player 1 and player 2
#How to keep track of the slots...
#How to check for wins...
#  -store and continuously update horizontal and vertical arrays
#  -check for horizontal arrays (6)
#  -check for vertical with arrays (7)
#  -could also store info in diagonal arrays (12 diagonal arrays with possible connect 4s)
require_relative 'player'
require_relative 'board'
class Game
  attr_accessor :over, :player1, :player2
  def initialize
    @over = false
    @player1 = nil
    @player2 = nil
    @board = nil
  end
  def over?
    @over
  end
  def end_game
    @over = true
  end
  def begin_game
    puts "Welcome to Connect Four"
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @board = Board.new
  end
  def game_loop
    begin_game
    until over?
      puts 'hi'
      end_game
    end
  end
end

new_game = Game.new
new_game.game_loop
