class OwnedItemsController < ApplicationController

    def destroy 
        @item = OwnedItem.find(params[:id])
        user = @item.user
        @item.destroy
        redirect_to user_path(user)
    end 
end
