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

	def login
		puts "hi"
	end

	def authenticate
		session.clear
		user = User.find_by(email: params[:login][:email]).try(:authenticate, params[:login][:password]) 
		if user
			session[:id]=user.id
			redirect_to root_path
		else
			render 'login'
		end
	end

	def logout
		session.clear
		redirect_to root_path
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end