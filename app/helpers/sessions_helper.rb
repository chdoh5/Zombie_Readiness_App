module SessionsHelper

    def logged_in?
        !!current_user
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        end
    end


    def authorize!
        redirect_to '/login' unless logged_in?
    end




end