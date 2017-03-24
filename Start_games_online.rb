require 'sinatra'
require 'tilt/erb'
enable :sessions
require_relative 'you_say.rb'
require_relative 'start_messages.rb'
require_relative 'misc_messages.rb'
require_relative 'trippy_messages.rb'
require_relative 'dave_says.rb'
require_relative 'trippy_methods.rb'
start_message = Start_messages.new
misc_messages = Misc_messages.new
trippy_messages = Trippy_messages.new
dave_says = Dave_says.new
you_say = You_say.new
trippy_methods = Trippy_methods.new 

get '/' do
	erb :startgame, :locals => {:message1 => start_message.welcome, :message2 => start_message.name_age }
end

get '/startjade' do
	erb :startgame2, :locals => {:message1 =>start_message.to_start_jade, :message2 => start_message.name_age}
end

get '/startjoe' do
	erb :startgame, :locals => {:message1 => start_message.to_start_joe , :message2 => start_message.name_age}
end

get '/info' do
  erb :info, :locals => {:message1 => "", :message2 => "" } 
end

get '/downloads' do
	erb :downloads, :locals => {:message1 => misc_messages.downloads}
end
	
post '/startgames' do
	play = params[:playgame]
	
	session[:name] = params[:name]
	session[:age] = params[:age].to_i
	name = session[:name]
	
    if play == "Joe's Trippy Adventure Game" && session[:age] >= 18
			erb :trippygame1, :locals => {:message1 => start_message.start_joe(name),:message2 => trippy_messages.knock(name),:message3 => trippy_messages.answer, 
										  :start_time => trippy_methods.start_time }
	
	elsif play == "Joe's Trippy Adventure Game" && session[:age] <= 18 
			erb :safari1, :locals => {:message1 => start_message.too_young(name) , :age => "", :start_time => trippy_methods.start_time}
	
	elsif play == "Jade's Safari Adventure Game" && session[:age] <= 18
			erb :safari1, :locals => {:message1 => start_message.start_jade(name), :age =>"", :start_time => trippy_methods.start_time}
	
	else play == "Jade's Safari Adventure Game" && session[:age] >= 18
			erb :safari1, :locals => {:age => start_message.too_old(name), :message1 => start_message.start_jade(name), :start_time => trippy_methods.start_time}
	end
end

post '/answerdoor' do 
answerdoor = params[:door]
name = session[:name]
  door = rand(1..8)
	if answerdoor.include?('Yes') && door < 6
		erb :davehere, :locals => {:daveishere => trippy_messages.its_dave(name), :message1 => dave_says.whats_up(name)}
	
	elsif  answerdoor.include?('Yes') && door > 6
				erb :police, :locals => {:msg1 => trippy_messages.cops_at_door(name),:arrested => trippy_messages.arrested(name), :message3 =>"",:search =>"", :stash => ""}

	elsif  answerdoor.include?('No') && door < 6 
				erb :davehere, :locals => {:daveishere => trippy_messages.dave_comes_in(name),:message1 => trippy_messages.go_to_club?(name)}
	
	else  answerdoor.include?('No') && door > 6
				erb :police, :locals => {:msg1 => trippy_messages.cops_at_door(name), :arrested =>trippy_messages.arrested(name),:message3 =>"",:search =>"",:stash => ""}

	end
end

# Have to figure out why its not remembering age or something if i just redirect back to startgames after getting arrested 
# So I can get rid of the replay post 

post '/replay' do
replay = params[:replay]
name = session[:name]
	if replay == "Joe's Trippy Adventure Game"  && session[:age] >= 18 
		erb :trippygame1, :locals => {:message1 => start_message.start_joe(name), :message2 => trippy_messages.knock(name),:message3 => trippy_messages.answer, :start_time => trippy_methods.start_time}
	
	elsif replay == "Joe's Trippy Adventure Game"  && session[:age] <= 18
		erb :safari1, :locals => {:message1 =>start_message.too_young(name) , :age => "", :start_time => trippy_methods.start_time}
		
	elsif replay == "Jade's Safari Adventure Game"  && session[:age] >= 18
		erb :safari1, :locals =>  {:message1 => start_message.start_jade(name), :age =>"", :start_time => trippy_methods.start_time}
	
	elsif replay == "Jade's Safari Adventure Game"  && session[:age] <= 18 
		erb :safari1, :locals => {:age => start_message.too_old(name), :message1 => start_message.start_jade(name), :start_time => trippy_methods.start_time}
	else
		erb :startgame, :locals => {:message1 =>start_message.too_bad(joe) , :message2 => ""}
	end
