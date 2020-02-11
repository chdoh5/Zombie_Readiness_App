class WeaponsController < ApplicationController 

    def index 
        @weapons = Weapon.all.select {|weapon| weapon.user_id == nil}
    end


end

