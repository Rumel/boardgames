# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  facebook   :string(255)
#

class Player < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :game_plays

	validates :name, presence: true, length: { maximum: 50 },
	 uniqueness: { case_sensitive: false}

	def image_url(width=100, height=100)
		unless self.facebook.blank?
			"https://graph.facebook.com/#{self.facebook}/picture?width=#{width
			}&height=#{height}"
		else
			"http://placekitten.com/g/#{width}/#{height}"
		end
	end
end
