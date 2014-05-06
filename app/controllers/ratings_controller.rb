class RatingsController < ApplicationController
before_filter :set_post
	def create
		@rating = @post.ratings.new :value => params[:value]
		if @rating && @rating.save
			flash[:notice] = 'Your rating was saved successfully'
		else
			flash[:alert] = 'There was a problem saving your rating :('
		end
		redirect_to posts_path
	end
end