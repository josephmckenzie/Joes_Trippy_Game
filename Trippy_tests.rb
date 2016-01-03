require_relative "start_messages"
require_relative 'trippy_methods.rb'
require "minitest/autorun"

class Tictactoe_tests < Minitest::Test

	def test_for_start_messages
	message = Start_messages.new
	
	assert_equal("Welcome to Joe's Games.", message.welcome)
	assert_equal("Enter your name & age to start.",message.name_age)
	assert_equal("So you wanna play Jade's Safari Adventure game?",message.to_start_jade)
	assert_equal("If you want to play Joe's Trippy Adventure Game",message.to_start_joe)
	end
	
	def test_for_start_with_amount
		trippy = Trippy_methods.new
		
		assert_equal(0,trippy.start_with_amount(0))
		assert_equal(1,trippy.start_with_amount(1))
		assert_equal(2,trippy.start_with_amount(2))
		assert_equal(1,trippy.start_with_amount(3))
		assert_equal(1,trippy.start_with_amount(5))
	
	end

	# def test_start_amount
# trippy = Trippy_methods.new
		# @acid_amount = 2
		# assert_equal("You Started off with taking #{@acid_amount} hits of acid....Enjoy",trippy.start_acid_amount)
	# end
	
	def test_for_greedy
		trippy = Trippy_methods.new
		assert_equal(nil,trippy.greedy_ass(0))
		assert_equal(nil,trippy.greedy_ass(1))
		assert_equal(nil,trippy.greedy_ass(2))
		assert_equal(["Damn man don't be greedy...Ill give you 1 hit for now.", "Don't Worry you will get more as time progresses"].join("<br>"),trippy.greedy_ass(3))
		assert_equal(["Damn man don't be greedy...Ill give you 1 hit for now.", "Don't Worry you will get more as time progresses"].join("<br>"),trippy.greedy_ass(4))
			
	end
	
	
	def test_here_you_go
		trippy= Trippy_methods.new
		name = "Joe"
		assert_equal("Here you go #{name} enjoy", trippy.here_you_go(name))
	end
	
	def test_for_increase_high
	
	
	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
end



	# def start_with_amount(hits)
	
	# @acid_amount = 0
		# if hits <= 2
			# @acid_amount += hits
		# else @acid_amount += 1 
		# end
	# end