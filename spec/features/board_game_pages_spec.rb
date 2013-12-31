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

	describe "Edit page" do
		let!(:bg) { FactoryGirl.create(:board_game) }

		before { visit edit_board_game_path(bg.id) }

		it { should have_field("Name") }
		it { should have_field("Image Url") }
		it { should have_button("Save") }
	end

	describe "Show Page" do
		let!(:bg) { FactoryGirl.create(:board_game) }

		before { visit board_game_path(bg.id) }

		it { should have_content(bg.name) }
		it { should have_link("Edit", href: edit_board_game_path(bg.id)) }
	end
end