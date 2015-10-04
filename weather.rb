require 'yahoo_weatherman'

def your_location(loc)

puts "Please insert your zip code:"
 @location = gets.chomp
end


def weather_forecast(loc)
    
client = Weatherman::Client.new
weather = client.lookup_by_location(loc)
forecast = weather.forecasts

 forecast.each do |n|
puts "The weather forecast for " + n["day"].to_s + " is " + n["text"].to_s.downcase + ", with a low of " + n["low"].to_s + " and a high of " + n["high"].to_s + " degrees Celsius."
end
  
end

your_location(@location)
weather_forecast(@location)

