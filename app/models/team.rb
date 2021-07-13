class Team < ApplicationRecord
    has_many :players
    has_many :fixture_teams
    has_many :fixtures, through: :fixture_teams
end
