class CommentsController < ApplicationController
	layout 'spots'
	def new
		@post = Post.find(params[:post_id])
	    @comment = @post.comments.new
	    @comments = Post.find(params[:post_id]).comments
	end
	def create
		@comment = Comment.new(comment_params)
		@comment.post_id = params[:post_id]
		@comment.user = current_user
			if @comment && @comment.save
			flash[:notice] = 'Your comment has been saved!'
		else
			flash[:alert] = 'There was a problem saving your comment :('
		end
		redirect_to :back
	end
	private
	def comment_params
		params.require(:comment).permit(:review)
	end
end