class AddFacebookToPlayer < ActiveRecord::Migration
  def change
  	add_column :players, :facebook, :string
  end
end
