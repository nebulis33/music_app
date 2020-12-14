class Album < ApplicationRecord
    validates :title, :year, presence: true
    validates :recording_type, inclusion: {in: %w(studio live)}

    belongs_to :band

    delegate :name, to: :band, prefix: true
end
