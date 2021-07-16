class PlayersController < ApplicationController
    before_action :redirect_if_not_signed_in

    def index
        @players = Player.all
    end

    def show
        @player = Player.find(params[:id])
    end
end
