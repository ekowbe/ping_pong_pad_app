class FixturesController < ApplicationController
    def index
        @upcoming_fixtures = Fixture.upcoming_fixtures
        @past_fixtures = Fixture.past_fixtures
        @fixture_dates = Fixture.dates
        @upcoming_fixture_dates = @fixture_dates.select{|date| date > Time.now}
        @past_fixture_dates = @fixture_dates.select{|date| date < Time.now}
        @fixtures_by_date = Fixture.fixtures_by_date
        
    end


end

