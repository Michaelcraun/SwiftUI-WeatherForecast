//
//  Helper.swift
//  Weather Forecast
//
//  Created by Michael Craun on 5/9/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import Foundation

struct Helper {
    func timeConverter(timeStamp: Int, isDay: Bool) -> String {
        let unixTimeStamp = timeStamp
        let date = Date(timeIntervalSince1970: TimeInterval(unixTimeStamp))
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.locale = .current
        formatter.dateFormat = isDay ? "EEE" : "EEEE, MMM d, yyyy"
        return formatter.string(from: date)
    }
    
    func showWeatherIcon(item: Forecast.Day.Weather) -> String {
        let main = item.main
        switch main {
        case "Ash": return "cloud.hail"
        case "Clear": return "sun.max"
        case "Clouds": return "cloud.sun.fill"
        case "Drizzle": return "cloud.drizzle.fill"
        case "Dust": return "sun.dust.fill"
        case "Fog": return "cloud.fog.fill"
        case "Haze": return "sun.haze.fill"
        case "Mist": return "cloud.drizzle"
        case "Rain": return "cloud.rain.fill"
        case "Sand": return "cloud.hail"
        case "Snow": return "cloud.snow.fill"
        case "Squall": return "cloud.hail"
        case "Thunderstorm": return "cloud.bol.fill"
        default: return "clear"
        }
        
    }
    
//    func showWeatherIcon(item: TopLevel) -> String {
//        let main = (item.list.first?.weather.first?.main)!
//        switch main {
//        case "Ash": return "cloud.hail"
//        case "Clear": return "sun.max"
//        case "Clouds": return "cloud.sun.fill"
//        case "Drizzle": return "cloud.drizzle.fill"
//        case "Dust": return "sun.dust.fill"
//        case "Fog": return "cloud.fog.fill"
//        case "Haze": return "sun.haze.fill"
//        case "Mist": return "cloud.drizzle"
//        case "Rain": return "cloud.rain.fill"
//        case "Sand": return "cloud.hail"
//        case "Snow": return "cloud.snow.fill"
//        case "Squall": return "cloud.hail"
//        case "Thunderstorm": return "cloud.bol.fill"
//        default: return "clear"
//        }
//    }
}
