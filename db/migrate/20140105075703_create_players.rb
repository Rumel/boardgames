class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
    	t.belongs_to :user
    	t.string :name

    	t.timestamps
    end

    create_table :game_plays_players do |t|
    	t.belongs_to :player
    	t.belongs_to :game_play
    end
  end
end
