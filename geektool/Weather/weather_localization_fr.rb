#!/usr/bin/env ruby
# encoding: utf-8

### CONFIG [ THESE VALUES OVERRIDE weatherparser.rb ]
# "City, State" or "City, Country" or ZIP Code
$mycity = 'Paris, France'
# f for fahrenheit, c for celsius
$f_or_c = 'c'
# folder where the weather icons are located, no trailing slash
$basedir = '~/Dropbox/WeatherIcons'
### END CONFIG

  class Translate
    def translate_conditions(phrase)
      conditions_table = {
      'Overcast' => 'Couvert',
      'Clear' => 'Clair',
      'Partly Cloudy' => 'Partiellement nuageux',
      'Mostly Cloudy' => 'Nuageux',
      'Scattered Clouds' => 'Nuages dispersés',
      'Light' => 'Léger',
      'Heavy' => 'Lourd',
      'Drizzle' => 'Crachin',
      'Rain' => 'Pluie',
      'Snow' => 'Neige',
      'Snow Grains' => 'Neige gelée',
      'Ice Crystals' => 'Cristaux de glace',
      'Ice Pellets' => 'Grêle de glace',
      'Hail' => 'Grêle',
      'Mist' => 'Brûme',
      'Fog' => 'Brouillard',
      'Smoke' => 'Fumée',
      'Volcanic Ash' => 'Cendre volcanique',
      'Widespread Dust' => 'Poussière',
      'Sand' => 'Sable',
      'Haze' => 'Brume',
      'Spray' => 'Pluie vaporeuse',
      'Dust Whirls' => 'Tourbillons de poussière',
      'Sandstorm' => 'Orage de sable',
      'Low Drifting Snow' => 'Poudrerie',
      'Low Drifting Widespread Dust' => 'Soulèvements de poussière',
      'Low Drifting Sand' => 'Soulèvements de sable',
      'Blowing Snow' => 'Vent neigeux',
      'Blowing Widespread Dust' => 'Vent de poussière',
      'Blowing Sand' => 'Vent de sable',
      'Rain Mist' => 'Bruine',
      'Rain Showers' => 'Averses',
      'Snow Showers' => 'Chutes de neige',
      'Ice Pellet Showers' => 'Chutes de grésil',
      'Hail Showers' => 'Grêle',
      'Small Hail Showers' => 'Grésil',
      'Thunderstorm' => 'Orage sec',
      'Thunderstorms and Rain' => 'Orage pluvieux',
      'Thunderstorms and Snow' => 'Orage de neige',
      'Thunderstorms and Ice Pellets' => 'Orage de grésil',
      'Thunderstorms with Hail' => 'Orage de grêle',
      'Thunderstorms with Small Hail' => 'Orage et grésil',
      'Freezing Drizzle' => 'Crachin gelé',
      'Freezing Rain' => 'Pluie givrante',
      'Freezing Fog' => 'Brouillard givrant'
      }
      res = conditions_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def translate_forecast(phrase)
      conditions_table = {
      'Chance of Flurries' => 'Risques de précipitations',
      'Chance of Rain' => 'Risques de pluie',
      'Chance of Freezing Rain' => 'Risques de pluie givrante',
      'Chance of Sleet' => 'Risques de pluie/neige',
      'Chance of Snow' => 'Risques de chutes de neige',
      'Chance of Thunderstorms' => 'Risque orageux',
      'Chance of a Thunderstorm' => 'Risque d\'orage',
      'Clear' => 'Dégagé',
      'Cloudy' => 'Nuageux',
      'Flurries' => 'Précipitations',
      'Fog' => 'Brouillard',
      'Haze' => 'Brume',
      'Mostly Cloudy' => 'Généralement nuageux',
      'Mostly Sunny' => 'Généralement ensoleillé',
      'Partly Cloudy' => 'Partiellement nuageux',
      'Partly Sunny' => 'Partiellement ensoleillé',
      'Freezing Rain' => 'Pluie givrante',
      'Rain' => 'Pluie',
      'Sleet' => 'Pluie/Neige',
      'Snow' => 'Neige',
      'Sunny' => 'Ensoleillé',
      'Thunderstorms' => 'Orages',
      'Thunderstorm' => 'Orage',
      'Unknown' => 'Inconnu',
      'Overcast' => 'Couvert',
      'Scattered Clouds' => 'Nuages dispersés'
      }

      res = conditions_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def translate_strings(phrase)
      strings_table = {
            'Forecast for' => 'Prévisions pour'
      }
      res = strings_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def translate_day(phrase)
      day_table = {
      'Sunday' => 'Dimanche',
      'Monday' => 'Lundi',
      'Tuesday' => 'Mardi',
      'Wednesday' => 'Mercredi',
      'Thursday' => 'Jeudi',
      'Friday' => 'Vendredi',
      'Saturday' => 'Samedi'
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
