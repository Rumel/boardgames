FactoryGirl.define do
	factory :board_game do
		sequence(:name) { |n| "Board Game #{n}" }
		sequence(:image_url) { |n| "/#{n}.jpg" }
		user
	end

	factory :user do
		sequence(:name) { |n| "User #{n}" }
		sequence(:email) { |n| "user-#{n}@example.com" }
		sequence(:password) { |n| "password#{n}" }
		sequence(:password_confirmation) { |n| "password#{n}" }
	end
end