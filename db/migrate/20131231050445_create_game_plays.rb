class CreateGamePlays < ActiveRecord::Migration
  def change
    create_table :game_plays do |t|
      t.belongs_to :user

      t.timestamps
    end

    create_table :board_games_game_plays do |t|
      t.belongs_to :game_play
      t.belongs_to :board_game
    end
  end
end
