class FixturesController < ApplicationController
    def index
        @fixture_dates = Fixture.dates
        @upcoming_fixture_dates = @fixture_dates.select{|date| date > Time.now}
        @fixtures_by_date = Fixture.fixtures_by_date
    end

    def show
        @fixture = Fixture.find(params[:id])
        @team1 = @fixture.teams[0]
        @team2 = @fixture.teams[1]

    end

    private 




end

