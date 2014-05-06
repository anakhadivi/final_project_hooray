class RemoveColumnsFromUsersTable < ActiveRecord::Migration
  def change
 	remove_column :users, :username, :string
 	remove_column :users, :fname, :string
  end
end
