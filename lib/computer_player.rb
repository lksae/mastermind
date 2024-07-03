# frozen_string_literal: true

require_relative 'player'

# ComputerPlayer class
class ComputerPlayer < Player
  def provide_random_order(number_of_pegs, colors)
    random_order = []
    random_order.push(colors.sample) while number_of_pegs > random_order.length
    random_order
  end
end
