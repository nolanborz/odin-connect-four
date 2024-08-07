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
      allow(player).to receive(:gets).and_return("-1\n", "7\n", "3\n")
      
      expect do
        player.input
      end.to output(expected_output).to_stdout

      expect(player.input).to eq(3)
    end
  end
end

def expected_output
  first_prompt = "test_player's turn, enter a number from 0-6: "
  invalid_message = "Invalid input. Please enter a number between 0 and 6.\n"

  output = ""
  output << first_prompt << "Debug: Received input '-1'\n" << invalid_message
  output << first_prompt << "Debug: Received input '7'\n" << invalid_message
  output << first_prompt << "Debug: Received input '3'\n"
  output
end
