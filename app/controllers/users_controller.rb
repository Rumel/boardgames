class UsersController < ApplicationController
  	def new
      if signed_in?
        redirect_to board_games_path
      else
        @user = User.new
      end
  	end

  	def create
  		@user = User.new(user_params)
  		if @user.save
        sign_in @user
  			redirect_to board_games_path
  		else
  			render 'new'
  		end
  	end

  	private

  		def user_params
  			params.require(:user).permit(:name, :email,
  					 :password, :password_confirmation)
  		end
end