end

post '/davehere' do
davehere = params[:dave]
name = session[:name]
	if davehere == "Yes"
		 erb :davehere2, :locals => {:message1 => you_say.yeah_lets_go ,:message2 => ""}
	else erb :smokefirst, :locals => {:message1 => trippy_messages.smoke_first(name),:message2 => dave_says.watchin_tv}
	end
end

post '/smokefirst?' do 
  smokefirst = params[:smoke1st]
	name = session[:name]
	if smokefirst == "Yes"
         erb :smokefirst, :locals => {:message1 =>trippy_messages.smoke_first(name),:message2 => trippy_messages.chill_or_leave(name)} 
	
	else erb :leaverightaway, :locals => {:message1 => trippy_messages.leave_now(name),:message2 => trippy_messages.pull_up_to_club(name),
										  :stash => trippy_methods.put_in_stash("Blunts"), :message3 => "",:hits_taken => ""}
	end
end

post '/go_to_club' do
  gotoclub= params[:club]
 name = session[:name]
	if gotoclub == "Go to Club"
		erb :leaverightaway, :locals => {:message1 =>trippy_messages.smoke_n_leave(name),:stash => trippy_methods.put_in_stash("Blunts"), 
    		                             :message2 =>trippy_messages.pull_up_to_club(name),:message3 =>trippy_messages.club_or_smoke?,:hits_taken => ""}
	else
		erb :chillathome, :locals => {:message1 => trippy_messages.just_chill,:stick_out_tounge => trippy_messages.stick_out_tounge(name), 
									  :doyou => trippy_messages.stick_out_tounge? }
	end
end

post '/stick_out_tounge' do
tounge = params[:tounge]
name = session[:name]
session[:hits] = params[:hits]
hits = session[:hits].to_i
	if tounge == "Yes"
		erb :stick_out_your_tounge, :locals => {:yes => you_say.ok_to_acid, :places => trippy_messages.places_acid_on_tounge, 
												:leave => trippy_messages.dosed_now_leave?,:start_amount => trippy_methods.start_with_amount(hits), 
												:hits_taken => trippy_methods.start_acid_amount, :greedy => trippy_methods.greedy_ass(hits)}
	else
	    erb :chillathome2, :locals => {:message1 => you_say.gee_idk, :stick_out_tounge => dave_says.if_you_need_to_know(name), :doyou => dave_says.still_wanna_know}
	end
end

post '/what_is_it' do
name = session[:name]
  whatisit = params[:what]
	session[:hits] = params[:hits]
hits = session[:hits].to_i
	if whatisit == "Yes"
		erb :it_is_acid, :locals => {:its_acid_man => dave_says.its_acid_man(name), :msg2 => "",:yes => you_say.ok_to_acid, :places => trippy_messages.places_acid_on_tounge, 
									 :leave => trippy_messages.dosed_now_leave?,:start_amount => trippy_methods.start_with_amount(hits), 
									 :hits_taken => trippy_methods.start_acid_amount, :greedy => trippy_methods.greedy_ass(hits)}
	elsif whatisit == "No"  	
		erb :it_is_acid, :locals => {:its_acid_man => dave_says.dont_want_to_know(name), :msg2 => "", :yes => you_say.ok_to_acid, :places => trippy_messages.places_acid_on_tounge, 
									 :leave => trippy_messages.dosed_now_leave?,:start_amount => trippy_methods.start_with_amount(hits), 
									 :hits_taken => trippy_methods.start_acid_amount, :greedy => trippy_methods.greedy_ass(hits)}
	end
end
	
post '/acid' do
   tounge = params[:tounge]  
name = session[:name]
session[:hits] = params[:hits]
hits = session[:hits].to_i
	if tounge == "Yes"
	    erb :stick_out_your_tounge, :locals => {:yes => you_say.ok_to_acid, :places => trippy_messages.places_acid_on_tounge, 
												:leave => trippy_messages.dosed_now_leave?,:start_amount => trippy_methods.start_with_amount(hits), 
												:hits_taken => trippy_methods.start_acid_amount, :greedy => trippy_methods.greedy_ass(hits)}
												
  	else erb :it_is_acid, :locals => {:its_acid_man => trippy_messages.have_to_trip(name), :msg2 => ""}
	end
