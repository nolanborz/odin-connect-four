require_relative '../lib/player'
describe Player do
  describe "#initialize" do
    it "initializes player object and class with name" do
      player = Player.new('player')
      expect(player.name).to eq('player')
    end
  end
  describe "#input" do
    let(:player) { Player.new('test_player') }
    it "accepts valid input" do
      allow(player).to receive(:gets).and_return("3\n")
      expect(player.input).to eq(3)
    end
    it "rejects invalid input and then accepts valid input" do
      allow(player).to receive(:gets).and_return("invalid\n", "0\n", "7\n", "4\n")
      expect(player).to receive(:puts).with("Invalid input. Please enter a number between 1 and 6.").exactly(3).times
      expect(player.input).to eq(4)
    end
  end
end