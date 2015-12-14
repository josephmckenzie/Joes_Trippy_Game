require 'sinatra'



ai = AI.new()

get '/tictactoe' do
	erb :gametype, :locals => {:message => "", :board => ai.game_board.board}
end

post '/tictactoe' do
	ai.game_players.type = params[:gametype]
	if ai.game_players.type == "1"
		erb :level, :locals => {:message => "You Chose to play a 1 player game", :board => ai.game_board.board}
	else
		erb :marker, :locals => {:message => "You Chose to play a 2 player game", :board => ai.game_board.board}
	end
end

post '/marker' do
		ai.level = params[:difficulty] if ai.game_players.type == "1"
	
	erb :marker, :locals => {:message => "Really your gonna play that level?", :board => ai.game_board.board}
end

post '/squares' do
	ai.game_players.player1 = params[:XorO]
	ai.game_players.player2 = ai.game_players.p2()
	erb :squares, :locals => {:p1 => ai.game_players.player1, :p2 => ai.game_players.player2, 
							  :message => "Player 1 is #{ai.game_players.player1} so Player 2 is #{ai.game_players.player2} ", :message2 => "", 
							  :current => ai.game_players.current, :board => ai.game_board.board, :type => ai.game_players.type, :invaild => ""}
end

post '/game' do
	choice = params[:choice].to_i
	player_marker = ai.game_players.current_player()
	
	if ai.game_board.square_available?(choice - 1) == true
		ai.game_board.board[choice - 1] = player_marker
		redirect to('/status')
	else
		erb :squares, :locals => {:p1 => ai.game_players.player1, :p2 => ai.game_players.player2, 
								  :invaild => "#{choice} is already taken", :error2 => "Please choose again.",:message => "",:message2 => "", 
								  :current => ai.game_players.current, :board => ai.game_board.board, :type => ai.game_players.type}
	end	
end

get '/cpu' do
	sleep 1
	player_marker = ai.game_players.current_player()
	move = ai.computer_move(ai.level)
	ai.game_board.board[move] = player_marker
	redirect to('/status')
end

get '/status' do
	if ai.game_board.winner?(ai.game_players.current_player) == true
		redirect to('/win')
	elsif ai.game_board.board_full?() == true
		
	end
	
	ai.game_players.current = ai.game_players.change()
	redirect to('/cpu') if ai.game_players.type == "1" && ai.game_players.current == 2
	erb :squares, :locals => {:p1 => ai.game_players.player1, :p2 => ai.game_players.player2, 
							  :invaild => "", :message => "", :message2 => "", 
							  :current => ai.game_players.current, :board => ai.game_board.board, :type => ai.game_players.type}	
end

get '/win' do
	erb :gameover, :locals => {:message => "!!! Hey player #{ai.game_players.current} you win !!!", :board => ai.game_board.board}
end

get '/tie' do
	erb :gameover, :locals => {:message => "It's a tie.", :board => ai.game_board.board}
end

post '/new' do
	ai = AI.new()
	# game_board = Board.new()
	# players = Players.new()
	redirect to('/tictactoe')
end