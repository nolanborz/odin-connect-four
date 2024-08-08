class Player
  attr_accessor :name, :piece
  def initialize(name, piece)
    @name = name
    @piece = piece
  end
  def input
    loop do
      print "#{@name}'s turn, enter a number from 0-6: "
      placement = gets.chomp
      puts "Debug: Received input '#{placement}'"  # Debug output
      placement = placement.to_i
      return placement if (0..6).include?(placement)
      puts "Invalid input. Please enter a number between 0 and 6."
    end
  end
end