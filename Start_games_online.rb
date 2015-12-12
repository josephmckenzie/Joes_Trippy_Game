require 'sinatra'
require 'tilt/erb'
enable :sessions

# require_relative "trippy_game_functions.rb"
# trippy = Joestrippygame.new 

get '/startgames' do
	
	erb :startgame, :locals => {:message1 => "Welcome To Joe's Games.", :message2 => "Enter your name & age to start."}
end

get '/startjade' do
	erb :startgame2, :locals => {:message1 => "So you wanna play Jade's Safari Adventure game ?", :message2 => "Enter your name & age to start."}
end

get '/startjoe' do
	erb :startgame, :locals => {:message1 => "If you want to play Joe's Trippy Adventure Game", :message2 => "You must verify your name & age to start."}
end

get '/info' do
  erb :info, :locals => {:message1 => "", :message2 => "" } 
end

get '/downloads' do
	erb :downloads, :locals => {:message1 => "Here are my games I have available for download"}
end
	
post '/startgames' do
	play = params[:playgame]
	session[:name] = params[:name]
	session[:age] = params[:age].to_i
	
    if play == "Joe's Trippy Adventure Game" && session[:age] > 17 
			erb :trippygame1, :locals => {:message1 => "Great #{session[:name]} you are old enough to Play Joe's Trippy Adventure Game.",
										  :message2 => "One day #{session[:name]} is sitting around Smoking a bong when someone knocks on the door.", 
										  :message3 => "Do you get up and answer it?"}
	elsif play == "Joe's Trippy Adventure Game" && session[:age] < 17 
			erb 	erb :safari1, :locals => {:message1 => "#{session[:name]} You are to young to play Joe's Trippy game how about a nice Lepoard adventure game?", :age => ""}
	elsif play == "Jade's Safari Adventure Game" && session[:age] < 17
			erb :safari1, :locals => {:message1 => "#{session[:name]} Chose to play Jade's Safari Adventure Game.", :age =>""}
	else play == "Jade's Safari Adventure Game" && session[:age] > 17
			erb :safari1, :locals => {:age => "Hey man Aren't You a little old to play this type of game?",
									  :message1 => "#{session[:name]} Chose to play Jade's Safari Adventure Game."}
	end
end

post '/answerdoor' do 
answerdoor = params[:door]
  door = rand(2).floor
	if answerdoor.include?('Yes') && door == 0
		# erb :answerdoor, :locals => {:answerdoor => "#{playername} Decides to get up and answer the door", :answerdoor2 => " #{playername} your in Luck It's Your good buddy Dave." }
		erb :davehere, :locals => {:daveishere => "Your in Luck #{session[:name]},It's Your Good Buddy Dave.",
								   :message1 => "\"Whats up  #{session[:name]} I'm Thinking about hitting the club up wanna go?\""}
		
	elsif   answerdoor.include?('Yes') && door == 1
				# erb :answerdoor, :locals => {:answerdoor => "#{playername} Decides to get up and answer the door", :answerdoor2 => " Oh No its The cops." }
				erb :police, :locals => {:msg1 => "\"Fuck #{session[:name]} you answer the door & I'ts the cops, they bong lying on the table\"",
										 :arrested => "\"Well damn man. That sucks for you #{session[:name]} They arrest you & take you to the police station....\"",
										 :message3 =>"",:search =>""}

	elsif   answerdoor.include?('No') && door == 0 
		erb :davehere, :locals => {:daveishere => "It doesn't really matter #{session[:name]}, cause Your Good Buddy Dave walks in on his own.",
                             	   :message1 => "\"Whats up  #{session[:name]} I'm Thinking about hitting the club up wanna go?\""}
	
	elsif   answerdoor.include?('No') && door == 1
				# erb :answerdoorno, :locals => {:answerdoor => "#{playername} Decides not to answer the door, but it dosen't Really matter cause its the cops and the bust in."}
		erb :police, :locals => {:msg1 => "\"Fuck #{session[:name]} I'ts the cops and they bust in the door and see the bong lying on the table\"",
							     :arrested => "\"Well damn man. That sucks for you #{session[:name]} They arrest you & take you to the police station....\"",
								 :message3 =>"",:search =>""}

	end
end

