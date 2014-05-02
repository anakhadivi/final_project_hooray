class CommentsController < ApplicationController
	def index
		@comments = Comment.where(params[:post_id])
		@post = Post.find(params[:post_id])
	end
	def new
		@post = Post.find(params[:post_id])
	    @comment = @post.comments.new
	    @comments = Comment.all(params[:id])
	end
	def create
		@comment = Comment.new
		@comment.post_id = params[:post_id]
		@comment.user = current_user
		if @comment.save
			flash[:notice] = 'Your comment has been saved!'
		else
			flash[:alert] = 'There was a problem saving your comment :('
			
		end
		redirect_to posts_path
	end

end