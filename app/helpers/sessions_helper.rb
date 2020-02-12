module SessionsHelper

    def logged_in?
        !!current_user
    end

    def current_user
        if session[:name]
            @current_user ||= User.find_by(name: session[:name])
        end
    end


    def authorize!
        redirect_to '/login' unless logged_in?
    end




end