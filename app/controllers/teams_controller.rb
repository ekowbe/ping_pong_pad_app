class TeamsController < ApplicationController
    before_action :redirect_if_not_signed_in

    def index
        @teams = Team.all
    end

    def show
        @team = Team.find(params[:id])
    end
end
