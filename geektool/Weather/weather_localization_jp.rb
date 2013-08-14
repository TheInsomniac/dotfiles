#!/usr/bin/env ruby
# encoding: utf-8
# Japanese: [Brandon Pittman](http://www.brandonpittman.net/)

### CONFIG [ THESE VALUES OVERRIDE weatherparser.rb ]
# "City, State" or "City, Country" or ZIP Code
$mycity = 'Osaka, Japan'
# f for fahrenheit, c for celsius
$f_or_c = 'c'
# folder where the weather icons are located, no trailing slash
$basedir = '~/Dropbox/WeatherIcons'
### END CONFIG


  class Translate
    def translate_conditions(phrase)
      conditions_table = {
      'Overcast' => '曇り',
      'Clear' => '晴れ',
      'Partly Cloudy' => '晴時々曇',
      'Mostly Cloudy' => '雲時々晴',
      'Scattered Clouds' => '薄い雲',
      'Light' => '小',
      'Heavy' => '大',
      'Drizzle' => '霧雨',
      'Rain' => '雨',
      'Snow' => '雪',
      'Snow Grains' => '雪粒',
      'Ice Crystals' => '氷結晶',
      'Ice Pellets' => '氷小粒',
      'Hail' => 'ひょう',
      'Mist' => '霧',
      'Fog' => '霧',
      'Smoke' => '煙',
      'Volcanic Ash' => '火山灰',
      'Widespread Dust' => '大砂',
      'Sand' => '砂',
      'Haze' => '霧',
      'Spray' => 'しぶき',
      'Dust Whirls' => '砂塵嵐',
      'Sandstorm' => '砂嵐',
      'Low Drifting Snow' => '雪の吹きだまり',
      'Low Drifting Widespread Dust' => '大砂の吹きだまり',
      'Low Drifting Sand' => '砂の吹きだまり',
      'Blowing Snow' => '吹雪',
      'Blowing Widespread Dust' => '大砂',
      'Blowing Sand' => '大砂霧',
      'Rain Mist' => '霧雨',
      'Rain Showers' => '大雨',
      'Snow Showers' => '大雪',
      'Ice Pellet Showers' => '大雪粒',
      'Hail Showers' => 'ひょう',
      'Small Hail Showers' => '小ひょう',
      'Thunderstorm' => '雷',
      'Thunderstorms and Rain' => '雷時々雨',
      'Thunderstorms and Snow' => '雷時々雪',
      'Thunderstorms and Ice Pellets' => '雷時々氷小粒',
      'Thunderstorms with Hail' => '雷時々ひょう',
      'Thunderstorms with Small Hail' => '雷時々小ひょう',
      'Freezing Drizzle' => 'みぞれ',
      'Freezing Rain' => 'みぞれ',
      'Freezing Fog' => '凍っいる霧'
      }
      res = conditions_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def translate_forecast(phrase)
      conditions_table = {
      'Chance of Flurries' => '吹雪かもしれない',
      'Chance of Rain' => '雨かもしれない',
      'Chance of Freezing Rain' => '凍っている雨かもしれない',
      'Chance of Sleet' => 'みぞれかもしれない',
      'Chance of Snow' => '雪かもしれない',
      'Chance of Thunderstorms' => '雷かもしれない',
      'Chance of a Thunderstorm' => '雷かもしれない',
      'Clear' => '晴れ',
      'Cloudy' => '曇り',
      'Flurries' => '吹雪',
      'Fog' => '霧',
      'Haze' => '霧',
      'Mostly Cloudy' => '雲時々晴',
      'Mostly Sunny' => '晴時々雲',
      'Partly Cloudy' => '晴時々雲',
      'Partly Sunny' => '雲時々晴',
      'Freezing Rain' => '着氷性の雨',
      'Rain' => '雨',
      'Sleet' => 'みぞれ',
      'Snow' => '雪',
      'Sunny' => '晴れ',
      'Thunderstorms' => '雷',
      'Thunderstorm' => '雷',
      'Unknown' => '不明',
      'Overcast' => '曇り',
      'Scattered Clouds' => '薄い雲'
      }

      res = conditions_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def translate_strings(phrase)
      strings_table = {
            'Forecast for' => 'の天気予報'
      }
      res = strings_table[phrase]
      return res == '' || res.nil? ? phrase : res
    end

    def translate_day(phrase)
      day_table = {
      'Sunday' => '日曜日',
      'Monday' => '月曜日',
      'Tuesday' => '火曜日',
      'Wednesday' => '水曜日',
      'Thursday' => '木曜日',
      'Friday' => '金曜日',
      'Saturday' => '土曜日'
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
