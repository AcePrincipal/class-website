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
        
        if @user.valid?
          session[:current_user_id] = @user.id
          flash[:message] = "You have successfully signed in!"
          redirect_to user_path(@user)
        else
            flash[:message] = @user.errors.full_messages.join(", ")
            redirect_to new_user_path
        end
      end 

    def show 
        @user = current_user
        @programs = Program.where(user_id: @user.id).order(created_at: :desc)
    end 

    def joined 
      @user = current_user
      @seats = @user.seats 
      @programs = @user.program_seats
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
