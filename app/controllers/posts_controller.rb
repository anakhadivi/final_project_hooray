class PostsController < ApplicationController
	layout 'spots'
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])		
		@comments = Post.find(params[:id]).comments
	end
	def new 
		@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post && @post.save
			flash[:notice] = 'Your post has been saved'
		else
			flash[:alert] = 'There was a problem saving your post :('
			
		end
		redirect_to posts_path
	end
	private
	def post_params
		params.require(:post).permit(:location, :notes, :image)
	end
end

