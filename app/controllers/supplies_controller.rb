class SuppliesController < ApplicationController 

    def index
        @supplies = Supply.all
    end

    def show 
        @supply = Supply.find(params[:id])
    end 


end

