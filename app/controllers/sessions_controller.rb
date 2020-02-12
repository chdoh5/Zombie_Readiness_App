class SessionsController < ApplicationController
    include SessionsHelper
    before_action :authorize!, except: [:new, :create]

    def new
        if session[:name] 
            redirect_to '/'
        end

    end

    def create 
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "You Don't Belong Here!"
            redirect_to '/login'
        end
        # if !params[:name] || params[:name].empty?
        #      redirect_to(controller: 'sessions', action: 'new')
        # elsif
        #     session[:name] = params[:name]
        #     redirect_to(controller: 'application', action: 'hello')
        # end
    end

    def destroy
        session.delete :name
        redirect_to '/'
    end
        



end
