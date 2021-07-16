class Fixture < ApplicationRecord
    has_many :matches
    has_many :fixture_teams #each fixture has 2 fixture_teams
    has_many :teams, through: :fixture_teams

    def format_date_time
        min = self.date_time.min - self.date_time.min % 15
        # we want the minutes to occur in multiples of 15
        self.date_time.strftime("%A, %B %d, %Y %H:#{min}")
    end

    def self.in_order
        Fixture.all.sort_by{|fixture| fixture.date_time}
    end

    def self.upcoming_fixtures
        Fixture.in_order.select{|fixture| fixture.date_time > Time.now}
    end

    def self.past_fixtures
        Fixture.in_order.select{|fixture| fixture.date_time < Time.now}
    end

    def self.date_times
        date_times = Fixture.in_order.map{|fixture| fixture.date_time}
    end

    def self.dates
        dates = Fixture.date_times.map{|dt| dt.to_date}.uniq
    end

    def self.fixtures_by_date
        fixtures_by_date = {}
        dates = Fixture.dates
        dates.each do |date|
            fixtures_on_current_date = Fixture.in_order.select{|f| f.date_time.to_date == date}
            fixtures_by_date[date] = fixtures_on_current_date
        end

        fixtures_by_date
    end

    def calculate_winner
        team1, team2 = self.teams
        
        # get score for each team
        scores = self.fixture_teams.sort_by{|ft| ft.score}

        #team1_score = 

        
    end
end
