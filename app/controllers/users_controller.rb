class UsersController < ApplicationController
  	def new
  		@user = User.new
  	end

  	def create
  		@user = User.new(user_params)
  		if @user.save
  			redirect_to board_games_path
  		else
  			# Do some error stuff here
  			render 'new'
  		end
  	end

  	private

  		def user_params
  			params.require(:user).permit(:name, :email,
  					 :password, :password_confirmation)
  		end
end
