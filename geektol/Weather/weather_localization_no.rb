#!/usr/bin/env ruby
# encoding: utf-8
# German: [Helge Rosseboe](http://conseptfoto.no/)

### CONFIG [ THESE VALUES OVERRIDE weatherparser.rb ]
# "City, State" or "City, Country" or ZIP Code
$mycity = 'Haugesund, Norway'
# f for fahrenheit, c for celsius
$f_or_c = 'c'
# folder where the weather icons are located, no trailing slash
$basedir = '~/Dropbox/WeatherIcons'
### END CONFIG

  class Translate
    def translate_conditions(phrase)
      conditions_table = {
      'Forecast for' => 'Værvarsel for',
      'Overcast' => 'Overskyet',
      'Clear' => 'Klart',
      'Partly Cloudy' => 'Devis overskyet',
      'Mostly Cloudy' => 'For det meste overskyet',
      'Scattered Clouds' => 'Lettskyet',
      'Light' => 'Lyst',
      'Heavy' => 'Mørkt',
      'Drizzle' => 'Duskregn',
      'light showers rain' => 'Lettskyet regn',
      'Rain' => 'Regn',
      'Snow' => 'Snø',
      'Snow Grains' => 'Kornsnø',
      'Ice Crystals' => 'Iskrystaller',
      'Ice Pellets' => 'Ishagl',
      'Hail' => 'Hagl',
      'Mist' => 'Damp',
      'Fog' => 'Tåke',
      'Smoke' => 'Røyk',
      'Volcanic Ash' => 'Vulkans aske',
      'Widespread Dust' => 'Støvdrev',
      'Sand' => 'Sand',
      'Haze' => 'Dis',
      'Spray' => 'Spray',
      'Dust Whirls' => 'Støvvirvler',
      'Sandstorm' => 'Sandstorm!',
      'Low Drifting Snow' => 'Lavt snødrev',
      'Low Drifting Widespread Dust' => 'Lavt støvdrev',
      'Low Drifting Sand' => 'Lavt sanddrev',
      'Blowing Snow' => 'Snøfokk',
      'Blowing Widespread Dust' => 'Støvfokk',
      'Blowing Sand' => 'Sandstorm',
      'Rain Mist' => 'Yr',
      'Rain Showers' => 'Regnbyger',
      'Snow Showers' => 'Snøbyger',
      'Ice Pellet Showers' => 'Is pellets byger',
      'Hail Showers' => 'Haglbyger',
      'Small Hail Showers' => 'Små haglbyger',
      'Thunderstorm' => 'Tordenvær',
      'Thunderstorms and Rain' => 'Tordenvær og regn',
      'Thunderstorms and Snow' => 'Tordenvær og snø',
      'Thunderstorms and Ice Pellets' => 'Tordenvær og is pellets',
      'Thunderstorms with Hail' => 'Tordenvær og hagl',
      'Thunderstorms with Small Hail' => 'Tordenvær og haglbyger',
      'Freezing Drizzle' => 'Underkjølt yr',
      'Freezing Rain' => 'Underkjølt regn',
      'Freezing Fog' => 'Underkjølt tåke'
      }
      res = conditions_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def translate_forecast(phrase)
      conditions_table = {
      'Chance of Flurries' => 'Mulihet for lett snøfall',
      'Chance of Rain' => 'Mulighet for regn',
      'Chance of Freezing Rain' => 'Mulighet for underkjølt regn',
      'Chance of Sleet' => 'Mulighet for slued',
      'Chance of Snow' => 'Mulighet for snø',
      'Chance of Thunderstorms' => 'Mulighet for tordenvær',
      'Chance of a Thunderstorm' => 'Sporadisk skyet',
      'Clear' => 'Klart',
      'Cloudy' => 'Overskyet',
      'Flurries' => 'Lett snøfall',
      'Fog' => 'Tåke',
      'Haze' => 'Dis',
      'Mostly Cloudy' => 'For det meste skyet',
      'Mostly Sunny' => 'For det meste sol',
      'Partly Cloudy' => 'Delvis overskyet',
      'Partly Sunny' => 'Delvis sol',
      'Freezing Rain' => 'Underkjølt regn',
      'Rain' => 'Regn',
      'Sleet' => 'Sludd',
      'Snow' => 'Snø',
      'Sunny' => 'Sol',
      'Thunderstorms' => 'Tordenvær',
      'Thunderstorm' => 'Tordenvær',
      'Unknown' => 'Ukjent',
      'Overcast' => 'Overskyet',
      'Scattered Clouds' => 'Devis skyet'
      }

      res = conditions_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def translate_strings(phrase)
      strings_table = {
            'Forecast for' => 'Værvarsel for'
      }
      res = strings_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def translate_day(phrase)
      day_table = {
      'Sunday' => 'Søndag',
      'Monday' => 'Mandag',
      'Tuesday' => 'Tirsdag',
      'Wednesday' => 'Onsdag',
      'Thursday' => 'Torsdag',
      'Friday' => 'Fredag',
      'Saturday' => 'Lørdag'
      }
      res = day_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def current_time
      # set the format using strftime placeholders
      # http://apidock.com/ruby/DateTime/strftime
      # Example: AM/PM format
      # time_format = '%-l:%M %p'
      # Example: 24-hour format
      # time_format = '%H:%M'
      time_format = '%H:%M'
      Time.now.strftime(time_format)
    end
  end
