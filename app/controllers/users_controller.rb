class UsersController < ApplicationController 

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
        else
            redirect_to :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :group)
    end

end
