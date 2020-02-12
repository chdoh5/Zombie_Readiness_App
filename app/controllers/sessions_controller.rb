class SessionsController < ApplicationController
    include SessionsHelper
    before_action :authorize!, except: [:new, :create]

    def new
        if session[:user_id] 
            p session[:user_id]
            redirect_to '/'
        end

    end

    def create 
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to(controller: 'application', action: 'hello')
        else
            flash[:message] = "You Don't Belong Here!"
            redirect_to '/login'
        end
       
    end

    def destroy
        
        session.delete :user_id
        redirect_to '/login'
    end
        



end
