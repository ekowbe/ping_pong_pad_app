class Team < ApplicationRecord
    belongs_to :college
    has_many :players
    has_many :fixture_teams
    has_many :fixtures, through: :fixture_teams
end
