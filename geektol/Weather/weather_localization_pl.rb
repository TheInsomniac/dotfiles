#!/usr/bin/env ruby
# encoding: utf-8
# Credits: Joanna Kamrowska & Sebastian Szwac

	class Translate
		def translate_conditions(phrase)
			conditions_table = {
			'Overcast' => 'Zachmurzenie',
			'Clear' => 'Czyste niebo',
			'Partly Cloudy' => 'Częściowe zachmurzenie',
			'Mostly Cloudy' => 'Duże zachmurzenie',
			'Scattered Clouds' => 'Lekkie zachmurzenie',
			'Light' => 'Lekkie',
			'Heavy' => 'Ciężkie',
			'Drizzle' => 'Mżawka',
			'Rain' => 'Deszcz',
			'Snow' => 'Śnieg',
			'Snow Grains' => 'Grad',
			'Ice Crystals' => 'Oblodzenie',
			'Ice Pellets' => 'Ziarna lodowe',
			'Hail' => 'Grad',
			'Mist' => 'Mgła',
			'Fog' => 'Mgła',
			'Smoke' => 'Dym',
			'Volcanic Ash' => 'Popiół wulkaniczny',
			'Widespread Dust' => 'Zapylenie',
			'Sand' => 'Piasek',
			'Haze' => 'Zamglenie',
			'Spray' => 'Mżawka',
			'Dust Whirls' => 'Wiry pyłowe',
			'Sandstorm' => 'Burza piaskowa',
			'Low Drifting Snow' => 'Zamieć śnieżna niska',
			'Low Drifting Widespread Dust' => 'Wichura pyłowa niska',
			'Low Drifting Sand' => 'Wichura piaskowa niska',
			'Blowing Snow' => 'Zamieć śnieżna wysoka',
			'Blowing Widespread Dust' => 'Wichura pyłowa wysoka',
			'Blowing Sand' => 'Wichura piaskowa wysoka',
			'Rain Mist' => 'Zamglenie',
			'Rain Showers' => 'Przelotny deszcz',
			'Snow Showers' => 'Przelotne opady śniegu',
			'Ice Pellet Showers' => '',
			'Hail Showers' => 'Przelotny grad',
			'Small Hail Showers' => '',
			'Thunderstorm' => 'Burza',
			'Thunderstorms and Rain' => 'Burze z deszczem',
			'Thunderstorms and Snow' => 'Burze z opadami śniegu',
			'Thunderstorms and Ice Pellets' => '',
			'Thunderstorms with Hail' => 'Burze z opadami gradu',
			'Thunderstorms with Small Hail' => '',
			'Freezing Drizzle' => 'Marznąca mżawka',
			'Freezing Rain' => 'Marznący deszcz',
			'Freezing Fog' => ''
			}
			res = conditions_table[phrase]
			return res == '' || res.nil? ? phrase : res
		end

		def translate_forecast(phrase)
			conditions_table = {
			'Chance of Flurries' => 'Możliwe gwałtowne podmuchy wiatru',
			'Chance of Rain' => 'Możliwe opady deszczu',
			'Chance of Freezing Rain' => 'Możliwe opady marznącego deszczu',
			'Chance of Sleet' => 'Możliwe opady lodowego deszczu',
			'Chance of Snow' => 'Możliwe opady śniegu',
			'Chance of Thunderstorms' => ' Możliwe burze',
			'Chance of a Thunderstorm' => 'Możliwa burza',
			'Clear' => 'Bezchmurnie',
			'Cloudy' => 'Pochmurno',
			'Flurries' => 'Przelotne opady śniegu',
			'Fog' => 'Mgła',
			'Haze' => 'Zamglenie',
			'Mostly Cloudy' => 'Przeważnie pochmurno',
			'Mostly Sunny' => 'Przeważnie słonecznie',
			'Partly Cloudy' => 'Częściowe zachmurzenie',
			'Partly Sunny' => 'Częściowo słoncznie',
			'Freezing Rain' => 'Marznący deszcz',
			'Rain' => 'Deszcz',
			'Sleet' => 'Lodowy deszcz',
			'Snow' => 'Śnieg',
			'Sunny' => 'Słonecznie',
			'Thunderstorms' => 'Burze',
			'Thunderstorm' => 'Burza',
			'Unknown' => 'Nieznana',
			'Overcast' => 'Całkowite zachmurzenie',
			'Scattered Clouds' => 'Lekkie zachmurzenie'
			}

			res = conditions_table[phrase]
			return res == '' || res.nil? ? phrase : res
		end

		def translate_strings(phrase)
			strings_table = {
						'Forecast for' => 'Prognoza dla'
			}
			res = strings_table[phrase]
			return res == '' || res.nil? ? phrase : res
		end

		def translate_day(phrase)
			day_table = {
			'Sunday' => 'Niedziela',
			'Monday' => 'Poniedziałek',
			'Tuesday' => 'Wtorek',
			'Wednesday' => 'Środa',
			'Thursday' => 'Czwartek',
			'Friday' => 'Piątek',
			'Saturday' => 'Sobota'
			}
			res = day_table[phrase]
			return res == '' || res.nil? ? phrase : res
		end
	end
