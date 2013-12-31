class AddHasManyBoardGamesToUsers < ActiveRecord::Migration
  def change
  	change_table :board_games do |t|
  		t.belongs_to :user
  	end
  end
end
