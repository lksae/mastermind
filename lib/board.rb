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
end
