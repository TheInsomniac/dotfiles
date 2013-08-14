#!/usr/bin/env ruby
# encoding: utf-8
# Sweden: [Robin Dorand](www.dorand.se/)

### CONFIG [ THESE VALUES OVERRIDE weatherparser.rb ]
# "City, State" or "City, Country" or ZIP Code
$mycity = 'Lulea, Sweden'
# f for fahrenheit, c for celsius
$f_or_c = 'c'
# folder where the weather icons are located, no trailing slash
$basedir = '/Users/Robin/Documents/Backup/GeekTool/GeekToolWeatherLocalized1.2'
### END CONFIG

  class Translate
    def translate_conditions(phrase)
      conditions_table = {
      'Overcast' => 'Mulet',
      'Clear' => 'Klart',
      'Partly Cloudy' => 'Delvis Molnigt',
      'Mostly Cloudy' => 'Mestadels Molnigt',
      'Scattered Clouds' => 'Spridda Moln',
      'Light' => 'Lätt',
      'Heavy' => 'Kraftig',
      'Drizzle' => 'Duggregn',
      'Rain' => 'Regn',
      'Snow' => 'Snö',
      'Snow Grains' => 'Lätt Snöfall',
      'Ice Crystals' => 'Iskristaller',
      'Ice Pellets' => 'Lätt Hagel',
      'Hail' => 'Hagel',
      'Mist' => 'Dis',
      'Fog' => 'Dimma',
      'Smoke' => 'Rök',
      'Volcanic Ash' => 'Vulkanutbrott! GTFO!!',
      'Widespread Dust' => 'Stoft',
      'Sand' => 'Sand',
      'Haze' => 'Dimma',
      'Spray' => 'Stänk',
      'Dust Whirls' => 'Dammvirvlar',
      'Sandstorm' => 'Sandstorm!',
      'Low Drifting Snow' => 'Drivsnö',
      'Low Drifting Widespread Dust' => 'Okänt',
      'Low Drifting Sand' => 'Okänt',
      'Blowing Snow' => 'Snöstorm',
      'Blowing Widespread Dust' => 'Okänt',
      'Blowing Sand' => 'Okänt',
      'Rain Mist' => 'Regndis',
      'Rain Showers' => 'Regnskurar',
      'Snow Showers' => 'Snöbyar',
      'Ice Pellet Showers' => 'Lätta Hagelskurar',
      'Hail Showers' => 'Hagelskurar',
      'Small Hail Showers' => 'Lätta Hagelskurar',
      'Thunderstorm' => 'Åskoväder',
      'Thunderstorms and Rain' => 'Åskoväder och Regn',
      'Thunderstorms and Snow' => 'Åskoväder och Snö',
      'Thunderstorms and Ice Pellets' => 'Åskoväder och Hagel',
      'Thunderstorms with Hail' => 'Åskoväder och Hagel',
      'Thunderstorms with Small Hail' => 'Åskoväder och Lätt Hagel',
      'Freezing Drizzle' => 'Underkylt Duggregn',
      'Freezing Rain' => 'Underkylt Regn',
      'Freezing Fog' => 'Underkyld Dimma'
      }
      res = conditions_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def translate_forecast(phrase)
      conditions_table = {
      'Chance of Flurries' => 'Risk för Snöstorm',
      'Chance of Rain' => 'Möjligen Regn',
      'Chance of Freezing Rain' => 'Risk för Underkylt Regn',
      'Chance of Sleet' => 'Möjligen Snöblandat Regn',
      'Chance of Snow' => 'Möjligen Snö',
      'Chance of Thunderstorms' => 'Möjligen Åska',
      'Chance of a Thunderstorm' => 'Risk För Åskoväder',
      'Clear' => 'Klart',
      'Cloudy' => 'Molnigt',
      'Flurries' => 'Snöstorm',
      'Fog' => 'Dimma',
      'Haze' => 'Dimma',
      'Mostly Cloudy' => 'Mestadels Molnigt',
      'Mostly Sunny' => 'Mestadels Soligt',
      'Partly Cloudy' => 'Delvis Molnigt',
      'Partly Sunny' => 'Delvis Soligt',
      'Freezing Rain' => 'Underkylt Regn',
      'Rain' => 'Regn',
      'Sleet' => 'Snöblandat Regn',
      'Snow' => 'Snö',
      'Sunny' => 'Soligt',
      'Thunderstorms' => 'Åskoväder',
      'Thunderstorm' => 'Åskoväder',
      'Unknown' => 'Okänt',
      'Overcast' => 'Mulet',
      'Scattered Clouds' => 'Spridda Moln'
      }

      res = conditions_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def translate_strings(phrase)
      strings_table = {
            'Forecast for' => ''
      }
      res = strings_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def translate_day(phrase)
      day_table = {
      'Sunday' => 'Söndag',
      'Monday' => 'Måndag',
      'Tuesday' => 'Tisdag',
      'Wednesday' => 'Onsdag',
      'Thursday' => 'Torsdag',
      'Friday' => 'Fredag',
      'Saturday' => 'Lördag'
      }
      res = day_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def current_time
      # set the format using strftime placeholders
      # http://apidock.com/ruby/DateTime/strftime
      # Example: 24-hour format
      # time_format = '%H:%M'
      time_format = '%H:%M'
      Time.now.strftime(time_format)
    end
  end
