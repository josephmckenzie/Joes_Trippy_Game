require_relative "sound_functions.rb"
game_sounds

#I want some kind of Psychedelic music playing in Background on a lower setting nothing to intrusive though 

def player_name
	puts "Hey man whats your name?"
	@your_name = $stdin.gets.chomp.upcase
	play_game
end

def play_game
	# knock_at_door
	# anyone_home
	puts "\nHey #{@your_name} You are sitting around at home watching some TV and smoking on a bong when someone knocks at the door
Do you get up to answer it?"
# cough_3x
	@answer_door = $stdin.gets.chomp.upcase
	if @answer_door =~ /[[:digit:]]/ || @answer_door !~ /[[:alpha:]]/ 
	# need_input
		puts "\nThat was a number or a blank how about using a letter. Choose again. "
	play_game
	elsif @answer_door.include? ("Y")
		answer_door_man
	elsif @answer_door.include? ("N")
		answer_door_man
	# error 
	else puts "Choose again What are you high?"
	play_game
	
	end
end

def answer_door_man
	door = rand(2).floor
	if @answer_door.include?('Y') && door == 0
	# door_open
		puts "\n You answer the door and its your good buddy Dave. Dave asks you if you wanna go out and get 
a few drinks and maybe do a lil something special ..."
			chill_with_dave
	elsif @answer_door.include?('Y') and door == 1
	# police_siren
		puts "\n Oh no its the cops and they see the bong that you left out in the open and take you to jail... Damn"
	# gameover
		puts ("\nWell that sucks.... Lets Play again.")
			player_name
	elsif @answer_door.include?('N') and door == 0
	# door_open
		puts"\n You don't bother getting up to answer the door but that don't matter because in walk Dave says WTF 
why didn't you answer dick? I knew you were in here....Well you wanna go get some drinks and I got a lil something special for us too man ."
		chill_with_dave
	elsif @answer_door.include?('N') and door == 1
	# knock_at_door
	# snoring
		puts "\n You don't answer the door even though they knocked again and just smoke out and fall asleep watching TV. 
Since you fell asleep and missed all the fun The game is over Lets try again and maybe you can get farther...."
	# gameover
	player_name	
	# error
  else puts "Come on man pay attention Choose again "
	answer_door_man
  end
end

def chill_with_dave
	puts "You tell Dave Uh Hell yeah I do....You even gotta ask? I'm always down for whatever. 
		Do you Leave right away or smoke some bud first?"
	leavenow = $stdin.gets.chomp.upcase 
		if leavenow =~ /[[:digit:]]/ || leavenow !~ /[[:alpha:]]/
	# need_input
			puts "Hey man you typed a number or a blank... Try again Put the blunt down for a second if you have to."
			chill_with_dave
		elsif leavenow.include?('L')
			puts "You roll up a fat blunt and start out for the club."
			go_to_club 
		elsif leavenow.include?('S') 
		puts "You ask Dave if he wants to smoke a blunt, to which he replies Uhm yeah....Does a bear shit in the woods?
You guys blaze one up and are chillin when ...... Dave tells you to close your eyes and stick out your tongue.
Do you ?"
	tongue
	# error
		else puts "!!! Hey this is getting annoying How about You learn how to type. Leave or Stay? !!!"
			chill_with_dave
		end
end

def tongue 
tongue = $stdin.gets.chomp.upcase
	if tongue =~ /[[:digit:]]/ || tongue !~ /[[:alpha:]]/
	# need_input
		puts "You must have mistyped something because thats not a valid choice"
	elsif tongue.include?('Y')
		puts "You stick out your tongue and upon it Dave places something what you are not quite sure.... You ask Dave and says OH you will 
find out soon enough."
	elsif tongue.include?('N')
	# what_is_it?
		puts "Uh no Why? You ask him and he says Just do it man if you gotta ask then u don't want it... Will you do it?"
			tongue2
	# error
	else puts "You must've mistyped something because thats not a valid choice... Lets try again."	
	stay_home_at_first
	end
end



def tongue2
tongue2 = $stdin.gets.chomp.upcase 
	if tongue2 =~ /[[:digit]]/ || tongue2 !~ /[[:alpha:]]/
		puts "Uh hey stoner pick again as that was not a valid choice man. Try using either Yes or No. "
	# need_input
	elsif tongue2.include?("Y")
			puts"You stick out your tongue and Dave puts a cpl drops of a strange liquid on it......Dave Just smiles ......."
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
	puts "You arrive at the club and sit down at the bar & you and Dave order some drinks....Dave askes you to stick out your tongue..... Do you?"
		tongue
	
	puts "Do you hang out at the club or go for a walk?"
start_to_trip_choice1 = $stdin.gets.chomp.upcase
	if start_to_trip_choice1 =~ /[[:digit:]]/ || start_to_trip_choice1 !~ /[[:alpha:]]/
	# need_input
		puts "That was either a number or a nothing either way man,  how about HANGING out or go for a WALK."
		go_to_club
	elsif start_to_trip_choice1.include? ('H') or start_to_trip_choice1.include?('S')
		puts "You decide to just chill for a while enjoy your buzz and have a few more drinks.You start jamming out to some good 
music on the jukebox.....You guys have "
	elsif start_to_trip_choice1.include? ('G') or start_to_trip_choice1.include?('W')
	    puts "You and Dave decide to leave and go for a walk through the woods"
	# error
	else puts "Uhm Wow you GOTTA be high try again man!!!"

end
end


def start_to_trip




end
