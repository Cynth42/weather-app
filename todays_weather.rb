require 'yahoo_weatherman'

def todays_weather(location)
    client = Weatherman::Client.new
    weather = client.lookup_by_location(location)
    city = weather.location['city']
    region = weather.location['region']

    condition = weather.condition['text']
    puts "Today's weather in #{city}, #{region} is #{condition.upcase}!."
end

puts "What is your zipcode?"
location = gets.chomp

todays_weather(location)
