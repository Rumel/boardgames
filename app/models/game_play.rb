class GamePlay < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :board_games
	has_and_belongs_to_many :players

	def board_game
		if self.board_games.any?
			self.board_games.first
		else
			nil
		end
	end

	def board_game=(board_game)
		if self.board_games.any?
			self.board_games.delete_all
		end
		
		self.board_games.push board_game
	end

	def date_string
		self.created_at.strftime("%-m/%d/%y")
	end
end
