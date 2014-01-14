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