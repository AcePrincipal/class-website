class UsersController < ApplicationController

    def welcome 
      if session[:current_user_id]
        redirect_to user_path(session[:current_user_id])
      end 
    end 
    
    def new 
        @user = User.new 
    end 

    def create 
        @user = User.create(user_params)
        # @user = User.new 
        # @user.username = params[:username]
        # @user.email = params[:email]
        # @user.password = params[:password]

        # @user.save 

        redirect_to "/login"
    end 

    def show 
        @user = current_user
        @programs = Program.where(user_id: @user.id).order(created_at: :desc)
    end 

    private
    def user_params
      params.require(:user).permit(
        :username,
        :email,
        :password
      )
    end
end
