class SessionsController < ApplicationController
	def new
		if signed_in?
			redirect_to board_games_path
		end
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to board_games_path
		else
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
