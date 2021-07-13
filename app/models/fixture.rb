class Fixture < ApplicationRecord
    has_many :matches
    has_many :fixture_teams
    has_many :teams, through: :fixture_teams
end
