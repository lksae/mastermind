# frozen_string_literal: true

# Board class
class Board
  attr_accessor :random_order

  def initialize(random_order)
    self.random_order = random_order
  end

  def show_random_order
    p random_order
  end

  def compare_random_order_with_choice(choice)
    correct_pegs = []
    show_random_order
    p correct_pegs
  end

  def check_for_red_pegs(choice)
    red_pegs = []
    lefover_random = []
    choice.split(' ').each_with_index do |color, index|
      if color == random_order[index]
        red_pegs.push('red')
      else
        lefover_random.push(random_order[index])
      end
    end
  end

  def check_for_white_pegs(choice)
    white_pegs = []
    choice.split(' ').each do |color|
      white_pegs.push('white') if lefover_random.include?(color)
    end
  end

end
