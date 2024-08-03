require_relative '../lib/game'

describe Game do
  it "creates a new instance of game" do
    expect(Game.new).to be_a(Game)
  end
end

  