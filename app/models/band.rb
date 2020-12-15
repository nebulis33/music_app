class Band < ApplicationRecord
    validates :name, presence: true

    has_many :albums, dependent: :destroy
    #has_many :tracks, through: :albums
        ##not implemented until theres a use for this relation (ie an index of all the band's tracks)
end
