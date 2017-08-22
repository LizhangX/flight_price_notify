class FlightMailer < ApplicationMailer
    default from: "no-reply@notiflight.com"

    def notiflight_email(flight)
        @flight = flight
        prices = Price.all.where(flight: flight)
        @price_original = prices.first.price
        @price_last = prices.last.price
        @url = "https://www.google.com/flights/?f=0&gl=us#search;f=#{flight.fport};t=#{flight.tport};d=#{flight.ddate};r=#{flight.rdate}"

        mail(to: @flight.email, subject: "Your Flight's Price!")
    end
end
