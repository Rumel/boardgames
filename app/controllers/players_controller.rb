class PlayersController < ApplicationController
	before_action :signed_in_user

	def new
		@player = Player.new
	end

	def create
		@player = current_user.players.build(player_params)
		if @player.save
			redirect_to players_path
		else
			render 'new'
		end
	end

	def index
		@players = current_user.players.sort_by { |p| p.name }
	end

	def show
		@player = Player.find_by_id(params[:id])
	end

	private

		def player_params
			params.require(:player).permit(:name)
		end
end
