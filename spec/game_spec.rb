# game_spec.rb
require_relative '../lib/game'

RSpec.describe Game do
  let(:game) { Game.new }

  describe '#check_horizontal' do
    before do
      game.begin_game
    end

    it 'detects a horizontal win' do
      # Simulate a horizontal win
      4.times { |i| game.instance_variable_get(:@board).place_piece(i, 'O') }

      expect(game.check_horizontal(0, 'O')).to be true
    end

    it 'does not detect a win with less than 4 in a row' do
      # Place 3 pieces in a row
      3.times { |i| game.instance_variable_get(:@board).place_piece(i, 'O') }

      expect(game.check_horizontal(0, 'O')).to be false
    end

    it 'does not detect a win with 4 non-consecutive pieces' do
      # Place 4 non-consecutive pieces
      [0, 1, 3, 5].each { |i| game.instance_variable_get(:@board).place_piece(i, 'O') }

      expect(game.check_horizontal(0, 'O')).to be false
    end

    it 'detects a win in the middle of the row' do
      # Place a winning combination in the middle
      [2, 3, 4, 5].each { |i| game.instance_variable_get(:@board).place_piece(i, 'X') }

      expect(game.check_horizontal(0, 'X')).to be true
    end
  end
end

  