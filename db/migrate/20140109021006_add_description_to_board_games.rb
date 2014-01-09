class AddDescriptionToBoardGames < ActiveRecord::Migration
  def change
  	add_column :board_games, :description, :text
  	add_column :board_games, :rule_book_link, :string
  	add_column :board_games, :starting_player_rule, :string
  	add_column :board_games, :round_based, :boolean
  	add_column :board_games, :rounds, :integer
  end
end
