
require 'sinatra'
# require_relative "trippy_game_functions.rb"

# trippy = Joestrippygame.new 



get '/startgames' do
	answerphone = params[:playgame]
	
		erb :startgame, :locals => {:message1 => "Welcome To Joe's Games. Click the game you wish to play ."}
end

post '/startgames' do
	answerphone = params[:playgame]
playername = params[:name]
	if answerphone == "Joe's Trippy Adventure Game"
		erb :trippygame1, :locals => {:message1 => "#{playername} Chose to Play Joe's Trippy Adventure Game."}

	elsif answerphone == "Jade's Safari Adventure Game"
		erb :safari1, :locals => {:message1 => "#{playername} Chose to play Jade's Safari Adventure Game."}
	else
	erb :startgame, :locals => {:message1 => "Thanks For playing Have a Great Day"}
	end
end

post '/answerdoor' do 
answerdoor = params[:door]

playername = params[:name] 
	door = rand(2).floor
	if answerdoor.include?('Yes') && door == 0
		# erb :answerdoor, :locals => {:answerdoor => "#{playername} Decides to get up and answer the door", :answerdoor2 => " #{playername} your in Luck It's Your good buddy Dave." }
		erb :davehere, :locals => {:message1 => "Whats up #{playername}? I'm Thinking about hitting the club up wanna go? "}
		
	elsif   answerdoor.include?('Yes') && door == 1
				# erb :answerdoor, :locals => {:answerdoor => "#{playername} Decides to get up and answer the door", :answerdoor2 => " Oh No its The cops." }
					redirect to ('/police')
	elsif   answerdoor.include?('No') && door == 0 
				erb :answerdoorno, :locals => {:answerdoor => "#{playername} Decides not to answer the door, but it dosen't Really matter cause Dave walks in anyways."}
	elsif   answerdoor.include?('No') && door == 1
				# erb :answerdoorno, :locals => {:answerdoor => "#{playername} Decides not to answer the door, but it dosen't Really matter cause its the cops and the bust in."}
					redirect to ('/police')


	end

end


get '/police' do
playername = params[:name]
	erb :police, :locals => {:arrested => "Well damn man. That sucks #{playername}...." }

end


post '/davehere' do

davehere = params[:dave]

	if davehere == "Yes"
		erb :davehere2, :locals => {:message1 =>"Yeah let's go man, but do you wanna smoke some before we leave??"}
	else erb :davehere2, :locals => {:message1 =>"Booo Well Alright... Ill bring some with us then."}
	end


		
end

post '/smokefirst?' do 

smokefirst = params[:smoke1st]

	if smokefirst == "Yes"
		erb :smokefirst, :locals => {:message1 =>"You guys decide to smoke some bud first and watch a little tv.....Do you guys Decide to just chill at home or Leave for the club?"} 
	else erb :leaverightaway, :locals => {:message1 =>"After rolling a couple blunts, You leave for the club...."}
	end
end

post '/go_to_club' do
 gotoclub= params[:club]
 
	if gotoclub == "Go to Club"
		erb :leaverightaway, :locals => {:message1 =>"After Smoking a couple bongs, You leave for the club...."}
	elsif gotoclub == "Chill at Home"
	erb :chillathome, :locals => {:message1 => "You Chill at home forever and have no fun"}
	
	end
end

 