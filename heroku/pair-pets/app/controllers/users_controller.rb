class UsersController < ApplicationController
	before_action :require_login
	skip_before_action :require_login, only: [:new, :create]

	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
		@pets = @user.pets
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		session.clear
		redirect_to root_path
	end




private

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :city, :image, :description)
	end


end
