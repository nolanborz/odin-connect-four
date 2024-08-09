require_relative '../lib/player'

describe Player do
  describe "#initialize" do
    it "initializes player object and class with name and sym" do
      player = Player.new('player', 'O')
      expect(player.name).to eq('player')
      expect(player.piece).to eq('O')
    end
  end
end

  


