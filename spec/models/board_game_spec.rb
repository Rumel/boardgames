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