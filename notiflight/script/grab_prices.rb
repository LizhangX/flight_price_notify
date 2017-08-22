ENV['RAILS_ENV'] = "development" # Set to your desired Rails environment name
require "/Users/ali/Desktop/CodingDojo.nosync/Projects/flight_price_notify/notiflight/config/environment.rb"
require 'capybara/poltergeist'
# require 'Pry'
# require 'Nokogiri'
# require 'HTTParty'

Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

Capybara.default_driver = :poltergeist

browser = Capybara.current_session

flights = Flight.all
flights.each do |flight|
    browser.visit "https://www.google.com/flights/?f=0&gl=us#search;f=#{flight.fport};t=#{flight.tport};d=#{flight.ddate};r=#{flight.rdate}"
    sleep(3)
    price = browser.all(".EIGTDNC-d-Ab").first.text
    price = Price.create(price: price, flight: flight)
    # puts price 
    prices = Price.all.where(flight: flight)
    price_origin = prices.first.price
    price_last = prices.last.price
    FlightMailer.notiflight_email(flight).deliver_now
    puts "sent email to #{flight.email}"
    puts price_origin
    puts price_last
    if price_last < price_origin
        puts "yeah"
    else
        puts "same or more"
    end
    puts Time.now
    puts "-------"
end
# browser.visit "https://www.google.com/flights/?f=0&gl=us#search;f=DFW,DAL;t=SFO;d=2017-09-08;r=2017-09-10"
# sleep(2)
# price = browser.all(".EIGTDNC-d-Ab").first.text
# puts price




# page = Nokogiri::HTML(browser.html)
# pp page
# Pry.start(binding)

# browser.find_field("destinationAirport").native.send_keys(:return)
# loop do
#     sleep(2)
#     if driver.execute_script('return document.readyState') == "complete"
#       break
#     end
# end