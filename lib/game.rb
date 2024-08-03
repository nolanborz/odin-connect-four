#pseudo-code
#start the game by initiating a game class
#create a board class which has 7 columns and 6 rows
#create player 1 and player 2
#How to keep track of the slots...
#How to check for wins...
#  -store and continuously update horizontal and vertical arrays
#  -check for horizontal arrays (6)
#  -check for vertical with arrays (7)
#  -could also store info in diagonal arrays (12 total)

class Game
  attr_accessor :over
  def initialize
    @over = false
  end
  def over?
    @over
  end
  def end_game
    @over = true
  end
  
  
end
