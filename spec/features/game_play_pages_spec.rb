require 'spec_helper'

describe GamePlay do

	let!(:user) { FactoryGirl.create(:user) }

	subject { page }

	describe "New" do
		describe "when signed out" do
			before { visit new_game_play_path }

			it { should have_content("Login") }
		end

		describe "when signed in" do
			before do
				signin user
				visit new_game_play_path
			end

			it { should have_content("New Game Play") }
			it { should have_select(:board_game_id) }
			it { should have_button("Save") }
		end
	end
end
