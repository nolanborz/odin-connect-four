require_relative '../lib/game'

describe Game do
  it "creates a new instance of game" do
    expect(Game.new).to be_a(Game)
  end
  describe "#initialize" do
    it "initializes game object and sets 'over?' to false" do
      game = Game.new
      expect(game.over?).to be false
    end
  end
  describe "#game_loop" do
    it "calls end_game and sets over to true" do
      game = Game.new
      expect(game.over?).to be false
      game.game_loop
      expect(game.over?).to be true
    end
  end
end

  