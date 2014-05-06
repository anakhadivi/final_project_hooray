class UsersController < ApplicationController
	layout 'account'
	def show
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if 	@user.update_attributes(user_params)
			flash[:notice] = 'Your account has been updated'
		else
			flash[:alert] = 'There was a problem saving your account :('
		end
		redirect_to user_path(current_user)
	end
	private
	def user_params
		params.require(:user).permit(:email)
	end
end