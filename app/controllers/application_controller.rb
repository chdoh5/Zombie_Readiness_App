class ApplicationController < ActionController::Base
    include SessionsHelper

    def hello 
        redirect_to controller: 'sessions', action: 'new' unless session[:user_id]
        @supplies = Supply.all
        @owned_items = OwnedItem.all
      end


end
