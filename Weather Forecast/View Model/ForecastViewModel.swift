//
//  SwiftUIView.swift
//  Weather Forecast
//
//  Created by Michael Craun on 5/9/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import Combine
import SwiftUI

class ForecastViewModel: ObservableObject {
    @Published var weatherForecast: Forecast?
    var weatherService: Service
    var cityName = "Boston"
    var currentCity: String {
        if let city = weatherForecast?.city.name {
            return city
        } else {
            return "ERROR!"
        }
    }
    var currentCountry: String {
        if let country = weatherForecast?.city.country {
            return country
        } else {
            return "ERROR!"
        }
    }
    var day: String {
        if let day = weatherForecast?.list.first?.dt {
            let formattedDay = Helper().timeConverter(timeStamp: day, isDay: false)
            return formattedDay
        } else {
            return "ERROR!"
        }
    }
    var temperature: String {
        if let temp = weatherForecast?.list.first?.temp?.day {
            let formatted = String(format: "%.0f", temp)
            return formatted + "degrees"
        } else {
            return "ERROR!"
        }
    }
    var description: String {
        if let description = weatherForecast?.list.first?.weather?.first?.description {
            return description.capitalized(with: .current)
        } else {
            return "ERROR!"
        }
    }
    var currentCondition: Forecast.Day.Weather {
        if let condition = weatherForecast?.list.first?.weather?.first {
            return condition
        } else {
            return Forecast.Day.Weather()
        }
    }
    var windSpeed: String {
        if let wind = weatherForecast?.list.first?.speed {
            let formatted = String(format: "%.1f", wind)
            return "\(formatted)mi/h"
        } else {
            return "ERROR!"
        }
    }
    var humidity: String {
        if let hum = weatherForecast?.list.first?.humidity {
            return String(hum)
        } else {
            return "ERROR!"
        }
    }
    var maxTemp: String {
        if let max = weatherForecast?.list.first?.temp?.max {
            let formatted = String(format: "%.0f", max)
            return formatted
        } else {
            return "ERROR!"
        }
    }
    
    init() {
        weatherService = Service()
    }
    
    func searchCity() {
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeatherForecast(by: city)
        }
    }
    
    func fetchWeatherForecast(by city: String) {
        weatherService.getWeatherData(city: city) { (forecast) in
            DispatchQueue.main.async {
                self.weatherForecast = forecast
            }
        }
    }
    
    func getForecastList() -> [Forecast.Day] {
        if let mList = weatherForecast?.list {
            return mList
        } else {
            return []
        }
    }
}
