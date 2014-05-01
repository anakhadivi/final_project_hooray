class AddImageColumnsToPosts < ActiveRecord::Migration
  def self.up
  	add_attachment :posts, :image
  end
  def method_name
  	self.down
  	remove_attachment :posts, :image
  end
end
