class GroupsController < ApplicationController 

    def index
        @groups = Group.all
    end

    def show
        @group = Group.find(params[:id])
        @score = @group.readiness
    end


end

