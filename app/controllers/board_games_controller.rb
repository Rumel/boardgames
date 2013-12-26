class BoardGamesController < ApplicationController

	def index
		@board_games = BoardGame.all.sort_by { |boardgame| boardgame.name }

		respond_to do |format| 
			format.html
			format.json { render json: @board_games }
		end
	end

	def new
		@board_game = BoardGame.new
	end

	def create
		@board_game = BoardGame.new(board_game_params)

		@board_game.save

		redirect_to board_games_path
	end

	def edit
		@board_game = BoardGame.find(params[:id])
	end

	def show
		@board_game = BoardGame.find(params[:id])
	end

	def update
		@board_game = BoardGame.find(params[:id])
		if @board_game.update_attributes(board_game_params)
			flash[:success] = "Board game updated"
			redirect_to board_games_path
		else
			render 'edit'
		end
	end

	private

		def board_game_params
			params.require(:board_game).permit(:name, :image_url)
		end
end
