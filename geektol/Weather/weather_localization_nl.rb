#!/usr/bin/env ruby
# encoding: utf-8

### CONFIG [ THESE VALUES OVERRIDE weatherparser.rb ]
# "City, State" or "City, Country" or ZIP Code
$mycity = 'Amsterdam, Holland'
# f for fahrenheit, c for celsius
$f_or_c = 'c'
# folder where the weather icons are located, no trailing slash
$basedir = '~/Dropbox/WeatherIcons'
### END CONFIG

class Translate

	def translate_conditions(phrase)
		conditions_table = {
		'Overcast' => 'Bewolkt',
		'Clear' => 'Helder',
		'Partly Cloudy' => 'Half Bewolkt',
		'Mostly Cloudy' => 'Overwegend Bewolkt',
		'Scattered Clouds' => 'Verspreid Bewolkt',
		'Light' => 'Lichte',
		'Heavy' => 'Zware',
		'Drizzle' => 'Motregen',
		'Rain' => 'Regen',
		'Snow' => 'Sneeuw',
		'Snow Grains' => 'Lichte Sneeuw',
		'Ice Crystals' => 'Ijskristallen',
		'Ice Pellets' => 'Hagel',
		'Hail' => 'Hagel',
		'Mist' => 'Mist',
		'Fog' => 'Nevel',
		'Smoke' => 'Smog',
		'Volcanic Ash' => 'Vulkanische As',
		'Widespread Dust' => 'Stofstorm',
		'Sand' => 'Zand',
		'Haze' => 'Heiig',
		'Spray' => 'Nevel',
		'Dust Whirls' => 'Stofwervels',
		'Sandstorm' => 'Zandstorm',
		'Low Drifting Snow' => 'Matige Stuifsneeuw',
		'Low Drifting Widespread Dust' => 'Matige Stofverstuivingen',
		'Low Drifting Sand' => 'Matige Stuifzand',
		'Blowing Snow' => 'Stuifsneeuw',
		'Blowing Widespread Dust' => 'Stofverstuivingen',
		'Blowing Sand' => 'Zandstorm',
		'Rain Mist' => 'Mist en Regen',
		'Rain Showers' => 'Regenbuien',
		'Snow Showers' => 'Sneeuwbuien',
		'Ice Pellet Showers' => 'Hagel en Regen',
		'Hail Showers' => 'Hagelbuien',
		'Small Hail Showers' => 'Matige Hagelbuien',
		'Thunderstorm' => 'Onweersbui',
		'Thunderstorms and Rain' => 'Onweersbuien en Regen',
		'Thunderstorms and Snow' => 'Onweersbuien en Sneeuw',
		'Thunderstorms and Ice Pellets' => 'Onweersbuien en Hagelstenen',
		'Thunderstorms with Hail' => 'Onweersbuien en Hagelbuien',
		'Thunderstorms with Small Hail' => 'Onweersbuien en Hagel',
		'Freezing Drizzle' => 'Natte Motsneeuw',
		'Freezing Rain' => 'Natte Sneeuw',
		'Freezing Fog' => 'Aanvriezende Mist'
		}
		res = conditions_table[phrase]
		return res == '' || res.nil? ? phrase : res
	end

	def translate_forecast(phrase)
		conditions_table = {
		'Chance of Flurries' => 'Kans op Windstoten',
		'Chance of Rain' => 'Kans op Regen',
		'Chance of Freezing Rain' => 'Kans op Natte Sneeuw',
		'Chance of Sleet' => 'Kans op Natte Motsneeuw',
		'Chance of Snow' => 'Kans op Sneeuwbuien',
		'Chance of Thunderstorms' => 'Kans op Onweersbuien',
		'Chance of a Thunderstorm' => 'Kans op een Onweersbui',
		'Clear' => 'Helder',
		'Cloudy' => 'Bewolkt',
		'Flurries' => 'Windstoten',
		'Fog' => 'Mist',
		'Haze' => 'Heiig',
		'Mostly Cloudy' => 'Overwegend Bewolkt',
		'Mostly Sunny' => 'Overwegend Zonnig',
		'Partly Cloudy' => 'Half Bewolkt',
		'Partly Sunny' => 'Half Bewolkt',
		'Freezing Rain' => 'IJzel',
		'Rain' => 'Regenbuien',
		'Sleet' => 'Natte Motsneeuw',
		'Snow' => 'Sneeuwbuien',
		'Sunny' => 'Zonnig',
		'Thunderstorms' => 'Onweersbuien',
		'Thunderstorm' => 'Onweer',
		'Unknown' => 'Onbekend',
		'Overcast' => 'Bewolkt',
		'Scattered Clouds' => 'Verspreid Bewolkt'
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
		'Sunday' => 'Zondag',
		'Monday' => 'Maandag',
		'Tuesday' => 'Dinsdag',
		'Wednesday' => 'Woensdag',
		'Thursday' => 'Donderdag',
		'Friday' => 'Vrijdag',
		'Saturday' => 'Zaterdag'
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
