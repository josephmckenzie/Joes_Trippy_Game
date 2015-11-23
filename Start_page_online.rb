
require 'sinatra'
enable :sessions
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
		erb :davehere, :locals => {:daveishere => "Your in Luck #{session[:name]},It's Your Good Buddy Dave.", :message1 => "\"Whats up  #{session[:name]} I'm Thinking about hitting the club up wanna go?\""}
		
	elsif   answerdoor.include?('Yes') && door == 1
				# erb :answerdoor, :locals => {:answerdoor => "#{playername} Decides to get up and answer the door", :answerdoor2 => " Oh No its The cops." }
				erb :police, :locals => {:msg1 => "\"Fuck #{session[:name]} you answer the door & I'ts the cops, they bong lying on the table\"" ,:arrested => "\"Well damn man. That sucks for you #{session[:name]} They arrest you & take you to the police station....\""}

	elsif   answerdoor.include?('No') && door == 0 
		erb :davehere, :locals => {:daveishere => "It doesn't really matter #{session[:name]}, cause Your Good Buddy Dave walks in on his own.", :message1 => "\"Whats up  #{session[:name]} I'm Thinking about hitting the club up wanna go?\""}
	elsif   answerdoor.include?('No') && door == 1
				# erb :answerdoorno, :locals => {:answerdoor => "#{playername} Decides not to answer the door, but it dosen't Really matter cause its the cops and the bust in."}
							erb :police, :locals => {:msg1 => "\"Fuck #{session[:name]} I'ts the cops and they bust in the door and see the bong lying on the table\"" ,:arrested => "\"Well damn man. That sucks for you #{session[:name]} They arrest you & take you to the police station....\""}

	end
end

get '/police' do

	erb :police, :locals => {:msg1 => "\"Fuck #{session[:name]} I'ts the cops\"" ,:arrested => "\"Well damn man. That sucks for you #{session[:name]}....\""}
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
	else erb :davehere2, :locals => {:message1 =>"\"Booo Well Alright... Ill bring some with us then.\""}
	end
end

post '/smokefirst?' do 

smokefirst = params[:smoke1st]

	if smokefirst == "Yes"
         erb :smokefirst, :locals => {:message1 =>"#{session[:name]} & Dave decide to smoke some bud first and maybe watch a little tv.....", :message2 => "Hey #{session[:name]} do you guys wanna just chill at home or Leave for the club now?"} 
	else erb :leaverightaway, :locals => {:message1 =>"After #{session[:name]} & Dave get done rolling a couple blunts, you guys leave for the club...."}
	end
end

post '/go_to_club' do
 gotoclub= params[:club]
 
	if gotoclub == "Go to Club"
		erb :leaverightaway, :locals => {:message1 =>"After Smoking a couple bongs, #{session[:name]} & Dave leave for the club...."}
	elsif gotoclub == "Chill at Home"
		erb :chillathome, :locals => {:message1 => "You guys decide to just chill out for a while......", :stick_out_tounge => "Dave says to you... \"Hey #{session[:name]} close your eyes and stick out your tounge... \"", :doyou => "Do you stick out your tounge?" }
	end
end


post '/stick_out_tounge' do
 tounge = params[:tounge]
	
	if tounge == "Yes"
		erb :stick_out_your_tounge, :locals => {:yes => "You Say \" Ok and close your eyes and stick out your tounge\""  }
	elsif tounge == "No"
	   erb :chillathome, :locals => {:message1 => "You Say no man why what is it ?......", :stick_out_tounge => "Dave says to you... \"Hey #{session[:name]} if you need to know than it wont be as fun..... \"", :doyou => "Do you still wanna know what it is ?" }
 
	end
 
 
 end













 