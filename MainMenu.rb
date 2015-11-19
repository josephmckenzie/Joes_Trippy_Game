#Game Menu 
require_relative 'trippy_game_functions'


def gamestarts
puts "Welcome to Joe's Games. Please enter your age:"

age = gets.chomp.to_i

adult = 17

if age > adult
	puts "Ok you are old enough to play Joe's Trippy Adventure Game. Do you want to play ?"
		player_name
else	puts "You are not old enough to play my adult game. How about playing a nice adventure game involving rescuing endangered leopards?"

end

end

gamestarts