get '/available_room' do
	@available_room = Game.where( status: "started" )
	erb :"game/show_available_room"
end

get '/create_room' do
	@player = Player.find_by( username: session[:username] )
	erb :"game/create_room"
end

post '/create_room' do
	# for reference
	# @game = Game.create( room_name: params[:room_name], player1_id: params[:user_id] )
	player1 = Player.find( params[:player1_id] )
	game = player1.games.create( room_name: params[:room_name], player1_id: params[:player1_id], status: "started" )

	redirect "/room/#{game.id}"
end

# for viewing
get '/room/:id' do
	@game = Game.find( params[:id])
	@player1 = Player.find( @game.player1_id )

	erb :"board/show"
end

# to start the game
get '/game/:id' do
	@game = Game.find( params[:id])
	@player1 = Player.find( @game.player1_id )
	@player2 = Player.find_by( username: session[:username] )

	if @player1 != @player2
		@game.update( player2_id: @player2.id, status: "on-going")
		PlayerGame.create(player_id: @player2.id, game_id: @game.id)
		erb :"board/show"
	else
		@error.message = "You can't play against yourself"
		erb :index
	end
end

# get '/game/board' do
# 	@game = Game.find( params[:id])
# 	@player1 = Player.find( @game.player1_id )
# 	@player2 = Player.find_by( username: session[:username] )
	
#   erb :"game/board"
# end