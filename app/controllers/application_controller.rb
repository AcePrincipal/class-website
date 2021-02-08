class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user 
        if session[:current_user_id]
            @current_user = User.find(session[:current_user_id])
        end 
    end 

    def logged_in?
        !!session[:current_user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end 
end