get '/police' do

	erb :police, :locals => {:msg1 => "\"Fuck #{session[:name]} I'ts the cops\"" ,
							 :arrested => "\"Well damn man. That sucks for you #{session[:name]}....\"",
							 :message3 =>"",:search =>""}
end

post '/replay' do
replay = params[:replay]

	if replay == "Joe's Trippy Adventure Game"  && session[:age] > 17 
		erb :trippygame1, :locals => {:message1 => "",
										  :message2 => "One day #{session[:name]}  is sitting around Smoking a bong when someone knocks on the door.", 
										  :message3 => "Do you get up and answer it?"}
	elsif replay == "Joe's Trippy Adventure Game"  && session[:age] < 17
		erb :safari1, :locals => {:message1 => "#{session[:name]} You are to young to play Joe's Trippy game how about a nice Lepoard adventure game?"}
		
	elsif replay == "Jade's Safari Adventure Game"  && session[:age] > 17 
		erb :safari1, :locals => {:age => "Hey man Aren't You a little old to play this type of game?",
									  :message1 => "#{session[:name]} Chose to play Jade's Safari Adventure Game."}
	
	elsif replay == "Jade's Safari Adventure Game"  && session[:age] < 17 
		erb :safari1, :locals => {:message1 => "to play Jade's Safari Adventure Game.", :age =>"#{session[:name]} Thanks for Choosing"}
	else
		erb :startgame, :locals => {:message1 => "\"Well To bad your gonna play again .\"", :message2 => "Forever & ever & ever"}
	end
end

post '/davehere' do
davehere = params[:dave]

	if davehere == "Yes"
		 erb :davehere2, :locals => {:message1 =>"\"Yeah let's go man, but do you wanna smoke some before we leave??\"",:message2 => ""}
	else erb :smokefirst, :locals => {:message1 =>"#{session[:name]} & Dave decide to smoke some bud first and maybe watch a little tv.....",
	       							  :message2 => "After watching some TV Dave Says \"Lets go to the club man\""}
	end
end

post '/smokefirst?' do 
  smokefirst = params[:smoke1st]
	
	if smokefirst == "Yes"
         erb :smokefirst, :locals => {:message1 =>"#{session[:name]} & Dave decide to smoke some bud first and maybe watch a little tv.....",
	       							  :message2 => "Hey #{session[:name]} & Dave do you guys wanna just chill at home or Leave for the club now?"} 
	else erb :leaverightaway, :locals => {:message1 =>"#{session[:name]} & Dave roll a couple blunts real quick,and you leave for the club....", 
										  :message2 => "You pull up to the club.", :message3 => "Do you go in right away or go smoke a blunt in the woods first?"}
	end
end

post '/go_to_club' do
  gotoclub= params[:club]
 
	if gotoclub == "Go to Club"
		erb :leaverightaway, :locals => {:message1 =>"After Smoking a couple bongs, #{session[:name]} & Dave leave for the club....", :message2 => "You pull up to the club.",
										 :message3 => "Do you go in right away or smoke a blunt in the woods first?"}
	elsif gotoclub == "Chill at Home"
		erb :chillathome, :locals => {:message1 => "You guys decide to just chill out for a while......", 
									  :stick_out_tounge => "Dave says to you... \"Hey #{session[:name]} close your eyes and stick out your tounge... \"", 
									  :doyou => "Do you stick out your tounge?"}
	end
end

post '/stick_out_tounge' do
  tounge = params[:tounge]

	if tounge == "Yes"
			session[:hits] = params[:hits]
		erb :stick_out_your_tounge, :locals => {:yes => "You Say \" Ok and close your eyes and stick out your tounge\"", 
												:places => "Dave places a tiny piece of paper Upon your tounge",
												:leave => "Now that you have taken your dose Do you wanna hang out here or Leave for the club "}
					
	elsif tounge == "No"
	    erb :chillathome2, :locals => {:message1 => "You Say \" Gee I don't know man why what is it ?......\"", 
									   :stick_out_tounge => "Dave says to you... \"Hey #{session[:name]} if you need to know than it wont be as fun..... \"", 
									   :doyou => "Do you still wanna know what it is ?"}
	end
end

