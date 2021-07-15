class Player < ApplicationRecord
    belongs_to :team
    has_many :match_players
    has_many :matches, through: :match_players
<<<<<<< HEAD

    def name
        "#{self.first_name} #{self.last_name}"  
    end
=======
    has_many :fixtures, through: :matches
>>>>>>> 44895ffb6d9a9773652b83688aa9634f34fb9e48
end
