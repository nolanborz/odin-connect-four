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
  describe "#end_game" do
    it "turns @over to true when end game is called" do
      game = Game.new
      game.end_game
      expect(game.over?).to be true
      
    end
  end
end

  