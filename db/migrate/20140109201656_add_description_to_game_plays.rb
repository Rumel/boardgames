class AddDescriptionToGamePlays < ActiveRecord::Migration
  def change
  	add_column :game_plays, :description, :text
  end
end
