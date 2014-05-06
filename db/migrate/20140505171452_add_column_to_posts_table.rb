class AddColumnToPostsTable < ActiveRecord::Migration
  def change
  	add_column :posts, :best_at, :string
  end
end
