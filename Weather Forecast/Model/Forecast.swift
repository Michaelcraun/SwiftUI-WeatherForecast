//
//  Forecast.swift
//  Weather Forecast
//
//  Created by Michael Craun on 5/9/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import Foundation

struct Forecast: Decodable {
    var city: City
    var list: [Day]
    
    struct City: Decodable {
        var name: String?
        var country: String?
    }

    struct Day: Decodable {
        var dt: Int?
        var humidity: Int?
        var speed: Double?
        var temp: Temp?
        var weather: [Weather]?
        
        struct Temp: Decodable {
            var day: Double?
            var min: Double?
            var max: Double?
        }
        
        struct Weather: Decodable {
            var main: String?
            var description: String?
        }
    }
}

/*
 {
    "cod":"200",
    "message":0,
    "city":{
        "geoname_id":524901,
        "name":"Moscow",
        "lat":55.7522,
        "lon":37.6156,
        "country":"RU",
        "iso2":"RU",
        "type":"city",
        "population":0
    },
    "cnt":7,
    "list":[
        {
            "dt":1485766800,
            "temp":{
                "day":262.65,
                "min":261.41,
                "max":262.65,
                "night":261.41,
                "eve":262.65,
                "morn":262.65
            },
            "pressure":1024.53,
            "humidity":76,
            "weather":[
                {
                    "id":800,
                    "main":"Clear",
                    "description":"sky is clear",
                    "icon":"01d"
                }
            ],
            "speed":4.57,
            "deg":225,
            "clouds":0,
            "snow":0.01
        }
    ]
 }
 */
