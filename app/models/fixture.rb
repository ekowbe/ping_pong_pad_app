class Fixture < ApplicationRecord
    has_many :fixture_teams #each fixture has 2 fixture_teams
    has_many :teams, through: :fixture_teams

    def format_date_time
        min = self.date_time.min - self.date_time.min % 15
        # we want the minutes to occur in multiples of 15
        self.date_time.strftime("%A, %B %d, %Y %H:#{min}")
    end

end
