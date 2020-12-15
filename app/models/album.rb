class Album < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :band}
    validates :recording_type, inclusion: {in: %w(studio live)}
    validates :year, presence: true, numericality: true

    belongs_to :band
    has_many :tracks, dependent: :destroy

    delegate :name, to: :band, prefix: true
end
