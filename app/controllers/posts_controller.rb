class PostsController < ApplicationController
	layout 'spots'
	def index
		if params[:tag]
			@posts = Post.page(params[:page]).tagged_with(params[:tag])
		else
			@posts = Post.page(params[:page])
		end
	end
	def show
		@post = Post.find(params[:id])		
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
	def delete
		@post = Post.find(params[:id])
	end
	def destroy
		@post = Post.find(params[:id])
		if @post && @post.destroy
			flash[:notice] = 'Spot has been deleted'
		else
			flash[:alert] = 'There was a problem deleting your spot'
		end
		redirect_to user_path(current_user)
	end
	private
	def post_params
		params.require(:post).permit(:location, :notes, :image, :taglist)
	end
end

