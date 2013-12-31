include ApplicationHelper

def signin(user)
	visit signin_path
	fill_in "Email", with: user.email
	fill_in "Password", with: user.password
	click_button "Login"
end

def signout(user)
	visit signout_path
end