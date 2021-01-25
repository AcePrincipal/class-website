class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:username])
        # user = user.try(:authenticate, params[:username][:password])

        if user
            session[:current_user_id] = user.id
            flash[:message] = "You have successfully signed in!"
            redirect_to user_path(user)
        else
            flash[:message] = "Username or password incorrect"
            redirect_to "/login"
        end
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:current_user_id] = user.id
            flash[:message] = "You have successfully signed in with Google Oauth"
            redirect_to user_path(user)
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to "/"
        end
    end 

    def destroy
        session.delete("current_user_id")

        flash[:message] = "You have successfully logged out!"
        redirect_to "/"
    end 

    private 

    def auth 
        request.env['omniauth.auth']
    end 
end
