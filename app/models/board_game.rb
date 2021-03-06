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

class BoardGame < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :game_plays

	validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :user }
	validates :rounds, if: :round_based?, numericality: { only_integer: true, greater_than: 0 }

	def image(width=200, height=200)
		unless self.image_url.blank?
			image_url
		else
			"http://placekitten.com/g/#{width}/#{height}"
		end
	end

 	def board_game?
 		if game_type.present?
 			return game_type == "boardgame"
 		end

 		#Default to true
 		true
 	end

 	def card_game?
 		return game_type == "cardgame"
 	end
end
