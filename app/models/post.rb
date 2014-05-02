class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	# attr_accessor :content, :name, :tag_list
	acts_as_taggable

	has_attached_file :image, :styles => { :medium => "150x150>", :thumb => "60x60>" }, 
	:default_url => "/images/default_:style_avatar.png"
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
end
