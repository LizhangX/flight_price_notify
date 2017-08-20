require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

# page = HTTParty.get("https://www.aa.com/shopping/chooseFlights?bookingPathStateId=1503091157457-309")
page = HTTParty.get("https://newyork.craigslist.org/search/pet")

parse_page = Nokogiri::HTML(page)

price_array = []

# parse_page.css('.aa-tier-level-REG').css('.container').css('.tripSummaryForm').css('.section').css('.trip-summary').css('.row-nonbreak').css('.cost-summary').css('.unit-price').css('.cost').map do |a|
#     price = a.text
#     price_array.push(price)
# end

parse_page.css('.hdrlnk').map do |a|
    price = a.text
    price_array.push(price)
end

Pry.start(binding)

