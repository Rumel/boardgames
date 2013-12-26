FactoryGirl.define do
	factory :board_game do
		sequence(:name) { |n| "Board Game #{n}" }
		sequence(:image_url) { |n| "/n.jpg" }
	end
end