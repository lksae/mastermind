# frozen_string_literal: true

require_relative 'computer_player'
require_relative 'board'

# Game class
class Game
  def initialize
    @turns = 0
    @computer_player = ComputerPlayer.new(self)
    @colors = %w[red green yellow blue]
    @number_of_pegs = 4
  end

  def play
    provide_order_to_board
  end

  def receive_random_order_from_computer
    @computer_player.provide_random_order(@number_of_pegs, @colors)
  end

  def provide_order_to_board
    @board = Board.new(receive_random_order_from_computer)
    @board.show_random_order
  end
end
