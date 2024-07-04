# frozen_string_literal: true

# Board class
class Board
  attr_accessor :random_order

  def initialize(random_order)
    self.random_order = random_order # ['red', 'green', 'yellow', 'yellow'] # 
  end

  def show_random_order
    p random_order
  end

  def compare_random_order_with_choice(choice)
    # show_random_order
    red_pegs = check_for_red_pegs(choice)[0]
    white_pegs = check_for_white_pegs(check_for_red_pegs(choice)[2], check_for_red_pegs(choice)[1])
    red_pegs + white_pegs
  end

  def check_for_red_pegs(choice)
    red_pegs = []
    leftover_random = []
    leftover_choices = []
    choice.split(' ').each_with_index do |color, index|
      if color == random_order[index]
        red_pegs.push('red')
      else
        leftover_random.push(random_order[index])
        leftover_choices.push(color)
      end
    end
    [red_pegs, leftover_random, leftover_choices]
  end

  def check_for_white_pegs(choice, leftover_random)
    white_pegs = []
    leftover_random.each do |color|
      white_pegs.push('white') if choice.include?(color)
    end
    white_pegs
  end

  def check_computer_input(computer_choice)
    processed_computer_choices = []
    computer_choice.each_with_index do |color, index|
      if color == random_order[index]
        processed_computer_choices.push(color)
      else
        processed_computer_choices.push('incorrect')
      end
    end
    processed_computer_choices
  end
end
