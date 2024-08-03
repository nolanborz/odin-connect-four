require_relative '../lib/board'

describe Board do
  it "creates a new instance of board" do
    expect(Board.new).to be_a(Board)
  end
  describe '#initialize' do
    board = Board.new
    it "initializes a board with empty row arrays" do
      expect(board.rows_arr.length).to eq(6)
    end
    it "has all empty values filling the array" do
      expect(board.rows_arr[3].nil?).to be true
    end
    it "initializes column arr with empty values" do
      expect(board.columns_arr[2].nil?).to be true
    end
  end

      

end