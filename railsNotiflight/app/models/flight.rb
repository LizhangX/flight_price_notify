class Flight < ApplicationRecord
    belongs_to :user
    has_many :prices, dependent: :destroy

    validates :departureAirport, :arrivingAirport, :departureDate, :returnDate, :lowerPrice, :upperPrice, :tracking, presence: true
    validates_date :departureDate, on_or_after: :today
    validates_date :returnDate, on_or_after: :today
end