end

post '/justdosed' do
	justdosed = params[:justdosed]
	name = session[:name]
	if justdosed == "Stay"
		erb :homerotto, :locals => {:message1 => trippy_messages.just_chill, :message2 =>trippy_messages.see_something_crazy(name),	
									:message3 => you_say.did_you_see_that, :message4 => you_say.i_saw_something}

	else erb :leavetripping, :locals => {:message1 => trippy_messages.dose_and_leave(name), :stash =>trippy_methods.put_in_stash("Blunts"), 
										 :message2 =>trippy_messages.take_car_or_walk}
	end
end

post '/trippin_at_home' do
   what = params[:what]
	name = session[:name]
	if what == "Stay"
		erb :crazyass, :locals => {:message1 =>trippy_messages.see_something_crazy(name), :message2 => you_say.did_you_see_that, 
								   :its_cool => dave_says.nah_its_cool,:message3 => you_say.i_saw_something}
	
	else
		erb :leaveincar, :locals => {:message1 => trippy_messages.take_car(name), 
									 :message2 => trippy_messages.pull_over_and_walk,
									 :added => trippy_methods.just_added("Blunts"),:stash =>trippy_methods.put_in_stash("Blunts")}
	end
end

post '/leave_starting_to_trip' do
  leave = params[:leave]
name = session[:name]
	if leave == "Take Car"
		erb :leaveincar, :locals => {:message1 => trippy_messages.start_trippin_in_car(name) , 
									 :message2 => trippy_messages.pull_over_and_walk}

	else erb :leavewalking, :locals => {:message1 =>trippy_messages.start_out_walking(name),
										:message2 => trippy_messages.take_shortcut}
	
	end
end

post '/trippin_in_car' do
  driving = params[:drive]
  drive = rand(1..8).floor
  
  name = session[:name]
	if driving.include?('Continue to Drive') && drive < 6 
		erb :trippingincar, :locals => {:message1 => "You decide that you can make it the club fine, after all it is only like 5-10 minutes away",
										:message2 => "And it's not like your THAT messed up yet.", :message3 =>"Luckly you guys make it to the club in one piece.",
										:message4 => "Do you go in to the club or Go for a walk in the nearby woods?"} 
	elsif driving.include?('Continue to Drive') && drive > 6
		erb :police, :locals => {:msg1 => "\"Fuck #{session[:name]} The cops are behind us \"" ,
								 :arrested => "\"Well damn man\". They search you & Dave and find the weed and what Dave's had left too.",
								 :message3 =>"\"That sucks for you #{session[:name]}....\"",:search =>""}
		
	else erb :leavewalking, :locals => {:message1 =>"#{session[:name]} & Dave pull over and start walking down the road and before no time the reach a shortcut through the woods ",
										:message2 => "Do you take the shortcut through the woods?"}
  	end
end

post '/start_on_shortcut' do 
name = session[:name]
  path = params[:shortcut] 
  takeshortcut = rand(2).floor
	if path == "Take Shortcut"
		erb :shortcut, :locals => {:message1 => "#{session[:name]} & Dave start down in to the woods and soon they find themselves lost", 
									:message2 => "\"Damn dave I think we are lost\"",:message3 => "What do you do ?!?"}
	
	elsif path == "Walk The Road" && takeshortcut == 0
		erb :takeroad, :locals => {:message1 => "You guys choose not to walk through the woods & instead walk the road", 
								   :message2 => "Since the club is so close you know you can make it pretty quick",
								   :message3 => "A little bit later you come up on the club", 
								   :message4 => "Do you guys go in to the club or Take a walk in to the nearby woods?"}
	elsif path == "Walk The Road" && takeshortcut == 1 
		erb :police, :locals => {:msg1 => "\"Fuck #{session[:name]} The cops pull up beside you \"" ,
								 :arrested => "\"Well damn man.\"" , 
								 :search => "They search you & Dave and find your weed and what Dave's had stashed for later too.",
								 :message3 =>"\"That sucks for you #{session[:name]}....\""}
	end
end

