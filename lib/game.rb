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
    @game_won = false
    @computer_mode = true
  end

  def play
    puts '------------------------------------'
    puts 'Welcome to a new round of Mastermind'
    ask_user_who_will_create_code
    process_user_as_guesser if @computer_mode
    process_computer_as_guesser unless @computer_mode
  end

  def receive_user_code
    @human_player.receive_user_code
  end

  def play_round
    @turns += 1
    process_user_input if @computer_mode
    process_computer_input unless @computer_mode
  end

  def receive_random_order_from_computer
    @computer_player.provide_random_order(@number_of_pegs, @colors)
  end

  def provide_order_to_board(order)
    @board = Board.new(order)
  end

  def process_user_input
    @human_player.ask_user_for_choice
    evaluation_of_pegs = @board.compare_random_order_with_choice(@human_player.receive_user_choice)
    p evaluation_of_pegs
    return unless evaluation_of_pegs == %w[red red red red]

    display_winner_message
  end

  def display_winner_message
    @game_won = true
    p 'Congrats, you are a real mastermind!'
    p "You needed #{@turns} turns."
  end

  def display_loser_message
    puts "You didn't crack the code this time. Try again. The code was:"
    p @board.random_order
  end

  def ask_user_who_will_create_code
    puts 'Should the computer create the secret code?'
    puts 'Please enter "Yes" or "No"'
    decision = gets.chomp
    @computer_mode = false if decision == 'No'
  end

  def process_user_as_guesser
    provide_order_to_board(receive_random_order_from_computer)
    play_round while @turns < 12 && !@game_won
    return unless @turns == 12

    display_loser_message
  end

  def process_computer_as_guesser
    @computer_guesses = %w[incorrect incorrect incorrect incorrect]
    provide_order_to_board(receive_user_code)
    play_round while @turns < 12 && !@game_won
    return unless @turns == 12

    display_computer_loser_message
  end

  def display_computer_loser_message
    puts 'Congratulations! You are smarter than a computer!'
  end

  def process_computer_input
    computer_choice = @computer_player.select_colors_randomly(@computer_guesses, @colors)
    @computer_guesses = @board.check_computer_input(computer_choice)
    p @computer_guesses

    @game_won = true if @computer_guesses == @board.random_order
    return unless @computer_guesses == @board.random_order

    puts "Sadly, the computer is more intelligent than you.
    He needed only #{@turns} turns to crack your code.
    You moron!"
  end
end
