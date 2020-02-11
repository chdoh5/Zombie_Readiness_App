class UsersController < ApplicationController 

    def index
        @users = User.all
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
            redirect_to user_path(@user)
            # @owned_item = OwnedItem.new(user_id: @user.id, supply_id: params[:id])
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :group_id, :weapon_ids, :supply_ids => [])
    end

end

