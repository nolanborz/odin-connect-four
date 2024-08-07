require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }

  it "creates a new instance of board" do
    expect(board).to be_a(Board)
  end

  describe '#initialize' do
    it "initializes a board with 7 columns" do
      expect(board.board.length).to eq(7)
    end

    it "initializes each column with 6 rows" do
      expect(board.board.all? { |column| column.length == 6 }).to be true
    end

    it "has all empty values filling the board" do
      expect(board.board.all? { |column| column.all?(&:nil?) }).to be true
    end
  end

  describe '#place_piece' do
    it "places a piece in the first empty row of a column" do
      board.place_piece(0, :red)
      expect(board.get_piece(0, 5)).to eq(:red)
    end

    it "stacks pieces in a column" do
      board.place_piece(0, :red)
      board.place_piece(0, :black)
      expect(board.get_piece(0, 5)).to eq(:red)
      expect(board.get_piece(0, 4)).to eq(:black)
    end
  end

  describe '#column_full?' do
    it "returns false for an empty column" do
      expect(board.column_full?(0)).to be false
    end

    it "returns true for a full column" do
      6.times { board.place_piece(0, :red) }
      expect(board.column_full?(0)).to be true
    end
  end

  describe '#first_empty_row' do
    it "returns 5 for an empty column" do
      expect(board.first_empty_row(0)).to eq(5)
    end

    it "returns correct row after some pieces are placed" do
      2.times { board.place_piece(0, :red) }
      expect(board.first_empty_row(0)).to eq(3)
    end

    it "returns nil for a full column" do
      6.times { board.place_piece(0, :red) }
      expect(board.first_empty_row(0)).to be_nil
    end
  end
end