class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:username])
        # user = user.try(:authenticate, params[:username][:password])

        return redirect_to(controller: 'sessions', action: 'new') unless user

        session[:current_user_id] = user.id
        @user = user

        redirect_to user_path(@user)
    end

    def destroy
        session.delete("current_user_id")

        redirect_to "/"
    end 
end
