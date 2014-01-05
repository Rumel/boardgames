class Player < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :game_plays

	validates :name, presence: true, length: { maximum: 50 },
	 uniqueness: { case_sensitive: false}
end