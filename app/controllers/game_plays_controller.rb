class GamePlaysController < ApplicationController
	before_action :signed_in_user

	def index
		@game_plays = current_user.game_plays.paginate(page: params[:page], per_page: 10).order('created_at DESC')
	end

	def edit
		@game_play = GamePlay.find_by_id(params[:id])
		update_and_edit(@game_play)
	end

	def new 
		@game_play = GamePlay.new
		@board_games = current_user.board_games.sort_by { |b| b.name }
		@players = current_user.players.sort_by { |n| n.name }
	end

	def update
		if params[:board_game_id].blank?
			@game_play = GamePlay.find(params[:id])
			update_and_edit(@game_play)
			render 'edit'
		else
			@game_play = GamePlay.find(params[:id])
			@game_play.update_attributes(game_play_params)
			update_board_game(@game_play)
			update_player_ids(@game_play)
			redirect_to game_play_path(@game_play.id)
		end
	end

	def show
		@game_play = GamePlay.find(params[:id])
	end

	def create
		@game_play = current_user.game_plays.build(game_play_params)
		if params[:board_game_id].blank?
			update_and_edit(@game_play)
			render 'new'
		else
			update_board_game(@game_play)
			update_player_ids(@game_play)
			
			if @game_play.save
				redirect_to game_plays_path
			else
				render 'new'
			end
		end
	end

	def duplicate
		gp = GamePlay.find_by_id(params[:id])
		dup = gp.dup
		dup.board_game = gp.board_game
		dup.players = gp.players
		dup.save
		redirect_to game_plays_path
	end

	def destroy
		GamePlay.destroy(params[:id])
		redirect_to game_plays_path
	end

	private
		def game_play_params
			params.require(:game_play).permit(:player_ids, :board_game_id, :description)
		end

		def update_player_ids(game_play)
			player_ids = params[:game_play][:player_ids].select { |p| !p.empty? }

			game_play.players.delete_all
			player_ids.each do |p|
				player = Player.find_by_id(p)
				game_play.players << player
			end
		end

		def update_board_game(game_play)
			game_play.board_game = BoardGame.find_by_id(params[:board_game_id])
		end

		def update_and_edit(game_play)
			@board_games = current_user.board_games.sort_by { |bg| bg.name }
			@players = current_user.players.sort_by { |n| n.name }
			@player_ids = game_play.players.collect { |p| p.id }
		end
end
