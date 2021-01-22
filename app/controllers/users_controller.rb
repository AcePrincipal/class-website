class UsersController < ApplicationController

    def welcome 
    end 
    
    def new 
    end 

    def create 
        @user = User.new 
        @user.username = params[:username]
        @user.email = params[:email]
        @user.password = params[:password]

        @user.save 

        redirect_to "/login"
    end 

    def show 
        @user = current_user
    end 
end
