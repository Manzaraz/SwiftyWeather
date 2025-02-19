//
//  WeatherViewModel.swift
//  SwiftyWeather
//
//  Created by Christian Manzaraz on 18/02/2025.
//

import Foundation

@Observable
class WeatherViewModel {
    struct Returned: Codable {
        var current: Current
        var daily: Daily
    }
    
    struct Current: Codable {
        var temperature_2m: Double
        var apparent_temperature: Double
        var wind_speed_10m: Double
        var weather_code: Int
    }
    
    struct Daily: Codable {
        var time: [String] = []
        var weather_code: [Int] = []
        var temperature_2m_max: [Double] = []
        var temperature_2m_min: [Double] = []
    }
    
    var temperature = 0.0
    var feelsLike = 0.0
    var windSpeed = 0.0
    var weatherCode = 0
    var date: [String] = []
    var dailyWeatherCode: [Int] = []
    var dailyHighTemp: [Double] = []
    var dailyLowTemp: [Double] = []
    
    var urlString = "https://api.open-meteo.com/v1/forecast?latitude=42.33467401570891&longitude=-71.17007347605109&current=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation,weather_code,wind_speed_10m&hourly=uv_index&daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_sum&temperature_unit=fahrenheit&wind_speed_unit=mph&precipitation_unit=inch&timezone=auto"
    
    func getData() async {
        print("🕸️Accesing to the web url ... ")
        
        guard let url = URL(string: urlString) else {
            print("😡 URL ERROR: We e couldn't convert the string to a valid URL, check the urlString")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("😡 JSON ERROR: Could not decode data from url")
                return
            }
            
            self.temperature = returned.current.temperature_2m
            self.feelsLike = returned.current.apparent_temperature
            self.windSpeed = returned.current.wind_speed_10m
            self.weatherCode = returned.current.weather_code
            self.date = returned.daily.time
            self.dailyWeatherCode = returned.daily.weather_code
            self.dailyHighTemp = returned.daily.temperature_2m_max
            self.dailyLowTemp = returned.daily.temperature_2m_min
//            print(date)
//            print(dailyWeatherCode)
//            print(dailyHighTemp)
//            print(dailyLowTemp)
        } catch  {
            print("🤬 SOMETHING WENT WRONG \(error.localizedDescription)")
        }
    }
}
