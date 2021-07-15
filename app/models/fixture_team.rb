class FixtureTeam < ApplicationRecord
    belongs_to :fixture
    belongs_to :team

    def calculate_score
        c = 0
        self.team.matches
    end

    def calculate_winner
    end
end
