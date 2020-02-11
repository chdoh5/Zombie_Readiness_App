class GroupsController < ApplicationController 
    before_action :require_login

    def index
        @groups = Group.all
    end

    def show
        @group = Group.find(params[:id])
        @score = @group.readiness
    end

    private 

    def require_login
       
        return head(:forbidden) unless session.include? :name
    end


end

