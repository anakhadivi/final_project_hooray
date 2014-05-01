class UsersController < ApplicationController
	layout 'account'
	def index
		
	end
	def new
		
	end
	def show
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user && @user.save
			flash[:notice] = 'Your account has been updated'
		else
			flash[:alert] = 'There was a problem saving your account :('
		end
		redirect_to user_path(current_user)
	end
end