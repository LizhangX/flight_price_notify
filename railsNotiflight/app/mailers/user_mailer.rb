class UserMailer < ApplicationMailer
    default from: "no-reply@notiflight.com"
    
    def notiflight_email_lower(flight, price)
        @flight = flight
        @lowerPrice = flight.lowerPrice
        @price = price
        @url = "https://www.google.com/flights/?f=0&gl=us#search;f=#{flight.departureAirport};t=#{flight.arrivingAirport};d=#{flight.departureDate};r=#{flight.returnDate}"

        mail(to: @flight.user.email, subject: "Your Flight's Price DROPS!")
    end

    def notiflight_email_upper(flight, price)
        @flight = flight
        @upperPrice = flight.upperPrice
        @price = price
        @url = "https://www.google.com/flights/?f=0&gl=us#search;f=#{flight.departureAirport};t=#{flight.arrivingAirport};d=#{flight.departureDate};r=#{flight.returnDate}"

        mail(to: @flight.user.email, subject: "Your Flight's Price GOES UP!")
    end
end