require 'active_support'
require 'active_support/core_ext/string/inflections'
require 'httparty'

class WeatherService
  attr_reader :location, :response

  def initialize(location)
    @location = location
    @response = fetch_weather
  end

  def description
    "#{response['weather'][0]['main']}, " + \
      response['weather'][0]['description'].titlecase
  rescue NoMethodError
    'Unclear Forecast'
  end

  def temperature
    "#{response['main']['temp']}°F"
  rescue NoMethodError
    'Try Again Later'
  end

  private

  def fetch_weather
    base_uri = 'https://api.openweathermap.org/'
    endpoint = 'data/2.5/weather'
    query_params = "?q=#{location}&units=imperial"
    # api_key = '&appid=YOUR_API_KEY'
    api_key = '&appid=1d737a245df25d2e31d58974223582ed'
    url = base_uri + endpoint + query_params + api_key
    HTTParty.get(url)
  end
end
