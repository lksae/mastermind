# frozen_string_literal: true

require_relative 'player'

# ComputerPlayer class
class ComputerPlayer < Player
  def provide_random_order(number_of_pegs, colors)
    random_order = []
    random_order.push(colors.sample) while number_of_pegs > random_order.length
    random_order
  end

  def select_colors_randomly(guessed_colors, colors_to_choose_from)
    guessed_colors.each_with_index do |status, index|
      guessed_colors[index] = colors_to_choose_from.sample if status == 'incorrect'
    end
    guessed_colors
  end
end
