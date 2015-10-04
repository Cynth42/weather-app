#Accepts a zipcode and returns the five days weather forecast for that location
class FiveDaysForecasts
    require 'yahoo_weatherman'

    def self.get_location
    puts "Please enter your zip code to get your five days weather forecasts: "
    @location = gets.chomp
    new = {:unit=> "F"}
    client = Weatherman::Client.new(new)
    response = client.lookup_by_location(@location)
    city = response.location['city']
    region = response.location['region']
    day = Time.now.strftime("%w").to_i
    
    puts "\nThe Five Days Forecast for #{city}, #{region} is: \n"
    
    i = 1
    response.forecasts.each do |forecast|
    if (i == 1)
    day = "Today"
    
    elsif (i ==2)
    day = "Tomorrow"
    
    else
    datestring = forecast["day"]
    
    day = case datestring
				when "Mon" then "Monday"
                when "Tue" then "Tuesday"
                when "Wed" then "Wednesday"
                when "Thu" then "Thursday"
                when "Fri" then "Friday"
                when "Sat" then "Saturday"
                else "Sunday"
     end

end

puts day + " is going to be " + forecast["text"].downcase + " with a high of " + forecast["high"].to_s + "\nand a low of " + forecast["low"].to_s + " degrees Fahrenheit."
i += 1
     end
end
end

FiveDaysForecasts.get_location
