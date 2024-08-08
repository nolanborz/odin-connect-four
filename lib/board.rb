class Board 
  attr_accessor :board

  def initialize
    @board = Array.new(7) { Array.new(6) }
  end

  def get_piece(column, row)
    piece = @board[column][row]
    #puts "Getting piece at column #{column}, row #{row}: #{piece.inspect}"
    piece
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

  def draw_board
    puts "\nCurrent board:"
    (5.downto(0)).each do |row|
      line = (0..6).map do |col|
        piece = get_piece(col, row)
        piece.nil? ? "." : piece
      end.join(" ")
      puts line
    end
    puts (0..6).to_a.join(" ")
    puts
  end

  def place_piece(column, piece)
    row = first_empty_row(column)
    if row
      @board[column][row] = piece
      puts "Placed #{piece} at column #{column}, row #{row}"
      row
    else
      puts "Column #{column} is full"
      nil
    end
  end
end