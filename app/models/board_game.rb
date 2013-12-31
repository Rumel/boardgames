class BoardGame < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true, uniqueness: { case_sensitive: false }
end
