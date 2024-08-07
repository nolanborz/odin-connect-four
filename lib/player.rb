require_relative '../lib/board'
class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def input
    loop do
      print "#{@name}'s turn, enter a number from 1-6: "
      placement = gets.chomp.to_i
      return placement if (1..6).include?(placement)
      puts "Invalid input. Please enter a number between 1 and 6."
    end
  end
end