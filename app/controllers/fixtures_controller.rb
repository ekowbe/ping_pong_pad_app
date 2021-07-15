class FixturesController < ApplicationController
    def index
        @upcoming_fixtures = Fixture.upcoming_fixtures
        @past_fixtures = Fixture.past_fixtures
    end

    
end

