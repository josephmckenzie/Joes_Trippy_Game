require 'sinatra'
enable :sessions
require_relative 'stats.rb'

# require_relative "trippy_game_functions.rb"
# trippy = Joestrippygame.new 

get '/startgames' do
	answerphone = params[:playgame]
	
		erb :startgame, :locals => {:message1 => "Welcome To Joe\'s Games. Click the game you wish to play ."}
end

post '/startgames' do
	answerphone = params[:playgame]
	session[:name] = params[:name]
	
     if answerphone == "Joe's Trippy Adventure Game"
			erb :trippygame1, :locals => {:message1 => "#{session[:name]} Chose to Play Joe's Trippy Adventure Game."}
	 elsif answerphone == "Jade's Safari Adventure Game"
			erb :safari1, :locals => {:message1 => "#{session[:name]} Chose to play Jade's Safari Adventure Game."}
	 else   erb :startgame, :locals => {:message1 => "Thanks For playing Have a Great Day"}
	
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
										 :arrested => "\"Well damn man. That sucks for you #{session[:name]} They arrest you & take you to the police station....\"",:message3 =>"",:search =>""}

	elsif   answerdoor.include?('No') && door == 0 
		erb :davehere, :locals => {:daveishere => "It doesn't really matter #{session[:name]}, cause Your Good Buddy Dave walks in on his own.",
                             	   :message1 => "\"Whats up  #{session[:name]} I'm Thinking about hitting the club up wanna go?\""}
	
	elsif   answerdoor.include?('No') && door == 1
				# erb :answerdoorno, :locals => {:answerdoor => "#{playername} Decides not to answer the door, but it dosen't Really matter cause its the cops and the bust in."}
		erb :police, :locals => {:msg1 => "\"Fuck #{session[:name]} I'ts the cops and they bust in the door and see the bong lying on the table\"",
							     :arrested => "\"Well damn man. That sucks for you #{session[:name]} They arrest you & take you to the police station....\"",:message3 =>"",:search =>""}

	end
end

get '/police' do

	erb :police, :locals => {:msg1 => "\"Fuck #{session[:name]} I'ts the cops\"" ,:arrested => "\"Well damn man. That sucks for you #{session[:name]}....\"",:message3 =>"",:search =>""}
end

post '/replay' do
replay = params[:replay]
	if replay == "Yes"
		 erb :startgame, :locals => {:message1 => "Welcome To Joe's Games. Click the game you wish to play ."}
	else erb :startgame, :locals => {:message1 => "\"Well To bad your gonna play again .\""}
	end
end

post '/davehere' do
davehere = params[:dave]

	if davehere == "Yes"
		 erb :davehere2, :locals => {:message1 =>"\"Yeah let's go man, but do you wanna smoke some before we leave??\""}
	else erb :davehere2, :locals => {:message1 =>"\"Booo Well Alright... I guess ill just bring some with us then.\""}
	end
end

post '/smokefirst?' do 
  smokefirst = params[:smoke1st]
	
	if smokefirst == "Yes"
         erb :smokefirst, :locals => {:message1 =>"#{session[:name]} & Dave decide to smoke some bud first and maybe watch a little tv.....",
	       							  :message2 => "Hey #{session[:name]} & Dave do you guys wanna just chill at home or Leave for the club now?"} 
	else erb :leaverightaway, :locals => {:message1 =>"#{session[:name]} & Dave roll a couple blunts real quick,and you leave for the club....", :message2 => ""}
	end
end

post '/go_to_club' do
  gotoclub= params[:club]
 
	if gotoclub == "Go to Club"
		erb :leaverightaway, :locals => {:message1 =>"After Smoking a couple bongs, #{session[:name]} & Dave leave for the club....", :message2 => ""}
	elsif gotoclub == "Chill at Home"
		erb :chillathome, :locals => {:message1 => "You guys decide to just chill out for a while......", 
									  :stick_out_tounge => "Dave says to you... \"Hey #{session[:name]} close your eyes and stick out your tounge... \"", 
									  :doyou => "Do you stick out your tounge?"}
	end
end

post '/stick_out_tounge' do
  tounge = params[:tounge]

	if tounge == "Yes"
	
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
												 :leave => "Now that you have taken your dose Do you wanna hang out here or Leave for the club "}
  
	else erb :it_is_acid, :locals => {:its_acid_man => "\" Sorry #{session[:name]} you need to be tripping in order to play this game....\"", 
									  :msg2 => " Will you take some #{session[:name]} or do you wish to quit now and go play something else?"}
	end
end

post '/justdosed' do
	justdosed = params[:justdosed]
	
	 if justdosed == "Stay"
		erb :homerotto, :locals => {:message1 => "You guys decide to just chill at your place and enjoy your buzzes for a while", 
									:message2 => "Next Question"}
									
	else erb :leavetripping, :locals => {:message1 =>"After having taken a thier doses #{session[:name]} & Dave get ready for the club and leave....",
										 :message2 => "Do you Take the car or Walk"}
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
		erb :shortcut, :locals => {:message1 => "#{session[:name]} & Dave start down the path and soon find themselves lost", :message2 => "What do you do ?!?"}
	
	elsif path.include?('Walk The Road') && takeshortcut == 0
		erb :takeroad, :locals => {:message1 => "You guys choose not to walk through the woods & instead walk the road", 
								   :message2 => "Since the club is so close you know you can make it pretty quick", :message3 => "A little bit later you come up on the club", 
								   :message4 => "Do you guys go in to the club or Take a walk in to the nearby woods?"}
	elsif path.include?('Walk The Road') && takeshortcut == 1 
		erb :police, :locals => {:msg1 => "\"Fuck #{session[:name]} The cops pull up beside you \"" ,
								 :arrested => "\"Well damn man.\"" , :search => "They search you & Dave and find your weed and what Dave's had stashed for later too.",
								 :message3 =>"\"That sucks for you #{session[:name]}....\""}
	end
end




