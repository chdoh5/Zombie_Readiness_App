class ApplicationController < ActionController::Base
    include SessionsHelper

    def hello 
        redirect_to controller: 'sessions', action: 'new' unless session[:user_id]
      end


end
