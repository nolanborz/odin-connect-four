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
    @player1 = Player.new("Player 1", "O")
    @player2 = Player.new("Player 2", "X")
    @board = Board.new
  end
  def game_loop
    begin_game
    current_player = @player1
    loop do
      @board.draw_board
      puts "#{current_player.name}'s turn (#{current_player.piece})"
      column = current_player.input
  
      if @board.valid_move?(column)
        row = @board.place_piece(column, current_player.piece)
        
        if check_win(column, row)
          @board.draw_board
          puts "#{current_player.name} wins!"
          break
        elsif board_full?
          @board.draw_board
          puts "It's a draw!"
          break
        end
  
        current_player = (current_player == @player1) ? @player2 : @player1
      else
        puts "Invalid move. Try again."
      end
    end
    end_game
  end

  def board_full?
    @board.board.all? { |column| column.all? }
  end

  def check_win(column, row)
    piece = @board.get_piece(column, row)
    
    puts "Checking win for piece #{piece.inspect} at column #{column}, row #{row}"
  
    # Check horizontal
    return true if check_horizontal(row, piece)
    
    # Check vertical
    return true if check_vertical(column, piece)
    
    # Check diagonal (/)
    return true if check_diagonal_forward(column, row, piece)
    
    # Check diagonal (\)
    return true if check_diagonal_backward(column, row, piece)
  
    false
  end
  
  def check_horizontal(row, piece)
    count = 0
    (0..6).each do |col|
      if @board.get_piece(col, row) == piece
        count += 1
        return true if count >= 4
      else
        count = 0
      end
    end
    false
  end
  
  def check_vertical(column, piece)
    count = 0
    (0..5).each do |row|
      if @board.get_piece(column, row) == piece
        count += 1
        return true if count >= 4
      else
        count = 0
      end
    end
    false
  end
  
  def check_diagonal_forward(column, row, piece)
    count = 0
    (-3..3).each do |i|
      r = row - i
      c = column + i
      if r.between?(0, 5) && c.between?(0, 6)
        if @board.get_piece(c, r) == piece
          count += 1
          return true if count >= 4
        else
          count = 0
        end
      end
    end
    false
  end
  
  def check_diagonal_backward(column, row, piece)
    count = 0
    (-3..3).each do |i|
      r = row + i
      c = column + i
      if r.between?(0, 5) && c.between?(0, 6)
        if @board.get_piece(c, r) == piece
          count += 1
          return true if count >= 4
        else
          count = 0
        end
      end
    end
    false
  end
  
  def check_direction(row, col, row_dir, col_dir, piece)
    count = 0
    (-3..3).each do |i|
      r = row + i * row_dir
      c = col + i * col_dir
      if r.between?(0, 5) && c.between?(0, 6)
        current_piece = @board.get_piece(c, r)
        puts "Checking position (#{c}, #{r}): #{current_piece.inspect}"
        if current_piece == piece
          count += 1
          puts "Match found. Count: #{count}"
          return true if count >= 4
        else
          count = 0
        end
      else
        break  # Stop checking if we're out of bounds
      end
    end
    false
  end
end
new_game = Game.new
new_game.game_loop
