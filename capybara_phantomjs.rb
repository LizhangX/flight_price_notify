require 'capybara/poltergeist'
require 'Pry'
# require 'Nokogiri'
# require 'HTTParty'

Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

Capybara.default_driver = :poltergeist

browser = Capybara.current_session
browser.visit "https://www.google.com/flights/?f=0&gl=us#search;f=DFW,DAL;t=SFO;d=2017-09-08;r=2017-09-10"
sleep(2)
price = browser.all(".EIGTDNC-d-Ab").first.text
puts price
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