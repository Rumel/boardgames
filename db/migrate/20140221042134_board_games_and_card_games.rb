class BoardGamesAndCardGames < ActiveRecord::Migration
  def change
  	add_column :board_games, :game_type, :string
  end
end
