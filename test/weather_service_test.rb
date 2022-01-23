require_relative '../lib/weather_service'
require 'minitest/autorun'
require 'minitest/pride'
require 'json'

class WeatherServiceTest < MiniTest::Test
  make_my_diffs_pretty!

  def test_it_exists_for_a_location
    weather_service = WeatherService.new('30315')

    assert_instance_of WeatherService, weather_service
    assert_equal '30315', weather_service.location
  end

  def test_it_gets_weather
    file = File.open('test/weather.json')
    json = file.readlines.first
    file.close

    weather_data = JSON.parse(json)

    weather_service = WeatherService.new('Atlanta')

    weather_service.stub(:response, weather_data) do
      assert_equal 'Clear, Clear Sky', weather_service.description
      assert_equal '28.8°F', weather_service.temperature
    end
  end

  def test_it_handles_error
    weather_service = WeatherService.new('Atlanta')

    weather_service.stub(:response, nil) do
      assert_equal 'Unclear Forecast', weather_service.description
      assert_equal 'Try Again Later', weather_service.temperature
    end
  end
end
