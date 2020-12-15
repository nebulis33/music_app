class Track < ApplicationRecord
    validates :ord, :title, presence: true, uniqueness: {scope: :album}
    validates :title, :album_id, presence: true

    delegate :title, to: :album, prefix: true
    delegate :year, to: :album, prefix: true
    delegate :name, to: :band, prefix: true

    belongs_to :album
    has_one :band, through: :album
end
