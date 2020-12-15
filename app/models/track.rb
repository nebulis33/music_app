class Track < ApplicationRecord
    validates :ord, :title, presence: true, uniqueness: {scope: :album}
    validates :title, :album_id, presence: true

    belongs_to :album
    has_one :band, through: :album
end
