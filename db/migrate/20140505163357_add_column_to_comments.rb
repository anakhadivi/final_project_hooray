class AddColumnToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :review, :string
  end
end
