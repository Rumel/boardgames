# == Schema Information
#
# Table name: board_games
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  image_url            :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  user_id              :integer
#  description          :text
#  rule_book_link       :string(255)
#  starting_player_rule :string(255)
#  round_based          :boolean
#  rounds               :integer
#

require 'spec_helper'

describe BoardGame do

	before do
		@board_game = BoardGame.new(name: "Smash Up", image_url: "/smash_up.jpg")
	end

	subject { @board_game }

	it { should respond_to(:name) }
	it { should respond_to(:image_url) }

	describe "when name is not present" do
		before { @board_game.name = " " }
		it { should_not be_valid }
	end
end
