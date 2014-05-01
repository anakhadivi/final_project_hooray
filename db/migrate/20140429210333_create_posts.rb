class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :location
    	t.string :notes
    	t.integer :user_id
      t.timestamps
    end
  end
end