post '/arrive_at_club' do
name = session[:name]
  club = params[:atclub]
	if club == "Go to Club"
		erb :club, :locals => {:message1=>" You arrive in the club ready to get your drink on.",
							   :message2=>"Sitting down at the bar you guys order a couple drinks." }
							   
	else erb :shortcut, :locals => {:message1 => "#{session[:name]} & Dave start down in to the woods and soon they find themselves lost", 
									:message2 => "\"Damn dave I think we are lost\"",:message3 => "What do you do ?!?"}
		
	end
	
end

post '/start_drinking' do
name = session[:name]
session[:booze] = params[:booze]
booze = session[:booze].to_i

  shots= params[:shotorbeer]
	if shots == "Take a Shot"
		erb :startdrinkinghard, :locals => {:message1 =>"#{session[:name]} says to Dave \"Hey Man Lets have some shots man.\"", 
											:message2 => "\"Hell Yeah\" Says Dave",
											:message3 => "You guys order up a pitcher of Kamakizees and proceed to have a few.",
											:start_drink_amount => trippy_methods.start_with_drinks(booze),
											:drink_start => trippy_methods.start_drink_amount}
	
	else erb:startdrinkingbeer, :locals => {:message1=> "You decide to hold off on any shots for the time being", 
											:message2 => "and just have a couple beers." , :message3 => "Will you buy a round?"}

	end
end

post '/drinkingshots' do
name = session[:name]
  shots = params[:shots]
	if shots == "Pass out some of the shots"
		erb :passoutshots, :locals => {:message1 => trippy_messages.round_of_shots(name), 
									   :message2 => trippy_messages.jerry_is_a_dick, :message3 =>""}
									   
	else erb :passoutshots, :locals => {:message1 => trippy_messages.greedy_shots(), :message2 => trippy_messages.need_all_that, 
									   :message3 => ""}
	end
end

post '/justdrinkbeer' do
name = session[:name]
  beer = params[:beer]
	if beer == "Buy a Round"
		erb :beer, :locals => {:message1 => trippy_messages.round_of_beers(name), 
							   :message2 => trippy_messages.jerry_is_a_dick ,
							   :message3 => dave_says.wanna_play_pool(name)}
	
	else erb :beer, :locals => {:message1 => trippy_messages.greedy_beer(name), 
								:message2 => dave_says.wanna_play_pool(name),
								:message3 => ""}
	end
end

post '/playpool' do
name = session[:name]
  pool = params[:pool]
  randomwin = rand(2)
	if pool =="Play a Round" 
		erb :pool, :locals => {:start => trippy_methods.start_pool,:whowon => trippy_methods.pool_games(randomwin),
							  :won_by => trippy_methods.pool_games_won(name), 
							  :message1 =>  trippy_messages.random_says(), 
							  :whowon => trippy_methods.who_won(randomwin), :message2 => "Wanna Play again?"}

	else erb :keepdrinking, :locals => {:message1 => "",:message2 => "", :message3 => ""}
	end
	
  
end

post '/playagain' do
name = session[:name]
playagain = params[:playagain]
randomwin = rand(2)
	if playagain == "Yeah sure"
		erb :pool, :locals => {:start=> "",:whowon => trippy_methods.pool_games(randomwin),
							  :won_by => trippy_methods.pool_games_won(name), 
							  :message1 => trippy_messages.random_says(), 
							  :whowon => trippy_methods.who_won(randomwin), :message2 => "Wanna Play again?"}
	
	else erb :keepdrinking, :locals => {:message1 => "",:message2 => "", :message3 => ""}
	
	end


end


post '/in_woods' do
name = session[:name]
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
name = session[:name]
  sit_walk = params[:sitorwalk]
	if sit_walk == "Sit Down and Smoke a Blunt"
		erb :sitdown, :locals => {:message1 => "You guys sit down to take a break & smoke a blunt.",
								  :message2 =>"After taking a few good hits off the blunt you realize you must be tripping really hard.",
								  :message3 => "Dave I think someone or something is watching us, Can you feel it ?",
								  :message4 => "\"WTF Look #{session[:name]} LOOK MAN are you seeing this shit too?\""}

	else erb :error, :locals => {:message1 => misc_messages.not_done} 							  

	end
end

post '/tripping_in_woods' do
name = session[:name]
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
name = session[:name]
  check = params[:checkem]
	if check == "Yeah Lets Go Check It Out"
		erb :check_em_out, :locals => {:message1 => "You get up to check out what you are seeing",:message2=>"When whatever you saw goes scampering off", 
									   :message3 =>"Do you chase after them?"}





	end
end



