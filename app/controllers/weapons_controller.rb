class WeaponsController < ApplicationController 

    def index 
        @weapons = Weapon.all.select {|weapon| weapon.user_id == nil }
        @taken = Weapon.all.select {|weapon| weapon.user_id != nil }
        @taken_weapons = Kaminari.paginate_array(@taken).page(params[:page]).per(10)
    end

    def update
        @weapon = Weapon.find(params[:id])
        @user = User.find(session[:user_id])
        @weapon.update(user_id: @user.id)
        redirect_to user_path(@user)
    end 


end

