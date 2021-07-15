class Player < ApplicationRecord
    belongs_to :team
    has_many :match_players
    has_many :matches, through: :match_players

    def name
        "#{self.first_name} #{self.last_name}"  
    end
end