post '/what_is_it' do

  whatisit = params[:what]
	
	if whatisit == "Yes"
		erb :it_is_acid, :locals => {:its_acid_man => "\"Man #{session[:name]} it's some blotter acid. I wanted it to be a surprise though man....\"", 
									 :msg2 => " Do you want some then #{session[:name]}?"}
	elsif whatisit == "No"  	
		erb :it_is_acid, :locals => {:its_acid_man => "Man #{session[:name]} thats good I didnt wanna tell you what it was anyways man.",
									 :msg2 => " Do you want some of what I got then #{session[:name]}?"}
	end
end
	
post '/acid' do
   tounge = params[:tounge]  

	if tounge == "Yes"
	    erb :stick_out_your_tounge, :locals => {:yes => "You Say \" Ok and close your eyes and stick out your tounge\"", 
	                                            :places => "Dave places a tiny piece of paper Upon your tounge" ,
												:leave => "Now that you have taken your dose Do you wanna Stay here or Leave for the club "}
  
	else erb :it_is_acid, :locals => {:its_acid_man => "\" Sorry #{session[:name]} you need to be tripping in order to play this game....\"", 
									  :msg2 => " Will you take some #{session[:name]} or do you wish to quit now and go play something else?"}
	end
end

post '/justdosed' do
	justdosed = params[:justdosed]
	
	if justdosed == "Stay"
		erb :homerotto, :locals => {:message1 => "You guys decide to just chill at your place and enjoy your buzzes for a while", 
									:message2 => "A little while #{session[:name]} later is really starting to trip when you spot something crazy looking out side....",
									:message3 => "Hey Dave did you just see that? , To which Dave says Man your just seeing stuff relax man.", 
									:message4 => "No I saw something man. Do you wanna go check it out?"}
									
	else erb :leavetripping, :locals => {:message1 =>"After having taken a thier doses #{session[:name]} & Dave get ready for the club and leave....",
										 :message2 => "Do you Take the car or Walk"}
	end
end

post '/trippin_at_home' do
   what = params[:what]
	
	if what == "Stay"
		erb :crazyass, :locals => {:message1 =>"#{session[:name]} & Dave are sitting around chilling when #{session[:name]} notices something out the window.",
								   :message2 => "Hey man did you just see what i saw? Nah man It's Cool your just seeing shit its the acid man.",
								   :message3 => " No man I know I saw something, you wanna go check it out with me?" }
	
	else
		erb :leaveincar, :locals => {:message1 => "#{session[:name]} & Dave take the car and its not long before they are really tripping hard.", 
									 :message2 => "Will you pull over and walk the rest of the way or Do you continue to drive the rest of the way?"}
	end
end

post '/leave_starting_to_trip' do
  leave = params[:leave]

	if leave == "Take Car"
		erb :leaveincar, :locals => {:message1 => "#{session[:name]} & Dave take the car and its not long before they are really tripping hard.", 
									 :message2 => "Will you pull over and walk the rest of the way or Do you continue to drive the rest of the way?"}

	else erb :leavewalking, :locals => {:message1 =>"#{session[:name]} & Dave start out walking and before no time the reach a shortcut through the woods ",
										:message2 => "Do you take the shortcut through the woods?"}
	
	end
end

post '/trippin_in_car' do
  driving = params[:drive]
  drive = rand(2).floor
  
	if driving.include?('Continue to Drive') && drive == 0 
		erb :trippingincar, :locals => {:message1 => "You decide that you can make it the club fine, after all it is only like 5-10 minutes away",
										:message2 => "And it's not like your THAT messed up yet.", :message3 =>"Luckly you guys make it to the club in one piece.",
										:message4 => "Do you go in to the club or Go for a walk in the nearby woods?"} 
	elsif driving.include?('Continue to Drive') && drive == 1
		erb :police, :locals => {:msg1 => "\"Fuck #{session[:name]} The cops are behind us \"" ,
								 :arrested => "\"Well damn man\". They search you & Dave and find the weed and what Dave's had left too.",
								 :message3 =>"\"That sucks for you #{session[:name]}....\"",:search =>""}
		
	else erb :leavewalking, :locals => {:message1 =>"#{session[:name]} & Dave pull over and start walking down the road and before no time the reach a shortcut through the woods ",
										:message2 => "Do you take the shortcut through the woods?"}
  	end
end

