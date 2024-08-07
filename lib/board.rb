class Board 
  attr_accessor :board

  def initialize
    @board = Array.new(7) { Array.new(6) }
  end

  def place_piece(column, piece)
    row = first_empty_row(column)
    @board[column][row] = piece if row
  end

  def get_piece(column, row)
    @board[column][row]
  end

  def column_full?(column)
    @board[column].all?
  end

  def first_empty_row(column)
    @board[column].rindex(nil)
  end

  def valid_move?(column)
    column.between?(0, 6) && !column_full?(column)
  end
end