class Team < ApplicationRecord
    belongs_to :college
    has_many :players
    has_many :fixture_teams
    has_many :fixtures, through: :fixture_teams

    def num_games_played
        self.fixture_teams.count
    end

    def num_games_won
        self.fixture_teams.select{|ft| ft.winner == 1}
    end

    def num_games_lost
    end


end
