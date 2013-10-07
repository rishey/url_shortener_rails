class UsersController < ApplicationController
	def index
	end

	def new
	end

	def create
		# render text: params[:user].inspect
		@user = User.new(user_params)
		if @user.save
			session[:id]=@user.id
			redirect_to root_path
		end
		
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end