post '/start_on_shortcut' do 
  path = params[:shortcut] 
  takeshortcut = rand(2).floor
	if path == "Take Shortcut"
		erb :shortcut, :locals => {:message1 => "#{session[:name]} & Dave start down in to the woods and soon they find themselves lost", 
									:message2 => "\"Damn dave I think we are lost\"",:message3 => "What do you do ?!?"}
	
	elsif path == "Walk The Road" && takeshortcut == 0
		erb :takeroad, :locals => {:message1 => "You guys choose not to walk through the woods & instead walk the road", 
								   :message2 => "Since the club is so close you know you can make it pretty quick", :message3 => "A little bit later you come up on the club", 
								   :message4 => "Do you guys go in to the club or Take a walk in to the nearby woods?"}
	elsif path == "Walk The Road" && takeshortcut == 1 
		erb :police, :locals => {:msg1 => "\"Fuck #{session[:name]} The cops pull up beside you \"" ,
								 :arrested => "\"Well damn man.\"" , :search => "They search you & Dave and find your weed and what Dave's had stashed for later too.",
								 :message3 =>"\"That sucks for you #{session[:name]}....\""}
	end
end

post '/arrive_at_club' do
  club = params[:atclub]
	if club == "Go to Club"
		erb :club, :locals => {:message1=>" You arrive in the club ready to get your drink on.",:message2=>"Sitting down at the bar you guys order a couple drinks."}

	else erb :shortcut, :locals => {:message1 => "#{session[:name]} & Dave start down in to the woods and soon they find themselves lost", 
									:message2 => "\"Damn dave I think we are lost\"",:message3 => "What do you do ?!?"}
		
	end
	
end

post '/start_drinking' do
  shots= params[:shot]
	if shots == "Take a Shot"
		erb :startdrinking, :locals => {:message1 =>"#{session[:name]} says to Dave \"Hey Man Lets have some shots man.\"", :message2 => "\"Hell Yeah\" Says Dave",
										:message3 => "You guys order up a pitcher of Kamakizees and proceed to have a few." }
	

	end
end

post '/start_trippin_at_club' do





end

post '/in_woods' do
  whatpath = params[:path]
	if whatpath == "Continue down Path"
		erb :deepinwoods, :locals => {:message1 => "You get a little farther down the path when Dave says\"Hey man I think we are lost.\"", 
									  :message2 => "\"Yeah I just said that man, Who cares are we not having fun just chilling out here in nature man?\"",
									  :message3 => "What do you want to do?"} 
		
	else erb :turnaround, :locals => {:message1 => "You Guys decide to turn around as you dont want to get to lost in the woods.",
									  :message2 => "As you start walking back the way you came, You begin tripping really hard.",
									  :message3 => "Before you know it you are completely lost.",
									  :message4 => "What will you do?"}
	end
end

post '/sit_or_walk' do
  sit_walk = params[:sitorwalk]
	if sit_walk == "Sit Down and Smoke a Blunt"
		erb :sitdown, :locals => {:message1 => "You guys sit down to take a break & smoke a blunt.", 
								  :message2 =>"After taking a few good hits off the blunt you realize you must be tripping really hard.",
								  :message3 => "Dave I think someone or something is watching us, Can you feel it ?",
								  :message4 => "\"WTF Look #{session[:name]} LOOK MAN are you seeing this shit too?\""}

	else erb :keepwalking, :locals => {:message1 => ""} 							  

	end
end

post '/tripping_in_woods' do
  wtf = params[:wtf] 
	if wtf == "Yeah WTF is it?"
		erb :wtf, :locals => {:message1 => "\"Are you seeing little creepy ass looking creatures or whatever they are?\"",
							  :message2 => "\"Yeah man WTF are they?\"", :message3 =>"\"Let's go check em out\"", 
							  :message4 =>"Do you get up & go check it out?"}
   
   #else erb :sitdown, :locals => {:message1 => "\"Are you seeing little creepy ass looking creatures or whatever they are?\"",
								  #:message2 => "\"Yeah man WTF are they?\"", :message3 =>"\"Lets go check em out\"",
                                  #:message4 => "Do you get up & go check it out?"}
	end
end

post '/check_em_out' do
  check = params[:checkem]
	if check == "Yeah Lets Go Check It Out"
		erb :check_em_out, :locals => {:message1 => "You get up to check out what you are seeing",:message2=>"When whatever you saw goes scampering off", 
									   :message3 =>"Do you chase after them?"}





	end
end



