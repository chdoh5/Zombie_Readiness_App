class WeaponsController < ApplicationController 

    def index 
        @weapons = Weapon.all.select {|weapon| weapon.user_id == nil }
        @taken_weapons = Weapon.all.select {|weapon| weapon.user_id != nil }
    end

    def update
        @weapon = Weapon.find(params[:id])
        @user = User.find_by(name: session[:name])
        @weapon.update(user_id: @user.id)
        redirect_to user_path(@user)
    end 


end

