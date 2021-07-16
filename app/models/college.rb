class College < ApplicationRecord
    has_many :teams
    has_one_attached :shield

end
