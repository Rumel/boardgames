class BoardGame < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :game_plays

	validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :user }
	validates :rounds, if: :round_based?, numericality: { only_integer: true, greater_than: 0 }
end
