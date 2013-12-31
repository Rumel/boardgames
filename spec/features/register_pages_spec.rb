require 'spec_helper'

describe "Register" do
	subject { page }

	describe "Register Page" do
		describe "Signing a user up" do
			before { visit register_path }

			it { should have_content("Register") }

			describe "with invalid information" do
				before { click_button "Register" }

				it { should have_content("Register") }
			end

			describe "with valid information" do
				before do 
					fill_in "Name", with: "Test User"
					fill_in "Email", with: "test@test.com"
					fill_in "Password", with: "testtest"
					fill_in "Password Confirmation", with: "testtest"
					click_button "Register"
				end

				it { should have_content("Test User") }
			end
		end
	end
end