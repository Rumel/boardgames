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

	def edit
		@player = Player.find_by_id(params[:id])
	end

	def update
		@player = Player.find_by_id(params[:id])
		if @player.update_attributes(player_params)
			redirect_to player_path(@player.id)
		else
			render 'edit'
		end
	end

	private

		def player_params
			params.require(:player).permit(:name, :facebook)
		end
end
