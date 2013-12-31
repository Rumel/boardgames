require 'spec_helper'

describe "Board Game pages" do
	
	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	let(:user2) { FactoryGirl.create(:user) }

	let!(:bg) { FactoryGirl.create(:board_game, user: user) }
	let!(:bg2) { FactoryGirl.create(:board_game, user: user) }
	let!(:bg3) { FactoryGirl.create(:board_game, user: user2) }

	describe "Index page" do

		describe "when signed out" do
			before { visit board_games_path }

			it { should_not have_content(bg.name) }
			it { should_not have_content(bg2.name) }
			it { should have_content("Login") }
		end

		describe "When signed in" do
			before  do
				signin user
			end

			it { should have_content(bg.name) }
			it { should have_content(bg2.name) }
			it { should_not have_content(bg3.name) }
		end
	end

	describe "Edit page" do
		
		describe "When signed out" do
			before { visit edit_board_game_path(bg.id) }

			it { should have_content("Login") }
		end

		describe "When signed in" do
			before { signin user }

			describe "Shouldn't be able to edit another user's game" do
				before { visit edit_board_game_path(bg3.id) }

				it { should_not have_field("Name") }
				it { should_not have_field("Image Url") }
				it { should_not have_button("Save") }
			end

			describe "Should be able to edit their game" do
				before { visit edit_board_game_path(bg.id) }

				it { should have_field("Name") }
				it { should have_field("Image Url") }
				it { should have_button("Save") }
			end
		end
	end

	describe "Show Page" do

		describe "When signed out" do
			before { visit board_game_path(bg.id) }

			it { should have_content("Login") }
		end

		describe "When signed in" do
			before { signin user }

			describe "Shouldn't be able to see another user's game" do
				before { visit board_game_path(bg3.id) }

				it { should_not have_content(bg3.name) }
			end

			describe "Should be able to see their own game" do
				before { visit board_game_path(bg.id) }

				it { should have_content(bg.name) }
				it { should have_link("Edit", href: edit_board_game_path(bg.id)) }
			end
		end
	end
end