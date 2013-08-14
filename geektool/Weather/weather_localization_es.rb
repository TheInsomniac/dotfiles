#!/usr/bin/env ruby
# encoding: UTF-8

### CONFIG [ THESE VALUES OVERRIDE weatherparser.rb ]
# "City, State" or "City, Country" or ZIP Code
$mycity = 'Madrid, Spain'
# f for fahrenheit, c for celsius
$f_or_c = 'c'
# folder where the weather icons are located, no trailing slash
$basedir = '~/Dropbox/WeatherIcons'
### END CONFIG

class Translate
	def translate_conditions(phrase)
		conditions_table = {
		'Overcast' => 'Cubierto',
		'Clear' => 'Despejado',
		'Partly Cloudy' => 'Parcialmente nublado',
		'Mostly Cloudy' => 'Mayormente nublado',
		'Scattered Clouds' => 'Nubes dispersas',
		'Light' => 'Ligero',
		'Heavy' => 'Fuerte',
		'Drizzle' => 'Llovizna',
		'Rain' => 'Lluvia',
		'Snow' => 'Nieve',
		'Snow Grains' => 'Nieve menuda',
		'Ice Crystals' => 'Nieve granulada',
		'Ice Pellets' => 'Granizo pequeño',
		'Hail' => 'Granizo',
		'Mist' => 'Neblina',
		'Fog' => 'Niebla',
		'Smoke' => 'Humo',
		'Volcanic Ash' => 'Ceniza volcanica',
		'Widespread Dust' => 'Nubes de polvo',
		'Sand' => 'Arena',
		'Haze' => 'Bruma',
		'Spray' => 'Rocio',
		'Dust Whirls' => 'Remolinos de polvo',
		'Sandstorm' => 'Tormenta de arena',
		'Low Drifting Snow' => 'Bajas acumulaciones de nieve',
		'Low Drifting Widespread Dust' => 'Ligeras nubes de polvo',
		'Low Drifting Sand' => 'Ligera ventisca de arena',
		'Blowing Snow' => 'Ventisca de nieve',
		'Blowing Widespread Dust' => 'Ventisca de polvo',
		'Blowing Sand' => 'Ventisca de arena',
		'Rain Mist' => 'Lluvia y neblina',
		'Rain Showers' => 'Lluvias',
		'Snow Showers' => 'Nevada',
		'Ice Pellet Showers' => 'Granizada',
		'Hail Showers' => 'Aguaceros',
		'Small Hail Showers' => 'Chubascos',
		'Thunderstorm' => 'Tormenta',
		'Thunderstorms and Rain' => 'Lluvia y tormentas electricas',
		'Thunderstorms and Snow' => 'Nieve y tormentas',
		'Thunderstorms and Ice Pellets' => 'Granizo pequeño y tormentas electricas',
		'Thunderstorms with Hail' => 'Tormentas con granizo',
		'Thunderstorms with Small Hail' => 'Tormentas con granizo pequeño',
		'Freezing Drizzle' => 'Llovizna helada',
		'Freezing Rain' => 'Lluvia helada',
		'Freezing Fog' => 'Niebla helada'
		}
		res = conditions_table[phrase]
		return res == '' || res.nil? ? phrase : res
	end

	def translate_forecast(phrase)
		conditions_table = {
		'Chance of Flurries' => 'Probabilidad de ligeras nevadas',
		'Chance of Rain' => 'Probabilidad de lluvia',
		'Chance of Freezing Rain' => 'Probabilidad de lluvia helada',
		'Chance of Sleet' => 'Probabilidad de nieve granulada',
		'Chance of Snow' => 'Probabilidad de nevada',
		'Chance of Thunderstorms' => 'Probabilidad de tormentas electricas',
		'Chance of a Thunderstorm' => 'Probabilidad de tormenta',
		'Clear' => 'Despejado',
		'Cloudy' => 'Nublado',
		'Flurries' => 'Ligeras nevadas',
		'Fog' => 'Niebla',
		'Haze' => 'Bruma',
		'Mostly Cloudy' => 'Mayormente nublado',
		'Mostly Sunny' => 'Mayormente soleado',
		'Partly Cloudy' => 'Parcialmente nublado',
		'Partly Sunny' => 'Parcialmente soleado',
		'Freezing Rain' => 'Lluvia helada',
		'Rain' => 'Lluvia',
		'Sleet' => 'Nieve granulada',
		'Snow' => 'Nieve',
		'Sunny' => 'Soleado',
		'Thunderstorms' => 'Tormentas electricas',
		'Thunderstorm' => 'Tormenta',
		'Unknown' => 'Desconocido',
		'Overcast' => 'Cubierto',
		'Scattered Clouds' => 'Nubes dispersas'
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
		'Sunday' => 'Domingo',
		'Monday' => 'Lunes',
		'Tuesday' => 'Martes',
		'Wednesday' => 'Miercoles',
		'Thursday' => 'Jueves',
		'Friday' => 'Viernes',
		'Saturday' => 'Sabado'
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
