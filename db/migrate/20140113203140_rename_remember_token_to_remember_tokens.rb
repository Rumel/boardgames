class RenameRememberTokenToRememberTokens < ActiveRecord::Migration
  def change
  	rename_column :users, :remember_token, :remember_tokens
  end
end
