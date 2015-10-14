require_relative "sound_functions.rb"
game_sounds

#I want some kind of Psychedelic music playing in Background on a lower setting nothing to intrusive though 

def
 player_name
	puts "Hey man whats your name?"
	@your_name = $stdin.gets.chomp.upcase
	play_game
end


def play_game
	# knock_at_door
	# anyone_home
	prompt = ">"
	puts "\n#{@your_name} is sitting around at home watching some TV and smoking on a bong when someone knocks at the door
Do you get up and answer it?"
# cough_3x
	print prompt
	while @answer_door = gets.chomp.upcase
	case @answer_door
	when /Y/
		answer_door_man
		break
	when "N"
		answer_door_man
		break
	# error 
	else puts "\nChoose again #{@your_name} What are you high?"
	print prompt

	end
end
end



def answer_door_man
	door = rand(2).floor
	if @answer_door.include?('Y') && door == 0
	# door_open
		puts "\n #{@your_name} answers the door and its your good buddy Dave. Dave asks you if you wanna go out and get 
a few drinks and maybe do a lil something special ..."
	chill_with_dave
	elsif @answer_door.include?('Y') && door == 1
	# police_siren
		puts "\n Oh no its the cops and they see the bong that you left out in the open and take you to jail... Damn"
	# gameover
		puts ("\nWell that sucks.... Lets Play again.")
			player_name
	elsif @answer_door.include?('N') and door == 0
	# door_open
		puts"\n You don't bother getting up to answer the door #{@your_name} but that don't matter because in walk Dave says WTF 
why didn't you answer dick? \nI knew you were in here....Well you wanna go get some drinks and I got a lil something special for us too man ."
		chill_with_dave
	elsif @answer_door.include?('N') and door == 1
	# knock_at_door
	# snoring
		puts "\n #{@your_name} doesn't answer the door even though they knocked again and just smokes out and falls asleep watching TV. 
Since #{@your_name} fell asleep and missed all the fun The game is over Lets try again and maybe you can get farther...."
	# gameover
	player_name	
	# error
  else puts "Come on #{@your_name} pay attention Choose again "
	answer_door_man
  end
end


def chill_with_dave
	puts "#{@your_name} tells Dave Uh Hell yeah I do....You even gotta ask? I'm always down for whatever. 
Do you Leave right away or smoke some bud first?"
	leavenow = $stdin.gets.chomp.upcase 
		if leavenow =~ /[[:digit:]]/ || leavenow !~ /[[:alpha:]]/
	# need_input
			puts "Hey man #{@your_name} you typed a number or a blank... Try again Put the blunt down for a second if you have to."
			chill_with_dave
		elsif leavenow.include?('L')
			puts "#{@your_name} rolls up a fat blunt and start out for the club."
			go_to_club 
		elsif leavenow.include?('S') 
		puts "#{@your_name} asks Dave if he wants to smoke a blunt, to which he replies Uhm yeah....Does a bear shit in the woods?
You guys blaze one up and are chillin when ...... Dave tells you to close your eyes and stick out your tongue.
Do you ?"
	tongue
	# error
		else puts "!!! Hey this is getting annoying #{@your_name} How about You learn how to type. Leave or Stay? !!!"
			chill_with_dave
		end
end


def tongue 
tongue = $stdin.gets.chomp.upcase
	if tongue =~ /[[:digit:]]/ || tongue !~ /[[:alpha:]]/
	# need_input
		puts "You must have mistyped something #{@your_name} because thats not a valid choice"
	elsif tongue.include?('Y')
		puts "#{@your_name} sticks out thier tongue and upon it Dave places something what you are not quite sure.... You ask Dave what it is and he says OH you will 
find out soon enough."
	elsif tongue.include?('N')
	# what_is_it?
		puts "Uh no Why? You ask him and he says Just do it man if you gotta ask me #{player_name} then u don't want it... 
Will you do it?"
			tongue2
	# error
	else puts "You must've mistyped something #{@your_name} because thats not a valid choice... Lets try again."	
	tongue
	end
end


def tongue2
tongue2 = $stdin.gets.chomp.upcase 
	if tongue2 =~ /[[:digit]]/ || tongue2 !~ /[[:alpha:]]/
		puts "Uh hey #{player_name} you are a stoner pick again. That was not a valid choice man. Try using either Yes or No. "
	# need_input
	elsif tongue2.include?("Y")
			puts"#{@your_name} sticks out thier tongue and on it Dave puts a cpl drops of a strange liquid on it....
You look at Dave...Dave Just smiles and laughs ......."
	#strange laugh
	elsif tongue2.include?("N") 
			puts"You tell dave not yet man. I know it gotta be something good but I still dont know if im trying to anything tonight.
Dave Says Whatever man your loss...../n You guys smoke a little bud and Head out for the club"
		go_to_club
		
	# error		
	else puts "Hey that wasn't a valid choice man Pick again Either Yes or No is what We are looking for."
		tongue2
end
end


def go_to_club
	puts "#{@your_name} & Dave arrives at the club and sit down at the bar. Dave orders you guys some drinks.....
/nYou guys get your Dave askes you to stick out your tongue..... Do you?"
		tongue
	
	puts "Do you hang out at the club or go for a walk?"
start_to_trip_choice1 = $stdin.gets.chomp.upcase
	if start_to_trip_choice1 =~ /[[:digit:]]/ || start_to_trip_choice1 !~ /[[:alpha:]]/
	# need_input
		puts "That was either a number or a nothing either way man,  how about HANGING out or go for a WALK."
		go_to_club
	elsif start_to_trip_choice1.include? ('H') or start_to_trip_choice1.include?('S')
		puts "You decide to just chill out at the club for a while enjoy your buzz, and have a few drinks. 
/nYou start jamming out to some good music on the jukebox.....
/nYou guys have a cpl Jagerbombs when you start to feel whatever Dave gave you start to kick in....."
		start_to_trip_at_club
	elsif start_to_trip_choice1.include? ('G') or start_to_trip_choice1.include?('W')
	    puts "You and Dave decide to leave and go for a walk through the woods"
	# error
	else puts "Uhm Wow you GOTTA be high That wasn't a correct choice. Try again man!!! 
HANG out or Go for a WALK, either one of them choices will work."

end
end


def start_to_trip_at_home
puts ""

end


def start_to_trip_at_club
puts "You "


end