require_relative '../lib/player'
describe Player do
  describe "#initialize" do
    it "initializes player object and class with name" do
      player = Player.new('rob')
      expect(player.name).to eq('rob')
    end
  end
end