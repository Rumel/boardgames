require 'spec_helper'

describe "Board Game pages" do
	
	subject { page }

	describe "Index page" do
		let!(:bg1) { FactoryGirl.create(:board_game) }
		let!(:bg2) { FactoryGirl.create(:board_game) }

		before { visit board_games_path }
		
		it { should have_content(bg1.name) }
		it { should have_content(bg2.name) }
	end
end