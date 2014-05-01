class PostsController < ApplicationController
	layout 'spots'
	def index
		@posts = Post.page(params[:page])
	end
	def show
		@post = Post.find(params[:id])		
	end
	def new 
		@post = Post.new
	end
	def create
		@post = Post.new
		@post.user = current_user
		if @post && @post.save
			flash[:notice] = 'Your post has been saved'
		else
			flash[:alert] = 'There was a problem saving your post :('
			
		end
		redirect_to post_path(@post)
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

end
