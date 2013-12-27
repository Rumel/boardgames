require 'spec_helper'

describe "Authentication" do

	subject { page }
	
	describe "Login" do
		before { visit signin_path }

		describe "with invalid information" do
			before { click_button "Login" }

			it { should have_text("Login") }
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email", with: user.email
				fill_in "Password", with: user.password
				click_button "Login"
			end

			it { should have_content(user.name) }

			describe "followed by sign out" do
				before { click_link "Sign out" }

				it { should have_content("Login") }
			end
		end
	end
end