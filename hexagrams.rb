require_relative 'lib/hexagram'
require_relative 'lib/weather_service'

require 'json'

f = File.open('hexagrams.json')
json = f.readlines.first
f.close

hexagram = Hexagram.new(JSON.parse(json).sample)
weather = WeatherService.new('30315')

puts "#{weather.description} #{weather.temperature}"
puts [hexagram.name, hexagram.number, hexagram.unicode].join (' ')
