# frozen_string_literal: true

require_relative 'computer_player'
require_relative 'human_player'
require_relative 'board'

# Game class
class Game
  def initialize
    @turns = 0
    @computer_player = ComputerPlayer.new(self)
    @human_player = HumanPlayer.new(self)
    @colors = %w[red green yellow blue]
    @number_of_pegs = 4
  end

  def play
    provide_order_to_board
    process_user_input
  end

  def receive_random_order_from_computer
    @computer_player.provide_random_order(@number_of_pegs, @colors)
  end

  def provide_order_to_board
    @board = Board.new(receive_random_order_from_computer)
  end

  def process_user_input
    @human_player.ask_user_for_choice
    @board.compare_random_order_with_choice(@human_player.receive_user_choice)
  end
end
