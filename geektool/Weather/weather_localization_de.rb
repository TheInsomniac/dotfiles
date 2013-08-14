#!/usr/bin/env ruby
# encoding: utf-8

### CONFIG [ THESE VALUES OVERRIDE weatherparser.rb ]
# "City, State" or "City, Country" or ZIP Code
$mycity = 'Stuttgart, Germany'
# f for fahrenheit, c for celsius
$f_or_c = 'c'
# folder where the weather icons are located, no trailing slash
$basedir = '~/Dropbox/WeatherIcons'
### END CONFIG

  class Translate
    def translate_conditions(phrase)
      conditions_table = {
      'Overcast' => 'Bedeckt',
      'Clear' => 'Klar',
      'Partly Cloudy' => 'Bewölkt',
      'Mostly Cloudy' => 'Wolkig',
      'Scattered Clouds' => 'Heiter',
      'Light' => 'Hell',
      'Heavy' => 'Dunkel',
      'Drizzle' => 'Niesel',
      'Rain' => 'Regen',
      'Snow' => 'Schnee',
      'Snow Grains' => 'Schneeregen',
      'Ice Crystals' => 'Eiskristalle',
      'Ice Pellets' => 'Graupelschauer',
      'Hail' => 'Hagel',
      'Mist' => 'Dunst',
      'Fog' => 'Nebel',
      'Smoke' => 'Rauch',
      'Volcanic Ash' => 'Vulkanausbruch! GTFO!!',
      'Widespread Dust' => 'Staubig',
      'Sand' => 'Sandig',
      'Haze' => 'Dunst',
      'Spray' => 'Sprühregen',
      'Dust Whirls' => 'Staubwirbel',
      'Sandstorm' => 'Sandsturm!',
      'Low Drifting Snow' => 'Schneeverwehungen',
      'Low Drifting Widespread Dust' => 'Staubverwehungen',
      'Low Drifting Sand' => 'Staubverwehungen',
      'Blowing Snow' => 'Schneetreiben',
      'Blowing Widespread Dust' => 'Staubtreiben',
      'Blowing Sand' => 'Sandtreiben',
      'Rain Mist' => 'Staubregen',
      'Rain Showers' => 'viel Regen',
      'Snow Showers' => 'viel Schnee',
      'Ice Pellet Showers' => '',
      'Hail Showers' => 'viel Hagel',
      'Small Hail Showers' => 'viel kleiner Hagel',
      'Thunderstorm' => 'Gewitter',
      'Thunderstorms and Rain' => 'Gewitter',
      'Thunderstorms and Snow' => 'Blitz und Schnee',
      'Thunderstorms and Ice Pellets' => 'Blitz und Eisstückchen',
      'Thunderstorms with Hail' => 'Blitze und Hagel',
      'Thunderstorms with Small Hail' => 'Blitze und wenig Hagel',
      'Freezing Drizzle' => 'Eis-Nielselregen',
      'Freezing Rain' => 'Schneeregen',
      'Freezing Fog' => 'Eisnebel'
      }
      res = conditions_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def translate_forecast(phrase)
      conditions_table = {
      'Chance of Flurries' => 'Vielleicht Schneegestöber',
      'Chance of Rain' => 'Vielleicht Regen',
      'Chance of Freezing Rain' => 'Vielleicht Eisregen',
      'Chance of Sleet' => 'Vielleicht Schneeregen',
      'Chance of Snow' => 'Vielleicht Schnee',
      'Chance of Thunderstorms' => 'Vielleicht Gewitter',
      'Chance of a Thunderstorm' => 'Vielleicht Gewitter',
      'Clear' => 'Klar',
      'Cloudy' => 'Wolkig',
      'Flurries' => 'Schneegestöber',
      'Fog' => 'Nebel',
      'Haze' => 'Nebel',
      'Mostly Cloudy' => 'Bewölkt',
      'Mostly Sunny' => 'Sonnig',
      'Partly Cloudy' => 'Bewölkt',
      'Partly Sunny' => 'Sonnig',
      'Freezing Rain' => 'Schneeregen',
      'Rain' => 'Regen',
      'Sleet' => 'Schneegestöber',
      'Snow' => 'Schnee',
      'Sunny' => 'Sonnig',
      'Thunderstorms' => 'Gewitter',
      'Thunderstorm' => 'Gewitter',
      'Unknown' => 'Unbekannt',
      'Overcast' => 'Bedeckt',
      'Scattered Clouds' => 'Heiter'
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
      'Sunday' => '',
      'Monday' => '',
      'Tuesday' => '',
      'Wednesday' => '',
      'Thursday' => '',
      'Friday' => '',
      'Saturday' => ''
      }
      res = day_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def current_time
      # set the format using strftime placeholders
      # http://apidock.com/ruby/DateTime/strftime
      # Example: 24-hour format
      # time_format = '%H:%M'
      time_format = '%-l:%M %p'
      Time.now.strftime(time_format)
    end
  end
