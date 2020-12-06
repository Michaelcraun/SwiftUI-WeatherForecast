//
//  Service.swift
//  Weather Forecast
//
//  Created by Michael Craun on 5/9/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import Foundation

class Service {
    let apiID = "18ac0ba2fc26e8865ea388dbd264c6fa"
    
    func getWeatherData(city: String, _ completion: @escaping (Forecast) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily?q=\(city)&APPID=\(apiID)&units=imperial")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { fatalError() }
            if let forecast = try? JSONDecoder().decode(Forecast.self, from: data) {
                completion(forecast)
            }
        }.resume()
    }
}
