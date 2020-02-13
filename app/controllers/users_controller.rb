class UsersController < ApplicationController 
    include SessionsHelper

    def index
        @users = User.all.page(params[:page])
    end

    def new
        @user = User.new
        @supplies = Supply.all
        @weapons = Weapon.all.select {|weapon| weapon.user_id == nil}
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            @weapon = Weapon.find(params[:user][:weapon_ids])
            @weapon.update(user_id: @user.id)
            params[:user][:supply_ids].each do |supply_id|
                OwnedItem.create(user_id: @user.id, supply_id: supply_id)
            end 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
            # @owned_item = OwnedItem.new(user_id: @user.id, supply_id: params[:id])
        else
            render :new
        end
    end

    def show
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
        @user = User.find(params[:id])
    end

    def edit

    end 



    private
    
    def user_params
        params.require(:user).permit(:name, :password, :group_id)
    end

    # def supply_params
    #     params.require(:user).permit(:supply_ids)
    # end 

    # def weapon_params
    #     params.require(:user).permit(:weapon_ids)
    # end 

end

