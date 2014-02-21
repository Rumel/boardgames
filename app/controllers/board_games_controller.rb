class BoardGamesController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: [:edit, :update, :show]

	def index
		@board_games = current_user.board_games
										.sort_by { |boardgame| boardgame.name }
										.select { |boardgame| boardgame.board_game? }
		@card_games = current_user.board_games
										.sort_by { |boardgame| boardgame.name }
										.select { |boardgame| boardgame.card_game? }
	end

	def new
		@url = 'create'
		@board_game = BoardGame.new
	end

	def create
		@board_game = current_user.board_games.new(board_game_params)

		@board_game.save

		redirect_to board_games_path
	end

	def edit
		@url = 'update'
		@board_game = BoardGame.find(params[:id])
	end

	def show
		@board_game = BoardGame.find(params[:id])
	end

	def update
		@url = 'update'
		@board_game = BoardGame.find(params[:id])
		if @board_game.update_attributes(board_game_params)
			flash[:success] = "Board game updated"
			redirect_to board_game_path(@board_game.id)
		else
			render 'edit'
		end
	end

	private

		def board_game_params
			params.require(:board_game).permit(:name, :image_url, :description,
				:rule_book_link, :starting_player_rule, :round_based, :rounds, :game_type)
		end

		def correct_user
			if !current_user.board_games.include?(BoardGame.find(params[:id]))
				redirect_to board_games_path
			end
		end
end
