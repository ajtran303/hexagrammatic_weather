# Hexagrammatical Weather

Get the weather and your fortune at the same time!

## Prerequisites

Get an [OpenWeatherMap API Key](https://openweathermap.org/api).

Reader be aware: in my experience, it takes a couple of hours before your api key becomes active after signing up for one and receiving the initial email!

Change `line 34` of `weather_service.rb` and put in your api key:

```ruby
# Line 34
api_key = '&appid=YOUR_API_KEY'
```

Change `line 11` of `hexagrams.rb` and put in your location. Per the [API Documentation](https://openweathermap.org/current):

> You can call by city name or city name, state code and country code. Please note that searching by states available only for the USA locations.

Install dependencies:

```zsh
bundle install
```

## Usage

```zsh
ruby hexagrams.rb
```

Sample output:

```zsh
Clouds Overcast Clouds 19.33°F
Coming To Meet 44 ䷫
```

## Running the tests

```zsh
ruby test/weather_service_test.rb
```
