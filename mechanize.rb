require 'mechanize'

p "initialize"
p "agent"
agent = Mechanize.new { |agent| 
    agent.open_timeout = 10
    agent.read_timeout = 10
}
p "#{agent}"
# p "#{agent.get 'http://google.com/'}"
page = agent.get('https://www.aa.com/homePage.do')

form = page.form('reservationFlightSearchForm')
form.originAirport = 'dfw'
form.destinationAirport = 'sfo'
form.departDate = "09/08/2017"
form.returnDate = "09/10/2017"
pp form
page = agent.submit(form)
pp page