# frozen_string_literal: true

require_relative 'player'

# HumanPlayer class
class HumanPlayer < Player
  def ask_user_for_choice
    p 'Which colors do you choose in ascending order?'
  end

  def receive_user_choice
    gets.chomp
  end

  def receive_user_code
    puts 'Please provide your code: '
    gets.chomp.split(' ')
  end
end
