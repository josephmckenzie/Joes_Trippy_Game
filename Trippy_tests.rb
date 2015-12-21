require_relative "start_messages"

require "minitest/autorun"

class Tictactoe_tests < Minitest::Test

	def test_for_start_messages
	message = Start_messages.new
	
	assert_equal("Welcome to Joe's Games.", message.welcome)
	assert_equal("Enter your name & age to start.",message.name_age)
	assert_equal("So you wanna play Jade's Safari Adventure game?",message.to_start_jade)
	assert_equal("If you want to play Joe's Trippy Adventure Game",message.to_start_joe)
	
	
	
	
	
	
	
	end
	
end

