class Player < ApplicationRecord
    belongs_to :team
    has_many :match_players
    has_many :matches, through: :match_players
    has_many :fixtures, through: :matches
end
